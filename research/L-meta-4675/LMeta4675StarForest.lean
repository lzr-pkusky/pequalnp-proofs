import Mathlib
import PEqualNP.Defs

/-!
# Star-forest case of project step L-meta-4675

For a disjoint union of stars, orient each edge from its center to its leaf.
Distinct edges then have distinct leaves, and the sets of centers and leaves
are disjoint. The theorem `disjoint_stars_bound` proves the gate bound whenever
every edge has an endpoint incident to no other edge. The proof uses only
fan-in at most two.
-/

namespace PEqualNP.StarForestLowerBound

open PEqualNP.CircuitLowerBounds

/-- Replace a watched gate output by the wires that feed it. The gate list is
in reverse evaluation order, so `tail.length` is this gate's index. -/
def previous (n : ℕ) (g : Gate) (tail : List Gate) (wires : Finset ℕ) : Finset ℕ :=
  if n + tail.length ∈ wires then
    (wires.erase (n + tail.length)) ∪ g.inputs.toFinset
  else wires

def support (n : ℕ) : List Gate → Finset ℕ → Finset ℕ
  | [], wires => wires
  | g :: tail, wires => support n tail (previous n g tail wires)

theorem previous_card (n : ℕ) (g : Gate) (tail : List Gate) (wires : Finset ℕ)
    (arity : g.inputs.length ≤ 2) : (previous n g tail wires).card ≤ wires.card + 1 := by
  unfold previous
  split_ifs with member
  · have h₁ := Finset.card_union_le (wires.erase (n + tail.length)) g.inputs.toFinset
    have h₂ := Finset.card_erase_add_one member
    have h₃ := List.toFinset_card_le g.inputs
    omega
  · omega

theorem support_card (n : ℕ) (R : List Gate) (arity : ∀ g ∈ R, g.inputs.length ≤ 2)
    (wires : Finset ℕ) : (support n R wires).card ≤ wires.card + R.length := by
  induction R generalizing wires with
  | nil => simp [support]
  | cons g tail ih =>
    have hg := arity g (by simp)
    have ht : ∀ gate ∈ tail, gate.inputs.length ≤ 2 :=
      fun gate h => arity gate (by simp [h])
    have h₁ := ih ht (previous n g tail wires)
    have h₂ := previous_card n g tail wires hg
    simp only [support, List.length_cons]
    omega

def evaluateBack (R : List Gate) (x : List Bool) : List Bool :=
  (Circuit.mk R.reverse 0).wires x

theorem evaluateBack_cons (g : Gate) (R : List Gate) (x : List Bool) :
    evaluateBack (g :: R) x = evaluateBack R x ++
      [g.op.eval (g.inputs.map fun i => (evaluateBack R x).getD i false)] := by
  simp [evaluateBack, Circuit.wires, List.reverse_cons, List.foldl_append]

theorem evaluateBack_length (R : List Gate) (x : List Bool) :
    (evaluateBack R x).length = x.length + R.length := by
  induction R with
  | nil => simp [evaluateBack, Circuit.wires]
  | cons g R ih => simp [evaluateBack_cons, ih, Nat.add_assoc]

theorem support_sound (n : ℕ) (R : List Gate) (x y : List Bool)
    (hx : x.length = n) (hy : y.length = n) (wires : Finset ℕ)
    (agree : ∀ i ∈ support n R wires, x.getD i false = y.getD i false) :
    ∀ i ∈ wires, (evaluateBack R x).getD i false = (evaluateBack R y).getD i false := by
  induction R generalizing wires with
  | nil => simpa [support, evaluateBack, Circuit.wires] using agree
  | cons g R ih =>
    have oldEq := ih (previous n g R wires) agree
    have lx : (evaluateBack R x).length = n + R.length := by rw [evaluateBack_length, hx]
    have ly : (evaluateBack R y).length = n + R.length := by rw [evaluateBack_length, hy]
    intro i hi
    rw [evaluateBack_cons, evaluateBack_cons]
    rcases lt_trichotomy i (n + R.length) with h | rfl | h
    · rw [List.getD_append _ _ _ _ (by omega : i < (evaluateBack R x).length),
          List.getD_append _ _ _ _ (by omega : i < (evaluateBack R y).length)]
      apply oldEq
      by_cases hmem : n + R.length ∈ wires <;> simp [previous, hmem, ne_of_lt h, hi]
    · rw [List.getD_append_right _ _ _ _ (by omega : (evaluateBack R x).length ≤ n + R.length),
          List.getD_append_right _ _ _ _ (by omega : (evaluateBack R y).length ≤ n + R.length)]
      simp only [lx, ly, Nat.sub_self, List.getD_cons_zero]
      congr 1
      apply List.map_congr_left
      intro j hj
      apply oldEq
      simp [previous, hi, hj]
    · have beyondX : (evaluateBack R x ++
          [g.op.eval (g.inputs.map fun i => (evaluateBack R x).getD i false)]).length ≤ i := by
        simp only [List.length_append, List.length_singleton, lx]
        omega
      have beyondY : (evaluateBack R y ++
          [g.op.eval (g.inputs.map fun i => (evaluateBack R y).getD i false)]).length ≤ i := by
        simp only [List.length_append, List.length_singleton, ly]
        omega
      rw [List.getD_eq_default _ _ beyondX, List.getD_eq_default _ _ beyondY]

