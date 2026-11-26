import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20122

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 11]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [12, 15]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [15, 19]⟩,
    ⟨.and, [0, 20]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [11, 26]⟩,
    ⟨.and, [3, 27]⟩,
    ⟨.or, [10, 18]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [28, 38]⟩,
    ⟨.or, [30, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_20122

theorem PEqualNP.Outside.L_meta_20122 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (7264353014310989955 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_20122.witness, by simp [PEqualNP.Outside.L_meta_20122.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
