# L-meta-20448 circuit search

For the 5-by-5 row-major mask `11896017`, the ten-gate control below matched all 25 one-a-side inputs. The exhaustive formula search found no formula through cost 10. The restricted CaDiCaL runs excluded the sharing cases identified by the reviewer after removing constants, copies, and unused gates. The general nine-gate SAT run timed out. These are computational results, with no formal Lean lower bound for this unit.

Inputs are wires 0–9. Gates 10 through 19 are `OR(0,7)`, `OR(1,9)`, `OR(2,10)`, `OR(6,10)`, `AND(5,12)`, `OR(11,12)`, `AND(11,13)`, `NOT(15)`, `OR(14,17)`, `OR(16,18)`. Wire 19 is the output.

The checked-in DIMACS cases can be passed to CaDiCaL 2.1.2 directly. The Python source records the restrictions and the truth-table postcheck.
