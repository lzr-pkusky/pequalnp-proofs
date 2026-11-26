"""Build a DIMACS SAT instance for a rectangular one-hot AND/OR circuit."""

import argparse
from pathlib import Path
import sys


DEFAULT_BUILDER = (
    Path(__file__).resolve().parents[3]
    / "referenced-chatgpt-conversation-this-is-an-2"
    / "work"
)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("rows", type=int)
    parser.add_argument("columns", type=int)
    parser.add_argument("mask", type=lambda value: int(value, 0))
    parser.add_argument("gates", type=int)
    parser.add_argument("output", type=Path)
    parser.add_argument("--builder-dir", type=Path, default=DEFAULT_BUILDER)
    args = parser.parse_args()
    if min(args.rows, args.columns, args.gates) < 1:
        parser.error("expected positive dimensions and gate count")
    if not 0 <= args.mask < 1 << (args.rows * args.columns):
        parser.error("mask must fit the row-major table")

    sys.path.insert(0, str(args.builder_dir.resolve()))
    from circuit_search import build

    input_count = args.rows + args.columns
    one_each = [
        (1 << row) | (1 << (args.rows + column))
        for row in range(args.rows)
        for column in range(args.columns)
    ]
    table = sum(1 << valuation for index, valuation in enumerate(one_each) if args.mask >> index & 1)
    formula, _ = build(
        input_count, args.gates, table, one_each, use_not=False,
        require_inputs=False, order=False,
    )
    with args.output.open("w", encoding="ascii", newline="\n") as out:
        print("p cnf", formula.variables, len(formula.clauses), file=out)
        for clause in formula.clauses:
            print(*clause, 0, file=out)


if __name__ == "__main__":
    main()
