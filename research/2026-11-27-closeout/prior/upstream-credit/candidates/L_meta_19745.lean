import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19745

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 11]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [12, 15]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [14, 21]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [15, 26]⟩,
    ⟨.and, [3, 27]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [10, 18]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 23]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [28, 38]⟩,
    ⟨.or, [30, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19745

theorem PEqualNP.Outside.L_meta_19745 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (10692751789718129190 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19745.witness, by simp [PEqualNP.Outside.L_meta_19745.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
