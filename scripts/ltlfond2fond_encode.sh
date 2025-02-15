#!/usr/bin/env bash



ltlfond2fond_encode() {
  # Getting domain and problem files from function arguments
  local _DOMAIN_FILE="$(realpath $1)"
  local _PROBLEM_FILE="$(realpath $2)"
  local _GOAL_FILE="$(realpath $3)"

  FINAL_CONDITION_FILE="$(dirname $_DOMAIN_FILE)/services_condition.txt"
  FINAL_CONDITION="$(cat $FINAL_CONDITION_FILE)"
  _COMPILED_PROBLEM_FILE="compiled_problem.pddl"

  # Run the operations
  export PYTHONPATH="$PYTHONPATH:$(pwd)/ltlfond2fond/ext"
  export PYTHONPATH="$PYTHONPATH:$(pwd)/ltlfond2fond/ext/pddl_parser"
  echo "${_DOMAIN_FILE}" "${_PROBLEM_FILE}" "${_GOAL_FILE}"
  python3 ltlfond2fond/convert-finite-seq.py "${_DOMAIN_FILE}" "${_PROBLEM_FILE}" "${_GOAL_FILE}"

  sed -i "s/(:goal (dummy_goal))/(:goal (and (dummy_goal) $FINAL_CONDITION))/g" "$_COMPILED_PROBLEM_FILE";

}

ltlfond2fond_encode $@
