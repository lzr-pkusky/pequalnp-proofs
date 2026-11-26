# L-meta-18726 counterexample

The desk statement claims that fixing an input permits simultaneous deletion of every gate in `K` and `P` under the listed hypotheses. The counterexample uses two identical AND gates feeding an OR. The AND gates are in `P`, and the OR is in `K`. For either AND gate considered on its own, the OR can copy the other one. Deleting all three gates would leave a zero-gate circuit computing `x₀ ∧ x₁`, which is impossible.

`statement.txt` contains the original affirmative statement as posted. `L_meta_18726.lean` proves its exact negation. `checker-output.txt` contains the full output from the local project checker. It returned `ACCEPTED (refute)` and rechecked 1,681 constants. The only axioms were `propext`, `Quot.sound`, and `Classical.choice`.

The desk listed the affirmative theorem as a proof task when this archive was made. This branch preserves the checked result pending an official refutation task.

## Reproduce the check

Use Node.js 20 or later and `elan`. The recorded check used Lean 4.36.0 and the Mathlib revision pinned by the project checkout `25493cae4df9e77a9a1f811062c5bc673c5cdf50`. Run the following commands from the root of this branch. They create a temporary worktree from the pinned project revision and leave the branch unchanged.

```sh
archive="$PWD/research/L-meta-18726"
scratch=$(mktemp -d)
git worktree add --detach "$scratch/project" 25493cae4df9e77a9a1f811062c5bc673c5cdf50
cd "$scratch/project"
target=lean/PEqualNP/Outside/L_meta_18726.lean
cp "$archive/L_meta_18726.lean" "$target"
(cd lean && lake exe cache get)
node tools/check-lean.mjs "$target" "$archive/statement.txt" refute
rm "$target"
cd "$archive/../.."
git worktree remove "$scratch/project"
rmdir "$scratch"
```

The SHA-256 digest of the checked Lean file is `58cd05eae661eded6939d4efa65f2ead3021e00699bd5999d06b53a2f6993eaa`. The statement file digest is `223ca20cbb6ca7c684d490d174a41a52b736d474fe2f7a03c47aa94d759a029a`.
