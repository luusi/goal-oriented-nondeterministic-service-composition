import shutil
from itertools import product
from pathlib import Path

import numpy as np
from pylatex import Document, Tabular, MultiColumn, NoEscape

from experiments.core import ActionMode, Heuristic, Encoding
from experiments.plotting.utils import parse_args, ExpType, PlanningConfig, heuristic_list, make_small, NA, \
    stats_as_row, empty_row, read_encoding_summary, PlanningStats

from experiments.domains.electric_motor import ALL_SYMBOLS as ALL_SYMBOLS_ELECTRIC_MOTOR


metrics_headers = ('TT', 'PT', 'EN', 'PS')
expcombs = [
    PlanningConfig(am, h)
    for h in heuristic_list() for am in ActionMode
]
nb_metrics = len(metrics_headers)
nb_heuristics = len(heuristic_list())
nb_configurations = len(expcombs)
nb_columns = nb_metrics * 2 + 1

# 1 benchmark + 4 metrics times
# table = Tabular('|c' * nb_metrics * nb_configurations + "|")
table_config = '||c||' + ("|".join(['c'] * nb_metrics * 2) + "||")



def _get_document() -> Document:
    geometry_options = {
        "margin": "0in",
        "includeheadfoot": True
    }
    doc = Document(documentclass="article", document_options=["landscape"], geometry_options=geometry_options)
    return doc


def _add_subheaders(table: Tabular):

    # add metrics
    table.add_row([""] + list(map(make_small, metrics_headers)) * 2)
    table.add_hline()


def _populate_table(input_dir, table: Tabular, prefix: str, title: str, unsolvable: bool=False):
    labels = ExpType.ELECTRIC_MOTOR_NONDET.labels() if not unsolvable else ExpType.ELECTRIC_MOTOR_NONDET_UNSOLVABLE.labels()
    table.add_row([MultiColumn(nb_columns, align='c',data=NoEscape(title))])
    # table.add_hline(start=3, end=5)
    # table.add_hline(start=7, end=9)
    table.add_hline()
    # table.add_row([MultiColumn(2, align="", data=""),
    #                MultiColumn(nb_metrics-1, align='||c||', data=NoEscape(PlanningConfig.heuristic_label(Heuristic.HMAX))),
    #                "", MultiColumn(nb_metrics-1, align='||c||', data=NoEscape(PlanningConfig.heuristic_label(Heuristic.FF)))])
    table.add_row(["",
                   MultiColumn(nb_metrics, align='||c||', data=NoEscape(PlanningConfig.heuristic_label(Heuristic.HMAX))),
                   MultiColumn(nb_metrics, align='||c||', data=NoEscape(PlanningConfig.heuristic_label(Heuristic.FF)))])
    table.add_hline()
    _add_subheaders(table)

    table.add_hline()
    for length in range(0, 7):
        stats_row = []
        for heuristic in Heuristic:
            resultdirname = f"{prefix}_{length}_{heuristic.value}" if not unsolvable else f"{prefix}_{heuristic.value}"
            result_dirpath = input_dir / resultdirname
            encoding_summary_path = result_dirpath / "encoding_summary.txt"
            planning_stdout_path = result_dirpath / "planning_stdout.txt"
            total_enc_time, return_code, timed_out = read_encoding_summary(encoding_summary_path)
            total_enc_time = total_enc_time if return_code == 0 else None
            planning_stats = PlanningStats.parse(planning_stdout_path.read_text())
            cur_stats_row = [round(total_enc_time, 4) if total_enc_time is not None else None, round(planning_stats.total, 4) if planning_stats.total is not None else None, planning_stats.node_expansion, planning_stats.policy_size]
            cur_stats_row = [el if el is not None else "---" for el in cur_stats_row]
            if unsolvable:
                cur_stats_row[2] = "N/A"
                cur_stats_row[3] = "N/A"
            stats_row.extend(cur_stats_row)

        _make_min_bold(stats_row)

        table.add_row([labels[length]] + list(map(make_small, stats_row)))
        table.add_hline()

        if unsolvable:
            break


def _make_min_bold(stats_row):
    for metric_id in range(1, nb_metrics):
        filtered_indexed_entries = list(enumerate(stats_row))[metric_id::nb_metrics]
        filtered_indexed_entries_mapped = list(map(lambda x: x[1] if isinstance(x[1], (float, int)) else float('inf'), filtered_indexed_entries))
        index_array = np.array(filtered_indexed_entries_mapped)
        min_index_array = np.where(index_array == np.min(index_array))[0]
        for index in min_index_array:
            new_index = metric_id + index * nb_metrics
            value = stats_row[new_index]
            if value != float('inf') and value != "---" and value != "N/A":
                stats_row[new_index] = f"\\textbf{{{value}}}"


def main():
    arguments = parse_args()
    input_dir: Path = Path(arguments.input_dir)
    if not input_dir.exists():
        raise ValueError("Input directory does not exist")

    output_dir: Path = Path(arguments.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    doc = _get_document()
    with doc.create(Tabular(table_config)) as table:
        _populate_table(input_dir, table,  "electric_motor_nondet", r"\textbf{Electric Motor scenario (nondeterministic)}")
    (output_dir / f"table_electric_motor_nondet.tex").write_text(table.dumps())
    doc.generate_pdf(str(output_dir / f'table_electric_motor_nondet.pdf'), clean_tex=False)

    doc = _get_document()
    with doc.create(Tabular(table_config)) as table:
        _populate_table(input_dir, table,  "electric_motor_nondet_unsolvable", r"\textbf{Electric Motor scenario (nondeterministic, unsolvable)}", unsolvable=True)
    (output_dir / f"table_electric_motor_nondet_unsolvable.tex").write_text(table.dumps())
    doc.generate_pdf(str(output_dir / f'table_electric_motor_nondet_unsolvable.pdf'), clean_tex=False)



if __name__ == '__main__':
    main()