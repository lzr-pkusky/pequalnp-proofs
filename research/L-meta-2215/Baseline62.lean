import Mathlib
import PEqualNP.Defs

namespace PEqualNP.Research.LMeta2215
open PEqualNP.CircuitLowerBounds PEqualNP.MetaComplexity

def incidence (a b : Fin 25) : Prop :=
  a.val < 12 ∧ 12 ≤ b.val ∧ (a.val + b.val + 2) % 13 ∈ ([0, 1, 3, 9] : List ℕ)

def edges : List (Fin 25 × Fin 25) := [(0, 12), (0, 14), (0, 20), (0, 24), (1, 13), (1, 19), (1, 23), (1, 24), (2, 12), (2, 18), (2, 22), (2, 23), (3, 17), (3, 21), (3, 22), (3, 24), (4, 16), (4, 20), (4, 21), (4, 23), (5, 15), (5, 19), (5, 20), (5, 22), (6, 14), (6, 18), (6, 19), (6, 21), (7, 13), (7, 17), (7, 18), (7, 20), (8, 12), (8, 16), (8, 17), (8, 19), (9, 15), (9, 16), (9, 18), (9, 24), (10, 14), (10, 15), (10, 17), (10, 23), (11, 13), (11, 14), (11, 16), (11, 22)]

def baseline : Circuit := ⟨[⟨.or, [12, 14]⟩,
    ⟨.or, [20, 25]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.and, [0, 27]⟩,
    ⟨.or, [13, 19]⟩,
    ⟨.or, [23, 29]⟩,
    ⟨.or, [24, 30]⟩,
    ⟨.and, [1, 31]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.or, [22, 33]⟩,
    ⟨.or, [23, 34]⟩,
    ⟨.and, [2, 35]⟩,
    ⟨.or, [17, 21]⟩,
    ⟨.or, [22, 37]⟩,
    ⟨.or, [24, 38]⟩,
    ⟨.and, [3, 39]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.or, [21, 41]⟩,
    ⟨.or, [23, 42]⟩,
    ⟨.and, [4, 43]⟩,
    ⟨.or, [15, 19]⟩,
    ⟨.or, [20, 45]⟩,
    ⟨.or, [22, 46]⟩,
    ⟨.and, [5, 47]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.or, [19, 49]⟩,
    ⟨.or, [21, 50]⟩,
    ⟨.and, [6, 51]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.or, [18, 53]⟩,
    ⟨.or, [20, 54]⟩,
    ⟨.and, [7, 55]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.or, [17, 57]⟩,
    ⟨.or, [19, 58]⟩,
    ⟨.and, [8, 59]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.or, [18, 61]⟩,
    ⟨.or, [24, 62]⟩,
    ⟨.and, [9, 63]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [17, 65]⟩,
    ⟨.or, [23, 66]⟩,
    ⟨.and, [10, 67]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [16, 69]⟩,
    ⟨.or, [22, 70]⟩,
    ⟨.and, [11, 71]⟩,
    ⟨.or, [28, 32]⟩,
    ⟨.or, [36, 73]⟩,
    ⟨.or, [40, 74]⟩,
    ⟨.or, [44, 75]⟩,
    ⟨.or, [48, 76]⟩,
    ⟨.or, [52, 77]⟩,
    ⟨.or, [56, 78]⟩,
    ⟨.or, [60, 79]⟩,
    ⟨.or, [64, 80]⟩,
    ⟨.or, [68, 81]⟩,
    ⟨.or, [72, 82]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [15, 84]⟩,
    ⟨.or, [21, 85]⟩], 83⟩


