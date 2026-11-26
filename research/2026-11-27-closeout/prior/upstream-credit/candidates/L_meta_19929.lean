import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19929

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 14]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [13, 15]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [10, 18]⟩,
    ⟨.and, [2, 23]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [12, 25]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [12, 28]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [24, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [30, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19929

theorem PEqualNP.Outside.L_meta_19929 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (7531109383139514375 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19929.witness, by simp [PEqualNP.Outside.L_meta_19929.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
