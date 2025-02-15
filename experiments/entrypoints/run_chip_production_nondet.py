import logging
from pathlib import Path
from typing import Callable, Sequence

from experiments.core import ActionMode, Heuristic
from experiments.domains.chip_production import get_goal_fn
from experiments.entrypoints._abstract_entrypoint import run_experiment, _main, run_nondet_experiment
from experiments.entrypoints.run_chip_production import ALL_SYMBOLS
from experiments.services import one_state_service, breakable_state_service


def get_service_builder_fn(current_symbols: Sequence[str]) -> Callable:
    def build_services():
        return [
            breakable_state_service(f"handler_{name}", name) for name in current_symbols
        ]
    return build_services


def _do_job(workdir: Path, timeout: float):
    combination_already_failed: set[tuple[ActionMode, Heuristic]] = set()
    for n in range(1, len(ALL_SYMBOLS) + 1):
        for heuristic in Heuristic:
            if (heuristic, ) in combination_already_failed:
                print(f"Skipping configuration {(heuristic, )} for {n=}")
                logging.info(f"Skipping configuration {(heuristic, )} for {n=}")
                continue
            current_symbols = ALL_SYMBOLS[:n]
            build_services = get_service_builder_fn(current_symbols)
            build_goal = get_goal_fn(current_symbols)
            result = run_nondet_experiment(workdir, timeout, f"chip_production_nondet_len_{n}_{heuristic.value}", build_services, build_goal, heuristic)
            # if result.planning_result and result.planning_result.timed_out:
            #     logging.info(f"Combination {(action_mode, heuristic)} timed out with n={n}, not continuing with this configuration...")
            #     combination_already_failed.add((action_mode, heuristic))


if __name__ == '__main__':
    _main(_do_job)
