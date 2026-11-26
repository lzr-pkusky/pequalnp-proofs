import heapq
import json
import random
import sys
from pathlib import Path


POINTS = 12
LINES = 13
INPUTS = POINTS + LINES
PENCIL = (12, 13, 15, 21)
NEIGHBORS = [sum(1 << i for i in range(LINES)
                 if (p + i + 14) % 13 in (0, 1, 3, 9)) for p in range(POINTS)]
EDGES = [(p, i + POINTS) for p, neighbors in enumerate(NEIGHBORS)
         for i in range(LINES) if 1 << i & neighbors]


def maximal_independent_sets(allowed_lines):
    for points in range(1 << POINTS):
        lines = allowed_lines
        for p, neighbors in enumerate(NEIGHBORS):
            if points >> p & 1:
                lines &= ~neighbors
        if all(points >> p & 1 or neighbors & lines for p, neighbors in enumerate(NEIGHBORS)):
            yield points | lines << POINTS


def test_rows():
    all_lines = (1 << LINES) - 1
    pencil_lines = sum(1 << (i - POINTS) for i in PENCIL)
    output_true = {1 << p | 1 << l for p, l in EDGES}
    output_false = set(maximal_independent_sets(all_lines))
    pencil_true = {1 << i for i in PENCIL}
    pencil_false = set(maximal_independent_sets(all_lines & ~pencil_lines))
    rows = sorted(output_true | output_false | pencil_true | pencil_false)
    wires = [sum((row >> i & 1) << j for j, row in enumerate(rows)) for i in range(INPUTS)]
    mask = lambda s: sum(1 << j for j, row in enumerate(rows) if row in s)
    targets = [(mask(ones | zeros), mask(ones))
               for ones, zeros in ((output_true, output_false), (pencil_true, pencil_false))]
    print('edges, main negative tests, auxiliary negative tests, total tests:',
          len(EDGES), len(output_false), len(pencil_false), len(rows), flush=True)
    return wires, targets


def star_circuit(order, pencil, auxiliary_first):
    gates = []

    def gate(op, a, b):
        out = INPUTS + len(gates)
        gates.append((op, min(a, b), max(a, b)))
        return out

    def any_wire(bits):
        value = bits[0]
        for b in bits[1:]:
            value = gate(1, value, b)
        return value

    auxiliary = any_wire(pencil) if auxiliary_first else None
    terms = [gate(0, p, any_wire([l for a, l in EDGES if a == p])) for p in order]
    output = any_wire(terms)
    return gates, (output, any_wire(pencil) if auxiliary is None else auxiliary)


def score(gates, outputs, root, targets):
    wires = root.copy()
    for op, a, b in gates:
        if op == 0:
            wires.append(wires[a] & wires[b])
        elif op == 1:
            wires.append(wires[a] | wires[b])
        else:
            wires.append(wires[a])
    return sum(((wires[i] & mask) ^ truth).bit_count()
               for i, (mask, truth) in zip(outputs, targets))


def save(gates, outputs):
    kept = []
    indices = list(range(INPUTS))
    for op, a, b in gates:
        if op == 2:
            indices.append(indices[a])
        else:
            indices.append(INPUTS + len(kept))
            kept.append((op, indices[a], indices[b]))
    assert len(kept) <= 61
    Path(__file__).with_name('L-meta-2215-witness.json').write_text(json.dumps({
        'gates': kept, 'outputs': [indices[i] for i in outputs],
    }))
    print('Found a candidate on every extremal test', flush=True)


def main():
    root, targets = test_rows()
    rng = random.Random(2215)
    order = list(range(POINTS))
    pencil = list(PENCIL)
    full = '--full' in sys.argv
    for restart in range(4 if full else 8):
        gates, outputs = star_circuit(order, pencil, restart % 2 == 1)
        assert len(gates) == 62 and score(gates, outputs, root, targets) == 0
        candidates = []
        for drop in range(len(gates)):
            old = gates[drop]
            for wire in range(INPUTS + drop):
                gates[drop] = (2, wire, wire)
                distance = score(gates, outputs, root, targets)
                if distance == 0:
                    save(gates, outputs)
                    return
                candidates.append((distance, drop, wire))
            gates[drop] = old
        by_gate = {}
        for candidate in heapq.nsmallest(200, candidates):
            by_gate.setdefault(candidate[1], candidate)
        seeds = sorted(by_gate.values())[:22] if full else heapq.nsmallest(18, candidates)
        print(f'Order {restart + 1}: closest single-gate deletion misses {seeds[0][0]} tests', flush=True)
        for base_score, drop, wire in seeds:
            trial = gates.copy()
            trial[drop] = (2, wire, wire)
            for gate_idx, (op, a, b) in enumerate(gates):
                if gate_idx == drop:
                    continue
                inputs = range(INPUTS + gate_idx)
                if full:
                    changes = ((o, i, j) for j in inputs for i in range(j) for o in (0, 1))
                else:
                    changes = [(1 - op, a, b)]
                    changes += [(op, min(a, w), max(a, w)) for w in inputs if w != b]
                    changes += [(op, min(w, b), max(w, b)) for w in inputs if w != a]
                for new_gate in changes:
                    trial[gate_idx] = new_gate
                    if score(trial, outputs, root, targets) == 0:
                        save(trial, outputs)
                        return
                trial[gate_idx] = gates[gate_idx]
        rng.shuffle(order)
        rng.shuffle(pencil)
    print('No 61-gate circuit found by deletion and one local replacement', flush=True)


if __name__ == '__main__':
    main()
