import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19776

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 11]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [18, 25]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [18, 30]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [5, 33]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [6, 35]⟩,
    ⟨.or, [12, 15]⟩,
    ⟨.or, [19, 37]⟩,
    ⟨.and, [7, 38]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [27, 40]⟩,
    ⟨.or, [29, 41]⟩,
    ⟨.or, [32, 42]⟩,
    ⟨.or, [34, 43]⟩,
    ⟨.or, [36, 44]⟩,
    ⟨.or, [39, 45]⟩], 46⟩

end PEqualNP.Outside.L_meta_19776

theorem PEqualNP.Outside.L_meta_19776 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (17357271221525121870 : ℕ).testBit (8 * u.val + v.val)) 31 := by
  exact ⟨PEqualNP.Outside.L_meta_19776.witness, by simp [PEqualNP.Outside.L_meta_19776.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
