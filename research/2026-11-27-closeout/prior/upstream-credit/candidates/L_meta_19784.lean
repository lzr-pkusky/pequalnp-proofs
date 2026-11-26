import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19784

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 12]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.or, [19, 20]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [15, 22]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [13, 27]⟩,
    ⟨.or, [18, 28]⟩,
    ⟨.and, [2, 29]⟩,
    ⟨.or, [17, 21]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [10, 22]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [16, 21]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [15, 39]⟩,
    ⟨.or, [16, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [34, 45]⟩,
    ⟨.or, [36, 46]⟩,
    ⟨.or, [38, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19784

theorem PEqualNP.Outside.L_meta_19784 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (13176519996038833020 : ℕ).testBit (8 * u.val + v.val)) 35 := by
  exact ⟨PEqualNP.Outside.L_meta_19784.witness, by simp [PEqualNP.Outside.L_meta_19784.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
