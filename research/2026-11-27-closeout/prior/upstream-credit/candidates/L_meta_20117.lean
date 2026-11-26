import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20117

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [0, 1]⟩,
    ⟨.or, [6, 16]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [13, 18]⟩,
    ⟨.and, [17, 19]⟩,
    ⟨.or, [1, 2]⟩,
    ⟨.or, [3, 21]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [13, 23]⟩,
    ⟨.and, [22, 24]⟩,
    ⟨.or, [4, 7]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [11, 27]⟩,
    ⟨.or, [14, 28]⟩,
    ⟨.and, [26, 29]⟩,
    ⟨.or, [3, 5]⟩,
    ⟨.or, [6, 31]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.and, [32, 33]⟩,
    ⟨.or, [0, 2]⟩,
    ⟨.or, [5, 35]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.and, [36, 37]⟩,
    ⟨.or, [4, 5]⟩,
    ⟨.and, [10, 39]⟩,
    ⟨.or, [5, 7]⟩,
    ⟨.and, [12, 41]⟩,
    ⟨.or, [20, 25]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [34, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩,
    ⟨.or, [42, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_20117

theorem PEqualNP.Outside.L_meta_20117 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (6627281390824537785 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_20117.witness, by simp [PEqualNP.Outside.L_meta_20117.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
