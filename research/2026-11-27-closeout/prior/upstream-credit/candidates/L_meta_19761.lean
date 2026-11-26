import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19761

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 10]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [13, 15]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [16, 23]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [18, 28]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [18, 33]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [19, 38]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [22, 25]⟩,
    ⟨.or, [27, 41]⟩,
    ⟨.or, [30, 42]⟩,
    ⟨.or, [32, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19761

theorem PEqualNP.Outside.L_meta_19761 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (12848437582187957865 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19761.witness, by simp [PEqualNP.Outside.L_meta_19761.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
