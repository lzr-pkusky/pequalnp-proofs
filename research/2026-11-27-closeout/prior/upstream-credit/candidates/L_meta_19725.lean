import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19725

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 13]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.or, [22, 23]⟩,
    ⟨.and, [0, 24]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [13, 26]⟩,
    ⟨.or, [22, 27]⟩,
    ⟨.and, [1, 28]⟩,
    ⟨.or, [9, 21]⟩,
    ⟨.and, [2, 30]⟩,
    ⟨.or, [19, 20]⟩,
    ⟨.and, [3, 32]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [4, 34]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.or, [20, 36]⟩,
    ⟨.and, [5, 37]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [6, 39]⟩,
    ⟨.or, [12, 21]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [25, 29]⟩,
    ⟨.or, [31, 43]⟩,
    ⟨.or, [33, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [38, 46]⟩,
    ⟨.or, [40, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19725

theorem PEqualNP.Outside.L_meta_19725 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8992515997758798780 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19725.witness, by simp [PEqualNP.Outside.L_meta_19725.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