theorem ofFn_lookup (n : ℕ) (x : Fin n → Bool) (i : ℕ) (hi : i < n) :
    (List.ofFn x).getD i false = x ⟨i, hi⟩ := by
  rw [List.getD_eq_getElem _ _ (by simpa)]
  simp

/-- A circuit with fan-in at most two depends on at most one more input than
it has gates. Each backward expansion adds at most one watched wire. -/
theorem circuit_support (n : ℕ) (C : Circuit) (arity : ∀ g ∈ C.gates, g.inputs.length ≤ 2) :
    ∃ W : Finset ℕ, W.card ≤ C.size + 1 ∧
      ∀ x y : Fin n → Bool, (∀ i : Fin n, i.val ∈ W → x i = y i) →
        C.eval (List.ofFn x) = C.eval (List.ofFn y) := by
  refine ⟨support n C.gates.reverse {C.output}, ?_, ?_⟩
  · have hr : ∀ g ∈ C.gates.reverse, g.inputs.length ≤ 2 := by simpa
    simpa [Circuit.size, Nat.add_comm] using support_card n C.gates.reverse hr {C.output}
  · intro x y agree
    have hv : ∀ i ∈ support n C.gates.reverse {C.output},
        (List.ofFn x).getD i false = (List.ofFn y).getD i false := by
      intro i hi
      by_cases h : i < n
      · rw [ofFn_lookup _ _ _ h, ofFn_lookup _ _ _ h]
        exact agree ⟨i, h⟩ hi
      · rw [List.getD_eq_default _ _ (by simpa using Nat.le_of_not_gt h),
            List.getD_eq_default _ _ (by simpa using Nat.le_of_not_gt h)]
    obtain ⟨gs, out⟩ := C
    simpa [Circuit.eval, Circuit.wires, evaluateBack] using
      (support_sound n gs.reverse (List.ofFn x) (List.ofFn y) (by simp) (by simp)
        {out} hv out (by simp))

def edgeEval (p l : ℕ) (E : Finset (Fin p × Fin l)) (x : Fin (p + l) → Bool) : Bool :=
  decide (∃ (a : Fin p) (b : Fin l), (a, b) ∈ E ∧
    x (Fin.castAdd l a) = true ∧ x (Fin.natAdd p b) = true)

def oneHot {n : ℕ} (v : Fin n) (i : Fin n) : Bool := decide (i = v)

def twoHot {n : ℕ} (u v : Fin n) (i : Fin n) : Bool := decide (i = u ∨ i = v)

theorem opposite_ne (p l : ℕ) (a : Fin p) (b : Fin l) :
    Fin.castAdd l a ≠ Fin.natAdd p b := by
  intro eq
  have hv := congrArg Fin.val eq
  simp only [Fin.val_castAdd, Fin.val_natAdd] at hv
  omega

theorem edge_oneHot (p l : ℕ) (E : Finset (Fin p × Fin l)) (v : Fin (p+l)) :
    edgeEval p l E (oneHot v) = false := by
  unfold edgeEval
  apply decide_eq_false
  rintro ⟨a, b, _, ha, hb⟩
  simp only [oneHot, decide_eq_true_eq] at ha hb
  exact opposite_ne p l a b (ha.trans hb.symm)

theorem edge_twoHot (p l : ℕ) (E : Finset (Fin p × Fin l))
    (a : Fin p) (b : Fin l) (ab : (a,b) ∈ E) :
    edgeEval p l E (twoHot (Fin.castAdd l a) (Fin.natAdd p b)) = true := by
  unfold edgeEval
  apply decide_eq_true
  exact ⟨a, b, ab, by simp [twoHot], by simp [twoHot]⟩

