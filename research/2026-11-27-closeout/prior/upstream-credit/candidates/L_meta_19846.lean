import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19846

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 11]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [13, 18]⟩,
    ⟨.and, [2, 23]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.and, [3, 25]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [13, 27]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [14, 30]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [11, 18]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [24, 37]⟩,
    ⟨.or, [26, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19846

theorem PEqualNP.Outside.L_meta_19846 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (10108984885455782700 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19846.witness, by simp [PEqualNP.Outside.L_meta_19846.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
