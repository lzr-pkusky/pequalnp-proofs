import collections
import heapq
import itertools
import json
import random
import re
import sys
from pathlib import Path


def indices(bits):
    while bits:
        low = bits & -bits
        yield low.bit_length() - 1
        bits ^= low


def pair_factor(groups, emit, rng=None):
    groups = list(map(set, groups))
    by_wire = collections.defaultdict(set)
    counts = collections.Counter()
    for i, group in enumerate(groups):
        for w in group:
            by_wire[w].add(i)
        counts.update(itertools.combinations(sorted(group), 2))
    while counts:
        if rng is None:
            (a, b), count = counts.most_common(1)[0]
        else:
            (a, b), count = max(counts.items(), key=lambda p: p[1] + rng.random() * 0.9)
        if count < 2:
            break
        c = emit('or', (a, b))
        shared = by_wire[a] & by_wire[b]
        for i in shared:
            group = groups[i]
            group.remove(a)
            group.remove(b)
            counts[a, b] -= 1
            for w in group:
                for x in (a, b):
                    key = tuple(sorted((x, w)))
                    counts[key] -= 1
                counts[tuple(sorted((c, w)))] += 1
            group.add(c)
        by_wire[a] -= shared
        by_wire[b] -= shared
        by_wire[c] |= shared
        counts = +counts
    return groups


def net(n, rectangles, rng=None, complement=False):
    gates, cache = [], {}

    def emit(op, args):
        key = (op, tuple(sorted(args)))
        if key not in cache:
            cache[key] = 2 * n + len(gates)
            gates.append(key)
        return cache[key]

    def OR(group):
        group = sorted(group)
        result = group[0]
        for wire in group[1:]:
            result = emit('or', (result, wire))
        return result

    lhs = pair_factor([list(indices(r)) for r, _ in rectangles], emit, rng)
    rhs = pair_factor([[n + j for j in indices(c)] for _, c in rectangles], emit, rng)
    terms = [emit('and', (OR(aa), OR(bb))) for aa, bb in zip(lhs, rhs)]
    output = OR(set(terms))
    if complement:
        output = emit('not', (output,))
    return gates, output


def transpose(rows):
    return [sum(1 << i for i, r in enumerate(rows) if r >> j & 1) for j in range(len(rows))]


def bicliques(rows):
    n = len(rows)
    masks = [set(), set()]
    for k, side in enumerate((rows, transpose(rows))):
        for r in side:
            if r.bit_count() >= 3:
                masks[k].add(r)
        for a, b in itertools.combinations(side, 2):
            if (a & b).bit_count() >= 3:
                masks[k].add(a & b)
        for a, b, c in itertools.combinations(side, 3):
            if (a & b & c).bit_count() >= 4:
                masks[k].add(a & b & c)

    def extend(side, columns):
        for column in columns:
            row = (1 << n) - 1
            for j in indices(column):
                row &= side[j]
            if row.bit_count() * column.bit_count() < 20:
                continue
            yield row, column

    cols = transpose(rows)
    both = set(extend(cols, masks[0])) | {(b, a) for a, b in extend(rows, masks[1])}
    boxes = set()
    for a, b in both:
        for i in indices(a):
            b &= rows[i]
        for j in indices(b):
            a &= cols[j]
        boxes.add((a,b))
    return sorted(boxes)


