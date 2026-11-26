import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19810

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 15]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [18, 23]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [12, 26]⟩,
    ⟨.or, [15, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [11, 19]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [13, 20]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [8, 19]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [8, 20]⟩,
    ⟨.and, [7, 38]⟩,
    ⟨.or, [22, 25]⟩,
    ⟨.or, [29, 40]⟩,
    ⟨.or, [31, 41]⟩,
    ⟨.or, [33, 42]⟩,
    ⟨.or, [35, 43]⟩,
    ⟨.or, [37, 44]⟩,
    ⟨.or, [39, 45]⟩], 46⟩

end PEqualNP.Outside.L_meta_19810

theorem PEqualNP.Outside.L_meta_19810 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (10184235645427475370 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19810.witness, by simp [PEqualNP.Outside.L_meta_19810.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
