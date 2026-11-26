import sys

from circuit_search import main


def graph_test(solver, p, column_masks):
    n = p + len(column_masks)
    edges = [((1 << point) | (1 << (p + line)))
             for line, col in enumerate(column_masks)
             for point in range(p) if col >> point & 1]
    cover = min(row.bit_count() for row in range(1 << n)
                if all(row & e for e in edges))
    table = sum(1 << row for row in range(1 << n)
                if any(row & e == e for e in edges))
    cap = len(edges) + cover - 2
    print(f'{p} x {n-p}, columns {column_masks}, {len(edges)} edges, cover {cover}, cap {cap}', flush=True)
    main(solver, n, cap, table, False, p)


if __name__ == '__main__':
    graph_test(sys.argv[1], int(sys.argv[2]), tuple(map(int, sys.argv[3:])))