/-- Each endpoint of an edge is essential. Activating just the two endpoints
makes the function true, and switching either endpoint off makes it false. -/
theorem edge_endpoints (p l : ℕ) (E : Finset (Fin p × Fin l)) (C : Circuit) (W : Finset ℕ)
    (computes : ∀ x, C.eval (List.ofFn x) = edgeEval p l E x)
    (support_agrees : ∀ x y : Fin (p+l) → Bool, (∀ i : Fin (p+l), i.val ∈ W → x i = y i) →
      C.eval (List.ofFn x) = C.eval (List.ofFn y))
    (a : Fin p) (b : Fin l) (ab : (a,b) ∈ E) : a.val ∈ W ∧ p + b.val ∈ W := by
  let u := Fin.castAdd l a
  let v := Fin.natAdd p b
  have trueEval : C.eval (List.ofFn (twoHot u v)) = true :=
    (computes _).trans (edge_twoHot p l E a b ab)
  have falseEval (i : Fin (p+l)) : C.eval (List.ofFn (oneHot i)) = false :=
    (computes _).trans (edge_oneHot p l E i)
  constructor
  · by_contra absent
    have same := support_agrees (twoHot u v) (oneHot v) (by
      intro i hi
      have ne : i ≠ u := fun eq => absent (by simpa [eq, u] using hi)
      simp [twoHot, oneHot, ne])
    rw [trueEval, falseEval] at same
    contradiction
  · by_contra absent
    have same := support_agrees (twoHot u v) (oneHot u) (by
      intro i hi
      have ne : i ≠ v := fun eq => absent (by simpa [eq, v] using hi)
      simp [twoHot, oneHot, ne])
    rw [trueEval, falseEval] at same
    contradiction

theorem star_forest_bound (p l : ℕ) (E : Finset (Fin p × Fin l)) (C : Circuit)
    (center leaf : Fin p × Fin l → Fin (p+l))
    (orient : ∀ e ∈ E,
      (center e = Fin.castAdd l e.1 ∧ leaf e = Fin.natAdd p e.2) ∨
      (center e = Fin.natAdd p e.2 ∧ leaf e = Fin.castAdd l e.1))
    (unique_leaf : Set.InjOn leaf (E : Set (Fin p × Fin l)))
    (separate : Disjoint (E.image center) (E.image leaf))
    (arity : ∀ g ∈ C.gates, g.inputs.length ≤ 2)
    (computes : ∀ x, C.eval (List.ofFn x) = edgeEval p l E x) :
    ∃ S : Finset (Fin (p+l)),
      (∀ (a : Fin p) (b : Fin l), (a,b) ∈ E → Fin.castAdd l a ∈ S ∨ Fin.natAdd p b ∈ S) ∧
      E.card + S.card ≤ C.size + 1 := by
  obtain ⟨W, hw, hagree⟩ := circuit_support (p+l) C arity
  let S := E.image center
  let T := E.image leaf
  have both (e : Fin p × Fin l) (he : e ∈ E) : (center e).val ∈ W ∧ (leaf e).val ∈ W := by
    have endpoints := edge_endpoints p l E C W computes hagree e.1 e.2 he
    rcases orient e he with ⟨hc, hl⟩ | ⟨hc, hl⟩
    · simpa only [hc, hl, Fin.val_castAdd, Fin.val_natAdd] using endpoints
    · simpa only [hc, hl, Fin.val_castAdd, Fin.val_natAdd] using And.symm endpoints
  have subset : (S ∪ T).image Fin.val ⊆ W := by
    intro i hi
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hi
    rcases Finset.mem_union.mp hv with hc | hl
    · obtain ⟨e, he, rfl⟩ := Finset.mem_image.mp hc
      exact (both e he).1
    · obtain ⟨e, he, rfl⟩ := Finset.mem_image.mp hl
      exact (both e he).2
  refine ⟨S, ?_, ?_⟩
  · intro a b ab
    have mem : center (a,b) ∈ S := Finset.mem_image.mpr ⟨(a,b), ab, rfl⟩
    rcases orient (a,b) ab with ⟨hc, _⟩ | ⟨hc, _⟩
    · exact Or.inl (hc ▸ mem)
    · exact Or.inr (hc ▸ mem)
  · have hcard := Finset.card_le_card subset
    have hT : T.card = E.card := Finset.card_image_of_injOn unique_leaf
    rw [Finset.card_image_of_injective _ Fin.val_injective,
      Finset.card_union_of_disjoint (show Disjoint S T from separate), hT] at hcard
    omega

