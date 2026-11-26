import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20155

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 11]⟩,
    ⟨.or, [12, 15]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [16, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [12, 19]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [11, 18]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [21, 28]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.and, [5, 33]⟩,
    ⟨.or, [9, 19]⟩,
    ⟨.and, [6, 35]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [20, 37]⟩,
    ⟨.and, [7, 38]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [27, 40]⟩,
    ⟨.or, [30, 41]⟩,
    ⟨.or, [32, 42]⟩,
    ⟨.or, [34, 43]⟩,
    ⟨.or, [36, 44]⟩,
    ⟨.or, [39, 45]⟩], 46⟩

end PEqualNP.Outside.L_meta_20155

theorem PEqualNP.Outside.L_meta_20155 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (5137396426346092845 : ℕ).testBit (8 * u.val + v.val)) 31 := by
  exact ⟨PEqualNP.Outside.L_meta_20155.witness, by simp [PEqualNP.Outside.L_meta_20155.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
