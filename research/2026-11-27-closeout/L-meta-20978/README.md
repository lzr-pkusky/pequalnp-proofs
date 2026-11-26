# Circuit gate bound for L-meta-20978

The 4-by-5 graph with row-major mask `33918` has row neighborhoods `{1,2,3,4}`, `{0,1}`, `{0}`, `{0}`. The exhaustive search below rules out nine gates. A ten-gate circuit matches the graph at all 20 one-hot inputs.

## Exhaustive search

Every input is essential. If a row wire were absent, the circuit would see the all-zero left side on that row. Monotonicity would force its neighborhood to be contained in every other row neighborhood. Each row has an edge missing from some other row. The same reasoning applies to the columns.

In a smallest circuit, delete unused gates and replace missing or forward references with false. Propagate constants, eliminate unary gates by redirecting their destinations, and use two-input gates. Each of nine essential inputs and each non-output gate feeds at least one operand slot. For `g` gates, there are `2g` slots, and `9 + g - 1` are required. This gives `g ≥ 8`.

With eight gates, each wire feeds exactly one slot and the circuit is a read-once formula. With nine gates, one wire feeds two slots and every other wire feeds one. The twice-used wire is either an input or the output of a read-once subcircuit. Its distinct leaves form a subset of the nine inputs. Outside that subcircuit, the remaining inputs and two copies of the shared result occur once each in a read-once formula.

`one_fanout.cpp` computes the possible row-major masks for each subset of formula leaves. The recurrence enumerates each root partition into two nonempty sets, then applies both operators to every pair of child masks. It checks the eight-gate case directly. For the nine-gate case it considers every subset of inputs for the shared result. If a positive input's projection to the outside wires is contained in a negative input's projection, monotonicity requires the shared result to be true on the positive input and false on the negative input. The program uses those forced bits to discard impossible shared masks before enumerating the outer formula.

The search found no solution after testing 46 feasible shared masks. The same binary recovered an eight-gate circuit for mask `906107` and a nine-gate circuit using a repeated wire for mask `376817`.

```sh
clang++ -std=c++17 -O3 -Wall -Wextra -pedantic one_fanout.cpp -o one_fanout
./one_fanout 33918
./one_fanout 906107
./one_fanout 376817
```

The search source has SHA-256 `dd89397a92d912e2e2bf2e1ba5ef9b96f69b8c68171f70a1ec18a86a9015ed1f`. The first run returns exit code 20; the two positive controls return 0.

## Ten-gate witness

Wires 0–3 are rows and wires 4–8 are columns. Bit `5 * row + column` denotes the wire value at that one-hot input.

| Wire | Gate | Inputs | Mask |
| ---: | --- | --- | ---: |
| 9 | OR | 1, 2 | 32736 |
| 10 | OR | 3, 9 | 1048544 |
| 11 | AND | 4, 10 | 33824 |
| 12 | OR | 5, 6 | 202950 |
| 13 | OR | 7, 8 | 811800 |
| 14 | OR | 12, 13 | 1014750 |
| 15 | AND | 0, 14 | 30 |
| 16 | AND | 1, 5 | 64 |
| 17 | OR | 11, 15 | 33854 |
| 18 | OR | 16, 17 | 33918 |

The designated output is wire 18.
