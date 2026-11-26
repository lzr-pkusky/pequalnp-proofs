import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19751

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 15]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [19, 25]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [15, 28]⟩,
    ⟨.or, [18, 29]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [14, 32]⟩,
    ⟨.or, [18, 33]⟩,
    ⟨.and, [4, 34]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [20, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [27, 43]⟩,
    ⟨.or, [31, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [37, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19751

theorem PEqualNP.Outside.L_meta_19751 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (10337339320775273190 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19751.witness, by simp [PEqualNP.Outside.L_meta_19751.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
