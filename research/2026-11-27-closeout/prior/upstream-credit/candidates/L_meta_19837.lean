import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19837

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 13]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.or, [18, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.or, [18, 24]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [19, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [19, 30]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [20, 35]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [20, 38]⟩,
    ⟨.and, [6, 39]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [23, 26]⟩,
    ⟨.or, [29, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [34, 45]⟩,
    ⟨.or, [37, 46]⟩,
    ⟨.or, [40, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19837

theorem PEqualNP.Outside.L_meta_19837 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (15680755338451602420 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19837.witness, by simp [PEqualNP.Outside.L_meta_19837.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
