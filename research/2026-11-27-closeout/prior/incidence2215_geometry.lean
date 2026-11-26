import Mathlib
import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_2215

def differences : Finset (Fin 13) := {0, 1, 3, 9}

def missedLines (points : Finset (Fin 13)) : Finset (Fin 13) :=
  Finset.univ.filter fun line => ∀ point ∈ points, point + line ∉ differences

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem four_points : ∀ points : Finset (Fin 13), points.card = 4 →
    (missedLines points).card ≤ 3 := by
  decide +kernel

theorem independent_rectangle (points lines : Finset (Fin 13))
    (misses : ∀ point ∈ points, ∀ line ∈ lines, point + line ∉ differences) :
    points.card ≤ 3 ∨ lines.card ≤ 3 := by
  by_cases small : points.card ≤ 3
  · exact Or.inl small
  · right
    obtain ⟨four, subset, size⟩ := Finset.exists_subset_card_eq (by omega : 4 ≤ points.card)
    apply (Finset.card_le_card ?_).trans (four_points four size)
    intro line mem
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, fun point h => misses point (subset h) line mem⟩

end PEqualNP.Outside.L_meta_2215
