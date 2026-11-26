import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19855

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 13]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [0, 20]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [17, 22]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [18, 25]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [17, 28]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [5, 33]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [16, 35]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [11, 38]⟩,
    ⟨.or, [15, 39]⟩,
    ⟨.and, [7, 40]⟩,
    ⟨.or, [21, 24]⟩,
    ⟨.or, [27, 42]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [34, 45]⟩,
    ⟨.or, [37, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19855

theorem PEqualNP.Outside.L_meta_19855 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (10192891319453729625 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19855.witness, by simp [PEqualNP.Outside.L_meta_19855.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
