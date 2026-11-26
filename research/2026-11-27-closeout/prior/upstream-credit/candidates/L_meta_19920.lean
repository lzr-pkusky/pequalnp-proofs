import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19920

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 15]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [12, 19]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.or, [13, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [17, 24]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [16, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [9, 20]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [14, 21]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [15, 20]⟩,
    ⟨.and, [7, 38]⟩,
    ⟨.or, [23, 26]⟩,
    ⟨.or, [29, 40]⟩,
    ⟨.or, [31, 41]⟩,
    ⟨.or, [33, 42]⟩,
    ⟨.or, [35, 43]⟩,
    ⟨.or, [37, 44]⟩,
    ⟨.or, [39, 45]⟩], 46⟩

end PEqualNP.Outside.L_meta_19920

theorem PEqualNP.Outside.L_meta_19920 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (17315157982817101740 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19920.witness, by simp [PEqualNP.Outside.L_meta_19920.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
