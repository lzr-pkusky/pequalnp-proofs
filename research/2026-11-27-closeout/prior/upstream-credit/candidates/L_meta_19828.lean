import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19828

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 13]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [19, 22]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [20, 29]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [8, 21]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [10, 21]⟩,
    ⟨.and, [7, 38]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.or, [28, 40]⟩,
    ⟨.or, [31, 41]⟩,
    ⟨.or, [33, 42]⟩,
    ⟨.or, [35, 43]⟩,
    ⟨.or, [37, 44]⟩,
    ⟨.or, [39, 45]⟩], 46⟩

end PEqualNP.Outside.L_meta_19828

theorem PEqualNP.Outside.L_meta_19828 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (6672462620410619475 : ℕ).testBit (8 * u.val + v.val)) 31 := by
  exact ⟨PEqualNP.Outside.L_meta_19828.witness, by simp [PEqualNP.Outside.L_meta_19828.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
