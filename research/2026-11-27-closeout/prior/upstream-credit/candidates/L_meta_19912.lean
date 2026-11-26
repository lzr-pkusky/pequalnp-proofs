import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19912

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [14, 15]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [2, 25]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [16, 27]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [18, 30]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [17, 33]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [16, 36]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [26, 41]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [32, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19912

theorem PEqualNP.Outside.L_meta_19912 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (3306370337538841395 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19912.witness, by simp [PEqualNP.Outside.L_meta_19912.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
