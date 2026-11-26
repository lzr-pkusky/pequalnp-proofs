import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19866

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 15]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.or, [8, 19]⟩,
    ⟨.and, [0, 20]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [17, 24]⟩,
    ⟨.and, [2, 25]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [13, 27]⟩,
    ⟨.or, [15, 28]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [18, 31]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [12, 19]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [18, 38]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [26, 41]⟩,
    ⟨.or, [30, 42]⟩,
    ⟨.or, [33, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19866

theorem PEqualNP.Outside.L_meta_19866 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (1125029453109683085 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19866.witness, by simp [PEqualNP.Outside.L_meta_19866.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
