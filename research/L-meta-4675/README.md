# L-meta-4675 partial result for star forests

This branch preserves a locally verified special case of L-meta-4675. The general four-cycle-free case remains open here.

## Statement proved

Let `E` be the edge set of a finite bipartite graph on `p` points and `l` lines. Assume that every edge has an endpoint incident to no other edge. The graph is then a disjoint union of stars and isolated vertices. Let `C` be a circuit with fan-in at most two that outputs true exactly when the input selects both endpoints of some edge in `E`.

The Lean theorem `PEqualNP.StarForestLowerBound.disjoint_stars_bound` constructs a vertex cover `S` with

```text
|E| + |S| ≤ C.size + 1.
```

The proof allows star centers on either side and includes the empty graph. It needs no restriction on the gate operations beyond the fan-in bound.

## Proof strategy

1. Trace the output backward through the gate list. Replacing a watched gate output by its at most two inputs adds at most one watched wire. Thus at most `C.size + 1` input coordinates can be essential.
2. Every incident vertex is essential. Turn on the two endpoints of one of its edges, then turn off that vertex. The output changes from true to false.
3. Orient each star edge from its center to its leaf. The distinct leaves are in bijection with the edges, and the centers form a disjoint vertex cover. Counting both sets within the essential inputs gives the inequality.

## Remaining obstacle

Four-cycle-free graphs can have edges whose endpoints both have degree at least two. For such graphs, counting distinct incident vertices can fall short of the required edge-plus-cover count. For example, this argument gives five gates for a six-cycle, while the requested inequality gives eight. Extending the proof requires a bound on additional gates, accounting for how a circuit can share intermediate expressions among edges even when its OR gates obey the posted color restriction.

## Lean verification

- The file compiled locally with Lean 4.36.0 and Mathlib at `fc4f59e577feb1a4956671bc04ac18aaaf8cd842`, using project revision `25493cae4df9e77a9a1f811062c5bc673c5cdf50`.
- The source scan found no `sorry`, `admit`, `native_decide`, or added axiom declarations. Lean reports only `propext`, `Classical.choice`, and `Quot.sound` for `disjoint_stars_bound`.
- A local Lean test instantiated the theorem on two disjoint stars centered on opposite sides and derived the expected five-gate lower bound.

To reproduce the file check from the repository root with the pinned dependencies available:

```sh
cd lean
lake env lean ../research/L-meta-4675/LMeta4675StarForest.lean
```

To inspect the theorem's axiom dependencies in the same environment:

```sh
{ cat ../research/L-meta-4675/LMeta4675StarForest.lean
  printf '\n#print axioms PEqualNP.StarForestLowerBound.disjoint_stars_bound\n'
} | lake env lean --stdin
```
