import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19933

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 12]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.or, [13, 15]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.or, [10, 20]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [15, 21]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [14, 26]⟩,
    ⟨.or, [16, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [11, 21]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [12, 34]⟩,
    ⟨.or, [19, 35]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [9, 20]⟩,
    ⟨.and, [7, 40]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [31, 43]⟩,
    ⟨.or, [33, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [39, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19933

theorem PEqualNP.Outside.L_meta_19933 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (13467367414173452220 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19933.witness, by simp [PEqualNP.Outside.L_meta_19933.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
