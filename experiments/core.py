import dataclasses
import json
from enum import Enum
from pathlib import Path
from typing import Sequence, Optional

from pylogics.parsers import parse_ltl

from ltlf_goal_oriented_service_composition.rewrite_formula import rewrite
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.to_pddl import services_to_pddl, _START_SYMB


class Heuristic(Enum):
    HMAX = "hmax"
    FF = "ff"


class Encoding(Enum):
    TB = "TB"
    LTLFOND2FOND = "ltlfond2fond"


class ActionMode(Enum):
    MODE_1 = "1"
    MODE_2 = "2"
    MODE_3 = "3"
    MODE_4 = "4"


@dataclasses.dataclass
class RunArgs:
    domain_filepath: Path
    problem_filepath: Path
    service_accepting_condition_filepath: Path
    timeout: Optional[float]
    heuristic: Heuristic

    def tolist(self) -> list:
        return [
            self.domain_filepath,
            self.problem_filepath,
            self.service_accepting_condition_filepath,
            self.timeout,
            self.heuristic,
        ]

    def to_json(self):
        obj = dict(
            timeout=self.timeout,
            heuristic=self.heuristic.value,
        )
        return obj

    def savejson(self, output: Path):
        obj = self.to_json()
        with open(output, "w") as f:
            json.dump(obj, f)


@dataclasses.dataclass
class DetRunArgs(RunArgs):
    action_mode: ActionMode
    planner_args: Sequence[str]

    def tolist(self) -> list:
        result = super().tolist()
        result.append(self.action_mode)
        result.append(self.planner_args)
        return result

    def to_json(self):
        obj = super().to_json()
        obj["action_mode"] = self.action_mode.value
        obj["planner_args"] = self.planner_args
        return obj


@dataclasses.dataclass
class NondetRunArgs(RunArgs):
    goal_filepath: Path
    planner_args: Sequence[str]

    def tolist(self) -> list:
        result = super().tolist()
        result.append(self.goal_filepath)
        result.append(self.planner_args)
        return result

    def to_json(self):
        obj = super().to_json()
        obj["planner_args"] = self.planner_args
        return obj



@dataclasses.dataclass
class Result:
    stdout: str
    stderr: str
    total: float
    returncode: int
    timed_out: bool
    exception: Exception | None = None

    def summary(self):
        return f"{self.total=}\n{self.returncode=}\n{self.timed_out=}"



def transform_goal_strong_next(goal_formula: str) -> str:
    return f"{_START_SYMB} & X[!]({goal_formula})"


def transform_goal_next(goal_formula: str) -> str:
    return f"{_START_SYMB} & X({goal_formula})"


def composition_problem_to_pddl(services: Sequence[Service], goal_formula: str) -> tuple[str, str]:
    formula = parse_ltl(goal_formula)
    formula_pddl = rewrite(formula)

    domain, problem = services_to_pddl(services, formula_pddl)
    return domain, problem
