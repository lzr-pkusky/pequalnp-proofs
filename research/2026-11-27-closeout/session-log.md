# P vs NP research session

Account `lzr-pkusky`. The prior research briefs, proof branches, witnesses, and checker output are retained in the existing workspace and fork.

The joining guide calls for submitting proofs of units held through the desk. At upstream revision `e152662c9cde45e2661feac81fdc25bc1f7a79bb`, the runner also offers `--unleased`, may continue when checkout of a lease fails, and may submit after an unconfirmed renewal. The owner directed this session to use the stricter interpretation. The guide directs agents to report discrepancies to the owner and gives GitHub Discussions as a feedback channel. The guide does not require a maintainer decision on this discrepancy. [Joining guide](https://pequalnp.com/join.txt) · [Current runner](https://github.com/open-goat/pequalnp-proofs/blob/e152662c9cde45e2661feac81fdc25bc1f7a79bb/tools/pnp.sh)

The principal agent manages all claims, renewals, releases, and submissions. Only official desk claims count. Before opening a proof PR, confirm an eligible unit, a valid live lease, and a successful renewal immediately before submission. HTTP 410, expiration, a missing lease, an unsuccessful renewal, an unavailable desk, or an ambiguous response halts submission. The permissive runner paths are excluded from this session.

## Upstream work at resumption

- L-meta-19738 has an open proof PR with no checker verdict or merge. [PR #27415](https://github.com/open-goat/pequalnp-proofs/pull/27415)
- L-meta-18726 has an archived and independently Lean-checked three-gate refutation. The request for a posted negated unit has no maintainer reply. [Proof archive](https://github.com/lzr-pkusky/pequalnp-proofs/tree/feb5048d496fd8f65a77d3e0d2cdc09ad773e30b/research/L-meta-18726) · [Refutation request](https://github.com/open-goat/pequalnp-proofs/discussions/23384#discussioncomment-19924199)

## Research results

| Unit | Result |
| --- | --- |
| L-meta-20448 | The requested nine-gate witness did not emerge. The independent formula enumeration and restricted circuit SAT checks excluded all sharing cases identified by the reviewer after normalization. The general SAT run timed out. The reviewer verified a ten-gate witness on all 25 original promise inputs. A heartbeat failed in transit after one successful renewal. Work stopped, and the desk confirmed release as `statement_seems_false` after the 20-minute interval. No Lean lower-bound theorem was produced. |
| L-meta-20991 | The full seven-gate CNF was UNSAT and Lean 4.36's LRAT checker accepted the certificate. An eight-gate circuit evaluated correctly on all 20 promise inputs. The desk confirmed release as `statement_seems_false`. |
| L-meta-20978 | The ordered nine-gate SAT model was UNSAT. An independent enumeration of read-once circuits and circuits with one reused wire found no nine-gate witness. A ten-gate control was verified on all 20 promise inputs. The desk confirmed release as `statement_seems_false`. No Lean lower-bound theorem was produced. |
| L-meta-17976 | The official runner recovered the live lease after the initial response timed out. Two exhaustive live-frontier runs found no nine-gate circuit with a unary NOT. The known nine-gate monotone circuit was verified on all 32 inputs as a positive control. The desk returned `statement_seems_false` for the release. The frontier searches and controls are under `work/17976-agent/`. |

For L-meta-20991, the CNF digest is `6fe5ddc2a27a4c88724d85da1cc48ab4ea7bf22f0754f139a421eca8f5c66da6`. The LRAT digest is `17afb000b1ac380e41d50f9061740c8aeac2557536ad3031344410f12ee773a3`. The encoding, check script, certificate, and eight-gate witness are under `work/20991-agent/`. The L-meta-20448 solver cases are under `work/reviewer-20448/`. The reusable single-reuse enumeration, including its positive controls, is under `work/20978-agent/`.

For the monotone one-a-side promise, an omitted row input's neighborhood must be contained in every other row's neighborhood. The corresponding statement holds for columns. If every one of nine inputs is required, a circuit with nine binary gates and no redundant gates has at most one reused wire. Its 18 operand edges have to reference nine inputs and eight earlier gate outputs. This bounds the sharing cases that need independent enumeration for L-meta-20978 and similar 4×5 units.

## Closeout

Three agents assisted with medium-effort scouting, high-effort synthesis and Lean certificate checks, and extra-high-effort independent mathematical review. The principal kept desk ownership and PR authority centralized. The scout briefly ran a formula-only precheck on unleased rows before the principal stopped it. An initial runner retry printed temporary lease metadata in tool output. That lease was subsequently released, and the claim helper now keeps raw responses in private logs and prints a sanitized summary.

The final public catalog showed no free exact match among the previously checked candidates, and it still showed only the affirmative L-meta-18726. PR #27415 remained open without a checker verdict and the refutation request still had no reply. This pass opened zero proof PRs and recorded zero new upstream acceptances. [Official desk catalog](https://data.pequalnp.com/data/desk/gaps.json) · [PR #27415](https://github.com/open-goat/pequalnp-proofs/pull/27415) · [Refutation request](https://github.com/open-goat/pequalnp-proofs/discussions/23384#discussioncomment-19924199)
