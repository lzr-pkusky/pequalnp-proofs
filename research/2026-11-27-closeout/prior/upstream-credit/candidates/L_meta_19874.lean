import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19874

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 14]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [13, 18]⟩,
    ⟨.and, [2, 23]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [13, 25]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [12, 30]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [24, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19874

theorem PEqualNP.Outside.L_meta_19874 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (1892380200682152600 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19874.witness, by simp [PEqualNP.Outside.L_meta_19874.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