def pointLeaf {p l : ℕ} (E : Finset (Fin p × Fin l)) (e : Fin p × Fin l) : Prop :=
  ∀ f ∈ E, f.1 = e.1 → f = e

def lineLeaf {p l : ℕ} (E : Finset (Fin p × Fin l)) (e : Fin p × Fin l) : Prop :=
  ∀ f ∈ E, f.2 = e.2 → f = e

theorem disjoint_stars_bound (p l : ℕ) (E : Finset (Fin p × Fin l)) (C : Circuit)
    (star : ∀ e ∈ E, pointLeaf E e ∨ lineLeaf E e)
    (arity : ∀ g ∈ C.gates, g.inputs.length ≤ 2)
    (computes : ∀ x, C.eval (List.ofFn x) = edgeEval p l E x) :
    ∃ S : Finset (Fin (p+l)),
      (∀ (a : Fin p) (b : Fin l), (a,b) ∈ E → Fin.castAdd l a ∈ S ∨ Fin.natAdd p b ∈ S) ∧
      E.card + S.card ≤ C.size + 1 := by
  classical
  let center (e : Fin p × Fin l) : Fin (p+l) :=
    if pointLeaf E e then Fin.natAdd p e.2 else Fin.castAdd l e.1
  let leaf (e : Fin p × Fin l) : Fin (p+l) :=
    if pointLeaf E e then Fin.castAdd l e.1 else Fin.natAdd p e.2
  have point_inj : Function.Injective (Fin.castAdd l : Fin p → Fin (p+l)) := by
    intro a b eq
    exact Fin.ext (by simpa using congrArg Fin.val eq)
  have line_inj : Function.Injective (Fin.natAdd p : Fin l → Fin (p+l)) := by
    intro a b eq
    apply Fin.ext
    exact Nat.add_left_cancel (by simpa only [Fin.val_natAdd] using congrArg Fin.val eq)
  have use_line (e : Fin p × Fin l) (he : e ∈ E) (np : ¬ pointLeaf E e) : lineLeaf E e :=
    (star e he).resolve_left np
  apply star_forest_bound p l E C center leaf _ _ _ arity computes
  · intro e _
    by_cases h : pointLeaf E e <;> simp [center, leaf, h]
  · intro e he f hf eq
    by_cases ep : pointLeaf E e <;> by_cases fp : pointLeaf E f
    · have same := point_inj (show Fin.castAdd l e.1 = Fin.castAdd l f.1 from by
        simpa only [leaf, ite_eq_left ep, ite_eq_left fp] using eq)
      exact (ep f hf same.symm).symm
    · exact False.elim (opposite_ne p l e.1 f.2 (by
        simpa only [leaf, ite_eq_left ep, ite_eq_right fp] using eq))
    · exact False.elim (opposite_ne p l f.1 e.2 (by
        simpa only [leaf, ite_eq_right ep, ite_eq_left fp] using eq.symm))
    · have same := line_inj (show Fin.natAdd p e.2 = Fin.natAdd p f.2 from by
        simpa only [leaf, ite_eq_right ep, ite_eq_right fp] using eq)
      exact (use_line e he ep f hf same.symm).symm
  · rw [Finset.disjoint_left]
    intro v vc vl
    obtain ⟨e, he, eqc⟩ := Finset.mem_image.mp vc
    obtain ⟨f, hf, eql⟩ := Finset.mem_image.mp vl
    have eq : center e = leaf f := eqc.trans eql.symm
    by_cases ep : pointLeaf E e <;> by_cases fp : pointLeaf E f
    · exact opposite_ne p l f.1 e.2 (by
        simpa only [center, leaf, ite_eq_left ep, ite_eq_left fp] using eq.symm)
    · have same := line_inj (show Fin.natAdd p e.2 = Fin.natAdd p f.2 from by
        simpa only [center, leaf, ite_eq_left ep, ite_eq_right fp] using eq)
      have ef := use_line f hf fp e he same
      exact fp (ef ▸ ep)
    · have same := point_inj (show Fin.castAdd l e.1 = Fin.castAdd l f.1 from by
        simpa only [center, leaf, ite_eq_right ep, ite_eq_left fp] using eq)
      have ef := fp e he same
      exact ep (ef.symm ▸ fp)
    · exact opposite_ne p l e.1 f.2 (by
        simpa only [center, leaf, ite_eq_right ep, ite_eq_right fp] using eq)

end PEqualNP.StarForestLowerBound
