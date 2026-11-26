import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19852

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [13, 14]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [11, 18]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [15, 21]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [15, 18]⟩,
    ⟨.and, [5, 30]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.and, [6, 32]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [13, 34]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 23]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [33, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19852

theorem PEqualNP.Outside.L_meta_19852 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (4062675765271054350 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19852.witness, by simp [PEqualNP.Outside.L_meta_19852.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
