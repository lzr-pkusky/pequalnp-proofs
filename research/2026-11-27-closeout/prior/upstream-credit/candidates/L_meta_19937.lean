import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19937

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 15]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [13, 19]⟩,
    ⟨.and, [0, 20]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [11, 24]⟩,
    ⟨.and, [2, 25]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.and, [3, 27]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [26, 37]⟩,
    ⟨.or, [28, 38]⟩,
    ⟨.or, [30, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19937

theorem PEqualNP.Outside.L_meta_19937 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (10691974706225816370 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19937.witness, by simp [PEqualNP.Outside.L_meta_19937.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
