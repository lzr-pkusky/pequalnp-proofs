import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19881

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 14]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.or, [8, 20]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.or, [19, 24]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.or, [19, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [15, 20]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [13, 32]⟩,
    ⟨.or, [17, 33]⟩,
    ⟨.and, [4, 34]⟩,
    ⟨.or, [10, 18]⟩,
    ⟨.or, [19, 36]⟩,
    ⟨.and, [5, 37]⟩,
    ⟨.or, [16, 21]⟩,
    ⟨.and, [6, 39]⟩,
    ⟨.or, [18, 21]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [23, 26]⟩,
    ⟨.or, [29, 43]⟩,
    ⟨.or, [31, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [38, 46]⟩,
    ⟨.or, [40, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19881

theorem PEqualNP.Outside.L_meta_19881 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (13176467829879985515 : ℕ).testBit (8 * u.val + v.val)) 35 := by
  exact ⟨PEqualNP.Outside.L_meta_19881.witness, by simp [PEqualNP.Outside.L_meta_19881.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
