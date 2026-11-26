import functools
import json
import random
import re
import subprocess
import sys
import tempfile
from pathlib import Path


def indices(bits):
    while bits:
        low = bits & -bits
        yield low.bit_length() - 1
        bits ^= low


def load(step, gaps):
    statement = next(g['statement'] for g in gaps if g['id'] == step)
    width = int(re.search(r'× Finset \(Fin (\d+)\)', statement)[1])
    limit = int(re.search(r'L.length ≤ (\d+)', statement)[1])
    rows = json.loads(re.search(r'\(\[(.*?)\] : List ℕ\)', statement)[0][1:-9].strip())
    if ').testBit j.val = false' in statement:
        rows = [row ^ ((1 << width) - 1) for row in rows]
    return width, limit, rows


def search(step, width, limit, rows):
    intersections = {(1 << width) - 1}
    for row in rows:
        intersections.update(mask & row for mask in list(intersections) if mask & row)
    rects = []
    cover = []
    for cols in sorted(intersections):
        rr = [i for i, row in enumerate(rows) if cols & row == cols]
        if rr:
            rects.append([rr, list(indices(cols))])
            cover.append(sum(cols << (i * width) for i in rr))
    full = sum(row << (i * width) for i, row in enumerate(rows))
    print(step, len(rects), full.bit_count(), flush=True)
    candidates = {bit: [] for bit in indices(full)}
    for k, mask in enumerate(cover):
        for bit in indices(mask):
            candidates[bit].append(k)

    def result(found):
        ans = [rects[k] for k in found]
        outfile = Path(__file__).with_name(f'{step}-rectangles.json')
        outfile.write_text(json.dumps(ans) + '\n')
        print('FOUND', step, len(ans), flush=True)

    if len(cover) < 8000 and '--sat' in sys.argv:
        sat = Path(__file__).with_name('lean-4.36.0-darwin_aarch64') / 'bin' / 'cadical'
        with tempfile.TemporaryDirectory() as directory:
            cnf = Path(directory) / 'cover.cnf'
            n = len(cover)
            aux = lambda i, j: n + i * limit + j + 1
            clauses = [[k + 1 for k in group] for group in candidates.values()]
            for i in range(n):
                clauses.append([-(i + 1), aux(i, 0)])
                if i:
                    clauses.append([-(i + 1), -aux(i - 1, limit - 1)])
                    for j in range(limit):
                        clauses.append([-aux(i - 1, j), aux(i, j)])
                        if j:
                            clauses.append([-(i + 1), -aux(i - 1, j - 1), aux(i, j)])
            with cnf.open('w') as f:
                print(f'p cnf {n * (limit + 1)} {len(clauses)}', file=f)
                for c in clauses:
                    print(*c, 0, file=f)
            try:
                p = subprocess.run([sat, '-q', cnf], text=True, capture_output=True, timeout=85)
            except subprocess.TimeoutExpired:
                print('SAT TIMEOUT', step, flush=True)
                return
            if p.returncode == 10:
                positive = [int(x) for line in p.stdout.splitlines() if line.startswith('v ') for x in line[2:].split() if int(x) > 0]
                found = tuple(x - 1 for x in positive if x <= n)
                remain = full
                for k in found:
                    remain &= ~cover[k]
                assert not remain and len(found) <= limit
                result(found)
            elif p.returncode == 20:
                print('UNSAT', step, flush=True)
            else:
                print(p.returncode, p.stdout[-1000:], p.stderr[-1000:], flush=True)
        return

    if len(cover) < 300 and '--exact' in sys.argv:
        @functools.lru_cache(maxsize=None)
        def exact(left, budget):
            if not left:
                return ()
            if budget == 0:
                return None
            bit = min(indices(left), key=lambda b: len(candidates[b]))
            choices = sorted(candidates[bit], key=lambda k: -(left & cover[k]).bit_count())
            for k in choices:
                found = exact(left & ~cover[k], budget - 1)
                if found is not None:
                    return (k, *found)
            return None

        found = exact(full, limit)
        if found is not None:
            result(found)
        else:
            print('UNSAT', step, exact.cache_info(), flush=True)
        return

    # Randomized greedy construction. Ranks incrementally and varies the amount
    # of noise, so successive iterations can escape the same initial choices.
    rng = random.Random(19)
    best = len(rows) + 1
    for iteration in range(1200):
        left, selected = full, []
        noise = rng.choice((2, 3, 4, 6, 8, 12))
        while left and len(selected) < best:
            scores = [0] * len(cover)
            for bit in indices(left):
                for k in candidates[bit]:
                    scores[k] += 1
            k = max(range(len(cover)), key=lambda k: scores[k] + rng.random() * min(noise, scores[k]))
            left &= ~cover[k]
            selected.append(k)
        if not left and len(selected) < best:
            best = len(selected)
            print('best', step, best, iteration, flush=True)
            if len(selected) <= limit:
                return result(selected)


if __name__ == '__main__':
    gaps = json.loads(Path(__file__).with_name('pnp-current-gaps.json').read_text())['gaps']
    for step in (s for s in sys.argv[1:] if not s.startswith('--')):
        search(step, *load(step, gaps))
