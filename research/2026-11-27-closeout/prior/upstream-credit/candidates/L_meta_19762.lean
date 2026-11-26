import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19762

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 14]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [14, 23]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [15, 28]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [15, 33]⟩,
    ⟨.and, [6, 34]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [7, 36]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [25, 38]⟩,
    ⟨.or, [27, 39]⟩,
    ⟨.or, [30, 40]⟩,
    ⟨.or, [32, 41]⟩,
    ⟨.or, [35, 42]⟩,
    ⟨.or, [37, 43]⟩], 44⟩

end PEqualNP.Outside.L_meta_19762

theorem PEqualNP.Outside.L_meta_19762 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (6099045440807847450 : ℕ).testBit (8 * u.val + v.val)) 29 := by
  exact ⟨PEqualNP.Outside.L_meta_19762.witness, by simp [PEqualNP.Outside.L_meta_19762.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
