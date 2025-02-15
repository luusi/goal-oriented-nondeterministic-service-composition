#!/usr/bin/env bash

set -exuo pipefail

INPUT_DIR=${1:-./output}
OUTPUT_DIR=${2:-./output-plots}

python3 experiments/plotting/chip_production_det_plots.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR
python3 experiments/plotting/chip_production_det_table.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR
python3 experiments/plotting/chip_production_nondet_plots.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR
python3 experiments/plotting/chip_production_nondet_table.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR
python3 experiments/plotting/chip_production_nondet_unsolvable_plots.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR
python3 experiments/plotting/electric_motor_det_plots.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR
python3 experiments/plotting/electric_motor_det_table.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR
python3 experiments/plotting/electric_motor_nondet_plots.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR
python3 experiments/plotting/electric_motor_nondet_unsolvable_plots.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR
python3 experiments/plotting/electrict_motor_nondet_table.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR
