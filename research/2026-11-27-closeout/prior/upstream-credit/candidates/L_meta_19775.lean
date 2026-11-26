import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19775

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 14]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [15, 19]⟩,
    ⟨.and, [0, 20]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [13, 18]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [12, 30]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19775

theorem PEqualNP.Outside.L_meta_19775 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (7508647934801106060 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19775.witness, by simp [PEqualNP.Outside.L_meta_19775.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
