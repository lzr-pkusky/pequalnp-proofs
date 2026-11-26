import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19913

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 14]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.or, [15, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.or, [17, 24]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [15, 20]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [9, 21]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.or, [19, 31]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.or, [19, 34]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [13, 37]⟩,
    ⟨.or, [19, 38]⟩,
    ⟨.and, [6, 39]⟩,
    ⟨.or, [14, 20]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [23, 26]⟩,
    ⟨.or, [28, 43]⟩,
    ⟨.or, [30, 44]⟩,
    ⟨.or, [33, 45]⟩,
    ⟨.or, [36, 46]⟩,
    ⟨.or, [40, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19913

theorem PEqualNP.Outside.L_meta_19913 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8982322578471014385 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19913.witness, by simp [PEqualNP.Outside.L_meta_19913.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