def greedy_cover(rows, boxes, rng, strength):
    n = len(rows)
    full_row = (1 << n) - 1
    remaining = sum(r << (i*n) for i,r in enumerate(rows))
    values = []
    for i, (a,b) in enumerate(boxes):
        cover = sum(b << (j*n) for j in indices(a))
        denominator = (a.bit_count() + b.bit_count()) ** strength
        values.append((cover, denominator, 0.15*rng.random()))

    def weight(n, i):
        cover, d, noise = values[i]
        m = (n & cover).bit_count()
        return m / d + noise, m

    heap = [(-weight(remaining, i)[0], i) for i in range(len(boxes))]
    heapq.heapify(heap)
    selected = []
    next_check = 20
    while heap:
        neg, i = heapq.heappop(heap)
        score, gain = weight(remaining, i)
        if score < -neg:
            heapq.heappush(heap, (-score, i))
            continue
        if gain <= 3 or score < 0.4:
            break
        remaining &= ~values[i][0]
        selected.append(boxes[i])
        if len(selected) == next_check:
            next_check += 20
            yield selected + [(1 << j, remaining >> (j*n) & full_row) for j in range(n) if remaining >> (j*n) & full_row]
    yield selected + [(1 << j, remaining >> (j*n) & full_row) for j in range(n) if remaining >> (j*n) & full_row]


def targets():
    catalog = Path(__file__).with_name('pnp-latest-gaps.json')
    return {g['id']: g for g in json.loads(catalog.read_text())['gaps']}


def verify(rows, gates, output):
    n = len(rows)
    # Bit-parallel semantics on every promised input, independent of synthesis.
    full = (1 << (n*n)) - 1
    parts = [((1 << n)-1) << (n*i) for i in range(n)]
    parts += [sum(1 << (n*i+j) for i in range(n)) for j in range(n)]
    for op, args in gates:
        x = parts[args[0]]
        if op == 'not':
            parts.append(full ^ x)
        else:
            y = parts[args[1]]
            parts.append(x & y if op == 'and' else x | y)
    assert parts[output] == sum(r << (n*i) for i, r in enumerate(rows))


def run(step):
    g = targets()[step]
    rows = [int(s, 16) for s in re.findall(r'0x[0-9a-f]+', g['statement'])]
    limit = int(re.search(r'C.size ≤ (\d+)', g['statement'])[1])
    n = len(rows)
    best = float('inf')
    rng = random.Random(113)

    def attempt(rects, flip, close, label):
        nonlocal best
        if flip:
            rects = [(b, a) for a, b in rects]
        gates, output = net(n, rects, rng, close)
        if len(gates) < best:
            verify(rows, gates, output)
            best = len(gates)
            print(step, label, best, 'gates', flush=True)
            Path(__file__).with_name(f'{step}-best-matrix.json').write_text(json.dumps(dict(gates=gates, output=output)))
        return best <= limit

    if '--biclique' in sys.argv:
        for close in (False, True):
            base = [row ^ ((1 << n) - 1) if close else row for row in rows]
            boxes = bicliques(base)
            print(step, len(boxes), 'candidate rectangles', close, flush=True)
            for exponent in (1, 1.15, 0.85, 0.7, 1.25, 1.4):
                for _ in range(3):
                    for rects in greedy_cover(base, boxes, rng, exponent):
                        if attempt(rects, False, close, ('greedy', len(rects), exponent, close)):
                            return
        return

    for close in (False, True):
        base = [row ^ ((1 << n) - 1) if close else row for row in rows]
        for flip, matrix in enumerate((base, transpose(base))):
            for _ in range(5):
                if attempt([(1 << i, r) for i, r in enumerate(matrix) if r], flip, close, ('stars', flip, close)):
                    return
    for close in (False, True):
        base = [row ^ ((1 << n) - 1) if close else row for row in rows]
        for flip, matrix in enumerate((base, transpose(base))):
            for k in (4, 5, 6, 8, 10, 12, 16):
                for _ in range(8):
                    order = list(range(n))
                    rng.shuffle(order)
                    rectangles = []
                    for start in range(0, n, k):
                        available = sum(1 << j for j in order[start:start+k])
                        same_mask = collections.defaultdict(int)
                        for i, r in enumerate(matrix):
                            active = available & r
                            if active:
                                same_mask[active] |= 1 << i
                        rectangles.extend((r, c) for c, r in same_mask.items())
                    if attempt(rectangles, flip, close, ('partition', k, flip, close)):
                        return


if __name__ == '__main__':
    run(sys.argv[1])
