import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19936

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 14]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [19, 22]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [15, 25]⟩,
    ⟨.or, [21, 26]⟩,
    ⟨.and, [1, 27]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.or, [18, 29]⟩,
    ⟨.and, [2, 30]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.or, [21, 32]⟩,
    ⟨.and, [3, 33]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [4, 35]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [5, 37]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [6, 39]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [24, 28]⟩,
    ⟨.or, [31, 43]⟩,
    ⟨.or, [34, 44]⟩,
    ⟨.or, [36, 45]⟩,
    ⟨.or, [38, 46]⟩,
    ⟨.or, [40, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19936

theorem PEqualNP.Outside.L_meta_19936 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (6839164070987673195 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19936.witness, by simp [PEqualNP.Outside.L_meta_19936.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
