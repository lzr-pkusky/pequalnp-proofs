import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20111

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [2, 3]⟩,
    ⟨.or, [1, 7]⟩,
    ⟨.or, [0, 5]⟩,
    ⟨.or, [4, 16]⟩,
    ⟨.or, [6, 18]⟩,
    ⟨.or, [6, 19]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.or, [5, 21]⟩,
    ⟨.and, [8, 23]⟩,
    ⟨.or, [1, 21]⟩,
    ⟨.and, [9, 25]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [10, 27]⟩,
    ⟨.or, [4, 22]⟩,
    ⟨.and, [11, 29]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.and, [12, 31]⟩,
    ⟨.or, [4, 7]⟩,
    ⟨.or, [20, 33]⟩,
    ⟨.and, [13, 34]⟩,
    ⟨.or, [2, 22]⟩,
    ⟨.and, [14, 36]⟩,
    ⟨.or, [0, 3]⟩,
    ⟨.or, [6, 38]⟩,
    ⟨.or, [17, 39]⟩,
    ⟨.and, [15, 40]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.or, [28, 42]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [37, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_20111

theorem PEqualNP.Outside.L_meta_20111 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (17056109459091738360 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_20111.witness, by simp [PEqualNP.Outside.L_meta_20111.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
