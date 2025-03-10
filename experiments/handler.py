import dataclasses
import logging
import os
import shutil
import subprocess
import time
from pathlib import Path
from typing import Sequence, Optional

from experiments.core import Result, DetRunArgs, NondetRunArgs, RunArgs
from experiments.utils import ROOT_PATH, copy_if_src_exists, terminate_process_tree

RUNNER_SCRIPT = ROOT_PATH / "scripts" / "run.sh"
MYND_PATH = ROOT_PATH / "planners" / "mynd"
COMPILED_PROBLEM = "compiled_problem.pddl"
COMPILED_DOMAIN = "compiled_domain.pddl"


def run_command(args: Sequence[str], cwd: Optional[str] = None, timeout: Optional[float] = None) -> Result:
    logging.info("Running command: " + " ".join(map(str, args)))
    start = time.perf_counter()
    timed_out = False
    proc = subprocess.Popen(
        args,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        cwd=cwd,
        env=os.environ,
    )
    stdout, stderr = b"", b""
    exception = None
    try:
        stdout, stderr = proc.communicate(timeout=timeout)
    except subprocess.TimeoutExpired:
        # graceful termination
        timed_out = True
        terminate_process_tree(proc.pid, timeout=5.0)
        stdout, stderr = proc.communicate(timeout=5.0)
    except BaseException as e:
        exception = e
        logging.error(f"{type(e).__name__}: {e}")
    finally:
        end = time.perf_counter()
        total = end - start
        logging.info("Command returned. Total time: {:.2f} seconds".format(total))

        stdout = stdout.decode("utf-8")
        stderr = stderr.decode("utf-8")

        return Result(stdout, stderr, total, proc.returncode, timed_out, exception)


@dataclasses.dataclass
class ExperimentResult:
    run_args: RunArgs
    encoding_result: Result | None = None
    planning_result: Result | None = None
    exception: Exception | None = None

    def save_results(self, output_dir: Path):
        domain_filepath = self.run_args.domain_filepath
        problem_filepath = self.run_args.problem_filepath
        service_accepting_condition_filepath = self.run_args.service_accepting_condition_filepath

        if self.encoding_result is not None:
            (output_dir / "encoding_stdout.txt").write_text(self.encoding_result.stdout)
            (output_dir / "encoding_stderr.txt").write_text(self.encoding_result.stderr)
            (output_dir / "encoding_summary.txt").write_text(self.encoding_result.summary())

        if self.planning_result is not None:
            (output_dir / "planning_stdout.txt").write_text(self.planning_result.stdout)
            (output_dir / "planning_stderr.txt").write_text(self.planning_result.stderr)
            (output_dir / "planning_summary.txt").write_text(self.planning_result.summary())

        copy_if_src_exists(domain_filepath, output_dir / "domain.pddl")
        copy_if_src_exists(problem_filepath, output_dir / "problem.pddl")
        copy_if_src_exists(service_accepting_condition_filepath, output_dir / "services_condition.txt")

        tmpdir = domain_filepath.parent
        # we assume compiled PDDL files are in the same directory of sources
        copy_if_src_exists(tmpdir / "domain_compiled.pddl", output_dir / "domain_compiled.pddl")
        copy_if_src_exists(tmpdir / "problem_compiled.pddl", output_dir / "problem_compiled.pddl")
        # this is for the ltlfond2fond hard-coded file names
        copy_if_src_exists(tmpdir / "compiled_domain.pddl", output_dir / "compiled_domain.pddl")
        copy_if_src_exists(tmpdir / "compiled_problem.pddl", output_dir / "compiled_problem.pddl")
        copy_if_src_exists(tmpdir / "goal.ltl", output_dir / "goal.ltl")

        copy_if_src_exists(domain_filepath.parent / "policy.dot", output_dir / "policy.dot")
        copy_if_src_exists(ROOT_PATH / "output.sas", output_dir / "output.sas")

        self.run_args.savejson(output_dir / "args.json")


class DownwardTBHandler:

    def __init__(self, run_args: DetRunArgs) -> None:
        self.run_args = run_args
        self.output_sas_path = None

    def _compiled_domain_filepath(self):
        return self.run_args.domain_filepath.parent / f"{self.run_args.domain_filepath.stem}_compiled.pddl"

    def _compiled_problem_filepath(self):
        return self.run_args.problem_filepath.parent / f"{self.run_args.problem_filepath.stem}_compiled.pddl"

    def _check_exception(self, result: Result):
        if result.exception is not None:
            raise result.exception

    def run_tb_encoder(self):
        result = run_command([
            "./scripts/tb_encode.sh",
            self.run_args.domain_filepath,
            self.run_args.problem_filepath,
            self.run_args.action_mode.value
        ], cwd=str(ROOT_PATH), timeout=10.0)
        return result

    def run_planner(self):
        eval_name = f"h{self.run_args.heuristic.value}"
        downward_args = [
            f"{eval_name}={self.run_args.heuristic.value}()",
            f"astar({eval_name},verbosity=verbose)"
        ]
        return run_command([
            "./scripts/run_downward.sh",
            self._compiled_domain_filepath(),
            self._compiled_problem_filepath(),
            *downward_args,
        ],
            cwd=ROOT_PATH, timeout=self.run_args.timeout)

    def launch(self) -> ExperimentResult:
        encoding_result = None
        planner_result = None
        exception = None
        try:
            encoding_result = self.run_tb_encoder()
            self._check_exception(encoding_result)
            planner_result = self.run_planner()
            self._check_exception(planner_result)
        except BaseException as e:
            exception = e
        return ExperimentResult(self.run_args, encoding_result, planner_result, exception)


