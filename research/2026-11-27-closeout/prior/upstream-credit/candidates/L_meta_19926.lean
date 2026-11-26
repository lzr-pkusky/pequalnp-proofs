import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19926

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 13]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.or, [8, 19]⟩,
    ⟨.or, [8, 18]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [19, 23]⟩,
    ⟨.and, [0, 24]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [12, 26]⟩,
    ⟨.or, [16, 27]⟩,
    ⟨.and, [1, 28]⟩,
    ⟨.or, [15, 22]⟩,
    ⟨.and, [2, 30]⟩,
    ⟨.or, [14, 20]⟩,
    ⟨.and, [3, 32]⟩,
    ⟨.or, [13, 22]⟩,
    ⟨.and, [4, 34]⟩,
    ⟨.or, [15, 21]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [10, 21]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [12, 20]⟩,
    ⟨.and, [7, 40]⟩,
    ⟨.or, [25, 29]⟩,
    ⟨.or, [31, 42]⟩,
    ⟨.or, [33, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [39, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19926

theorem PEqualNP.Outside.L_meta_19926 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (13064884772727831990 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19926.witness, by simp [PEqualNP.Outside.L_meta_19926.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
