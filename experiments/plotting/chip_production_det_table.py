import shutil
from itertools import product
from pathlib import Path

import numpy as np
from pylatex import Document, Tabular, MultiColumn, NoEscape

from experiments.core import ActionMode, Heuristic, Encoding
from experiments.plotting.utils import parse_args, ExpType, PlanningConfig, heuristic_list, make_small, NA, \
    stats_as_row, empty_row, read_encoding_summary, PlanningStats

from experiments.domains.chip_production import ALL_SYMBOLS as ALL_SYMBOLS_CHIP_PRODUCTION


metrics_headers = ('TT', 'PT', 'EN', 'PS')
expcombs = [
    PlanningConfig(am, h)
    for h in heuristic_list() for am in ActionMode
]
nb_metrics = len(metrics_headers)
nb_heuristics = len(heuristic_list())
nb_configurations = len(expcombs)
nb_columns = nb_metrics + 1

# 1 benchmark + 4 metrics times
# table = Tabular('|c' * nb_metrics * nb_configurations + "|")
table_config = '||c||' + ("|".join(['c'] * nb_metrics) + "||")



def _get_document() -> Document:
    geometry_options = {
        "margin": "0in",
        "includeheadfoot": True
    }
    doc = Document(documentclass="article", document_options=["landscape"], geometry_options=geometry_options)
    return doc



def _populate_table_tb(input_dir, table: Tabular):
    labels = [f"c{i}" for i in range(1, len(ALL_SYMBOLS_CHIP_PRODUCTION) + 1)]
    title = r"\textbf{Chip Production scenario (deterministic, TB)}"
    table.add_row([MultiColumn(1 + nb_metrics * len(ActionMode), align='c', data=NoEscape(title))])
    table.add_hline()

    rows = []
    for am in ActionMode:
        row = MultiColumn(nb_metrics, align='|c|', data=make_small(PlanningConfig.action_mode_label(am)))
        rows.append(row)
    table.add_row(tuple([""] + rows))
    table.add_hline()
    # add metrics
    table.add_row([""] + list(map(make_small, metrics_headers)) * nb_metrics)
    table.add_hline()

    for heuristic in heuristic_list():
        table.add_row(
            [MultiColumn(nb_metrics*len(ActionMode)+1, align='||c||', data=NoEscape(PlanningConfig.heuristic_label(heuristic)))])
        table.add_hline()
        for length in range(1, 13):
            stats_row = []
            for action_mode in ActionMode:
                resultdirname = f"chip_production_len_{length}_{action_mode.value}_{heuristic.value}"
                result_dirpath = input_dir / resultdirname
                encoding_summary_path = result_dirpath / "encoding_summary.txt"
                planning_stdout_path = result_dirpath / "planning_stdout.txt"
                total_enc_time, return_code, timed_out = read_encoding_summary(encoding_summary_path)
                total_enc_time = round(total_enc_time, 4) if return_code == 0 else "---"
                planning_stats = PlanningStats.parse(planning_stdout_path.read_text())
                cur_stats_row = [total_enc_time,
                                 round(planning_stats.total, 4) if planning_stats.total is not None else "---",
                                 planning_stats.node_expansion if planning_stats.node_expansion is not None else "---",
                                 planning_stats.policy_size if planning_stats.policy_size is not None else "---"]

                stats_row.extend(cur_stats_row)

            _make_min_bold(stats_row)

            table.add_row([labels[length - 1]] + list(map(make_small, stats_row)))
            table.add_hline()

def _populate_table(input_dir, table: Tabular):
    labels = ExpType.CHIP_PRODUCTION_DET.labels()
    title = r"\textbf{Chip Production scenario (deterministic, ltlfond2fond)}"

    table.add_row([MultiColumn(nb_metrics * len(Heuristic) + 1, align='c', data=NoEscape(title))])
    # table.add_hline(start=3, end=5)
    # table.add_hline(start=7, end=9)
    table.add_hline()
    table.add_row(["",
                   MultiColumn(nb_metrics, align='||c||', data=NoEscape(PlanningConfig.heuristic_label(Heuristic.HMAX))),
                   MultiColumn(nb_metrics, align='||c||', data=NoEscape(PlanningConfig.heuristic_label(Heuristic.FF)))])
    table.add_hline()

    # add metrics
    table.add_row([""] + list(map(make_small, metrics_headers)) * len(Heuristic))
    table.add_hline()

    for length in range(1, 13):
        stats_row = []
        for heuristic in heuristic_list():
            resultdirname = f"chip_production_ltlfond2fond_len_{length}_{heuristic.value}"
            result_dirpath = input_dir / resultdirname
            encoding_summary_path = result_dirpath / "encoding_summary.txt"
            planning_stdout_path = result_dirpath / "planning_stdout.txt"
            total_enc_time, return_code, timed_out = read_encoding_summary(encoding_summary_path)
            total_enc_time = total_enc_time if return_code == 0 else None
            planning_stats = PlanningStats.parse(planning_stdout_path.read_text())
            cur_stats_row = [round(total_enc_time, 4) if total_enc_time is not None else None,
                             round(planning_stats.total, 4) if planning_stats.total is not None else None,
                             planning_stats.node_expansion, planning_stats.policy_size]
            cur_stats_row = [el if el is not None else "---" for el in cur_stats_row]
            stats_row.extend(cur_stats_row)
        _make_min_bold_ltlfond2fond(stats_row)

        table.add_row([labels[length-1]] + list(map(make_small, stats_row)))
        table.add_hline()


def _make_min_bold(stats_row):
    for metric_id in range(0, nb_metrics):
        filtered_indexed_entries = list(enumerate(stats_row))[metric_id::nb_metrics]
        minidx, minel = min(filtered_indexed_entries,
                            key=lambda x: x[1] if isinstance(x[1], (float, int)) else float('inf'))
        if minel != float('inf'):
            stats_row[minidx] = f"\\textbf{{{minel}}}"


def _make_min_bold_ltlfond2fond(stats_row):
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
    with doc.create(Tabular('||c||' + ("|".join(['c'] * nb_metrics * len(ActionMode)) + "||"))) as table:
        _populate_table_tb(input_dir, table)
    (output_dir / f"table_chip_production_tb_det.tex").write_text(table.dumps())
    doc.generate_pdf(str(output_dir / f'table_chip_production_tb_det.pdf'), clean_tex=False)

    doc2 = _get_document()
    with doc2.create(Tabular('||c||' + ("|".join(['c'] * nb_metrics * len(Heuristic)) + "||"))) as table2:
        _populate_table(input_dir, table2)
    (output_dir / f"table_chip_production_det.tex").write_text(table2.dumps())
    doc2.generate_pdf(str(output_dir / f'table_chip_production_det.pdf'), clean_tex=False)



if __name__ == '__main__':
    main()