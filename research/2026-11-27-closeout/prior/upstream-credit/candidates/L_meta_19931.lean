import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19931

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 13]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [20, 23]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [19, 30]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [19, 33]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [12, 36]⟩,
    ⟨.or, [18, 37]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.or, [18, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [22, 25]⟩,
    ⟨.or, [27, 43]⟩,
    ⟨.or, [29, 44]⟩,
    ⟨.or, [32, 45]⟩,
    ⟨.or, [35, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19931

theorem PEqualNP.Outside.L_meta_19931 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (16399645806311595450 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19931.witness, by simp [PEqualNP.Outside.L_meta_19931.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
