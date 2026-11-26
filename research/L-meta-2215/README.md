# L-meta-2215 incidence-circuit research

The posted step asks for a fan-in-two AND/OR circuit of size at most 61. The main output must recognize the 48 incidences between 12 points and 13 lines. On inputs where the main output is false, a designated wire must equal the OR of line inputs 12, 13, 15, and 21.

## Verified baseline

[`Baseline62.lean`](Baseline62.lean) constructs a 62-gate circuit with both required outputs. One star per point uses three OR gates and one AND gate, for 48 gates. Eleven OR gates combine the stars, and three more OR gates compute the auxiliary wire. The auxiliary equality holds on every input in this construction.

The proof expands the actual wire list into Boolean expressions, checks the finite incidence list, and uses Boolean distributivity to identify the main output with the disjunction of its edge terms. It proves correctness for arbitrary inputs without enumerating all `2^25` assignments.

## Why the obvious sharing does not save a gate

[`StarArchitecture.lean`](StarArchitecture.lean) checks an explicit 12-edge matching, that any two stars on the same side have at most one common leaf, and that each point is incident to exactly one of the four auxiliary lines. The matching forces at least 12 centers in any vertex cover.

In a circuit that assigns each edge to one star, uses an OR tree of raw leaf inputs within each star, and ORs the completed stars, two different bottom OR trees cannot share a subexpression with two or more distinct leaves. The same argument rules out sharing a nontrivial bottom OR with a pure OR tree for the auxiliary wire. Opposite-side stars use disjoint types of leaves. The top OR tree combines star outputs and is false on singletons, whereas a nonempty pure input OR is true on a singleton. Within this architecture the checked cost expression is at least 62, even if the centers can be on either side.

This leaves open circuits that filter shared expressions through further AND gates, reuse a wire outside these OR trees, or exploit the fact that the auxiliary wire is unconstrained on accepted inputs.

## Local verification

The two files were checked with Lean 4.36.0 and Mathlib revision `fc4f59e577feb1a4956671bc04ac18aaaf8cd842` at project revision `25493cae4df9e77a9a1f811062c5bc673c5cdf50`. The source contains no `sorry`, `admit`, `native_decide`, or added axiom declarations. Lean reports only `propext`, `Classical.choice`, and `Quot.sound` for the correctness theorem, the cost theorem, and the checked overlap properties. The literal gate count uses no axioms.

From the repository root, with the pinned packages available:

```sh
cd lean
lake env lean ../research/L-meta-2215/Baseline62.lean
lake env lean ../research/L-meta-2215/StarArchitecture.lean
```

See [`LOG.md`](LOG.md) for search methods and outcomes.
