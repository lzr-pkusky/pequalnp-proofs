import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19823

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 12]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [13, 15]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [16, 23]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [4, 30]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [17, 32]⟩,
    ⟨.and, [5, 33]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [18, 35]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [12, 15]⟩,
    ⟨.or, [20, 38]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [22, 25]⟩,
    ⟨.or, [27, 41]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [31, 43]⟩,
    ⟨.or, [34, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19823

theorem PEqualNP.Outside.L_meta_19823 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (15612158718957067875 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19823.witness, by simp [PEqualNP.Outside.L_meta_19823.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
