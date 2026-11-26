import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19838

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 11]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [14, 23]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [14, 26]⟩,
    ⟨.and, [3, 27]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [28, 38]⟩,
    ⟨.or, [30, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19838

theorem PEqualNP.Outside.L_meta_19838 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (9972273704342751540 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19838.witness, by simp [PEqualNP.Outside.L_meta_19838.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
