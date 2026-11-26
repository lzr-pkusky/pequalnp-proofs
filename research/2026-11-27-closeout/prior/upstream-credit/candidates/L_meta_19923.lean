import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19923

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 13]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [15, 24]⟩,
    ⟨.or, [17, 25]⟩,
    ⟨.and, [1, 26]⟩,
    ⟨.or, [12, 21]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.or, [19, 30]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [8, 21]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [13, 18]⟩,
    ⟨.or, [19, 37]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.or, [19, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [23, 27]⟩,
    ⟨.or, [29, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [34, 45]⟩,
    ⟨.or, [36, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19923

theorem PEqualNP.Outside.L_meta_19923 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (6609709397838714315 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19923.witness, by simp [PEqualNP.Outside.L_meta_19923.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
