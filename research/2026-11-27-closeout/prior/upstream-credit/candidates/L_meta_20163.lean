import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20163

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [0, 1]⟩,
    ⟨.or, [2, 4]⟩,
    ⟨.or, [5, 7]⟩,
    ⟨.or, [6, 17]⟩,
    ⟨.or, [6, 18]⟩,
    ⟨.or, [3, 16]⟩,
    ⟨.or, [0, 20]⟩,
    ⟨.and, [8, 22]⟩,
    ⟨.or, [4, 21]⟩,
    ⟨.and, [9, 24]⟩,
    ⟨.or, [3, 19]⟩,
    ⟨.and, [10, 26]⟩,
    ⟨.or, [5, 19]⟩,
    ⟨.and, [11, 28]⟩,
    ⟨.or, [3, 7]⟩,
    ⟨.or, [17, 30]⟩,
    ⟨.and, [12, 31]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [13, 33]⟩,
    ⟨.or, [1, 20]⟩,
    ⟨.and, [14, 35]⟩,
    ⟨.or, [2, 21]⟩,
    ⟨.and, [15, 37]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [27, 39]⟩,
    ⟨.or, [29, 40]⟩,
    ⟨.or, [32, 41]⟩,
    ⟨.or, [34, 42]⟩,
    ⟨.or, [36, 43]⟩,
    ⟨.or, [38, 44]⟩], 45⟩

end PEqualNP.Outside.L_meta_20163

theorem PEqualNP.Outside.L_meta_20163 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8164297279589376675 : ℕ).testBit (8 * u.val + v.val)) 30 := by
  exact ⟨PEqualNP.Outside.L_meta_20163.witness, by simp [PEqualNP.Outside.L_meta_20163.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
