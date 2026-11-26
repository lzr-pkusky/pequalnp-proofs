import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19844

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 14]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.or, [12, 15]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.or, [11, 18]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [12, 20]⟩,
    ⟨.and, [2, 25]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [19, 27]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [13, 30]⟩,
    ⟨.or, [15, 31]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [19, 34]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [15, 20]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [26, 41]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [33, 43]⟩,
    ⟨.or, [36, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19844

theorem PEqualNP.Outside.L_meta_19844 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8254449022188472170 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19844.witness, by simp [PEqualNP.Outside.L_meta_19844.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
