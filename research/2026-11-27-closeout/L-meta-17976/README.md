# Inverter requirement for L-meta-17976

The function with truth table `4276677288` (`0xfee8eaa8`) has a nine-gate monotone circuit. The exhaustive frontier search found no circuit of that size with an inverter.

## Search argument

The archived Lean proof for `L_meta_8694` establishes a lower bound of nine gates in the general AND/OR/NOT model for this exact truth table. The eight-gate run below also reproduces that bound computationally. Thus a witness with at most nine gates must have exactly nine gates. Any gate outside the output dependency graph, any redundant copy, or any gate with the same truth table as an available earlier wire could be removed, contradicting the lower bound. Constant gates can also be eliminated by simplifying each downstream use of a constant. Truncating a two-input NOT to the first input preserves its truth table. If that made another gate dead, the same lower bound would be violated. The claimed unary NOT remains present throughout these transformations.

The frontier is the set of currently available wires that will be used again. The search begins with the five essential inputs. For each gate it chooses one operand for NOT or two for AND and OR, then enumerates which operands remain on the frontier. It adds the gate's output mask and allows at most one final wire, which must equal the target. A valid circuit determines precisely these keep-or-drop choices by the remaining references in its suffix. A state records the truth masks, remaining gate count, and whether an inverter is still required. It prunes a state if there are too many live wires for the number of gates remaining or if two inputs with different target values have identical values on every frontier wire. When the frontier has one more wire than the remaining gate count, only binary gates that consume both inputs can finish, and the remaining computation is monotone in the frontier values. The search memoizes equivalent states under the verified permutations of inputs 1, 2 and 3.

The search returned UNSAT after 6,302 canonical states. Disabling both symmetry quotienting and the extra monotonicity prune also returned UNSAT, after 66,449 states. The unrestricted eight-gate run returned UNSAT after 1,313 states. Allowing a circuit with no inverter yielded the nine-gate positive control below. The separately restricted SAT runs proved UNSAT for exactly two and exactly three NOTs. The exactly-one-NOT SAT run timed out.

```sh
clang++ -O3 -std=c++17 -Wall -Wextra -pedantic frontier.cpp -o frontier
./frontier
sed 's/symmetry < 6/symmetry < 1/; s/(needNot || !monotone_distinguish(wires))/needNot/' frontier.cpp | clang++ -O3 -std=c++17 -x c++ - -o frontier-unquotiented
./frontier-unquotiented
sed 's/walk(wires, 9, true)/walk(wires, 8, false)/' frontier.cpp | clang++ -O3 -std=c++17 -x c++ - -o frontier-eight
./frontier-eight
sed 's/walk(wires, 9, true)/walk(wires, 9, false)/' frontier.cpp | clang++ -O3 -std=c++17 -x c++ - -o frontier-monotone
./frontier-monotone
```

The source SHA-256 is `58a88824e77e1d611d035fd9a6347b25c52b0cd1a81b6dc0328e70117a744d34`. The two negative nine-gate runs and the eight-gate run return exit code 20. The positive control returns 0.

## Nine-gate monotone positive control

| Wire | Gate | Inputs |
| ---: | --- | --- |
| 5 | OR | 0, 4 |
| 6 | AND | 1, 2 |
| 7 | OR | 0, 6 |
| 8 | OR | 1, 2 |
| 9 | AND | 3, 7 |
| 10 | OR | 3, 7 |
| 11 | AND | 5, 8 |
| 12 | OR | 9, 11 |
| 13 | AND | 10, 12 |

Wire 13 has the target truth table. Every nonoutput gate wire has a later consumer.
