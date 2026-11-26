import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19819

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 13]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.and, [0, 18]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [15, 20]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.and, [2, 23]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [12, 25]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [14, 28]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [14, 33]⟩,
    ⟨.and, [6, 34]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.and, [7, 36]⟩,
    ⟨.or, [19, 22]⟩,
    ⟨.or, [24, 38]⟩,
    ⟨.or, [27, 39]⟩,
    ⟨.or, [30, 40]⟩,
    ⟨.or, [32, 41]⟩,
    ⟨.or, [35, 42]⟩,
    ⟨.or, [37, 43]⟩], 44⟩

end PEqualNP.Outside.L_meta_19819

theorem PEqualNP.Outside.L_meta_19819 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (10543322878649664930 : ℕ).testBit (8 * u.val + v.val)) 29 := by
  exact ⟨PEqualNP.Outside.L_meta_19819.witness, by simp [PEqualNP.Outside.L_meta_19819.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
