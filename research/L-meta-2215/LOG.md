# Research log for L-meta-2215

## 2026-11-26

| Approach | Result | What it establishes |
| --- | --- | --- |
| Construct and verify the point-star baseline | Lean accepted all-input correctness and counted 62 gates | Gives a reproducible upper bound and an exact reference for synthesis. |
| Boolean distributivity and sharing raw-input OR subexpressions | Lean verified the matching, overlap, and counting facts | Every edge-to-star implementation with this OR-tree structure costs at least 62. Other circuit architectures remain open. |
| Direct local rewriting | Tried a gate bypass followed by one gate replacement on several topological orders, with the auxiliary OR both early and late | Best bypass missed one test. No 61-gate circuit was found in the neighborhoods searched. |
| SAT over two- and three-point windows | Unrestricted runs timed out at 220 seconds | These timeouts establish neither satisfiability nor unsatisfiability. |
| SAT with the auxiliary OR fixed | The solver reported UNSAT for 11-gate replacements on two representative two-point windows, both with and without the other stars' line ORs available | Rules out these encodings if the SAT result is trusted. No Lean certificate was produced for the negative SAT results. |
| SAT with movable auxiliary output and shared line ORs | Two 150-second runs timed out | A broader local search remains inconclusive. |
| Two-pencil-class architecture with six stars fixed | The 29-gate replacement encoding had 11,886 variables and 557,646 clauses. The 180-second solver run timed out | No replacement was found within the run limit. The 61-gate construction remains open. |

The finite checker uses 48 edge pairs and 553 maximal independent sets for the main output, and four auxiliary singletons and 197 maximal independent sets with the auxiliary lines excluded for the auxiliary output. There are 756 distinct assignments across the four sets. For monotone circuits, on-values propagate to larger assignments and off-values to smaller assignments. A candidate must pass these tests before attempting a Lean proof.

Related architecture: [PR 12292](https://github.com/open-goat/pequalnp-proofs/pull/12292) describes splitting off six point stars and reusing their line ORs. Its residual 29-gate synthesis problem was still open in the PR. [PR 4404](https://github.com/open-goat/pequalnp-proofs/pull/4404) records a different reduction through a nine-point subproblem.

The desk reported that two other contributors held the original step during this pass. The 62-gate result and architecture lemmas were kept in this research branch. No upstream proof was submitted for L-meta-2215.

## Reproducing the searches

The rewrite search needs only Python 3. The window search writes a DIMACS instance and runs CaDiCaL. The solver's time limit is supplied in seconds.

```sh
cd research/L-meta-2215
python3 incidence2215.py --full
python3 incidence_window_sat.py /path/to/cadical 11 200 0 1 --fixed-pencil --shared-lines
python3 incidence_window_sat.py /path/to/cadical 11 200 0 2 --fixed-pencil --shared-lines
```

The two-pencil-class variant keeps six stars fixed and exposes their line-only OR wires to the replacement. Its 29-gate budget includes the auxiliary OR of inputs 12 and 13. A successful replacement could be joined to the six fixed stars and the other two auxiliary inputs to yield 61 gates in total. This variant fixes the pair's auxiliary OR explicitly, which narrows the search.

```sh
python3 incidence_window_sat.py /path/to/cadical 29 180 0 1 2 7 8 11 \
  --flags=12,13 --fixed-pencil --shared-lines
```
