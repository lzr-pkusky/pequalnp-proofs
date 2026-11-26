import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19829

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 14]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [13, 23]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.and, [5, 30]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.and, [6, 32]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [15, 34]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [33, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19829

theorem PEqualNP.Outside.L_meta_19829 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (14134136632318694985 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19829.witness, by simp [PEqualNP.Outside.L_meta_19829.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
