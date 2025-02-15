#!/usr/bin/env bash

set -exuo pipefail

cd ./planners/downward && \
  rm -f *.pddl &&\
  ./fast-downward.py $1 $2 --evaluator "$3" --search "$4" && \
  cd ../../
