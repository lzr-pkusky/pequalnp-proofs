import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19925

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 12]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [18, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [17, 26]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [20, 31]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [14, 19]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [15, 19]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [18, 38]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [28, 41]⟩,
    ⟨.or, [30, 42]⟩,
    ⟨.or, [33, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19925

theorem PEqualNP.Outside.L_meta_19925 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (14245574616248233305 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19925.witness, by simp [PEqualNP.Outside.L_meta_19925.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
