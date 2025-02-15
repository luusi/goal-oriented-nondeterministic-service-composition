import argparse
from pathlib import Path

import numpy as np
import pandas as pd
from matplotlib import pyplot as plt
import matplotlib.lines as mlines

from experiments.core import ActionMode, Heuristic
from experiments.plotting.utils import ExpType, AllResultDirs, PlanningConfig, action_mode_to_color, \
    action_mode_to_marker, LTLFOND2FONDCOLOR, LTLFOND2FONDMARKER, parse_args, heuristic_list, read_encoding_summary, \
    PlanningStats
import matplotlib as mpl

ELECTRIC_MOTOR_NONDET = "electric_motor_nondet"


def get_electric_motor_nondet_ltlfond2fond_dataframe(input_dir: Path) -> pd.DataFrame:
    df = pd.DataFrame(columns=["label", "length", "heuristic", "TT", "PT", "NE", "PS"])
    prefix = "electric_motor_nondet"
    for length in range(0, 7):
        for heuristic in heuristic_list():
            dirname = f"{prefix}_{length}_{heuristic.value}"
            result_dirpath = input_dir / dirname
            row_prefix = ["electric_motor_nondet", length, heuristic.value]
            encoding_summary_path = result_dirpath / "encoding_summary.txt"
            planning_stdout_path = result_dirpath / "planning_stdout.txt"
            if result_dirpath.exists():
                total_enc_time, return_code, timed_out = read_encoding_summary(encoding_summary_path)
                total_enc_time = total_enc_time if return_code == 0 else None
                planning_stats = PlanningStats.parse(planning_stdout_path.read_text())
                statsrow = [total_enc_time, planning_stats.total, planning_stats.node_expansion, planning_stats.policy_size]
                statsrow = [el if el is not None else float("nan") for el in statsrow]
                df.loc[len(df)] = row_prefix + statsrow
            else:
                df.loc[len(df)] = row_prefix + [float("nan")] * 4
    return df


def main():
    arguments = parse_args()
    input_dir: Path = Path(arguments.input_dir)
    if not input_dir.exists():
        raise ValueError("Input directory does not exist")

    output_dir: Path = Path(arguments.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Enable LaTeX integration
    mpl.rcParams['text.usetex'] = True
    mpl.rcParams['font.family'] = 'serif'
    mpl.rcParams['font.serif'] = 'Times New Roman'

    # Optional: Set specific parameters for figure size, font size, etc.
    mpl.rcParams['figure.figsize'] = (6, 5)
    mpl.rcParams['font.size'] = 10

    df = get_electric_motor_nondet_ltlfond2fond_dataframe(input_dir)

    # Create a new figure
    fig, ax = plt.subplots()

    # Heuristic legend
    legend_hmax = mlines.Line2D([], [], color='black', linestyle="solid", label=PlanningConfig.heuristic_label(Heuristic.HMAX))
    legend_ff = mlines.Line2D([], [],color='black', linestyle="dotted", label=PlanningConfig.heuristic_label(Heuristic.FF))
    heuristic_legend = ax.legend(handles=[legend_hmax, legend_ff], loc='upper left', title='Heuristic')
    ax.add_artist(heuristic_legend)

    # Encoding legend
    legend_ltlfond2fond = mlines.Line2D([], [], color=LTLFOND2FONDCOLOR, marker=LTLFOND2FONDMARKER, markeredgecolor="black", markeredgewidth=0.25, linestyle="solid", label='ltlfond2fond')
    encoding_legend = ax.legend(handles=[legend_ltlfond2fond], loc='upper left', title='Encoding', bbox_to_anchor=(0, 0.825))
    ax.add_artist(encoding_legend)

    df_enc_no_nan = df.fillna(value=1500.0)
    y_hmax = df_enc_no_nan[df_enc_no_nan.heuristic == "hmax"]
    y_ff = df_enc_no_nan[df_enc_no_nan.heuristic == "ff"]
    x_axis = np.arange(0, y_hmax.shape[0])
    plt.plot(x_axis, y_hmax["PT"], label=PlanningConfig.heuristic_label(Heuristic.HMAX), linestyle="solid", marker=LTLFOND2FONDMARKER, markeredgecolor="black", markeredgewidth=0.25, color=LTLFOND2FONDCOLOR)
    plt.plot(x_axis, y_ff["PT"], label=PlanningConfig.heuristic_label(Heuristic.FF), linestyle="dotted", marker=LTLFOND2FONDMARKER, markeredgecolor="black", markeredgewidth=0.25, color=LTLFOND2FONDCOLOR)
    plt.xlabel("length of formula")
    plt.ylabel("Planning Time (PT)")

    plt.ylim(0, 1000.0)
    plt.xticks(ticks=x_axis.tolist(), labels=ExpType.ELECTRIC_MOTOR_NONDET.labels(), rotation=15)
    plt.title("Electric Motor (nondeterministic)")

    plt.savefig(output_dir / f"{ExpType.ELECTRIC_MOTOR_NONDET.value}.pdf")


if __name__ == '__main__':
    main()