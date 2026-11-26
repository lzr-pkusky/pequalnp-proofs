import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19822

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [14, 15]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [15, 18]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [11, 23]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [13, 26]⟩,
    ⟨.and, [3, 27]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [14, 35]⟩,
    ⟨.and, [7, 36]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [25, 38]⟩,
    ⟨.or, [28, 39]⟩,
    ⟨.or, [30, 40]⟩,
    ⟨.or, [32, 41]⟩,
    ⟨.or, [34, 42]⟩,
    ⟨.or, [37, 43]⟩], 44⟩

end PEqualNP.Outside.L_meta_19822

theorem PEqualNP.Outside.L_meta_19822 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (6395723629099427220 : ℕ).testBit (8 * u.val + v.val)) 29 := by
  exact ⟨PEqualNP.Outside.L_meta_19822.witness, by simp [PEqualNP.Outside.L_meta_19822.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
