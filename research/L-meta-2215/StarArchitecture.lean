import Mathlib
import PEqualNP.Defs

namespace PEqualNP.Research.LMeta2215

abbrev incident (p : Fin 12) (l : Fin 13) : Prop :=
  (p.val + l.val + 14) % 13 ∈ ([0, 1, 3, 9] : List ℕ)

def linesAt (p : Fin 12) : Finset (Fin 13) := Finset.univ.filter (incident p)

def pointsAt (l : Fin 13) : Finset (Fin 12) := Finset.univ.filter (incident · l)

def pencil : Finset (Fin 13) := {0, 1, 3, 9}

set_option maxRecDepth 10000 in
theorem pointOverlap : ∀ a b : Fin 12, a ≠ b → ((linesAt a) ∩ (linesAt b)).card ≤ 1 := by
  decide +kernel

set_option maxRecDepth 10000 in
theorem lineOverlap : ∀ a b : Fin 13, a ≠ b → ((pointsAt a) ∩ (pointsAt b)).card ≤ 1 := by
  decide +kernel

theorem pencilOverlap : ∀ p : Fin 12, ((linesAt p) ∩ pencil).card = 1 := by
  decide +kernel

def matchedLine : Fin 12 → Fin 13 := ![0, 1, 6, 5, 4, 3, 2, 8, 7, 12, 11, 10]

theorem matching_incident : ∀ p : Fin 12, incident p (matchedLine p) := by
  decide +kernel

theorem matching_injective : Function.Injective matchedLine := by
  unfold Function.Injective
  decide +kernel

def pointIndex (p : Fin 12) : Fin 25 := Fin.castAdd 13 p

def lineIndex (l : Fin 13) : Fin 25 := Fin.natAdd 12 l

theorem disjoint_indices (p : Fin 12) (l : Fin 13) : pointIndex p ≠ lineIndex l := by
  intro eq
  have h := congrArg Fin.val eq
  simp only [pointIndex, lineIndex, Fin.val_castAdd, Fin.val_natAdd] at h
  omega

theorem cover_at_least_twelve (S : Finset (Fin 25))
    (cover : ∀ p l, incident p l → pointIndex p ∈ S ∨ lineIndex l ∈ S) : 12 ≤ S.card := by
  let select (p : Fin 12) : Fin 25 :=
    if pointIndex p ∈ S then pointIndex p else lineIndex (matchedLine p)
  have select_mem (p : Fin 12) : select p ∈ S := by
    by_cases h : pointIndex p ∈ S
    · simp [select, h]
    · simpa [select, h] using (cover p (matchedLine p) (matching_incident p)).resolve_left h
  have select_inj : Function.Injective select := by
    intro p q eq
    by_cases hp : pointIndex p ∈ S <;> by_cases hq : pointIndex q ∈ S
    · have h : pointIndex p = pointIndex q := by simpa [select, hp, hq] using eq
      exact Fin.ext (by simpa [pointIndex] using congrArg Fin.val h)
    · exact False.elim (disjoint_indices p (matchedLine q) (by simpa [select, hp, hq] using eq))
    · exact False.elim (disjoint_indices q (matchedLine p) (by simpa [select, hp, hq] using eq.symm))
    · have h : lineIndex (matchedLine p) = lineIndex (matchedLine q) := by
        simpa [select, hp, hq] using eq
      apply matching_injective
      apply Fin.ext
      have values := congrArg Fin.val h
      simp only [lineIndex, Fin.val_natAdd] at values
      omega
  have subset : Finset.univ.image select ⊆ S := by
    intro i hi
    obtain ⟨p, _, rfl⟩ := Finset.mem_image.mp hi
    exact select_mem p
  have h := Finset.card_le_card subset
  rwa [Finset.card_image_of_injective _ select_inj, Finset.card_univ, Fintype.card_fin] at h

/-- The standard star implementation has one bottom OR tree and an AND per
nonempty star, a top OR tree, and a three-gate auxiliary OR tree. -/
theorem star_budget (S : Finset (Fin 25)) (leaves : Fin 25 → ℕ)
    (cover : ∀ p l, incident p l → pointIndex p ∈ S ∨ lineIndex l ∈ S)
    (positive : ∀ i ∈ S, 0 < leaves i) (total : ∑ i ∈ S, leaves i = 48) :
    62 ≤ (∑ i ∈ S, (leaves i - 1)) + S.card + (S.card - 1) + 3 := by
  have hcover := cover_at_least_twelve S cover
  have bottom : (∑ i ∈ S, (leaves i - 1)) + S.card = 48 := by
    calc
      _ = (∑ i ∈ S, (leaves i - 1)) + (∑ _ ∈ S, (1 : ℕ)) := by simp
      _ = ∑ i ∈ S, leaves i := by
        rw [← Finset.sum_add_distrib]
        apply Finset.sum_congr rfl
        intro i hi
        have h := positive i hi
        omega
      _ = 48 := total
  omega

end PEqualNP.Research.LMeta2215
