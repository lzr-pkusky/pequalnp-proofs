import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20022

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [1, 6]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.and, [16, 18]⟩,
    ⟨.or, [2, 7]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [15, 21]⟩,
    ⟨.and, [20, 22]⟩,
    ⟨.or, [4, 5]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [13, 25]⟩,
    ⟨.and, [24, 26]⟩,
    ⟨.or, [0, 3]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.and, [28, 29]⟩,
    ⟨.or, [0, 1]⟩,
    ⟨.or, [5, 31]⟩,
    ⟨.or, [7, 32]⟩,
    ⟨.and, [14, 33]⟩,
    ⟨.or, [2, 3]⟩,
    ⟨.or, [4, 35]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.and, [36, 37]⟩,
    ⟨.or, [0, 6]⟩,
    ⟨.and, [9, 39]⟩,
    ⟨.or, [19, 23]⟩,
    ⟨.or, [27, 41]⟩,
    ⟨.or, [30, 42]⟩,
    ⟨.or, [34, 43]⟩,
    ⟨.or, [38, 44]⟩,
    ⟨.or, [40, 45]⟩], 46⟩

end PEqualNP.Outside.L_meta_20022

theorem PEqualNP.Outside.L_meta_20022 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (15289266858240601290 : ℕ).testBit (8 * u.val + v.val)) 31 := by
  exact ⟨PEqualNP.Outside.L_meta_20022.witness, by simp [PEqualNP.Outside.L_meta_20022.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
