import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19816

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 15]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.or, [17, 22]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [12, 15]⟩,
    ⟨.or, [20, 29]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [18, 21]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [20, 34]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [19, 37]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [21, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.or, [28, 43]⟩,
    ⟨.or, [31, 44]⟩,
    ⟨.or, [33, 45]⟩,
    ⟨.or, [36, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19816

theorem PEqualNP.Outside.L_meta_19816 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (12570512712759991245 : ℕ).testBit (8 * u.val + v.val)) 35 := by
  exact ⟨PEqualNP.Outside.L_meta_19816.witness, by simp [PEqualNP.Outside.L_meta_19816.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
