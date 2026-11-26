import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19922

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [1, 2]⟩,
    ⟨.or, [3, 4]⟩,
    ⟨.or, [6, 7]⟩,
    ⟨.or, [0, 17]⟩,
    ⟨.and, [8, 19]⟩,
    ⟨.or, [5, 16]⟩,
    ⟨.and, [9, 21]⟩,
    ⟨.or, [1, 18]⟩,
    ⟨.and, [10, 23]⟩,
    ⟨.or, [4, 18]⟩,
    ⟨.and, [11, 25]⟩,
    ⟨.or, [5, 17]⟩,
    ⟨.and, [12, 27]⟩,
    ⟨.or, [0, 2]⟩,
    ⟨.or, [3, 29]⟩,
    ⟨.and, [13, 30]⟩,
    ⟨.or, [7, 16]⟩,
    ⟨.and, [14, 32]⟩,
    ⟨.or, [0, 5]⟩,
    ⟨.or, [6, 34]⟩,
    ⟨.and, [15, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [24, 37]⟩,
    ⟨.or, [26, 38]⟩,
    ⟨.or, [28, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [33, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19922

theorem PEqualNP.Outside.L_meta_19922 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (5515944280522376865 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19922.witness, by simp [PEqualNP.Outside.L_meta_19922.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
