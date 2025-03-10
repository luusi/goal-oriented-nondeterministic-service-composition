import logging
from functools import partial
from pathlib import Path
from typing import Sequence

from experiments.core import ActionMode, Heuristic
from experiments.domains.electric_motor import BUILD_STATOR, BUILD_ROTOR, BUILD_INVERTER, ASSEMBLE_MOTOR, ELECTRIC_TEST, \
    STATIC_TEST, ALL_SYMBOLS, build_goal
from experiments.entrypoints._abstract_entrypoint import run_experiment, _main
from experiments.services import breakable_state_service, one_state_service
from ltlf_goal_oriented_service_composition.services import Service


def build_services() -> Sequence[Service]:
    services = []
    action_to_name = {
        BUILD_STATOR: "rotor_builder",
        BUILD_ROTOR: "stator_builder",
        BUILD_INVERTER: "inverter_builder",
        ASSEMBLE_MOTOR: "motor_assembler",
        ELECTRIC_TEST: "mechanical_engineer_1",
        STATIC_TEST: "mechanical_engineer_2",
    }
    for i, (action, service_name) in enumerate(action_to_name.items()):
        services.append(one_state_service(service_name, action))
    return services


def _do_job(workdir: Path, timeout: float):
    combination_already_failed: set[tuple[ActionMode, Heuristic]] = set()
    for action_mode in ActionMode:
        for heuristic in Heuristic:
            if (action_mode, heuristic) in combination_already_failed:
                print(f"Skipping configuration {(action_mode, heuristic)} for {0=}")
                logging.info(f"Skipping configuration {(action_mode, heuristic)} for {0=}")
                continue
            result = run_experiment(workdir, timeout,
                                    f"electric_motor_det_{0}_{action_mode.value}_{heuristic.value}",
                                    build_services, build_goal, action_mode, heuristic)
            # don't skip
            # if result.planning_result and result.planning_result.timed_out:
            #     logging.info(
            #         f"Combination {(action_mode, heuristic)} timed out with n={n}, not continuing with this configuration...")
            #     combination_already_failed.add((action_mode, heuristic))


if __name__ == '__main__':
    _main(_do_job)
