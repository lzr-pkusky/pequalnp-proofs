import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20140

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [0, 1]⟩,
    ⟨.or, [2, 6]⟩,
    ⟨.or, [4, 7]⟩,
    ⟨.or, [5, 16]⟩,
    ⟨.or, [3, 17]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [8, 21]⟩,
    ⟨.or, [6, 19]⟩,
    ⟨.and, [9, 23]⟩,
    ⟨.or, [2, 5]⟩,
    ⟨.or, [18, 25]⟩,
    ⟨.and, [10, 26]⟩,
    ⟨.or, [1, 3]⟩,
    ⟨.or, [18, 28]⟩,
    ⟨.and, [11, 29]⟩,
    ⟨.or, [3, 19]⟩,
    ⟨.and, [12, 31]⟩,
    ⟨.or, [0, 7]⟩,
    ⟨.or, [17, 33]⟩,
    ⟨.and, [13, 34]⟩,
    ⟨.or, [4, 20]⟩,
    ⟨.and, [14, 36]⟩,
    ⟨.or, [5, 20]⟩,
    ⟨.and, [15, 38]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [27, 40]⟩,
    ⟨.or, [30, 41]⟩,
    ⟨.or, [32, 42]⟩,
    ⟨.or, [35, 43]⟩,
    ⟨.or, [37, 44]⟩,
    ⟨.or, [39, 45]⟩], 46⟩

end PEqualNP.Outside.L_meta_20140

theorem PEqualNP.Outside.L_meta_20140 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (3306370337538841395 : ℕ).testBit (8 * u.val + v.val)) 31 := by
  exact ⟨PEqualNP.Outside.L_meta_20140.witness, by simp [PEqualNP.Outside.L_meta_20140.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
