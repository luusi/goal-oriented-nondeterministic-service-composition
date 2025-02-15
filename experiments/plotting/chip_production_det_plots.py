import argparse
from pathlib import Path

import matplotlib as mpl
import pandas as pd

from experiments.core import ActionMode, Heuristic
from experiments.plotting.utils import heuristic_list, ExpType, EncodingStats, stats_as_row, read_encoding_summary, \
    PlanningStats, PlanningConfig, action_mode_to_color, action_mode_to_marker, MAX_TIMEOUT, LTLFOND2FONDMARKER, \
    LTLFOND2FONDCOLOR, parse_args
import numpy as np
from matplotlib import pyplot as plt
import matplotlib.lines as mlines
from experiments.domains.chip_production import ALL_SYMBOLS as ALL_SYMBOLS_CHIP_PRODUCTION


CHIP_PRODUCTION_TB = "chip_production_tb"
CHIP_PRODUCTION_LTLFOND2FOND = "chip_production_ltlfond2fond"


def get_chip_production_tb_dataframe(input_dir: Path) -> pd.DataFrame:
    df = pd.DataFrame(columns=["label", "length", "encoding", "heuristic", "TT", "PT", "NE", "PS"])
    prefix = ExpType.CHIP_PRODUCTION_DET.value
    for length in range(1, 13):
        for action_mode in range(1, 5):
            for heuristic in heuristic_list():
                dirname = f"{prefix}_len_{length}_{action_mode}_{heuristic.value}"
                result_dirpath = input_dir / dirname
                row_prefix = [CHIP_PRODUCTION_TB, length, str(action_mode), heuristic.value]
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


def get_chip_production_ltlfond2fond_dataframe(input_dir: Path) -> pd.DataFrame:
    df = pd.DataFrame(columns=["label", "length", "heuristic", "TT", "PT", "NE", "PS"])
    prefix = "chip_production_ltlfond2fond"
    for length in range(1, 13):
        for heuristic in heuristic_list():
            dirname = f"{prefix}_len_{length}_{heuristic.value}"
            result_dirpath = input_dir / dirname
            row_prefix = [CHIP_PRODUCTION_LTLFOND2FOND, length, heuristic.value]
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

    df_tb = get_chip_production_tb_dataframe(input_dir)
    df_ltlfond2fond = get_chip_production_ltlfond2fond_dataframe(input_dir)

    # Create a new figure
    fig, ax = plt.subplots()

    # Heuristic legend
    legend_hmax = mlines.Line2D([], [], color='black', linestyle="solid",
                                label=PlanningConfig.heuristic_label(Heuristic.HMAX))
    legend_ff = mlines.Line2D([], [], color='black', linestyle="dotted",
                              label=PlanningConfig.heuristic_label(Heuristic.FF))
    heuristic_legend = ax.legend(handles=[legend_hmax, legend_ff], loc='upper left', title='Heuristic')
    ax.add_artist(heuristic_legend)

    # Encoding legend
    legend_simple = mlines.Line2D([], [], color=action_mode_to_color(ActionMode.MODE_1),
                                  marker=action_mode_to_marker(ActionMode.MODE_1), markeredgecolor="black",
                                  markeredgewidth=0.25, linestyle="solid", label='Simple')
    legend_osa = mlines.Line2D([], [], color=action_mode_to_color(ActionMode.MODE_2),
                               marker=action_mode_to_marker(ActionMode.MODE_2), markeredgecolor="black",
                               markeredgewidth=0.25, linestyle="solid", label='OSA')
    legend_pg = mlines.Line2D([], [], color=action_mode_to_color(ActionMode.MODE_3),
                              marker=action_mode_to_marker(ActionMode.MODE_3), markeredgecolor="black",
                              markeredgewidth=0.25, linestyle="solid", label='PG')
    legend_osapluspg = mlines.Line2D([], [], color=action_mode_to_color(ActionMode.MODE_4),
                                     marker=action_mode_to_marker(ActionMode.MODE_4), markeredgecolor="black",
                                     markeredgewidth=0.25, linestyle="solid", label='OSA+PG')
    legend_ltlfond2fond = mlines.Line2D([], [], color=LTLFOND2FONDCOLOR,
                                     marker=LTLFOND2FONDMARKER, markeredgecolor="black",
                                     markeredgewidth=0.25, linestyle="solid", label='ltlfond2fond')
    encoding_legend = ax.legend(handles=[legend_simple, legend_osa, legend_pg, legend_osapluspg, legend_ltlfond2fond], loc='upper left',
                                title='Encoding', bbox_to_anchor=(0, 0.825))
    ax.add_artist(encoding_legend)

    # tb encoding
    for action_mode in ActionMode:
        color = action_mode_to_color(action_mode)
        marker = action_mode_to_marker(action_mode)
        df_enc = df_tb[df_tb.encoding == action_mode.value]
        df_enc_no_nan = df_enc.fillna(value=MAX_TIMEOUT / 4 + 50.0)
        y_hmax = df_enc_no_nan[df_enc_no_nan.heuristic == "hmax"]
        y_ff = df_enc_no_nan[df_enc_no_nan.heuristic == "ff"]
        x_axis = np.arange(0, y_hmax.shape[0])
        plt.plot(x_axis, y_hmax["PT"], label=PlanningConfig.heuristic_label(Heuristic.HMAX), linestyle="solid",
                 marker=marker, markeredgecolor="black", markeredgewidth=0.25, color=color)
        plt.plot(x_axis, y_ff["PT"], label=PlanningConfig.heuristic_label(Heuristic.FF), linestyle="dotted",
                 marker=marker, markeredgecolor="black", markeredgewidth=0.25, color=color)
        plt.xlabel("length of formula")
        plt.ylabel("Planning Time (PT)")

    # ltlfond2fond encoding
    color = LTLFOND2FONDCOLOR
    marker = LTLFOND2FONDMARKER
    df_enc_no_nan = df_ltlfond2fond.fillna(value=MAX_TIMEOUT / 4 + 50.0)
    y_hmax = df_enc_no_nan[df_enc_no_nan.heuristic == "hmax"]
    y_ff = df_enc_no_nan[df_enc_no_nan.heuristic == "ff"]
    x_axis = np.arange(0, y_hmax.shape[0])
    plt.plot(x_axis, y_hmax["PT"], label=PlanningConfig.heuristic_label(Heuristic.HMAX), linestyle="solid",
             marker=marker, markeredgecolor="black", markeredgewidth=0.25, color=color)
    plt.plot(x_axis, y_ff["PT"], label=PlanningConfig.heuristic_label(Heuristic.FF), linestyle="dotted",
             marker=marker, markeredgecolor="black", markeredgewidth=0.25, color=color)
    plt.xlabel("length of formula")
    plt.ylabel("Planning Time (PT)")


    plt.ylim(0, 150.0)
    plt.xticks(ticks=x_axis.tolist(), labels=[f"c{i}" for i in range(1, len(ALL_SYMBOLS_CHIP_PRODUCTION) + 1)], rotation=15)
    plt.title("Chip Production scenario (deterministic)")

    plt.savefig(output_dir / f"chip_production_deterministic.pdf")



if __name__ == '__main__':
    main()