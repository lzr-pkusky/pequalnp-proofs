import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19798

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [12, 15]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [15, 19]⟩,
    ⟨.and, [0, 20]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [14, 24]⟩,
    ⟨.and, [2, 25]⟩,
    ⟨.or, [10, 18]⟩,
    ⟨.and, [3, 27]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [26, 37]⟩,
    ⟨.or, [28, 38]⟩,
    ⟨.or, [30, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19798

theorem PEqualNP.Outside.L_meta_19798 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (813692034574725510 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19798.witness, by simp [PEqualNP.Outside.L_meta_19798.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
