import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19797

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 13]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [18, 21]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [13, 25]⟩,
    ⟨.or, [22, 26]⟩,
    ⟨.and, [1, 27]⟩,
    ⟨.or, [9, 20]⟩,
    ⟨.and, [2, 29]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.or, [21, 33]⟩,
    ⟨.and, [4, 34]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.or, [22, 36]⟩,
    ⟨.and, [5, 37]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [6, 39]⟩,
    ⟨.or, [15, 20]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [24, 28]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [38, 46]⟩,
    ⟨.or, [40, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19797

theorem PEqualNP.Outside.L_meta_19797 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (15365916737909796330 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19797.witness, by simp [PEqualNP.Outside.L_meta_19797.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
