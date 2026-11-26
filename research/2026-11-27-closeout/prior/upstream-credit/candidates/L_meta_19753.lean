import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19753

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [13, 15]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.or, [12, 19]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [17, 21]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [21, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [14, 30]⟩,
    ⟨.or, [16, 31]⟩,
    ⟨.and, [3, 32]⟩,
    ⟨.or, [16, 22]⟩,
    ⟨.and, [4, 34]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [22, 36]⟩,
    ⟨.and, [5, 37]⟩,
    ⟨.or, [15, 20]⟩,
    ⟨.and, [6, 39]⟩,
    ⟨.or, [11, 20]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.or, [29, 43]⟩,
    ⟨.or, [33, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [38, 46]⟩,
    ⟨.or, [40, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19753

theorem PEqualNP.Outside.L_meta_19753 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (6616700159142438735 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19753.witness, by simp [PEqualNP.Outside.L_meta_19753.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
