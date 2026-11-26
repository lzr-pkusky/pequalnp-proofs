import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19765

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [1, 6]⟩,
    ⟨.or, [0, 5]⟩,
    ⟨.or, [2, 4]⟩,
    ⟨.or, [1, 18]⟩,
    ⟨.and, [8, 19]⟩,
    ⟨.or, [4, 17]⟩,
    ⟨.and, [9, 21]⟩,
    ⟨.or, [7, 17]⟩,
    ⟨.and, [10, 23]⟩,
    ⟨.or, [5, 18]⟩,
    ⟨.and, [11, 25]⟩,
    ⟨.or, [0, 3]⟩,
    ⟨.or, [6, 27]⟩,
    ⟨.and, [12, 28]⟩,
    ⟨.or, [7, 16]⟩,
    ⟨.and, [13, 30]⟩,
    ⟨.or, [3, 16]⟩,
    ⟨.and, [14, 32]⟩,
    ⟨.or, [2, 3]⟩,
    ⟨.or, [7, 34]⟩,
    ⟨.and, [15, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [24, 37]⟩,
    ⟨.or, [26, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [33, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19765

theorem PEqualNP.Outside.L_meta_19765 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (11848986063517868310 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19765.witness, by simp [PEqualNP.Outside.L_meta_19765.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
