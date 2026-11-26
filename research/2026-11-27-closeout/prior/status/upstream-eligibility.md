# Upstream proof eligibility, 26 November 2026

GitHub authenticated `lzr-pkusky`. The upstream pull request query returned no pull requests under that account. The latest desk catalog used for this pass was published at 22:00 Shanghai time.

| Result | Verification | Upstream disposition |
| --- | --- | --- |
| L-meta-4675 | Lean-checked lower bound for star forests | The theorem on the desk covers general bipartite 4-cycle-free graphs. The star-forest proof is partial and the row was stood down in the latest catalog. |
| L-meta-2215 | Lean-checked 62-gate circuit with the requested auxiliary behavior | The posted bound is 61. The related incidence thresholds checked in the catalog also require one fewer gate than the star construction on their stated graphs. The original row was stood down. |
| L-meta-18649 | Lean-checked and accepted by the local project checker | A prior proof is recorded as checked on upstream main. |
| L-meta-19660, 19661, 19662, 19663, 19664, 19665, 19667, 19671 and 19672 | Lean checked the exact statements on all 25 promised inputs. Circuit witnesses use 8 to 10 gates. | The live desk showed pending upstream PRs for all nine steps. |
| L-meta-18726 | A Lean-checked counterexample to the exact posted statement. The local project checker returned `ACCEPTED (refute)` and rechecked 1,681 constants. | The catalog offers the affirmative statement. It has no posted refutation row for this statement. |

For L-meta-18726, two identical AND gates feed a final OR. The two AND gates belong to the pruning set and the OR belongs to the copy-elimination set. For each AND gate individually, the OR copies the other gate. Removing all three would leave a zero-gate circuit for a function that depends on two inputs. This exhibits the missing requirement that a selected copy source survive pruning.

The new Lean proofs depend only on `propext`, `Quot.sound`, and `Classical.choice`.

The seven-cycle step L-meta-18791 was open. SAT tests reported unsatisfiability for two one-gate realizations of the other OR operand and for two larger searches that constrained the OR position and excluded constants. No Lean lower-bound proof was produced. Two bounded searches for the 11-gate perfect matching circuit, L-meta-17389, timed out. The 10×10 rectangle cover with nine boxes was unsatisfiable in a finite set-cover encoding. The desk had a pending PR for the opposite step, L-meta-9298. Randomized covers and common-subexpression rewrites on the larger matrices stayed above the then-current bounds.

No upstream submission was made in this pass.
