import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19914

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 15]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [0, 20]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [18, 22]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [18, 25]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [16, 28]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [16, 33]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [19, 38]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [21, 24]⟩,
    ⟨.or, [27, 41]⟩,
    ⟨.or, [30, 42]⟩,
    ⟨.or, [32, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19914

theorem PEqualNP.Outside.L_meta_19914 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8398537473870936615 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19914.witness, by simp [PEqualNP.Outside.L_meta_19914.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
