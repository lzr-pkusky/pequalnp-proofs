# Independent proof of L-meta-18649

[`GateElimination.lean`](GateElimination.lean) proves the exact posted statement. After fixing an input in a fan-in-two AND/OR/NOT circuit, it eliminates all gates in the two designated disjoint sets. Gates in the first set have a constant output or a constant input. Gates in the second set are outside the output and can be read only by other deleted gates or by gates known to be constant. The replacement circuit saves at least the total cardinality of the two sets.

## Proof strategy

Process the old gates in order. Each surviving wire is represented by a Boolean constant or by a live wire in the new prefix. AND and OR with one constant input simplify to a constant or a copy, and a NOT gate has exactly one input. The condition on readers allows the second set to be skipped even when it feeds gates proved constant. A read beyond the current prefix is represented by false, matching the evaluator even when the old circuit has a forward reference. A constant-true final output is excluded by the false-output witness in the posted hypotheses.

The induction preserves the represented wire functions and bounds the number of emitted gates by the number of old gates outside the two sets.

## Verification and status

- Lean 4.36.0 and the pinned Mathlib accepted the exact statement. The project format guard passed, and the local project checker returned `ACCEPTED (check)` and rechecked 1,709 constants.
- The proof's only axiom dependencies are `propext`, `Classical.choice`, and `Quot.sound`. The source contains no `sorry`, `admit`, `native_decide`, or added axioms.
- The checked proof file has SHA-256 `51979ab06c09022d0e1f99260ce1d85bd98d68e17ae5c2ce79aa4c4613ae03fb` at project revision `25493cae4df9e77a9a1f811062c5bc673c5cdf50`.
- The desk closed the step after a separate proof reached upstream. This branch archives the independent proof. There was no upstream submission from this branch. [Upstream theorem](https://github.com/open-goat/pequalnp-proofs/blob/main/lean/PEqualNP/Outside/L_meta_18649.lean)

```sh
cd lean
lake env lean ../research/L-meta-18649/GateElimination.lean
```