set_option maxRecDepth 100000 in
set_option maxHeartbeats 4000000 in
theorem expanded (x : Fin 25 → Bool) : baseline.wires (List.ofFn x) =
    [x 0,
     x 1,
     x 2,
     x 3,
     x 4,
     x 5,
     x 6,
     x 7,
     x 8,
     x 9,
     x 10,
     x 11,
     x 12,
     x 13,
     x 14,
     x 15,
     x 16,
     x 17,
     x 18,
     x 19,
     x 20,
     x 21,
     x 22,
     x 23,
     x 24,
     (x 12 || x 14),
     (x 20 || (x 12 || x 14)),
     (x 24 || (x 20 || (x 12 || x 14))),
     (x 0 && (x 24 || (x 20 || (x 12 || x 14)))),
     (x 13 || x 19),
     (x 23 || (x 13 || x 19)),
     (x 24 || (x 23 || (x 13 || x 19))),
     (x 1 && (x 24 || (x 23 || (x 13 || x 19)))),
     (x 12 || x 18),
     (x 22 || (x 12 || x 18)),
     (x 23 || (x 22 || (x 12 || x 18))),
     (x 2 && (x 23 || (x 22 || (x 12 || x 18)))),
     (x 17 || x 21),
     (x 22 || (x 17 || x 21)),
     (x 24 || (x 22 || (x 17 || x 21))),
     (x 3 && (x 24 || (x 22 || (x 17 || x 21)))),
     (x 16 || x 20),
     (x 21 || (x 16 || x 20)),
     (x 23 || (x 21 || (x 16 || x 20))),
     (x 4 && (x 23 || (x 21 || (x 16 || x 20)))),
     (x 15 || x 19),
     (x 20 || (x 15 || x 19)),
     (x 22 || (x 20 || (x 15 || x 19))),
     (x 5 && (x 22 || (x 20 || (x 15 || x 19)))),
     (x 14 || x 18),
     (x 19 || (x 14 || x 18)),
     (x 21 || (x 19 || (x 14 || x 18))),
     (x 6 && (x 21 || (x 19 || (x 14 || x 18)))),
     (x 13 || x 17),
     (x 18 || (x 13 || x 17)),
     (x 20 || (x 18 || (x 13 || x 17))),
     (x 7 && (x 20 || (x 18 || (x 13 || x 17)))),
     (x 12 || x 16),
     (x 17 || (x 12 || x 16)),
     (x 19 || (x 17 || (x 12 || x 16))),
     (x 8 && (x 19 || (x 17 || (x 12 || x 16)))),
     (x 15 || x 16),
     (x 18 || (x 15 || x 16)),
     (x 24 || (x 18 || (x 15 || x 16))),
     (x 9 && (x 24 || (x 18 || (x 15 || x 16)))),
     (x 14 || x 15),
     (x 17 || (x 14 || x 15)),
     (x 23 || (x 17 || (x 14 || x 15))),
     (x 10 && (x 23 || (x 17 || (x 14 || x 15)))),
     (x 13 || x 14),
     (x 16 || (x 13 || x 14)),
     (x 22 || (x 16 || (x 13 || x 14))),
     (x 11 && (x 22 || (x 16 || (x 13 || x 14)))),
     ((x 0 && (x 24 || (x 20 || (x 12 || x 14)))) || (x 1 && (x 24 || (x 23 || (x 13 || x 19))))),
     ((x 2 && (x 23 || (x 22 || (x 12 || x 18)))) || ((x 0 && (x 24 || (x 20 || (x 12 || x 14)))) || (x 1 && (x 24 || (x 23 || (x 13 || x 19)))))),
     ((x 3 && (x 24 || (x 22 || (x 17 || x 21)))) || ((x 2 && (x 23 || (x 22 || (x 12 || x 18)))) || ((x 0 && (x 24 || (x 20 || (x 12 || x 14)))) || (x 1 && (x 24 || (x 23 || (x 13 || x 19))))))),
     ((x 4 && (x 23 || (x 21 || (x 16 || x 20)))) || ((x 3 && (x 24 || (x 22 || (x 17 || x 21)))) || ((x 2 && (x 23 || (x 22 || (x 12 || x 18)))) || ((x 0 && (x 24 || (x 20 || (x 12 || x 14)))) || (x 1 && (x 24 || (x 23 || (x 13 || x 19)))))))),
     ((x 5 && (x 22 || (x 20 || (x 15 || x 19)))) || ((x 4 && (x 23 || (x 21 || (x 16 || x 20)))) || ((x 3 && (x 24 || (x 22 || (x 17 || x 21)))) || ((x 2 && (x 23 || (x 22 || (x 12 || x 18)))) || ((x 0 && (x 24 || (x 20 || (x 12 || x 14)))) || (x 1 && (x 24 || (x 23 || (x 13 || x 19))))))))),
     ((x 6 && (x 21 || (x 19 || (x 14 || x 18)))) || ((x 5 && (x 22 || (x 20 || (x 15 || x 19)))) || ((x 4 && (x 23 || (x 21 || (x 16 || x 20)))) || ((x 3 && (x 24 || (x 22 || (x 17 || x 21)))) || ((x 2 && (x 23 || (x 22 || (x 12 || x 18)))) || ((x 0 && (x 24 || (x 20 || (x 12 || x 14)))) || (x 1 && (x 24 || (x 23 || (x 13 || x 19)))))))))),
     ((x 7 && (x 20 || (x 18 || (x 13 || x 17)))) || ((x 6 && (x 21 || (x 19 || (x 14 || x 18)))) || ((x 5 && (x 22 || (x 20 || (x 15 || x 19)))) || ((x 4 && (x 23 || (x 21 || (x 16 || x 20)))) || ((x 3 && (x 24 || (x 22 || (x 17 || x 21)))) || ((x 2 && (x 23 || (x 22 || (x 12 || x 18)))) || ((x 0 && (x 24 || (x 20 || (x 12 || x 14)))) || (x 1 && (x 24 || (x 23 || (x 13 || x 19))))))))))),
     ((x 8 && (x 19 || (x 17 || (x 12 || x 16)))) || ((x 7 && (x 20 || (x 18 || (x 13 || x 17)))) || ((x 6 && (x 21 || (x 19 || (x 14 || x 18)))) || ((x 5 && (x 22 || (x 20 || (x 15 || x 19)))) || ((x 4 && (x 23 || (x 21 || (x 16 || x 20)))) || ((x 3 && (x 24 || (x 22 || (x 17 || x 21)))) || ((x 2 && (x 23 || (x 22 || (x 12 || x 18)))) || ((x 0 && (x 24 || (x 20 || (x 12 || x 14)))) || (x 1 && (x 24 || (x 23 || (x 13 || x 19)))))))))))),
     ((x 9 && (x 24 || (x 18 || (x 15 || x 16)))) || ((x 8 && (x 19 || (x 17 || (x 12 || x 16)))) || ((x 7 && (x 20 || (x 18 || (x 13 || x 17)))) || ((x 6 && (x 21 || (x 19 || (x 14 || x 18)))) || ((x 5 && (x 22 || (x 20 || (x 15 || x 19)))) || ((x 4 && (x 23 || (x 21 || (x 16 || x 20)))) || ((x 3 && (x 24 || (x 22 || (x 17 || x 21)))) || ((x 2 && (x 23 || (x 22 || (x 12 || x 18)))) || ((x 0 && (x 24 || (x 20 || (x 12 || x 14)))) || (x 1 && (x 24 || (x 23 || (x 13 || x 19))))))))))))),
     ((x 10 && (x 23 || (x 17 || (x 14 || x 15)))) || ((x 9 && (x 24 || (x 18 || (x 15 || x 16)))) || ((x 8 && (x 19 || (x 17 || (x 12 || x 16)))) || ((x 7 && (x 20 || (x 18 || (x 13 || x 17)))) || ((x 6 && (x 21 || (x 19 || (x 14 || x 18)))) || ((x 5 && (x 22 || (x 20 || (x 15 || x 19)))) || ((x 4 && (x 23 || (x 21 || (x 16 || x 20)))) || ((x 3 && (x 24 || (x 22 || (x 17 || x 21)))) || ((x 2 && (x 23 || (x 22 || (x 12 || x 18)))) || ((x 0 && (x 24 || (x 20 || (x 12 || x 14)))) || (x 1 && (x 24 || (x 23 || (x 13 || x 19)))))))))))))),
     ((x 11 && (x 22 || (x 16 || (x 13 || x 14)))) || ((x 10 && (x 23 || (x 17 || (x 14 || x 15)))) || ((x 9 && (x 24 || (x 18 || (x 15 || x 16)))) || ((x 8 && (x 19 || (x 17 || (x 12 || x 16)))) || ((x 7 && (x 20 || (x 18 || (x 13 || x 17)))) || ((x 6 && (x 21 || (x 19 || (x 14 || x 18)))) || ((x 5 && (x 22 || (x 20 || (x 15 || x 19)))) || ((x 4 && (x 23 || (x 21 || (x 16 || x 20)))) || ((x 3 && (x 24 || (x 22 || (x 17 || x 21)))) || ((x 2 && (x 23 || (x 22 || (x 12 || x 18)))) || ((x 0 && (x 24 || (x 20 || (x 12 || x 14)))) || (x 1 && (x 24 || (x 23 || (x 13 || x 19))))))))))))))),
     (x 12 || x 13),
     (x 15 || (x 12 || x 13)),
     (x 21 || (x 15 || (x 12 || x 13)))] := by
  have input : List.ofFn x = [(x 0), (x 1), (x 2), (x 3), (x 4), (x 5), (x 6), (x 7), (x 8), (x 9), (x 10), (x 11), (x 12), (x 13), (x 14), (x 15), (x 16), (x 17), (x 18), (x 19), (x 20), (x 21), (x 22), (x 23), (x 24)] := by simp [List.ofFn_succ]
  rw [input]
  simp only [baseline, Circuit.wires, List.foldl_cons, List.foldl_nil,
    List.map_cons, List.map_nil, List.cons_append, List.nil_append,
    List.getD_cons_zero, List.getD_cons_succ, GateOp.eval,
    List.all_cons, List.all_nil, List.any_cons, List.any_nil, Bool.and_true, Bool.or_false, id_eq]

