import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19928

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 13]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [20, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [19, 26]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.or, [18, 31]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [14, 36]⟩,
    ⟨.or, [17, 37]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [19, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [28, 43]⟩,
    ⟨.or, [30, 44]⟩,
    ⟨.or, [33, 45]⟩,
    ⟨.or, [35, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19928

theorem PEqualNP.Outside.L_meta_19928 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (16643312522802600795 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19928.witness, by simp [PEqualNP.Outside.L_meta_19928.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
