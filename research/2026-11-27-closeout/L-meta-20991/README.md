# Circuit gate bound for L-meta-20991

The 4-by-5 graph with row-major mask `35071` has minimum size 8 under the `RepSizeAtMost` gate convention. An LRAT certificate rules out the seven-gate SAT encoding, and the circuit below evaluates to the graph on all 20 specified inputs.

## Seven-gate encoding

`full-7.cnf` has 630 variables and 7,607 clauses. Nine input wires encode the four rows followed by the five columns. Each gate chooses two operands from these inputs, free false and true wires, and earlier gates. It also chooses AND or OR. The lower operand index comes first because both operators are commutative. Starting with the one-hot input assignment for each row and column pair, the clauses force both selected values and the result of each gate according to its truth table. A unit clause forces the last gate's output to the corresponding bit of `35071`. Each earlier gate must be read at least once.

Every Lean circuit of size at most seven can be represented in the encoding. An invalid or forward wire reference reads false, so it can be replaced with the free false wire. A zero-input AND or OR can select the corresponding constant twice, and a one-input gate can select that input twice. Starting from the designated output, remove gates outside its dependency graph. If the result has fewer than seven gates, append identity gates that select the preceding output twice. This puts the output at gate seven and makes every earlier gate feed a later gate. Allowing the two constants for free only enlarges the set of circuits the SAT instance searches.

CaDiCaL 2.1.2 returned exit code 20 and emitted `full-7.lrat`. Lean 4.36.0 independently accepted the certificate through `Std.Tactic.BVDecide.LRAT.check`, with 204,739 proof actions. The checker establishes unsatisfiability of the encoding. The preceding translation explains why that result rules out each allowed seven-gate Lean circuit.

| File | SHA-256 |
| --- | --- |
| `full-7.cnf` | `6fe5ddc2a27a4c88724d85da1cc48ab4ea7bf22f0754f139a421eca8f5c66da6` |
| `full-7.lrat` | `17afb000b1ac380e41d50f9061740c8aeac2557536ad3031344410f12ee773a3` |

From this directory, use `generate_cnf.py` with the archived `circuit_search.py` builder. The exact archived builder is in `../prior/circuit_search.py`. The builder used here has SHA-256 `6f4e63feb646692e3eb4e1d011013e16281e70c235fac208ad9ab29657e6d1c2`.

```sh
gzip -dc full-7.lrat.gz > full-7.lrat
python3 -B generate_cnf.py 4 5 35071 7 regenerated.cnf --builder-dir ../prior
cmp full-7.cnf regenerated.cnf
cadical -q --check --checkproof=2 --lrat --no-binary full-7.cnf regenerated.lrat
lean --run CheckCertificate.lean full-7.cnf full-7.lrat
```

## Eight-gate witness

Wires 0–3 are the row inputs and 4–8 are the column inputs. Each wire mask uses bit `5 * row + column` for the corresponding one-hot input. Thus each output mask follows by applying the stated bitwise operation to its two input masks.

| Wire | Gate | Inputs | Mask |
| ---: | --- | --- | ---: |
| 9 | AND | 1, 6 | 128 |
| 10 | OR | 5, 9 | 67778 |
| 11 | OR | 1, 3 | 1016800 |
| 12 | AND | 4, 11 | 32800 |
| 13 | OR | 0, 12 | 32831 |
| 14 | OR | 1, 2 | 32736 |
| 15 | AND | 10, 14 | 2240 |
| 16 | OR | 13, 15 | 35071 |

The output is wire 16. Its row neighborhoods, in order, are `{0, 1, 2, 3, 4}`, `{0, 1, 2}`, `{1}`, and `{0}`.