set_option maxHeartbeats 0 in
theorem edges_correct : ∀ a b : Fin 25, (a,b) ∈ edges ↔ incidence a b := by
  unfold incidence
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem baseline_main (x : Fin 25 → Bool) :
    baseline.eval (List.ofFn x) = true ↔ ∃ a b, incidence a b ∧ x a = true ∧ x b = true := by
  have ev : baseline.eval (List.ofFn x) = edges.any (fun e => x e.1 && x e.2) := by
    rw [Circuit.eval, expanded]
    simp only [baseline, List.getD_cons_zero, List.getD_cons_succ, edges, List.any_cons,
      List.any_nil, Bool.or_false, Bool.and_or_distrib_left]
    ac_rfl
  rw [ev, List.any_eq_true]
  constructor
  · rintro ⟨⟨a,b⟩, mem, works⟩
    exact ⟨a, b, (edges_correct a b).mp mem, (Bool.and_eq_true _ _).mp works⟩
  · rintro ⟨a,b,rel,ha,hb⟩
    exact ⟨(a,b), (edges_correct a b).mpr rel, (Bool.and_eq_true _ _).mpr ⟨ha,hb⟩⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem baseline_aux (x : Fin 25 → Bool) :
    (baseline.wires (List.ofFn x)).getD 86 false = (x 12 || x 13 || x 15 || x 21) := by
  rw [expanded]
  simp only [List.getD_cons_zero, List.getD_cons_succ]
  ac_rfl

theorem baseline_verified : ∃ (C : Circuit) (q : ℕ), Monotone2 C ∧ C.size ≤ 62 ∧
    C.output < 25 + C.size ∧ q < 25 + C.size ∧ ∀ x : Fin 25 → Bool,
    (C.eval (List.ofFn x) = true ↔ ∃ a b, incidence a b ∧ x a = true ∧ x b = true) ∧
    (C.eval (List.ofFn x) = false → (C.wires (List.ofFn x)).getD q false = (x 12 || x 13 || x 15 || x 21)) :=
  ⟨baseline, 86, by simp [baseline, Monotone2], by decide, by decide, by decide,
    fun x => ⟨baseline_main x, fun _ => baseline_aux x⟩⟩

theorem baseline_size : baseline.size = 62 := rfl

end PEqualNP.Research.LMeta2215
