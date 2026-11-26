import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19779

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 11]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.or, [10, 20]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.or, [19, 24]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.or, [19, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.or, [18, 30]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [15, 21]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.or, [17, 35]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [13, 21]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [12, 20]⟩,
    ⟨.and, [7, 40]⟩,
    ⟨.or, [23, 26]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [32, 43]⟩,
    ⟨.or, [34, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [39, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19779

theorem PEqualNP.Outside.L_meta_19779 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (17455334905265877990 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19779.witness, by simp [PEqualNP.Outside.L_meta_19779.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
