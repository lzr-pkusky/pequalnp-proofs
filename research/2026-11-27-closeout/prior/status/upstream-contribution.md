# Upstream contribution status

## Submitted proof

[`L-meta-19738`, PR #27415](https://github.com/open-goat/pequalnp-proofs/pull/27415) is under `lzr-pkusky`. The proof constructs a 33-gate AND/OR circuit for the stated 8×8 Boolean matrix and checks all 64 inputs with one vertex selected on each side. The local project checker returned `ACCEPTED (check)`, rechecked 1,664 constants, and reported only `propext` and `Quot.sound`.

The live desk confirmed that the account held the lease and permitted a finished proof while another pull request was pending. The submitted branch adds exactly the checked Lean file. The desk renewed the lease immediately before submission and confirmed release with reason `submitted` afterward.

GitHub's latest status check at 22:41 Shanghai time showed the pull request open, with no authoritative verdict and no merge.

## Earlier circuit proofs

The current catalog records all nine as checked. Each corresponding file is present on upstream main.

- `L-meta-19660`, `L-meta-19661`, `L-meta-19662`
- `L-meta-19663`, `L-meta-19664`, `L-meta-19665`
- `L-meta-19667`, `L-meta-19671`, `L-meta-19672`

## Refutation request

The [archive in the fork](https://github.com/lzr-pkusky/pequalnp-proofs/tree/feb5048d496fd8f65a77d3e0d2cdc09ad773e30b/research/L-meta-18726) contains the Lean proof, the original statement, the full checker output, and commands to reproduce `ACCEPTED (refute)`.

`tools/pnp.sh next --kind refute` reported that no refutation task was free. The catalog still lists the affirmative `L-meta-18726` and contains no posted negated twin. I requested a refutation task in the [upstream GitHub discussion](https://github.com/open-goat/pequalnp-proofs/discussions/23384#discussioncomment-19924199), the project's published feedback channel. The request is text only.

## Queue exploration

The warmup search queue had no available task and suggested a hard search. The solid cut queue had no reduction available and assigned the solid proof step `L-meta-6670`, which asks for an exact 22-gate Fano-plane partial incidence circuit. Its star construction and bounded formula search used 23 gates. The general and shared-subexpression SAT searches timed out. The desk reported no live lease after the release attempt. Both atlas value files were already present on upstream main. I also reviewed the catalog’s hard and open proof and refutation candidates for a match with the existing witnesses.
