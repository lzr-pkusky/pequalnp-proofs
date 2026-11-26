import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19834

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [12, 13]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [15, 21]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [13, 28]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 23]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [30, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19834

theorem PEqualNP.Outside.L_meta_19834 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (525294032877098160 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19834.witness, by simp [PEqualNP.Outside.L_meta_19834.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
