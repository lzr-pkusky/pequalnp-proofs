import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19752

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 11]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [13, 19]⟩,
    ⟨.and, [0, 20]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [13, 18]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.and, [5, 30]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [12, 32]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19752

theorem PEqualNP.Outside.L_meta_19752 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (3033546467241018405 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19752.witness, by simp [PEqualNP.Outside.L_meta_19752.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
