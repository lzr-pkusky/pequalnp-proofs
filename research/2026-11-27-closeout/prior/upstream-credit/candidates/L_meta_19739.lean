import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19739

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 14]⟩,
    ⟨.or, [12, 15]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [11, 18]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [13, 21]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [14, 30]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 23]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19739

theorem PEqualNP.Outside.L_meta_19739 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (10678392892249613865 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19739.witness, by simp [PEqualNP.Outside.L_meta_19739.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
