import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19919

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [14, 15]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.and, [2, 23]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [15, 25]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [12, 28]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [14, 35]⟩,
    ⟨.and, [7, 36]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [24, 38]⟩,
    ⟨.or, [27, 39]⟩,
    ⟨.or, [30, 40]⟩,
    ⟨.or, [32, 41]⟩,
    ⟨.or, [34, 42]⟩,
    ⟨.or, [37, 43]⟩], 44⟩

end PEqualNP.Outside.L_meta_19919

theorem PEqualNP.Outside.L_meta_19919 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8125095274657465365 : ℕ).testBit (8 * u.val + v.val)) 29 := by
  exact ⟨PEqualNP.Outside.L_meta_19919.witness, by simp [PEqualNP.Outside.L_meta_19919.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