class DownwardLTLfFond2FondHandler:

    def __init__(self, run_args: NondetRunArgs) -> None:
        self.run_args = run_args
        self.output_sas_path = None

    def _compiled_domain_filepath(self):
        return self.run_args.domain_filepath.parent / f"{self.run_args.domain_filepath.stem}_compiled.pddl"

    def _compiled_problem_filepath(self):
        return self.run_args.problem_filepath.parent / f"{self.run_args.problem_filepath.stem}_compiled.pddl"

    def _check_exception(self, result: Result):
        if result.exception is not None:
            raise result.exception

    def run_ltlfond2fond_encoder(self):
        result = run_command([
            "./scripts/ltlfond2fond_encode.sh",
            self.run_args.domain_filepath,
            self.run_args.problem_filepath,
            self.run_args.goal_filepath
        ], cwd=str(ROOT_PATH), timeout=10.0)
        assert result.returncode == 0, result.stderr

        shutil.move(ROOT_PATH / COMPILED_DOMAIN, self._compiled_domain_filepath())
        shutil.move(ROOT_PATH / COMPILED_PROBLEM, self._compiled_problem_filepath())
        return result

    def run_planner(self):
        eval_name = f"h{self.run_args.heuristic.value}"
        downward_args = [
            f"{eval_name}={self.run_args.heuristic.value}()",
            f"astar({eval_name},verbosity=verbose)"
        ]
        return run_command([
            "./scripts/run_downward.sh",
            self._compiled_domain_filepath(),
            self._compiled_problem_filepath(),
            *downward_args,
        ],
            cwd=ROOT_PATH, timeout=self.run_args.timeout)

    def launch(self) -> ExperimentResult:
        encoding_result = None
        planner_result = None
        exception = None
        try:
            encoding_result = self.run_ltlfond2fond_encoder()
            self._check_exception(encoding_result)
            planner_result = self.run_planner()
            self._check_exception(planner_result)
        except BaseException as e:
            exception = e
        return ExperimentResult(self.run_args, encoding_result, planner_result, exception)


class NondetExperimentHandler:


    def __init__(self, run_args: NondetRunArgs) -> None:
        self.run_args = run_args

        _java_bin_home = str(Path(os.environ["JAVA_HOME"]) / "bin")
        self.java_bin = shutil.which("java", path=_java_bin_home)
        if not self.java_bin:
            raise ValueError("Could not find java")
        logging.info(f"Using java {self.java_bin}")

        self.output_sas_path = None

    def _compiled_domain_filepath(self):
        return self.run_args.domain_filepath.parent / COMPILED_DOMAIN

    def _compiled_problem_filepath(self):
        return self.run_args.problem_filepath.parent / COMPILED_PROBLEM

    def _check_exception(self, result: Result):
        if result.exception is not None:
            raise result.exception

    def run_ltlfond2fond_encoder(self):
        result = run_command([
            "./scripts/ltlfond2fond_encode.sh",
            self.run_args.domain_filepath,
            self.run_args.problem_filepath,
            self.run_args.goal_filepath
        ], cwd=str(ROOT_PATH), timeout=10.0)
        assert result.returncode == 0, result.stderr

        shutil.move(ROOT_PATH / COMPILED_DOMAIN, self._compiled_domain_filepath())
        shutil.move(ROOT_PATH / COMPILED_PROBLEM, self._compiled_problem_filepath())
        return result

    def run_planner(self):
        mynd_args = " ".join([
            "-heuristic",
            f"{self.run_args.heuristic.value}",
            "-exportDot",
            str(self.run_args.domain_filepath.parent / "policy.dot"),
            "-dumpPlan",
        ])
        return run_command([
            "./scripts/run_mynd.sh",
            self._compiled_domain_filepath(),
            self._compiled_problem_filepath(),
            mynd_args,
        ],
            cwd=ROOT_PATH, timeout=self.run_args.timeout)

    def launch(self) -> ExperimentResult:
        encoding_result = None
        planner_result = None
        exception = None
        try:
            encoding_result = self.run_ltlfond2fond_encoder()
            self._check_exception(encoding_result)
            planner_result = self.run_planner()
            self._check_exception(planner_result)
        except BaseException as e:
            exception = e
        return ExperimentResult(self.run_args, encoding_result, planner_result, exception)
