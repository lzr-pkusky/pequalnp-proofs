import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19796

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 13]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [13, 18]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [15, 21]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [14, 26]⟩,
    ⟨.and, [3, 27]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [14, 29]⟩,
    ⟨.and, [4, 30]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [5, 32]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.and, [6, 34]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.and, [7, 36]⟩,
    ⟨.or, [20, 23]⟩,
    ⟨.or, [25, 38]⟩,
    ⟨.or, [28, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [33, 41]⟩,
    ⟨.or, [35, 42]⟩,
    ⟨.or, [37, 43]⟩], 44⟩

end PEqualNP.Outside.L_meta_19796

theorem PEqualNP.Outside.L_meta_19796 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (9928239608072734260 : ℕ).testBit (8 * u.val + v.val)) 29 := by
  exact ⟨PEqualNP.Outside.L_meta_19796.witness, by simp [PEqualNP.Outside.L_meta_19796.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
