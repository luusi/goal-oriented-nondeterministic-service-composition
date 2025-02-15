import argparse
import logging
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import Callable, Optional, Sequence

from experiments.core import composition_problem_to_pddl, ActionMode, Heuristic, DetRunArgs, NondetRunArgs, \
    transform_goal_strong_next, transform_goal_next
from experiments.handler import ExperimentResult, DownwardLTLfFond2FondHandler, NondetExperimentHandler, \
    DownwardTBHandler
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.to_pddl import final_services_condition


def configure_logging(filename: Optional[str] = None):
    console = logging.StreamHandler()
    handlers = [console]
    if filename:
        file = logging.FileHandler(filename)
        handlers += [file]
    logging.basicConfig(
        format="[%(asctime)s][%(levelname)s]: %(message)s",
        level=logging.DEBUG,
        handlers=handlers,
    )


def reset_logging():
    root = logging.getLogger()
    for handler in root.handlers:
        root.removeHandler(handler)
    for logfilter in root.filters:
        root.removeFilter(logfilter)


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--workdir", type=str, default="output")
    parser.add_argument("--timeout", type=float, default=300.0)
    return parser.parse_args()


def all_services_deterministic(services: Sequence[Service]) -> bool:
    return any(service.is_deterministic for service in services)


def run_experiment(workdir: Path,
                   timeout: float,
                   experiment_name: str,
                   service_builder_fn: Callable,
                   goal_builder_fn: Callable,
                   action_mode: ActionMode,
                   heuristic: Heuristic) -> ExperimentResult:
    assert workdir.exists()

    output_dir = workdir / experiment_name
    if output_dir.exists():
        raise ValueError(f"directory {output_dir} already exists")

    output_dir.mkdir()

    logging.info(f"Running experiment {experiment_name}, workdir {workdir}, timeout {timeout}")
    with TemporaryDirectory() as tmpfile:
        tmpdirpath = Path(tmpfile)

        services = service_builder_fn()
        goal = goal_builder_fn()
        goal = transform_goal_strong_next(goal)
        logging.info(f"Nb Services: {len(services)}")
        logging.info(f"Goal: {goal}")
        domain_txt, problem_txt = composition_problem_to_pddl(services, goal)
        accepting_service_condition = final_services_condition(services)

        domain_filepath = (tmpdirpath / "domain.pddl")
        problem_filepath = (tmpdirpath / "problem.pddl")
        service_accepting_condition_filepath = (tmpdirpath / "services_condition.txt")
        domain_filepath.write_text(domain_txt)
        problem_filepath.write_text(problem_txt)
        service_accepting_condition_filepath.write_text(accepting_service_condition)

        run_args = DetRunArgs(domain_filepath, problem_filepath, service_accepting_condition_filepath, timeout, heuristic, action_mode, "")

        try:
            result = DownwardTBHandler(run_args).launch()
            return result
        finally:
            # save output
            logging.info("Saving results...")
            result.save_results(output_dir)
            if result.exception:
                raise result.exception
            logging.info("Done!")


def run_experiment_ltlfond2fond(workdir: Path,
                   timeout: float,
                   experiment_name: str,
                   service_builder_fn: Callable,
                   goal_builder_fn: Callable,
                   heuristic: Heuristic) -> ExperimentResult:
    assert workdir.exists()

    output_dir = workdir / experiment_name
    if output_dir.exists():
        raise ValueError(f"directory {output_dir} already exists")

    output_dir.mkdir()

    logging.info(f"Running experiment {experiment_name}, workdir {workdir}, timeout {timeout}")
    with TemporaryDirectory() as tmpfile:
        tmpdirpath = Path(tmpfile)

        services = service_builder_fn()
        goal = goal_builder_fn()
        goal = transform_goal_next(goal)
        logging.info(f"Nb Services: {len(services)}")
        logging.info(f"Goal: {goal}")
        domain_txt, problem_txt = composition_problem_to_pddl(services, goal)
        domain_txt = domain_txt.replace(":non-deterministic", "")
        accepting_service_condition = final_services_condition(services)

        domain_filepath = (tmpdirpath / "domain.pddl")
        problem_filepath = (tmpdirpath / "problem.pddl")
        goal_filepath = (tmpdirpath / "goal.ltl")
        service_accepting_condition_filepath = (tmpdirpath / "services_condition.txt")
        domain_filepath.write_text(domain_txt)
        problem_filepath.write_text(problem_txt)
        goal_filepath.write_text(goal)
        service_accepting_condition_filepath.write_text(accepting_service_condition)

        run_args = NondetRunArgs(domain_filepath, problem_filepath, service_accepting_condition_filepath, timeout, heuristic, goal_filepath, "")

        try:
            result = DownwardLTLfFond2FondHandler(run_args).launch()
            return result
        finally:
            # save output
            logging.info("Saving results...")
            result.save_results(output_dir)
            if result.exception:
                raise result.exception
            logging.info("Done!")


def run_nondet_experiment(workdir: Path,
                   timeout: float,
                   experiment_name: str,
                   service_builder_fn: Callable,
                   goal_builder_fn: Callable,
                   heuristic: Heuristic) -> ExperimentResult:
    assert workdir.exists()

    output_dir = workdir / experiment_name
    if output_dir.exists():
        raise ValueError(f"directory {output_dir} already exists")

    output_dir.mkdir()

    logging.info(f"Running experiment {experiment_name}, workdir {workdir}, timeout {timeout}")
    with TemporaryDirectory() as tmpfile:
        tmpdirpath = Path(tmpfile)

        services = service_builder_fn()
        goal = goal_builder_fn()
        goal = transform_goal_next(goal)
        logging.info(f"Nb Services: {len(services)}")
        logging.info(f"Goal: {goal}")
        # in nondet case, the goal in the problem will be removed by the encoder,
        # kept code as it is to simplify code
        domain_txt, problem_txt = composition_problem_to_pddl(services, goal)
        accepting_service_condition = final_services_condition(services)

        domain_filepath = (tmpdirpath / "domain.pddl")
        problem_filepath = (tmpdirpath / "problem.pddl")
        goal_filepath = (tmpdirpath / "goal.ltl")
        service_accepting_condition_filepath = (tmpdirpath / "services_condition.txt")
        domain_filepath.write_text(domain_txt)
        problem_filepath.write_text(problem_txt)
        goal_filepath.write_text(goal)
        service_accepting_condition_filepath.write_text(accepting_service_condition)

        run_args = NondetRunArgs(domain_filepath, problem_filepath, service_accepting_condition_filepath, timeout, heuristic, goal_filepath, "")

        try:
            result = NondetExperimentHandler(run_args).launch()
            return result
        finally:
            # save output
            logging.info("Saving results...")
            result.save_results(output_dir)
            if result.exception:
                raise result.exception
            logging.info("Done!")


def _main(job_fn):
    arguments = parse_args()
    workdir = Path(arguments.workdir)
    if not workdir.exists():
        workdir.mkdir(parents=True)
    configure_logging(filename=str(workdir / "output.log"))

    try:
        job_fn(workdir, arguments.timeout)
    except KeyboardInterrupt:
        logging.warning("Interrupted by user")
        return
    except Exception:
        logging.exception("Exception occurred")

