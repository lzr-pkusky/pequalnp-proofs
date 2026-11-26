import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19924

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 15]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [13, 19]⟩,
    ⟨.and, [0, 20]⟩,
    ⟨.or, [13, 18]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [15, 28]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [30, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19924

theorem PEqualNP.Outside.L_meta_19924 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (5947437220121374770 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19924.witness, by simp [PEqualNP.Outside.L_meta_19924.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
