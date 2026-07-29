import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

abbrev Time := ℝ
abbrev Space1 := ℝ
abbrev Space3 := ℝ × ℝ × ℝ

structure DustyGasParameters where
  mu_g : ℝ
  mu_p : ℝ
  rho_g : ℝ
  rho_p : ℝ
  D : ℝ
  tau : ℝ

def defaultDustyGasParameters : DustyGasParameters := {
  mu_g := 1.8e-5
  mu_p := 1.0e-3
  rho_g := 1.2
  rho_p := 1000.0
  D := 1.0e-9
  tau := 0.1
}

structure TwoPhaseFlow where
  phi_g : Time → Space3 → ℝ
  phi_p : Time → Space3 → ℝ
  u_g : Time → Space3 → Space3
  u_p : Time → Space3 → Space3
  p : Time → Space3 → ℝ
  params : DustyGasParameters

def defaultTwoPhaseFlow : TwoPhaseFlow := {
  phi_g := fun _ _ => 0.0
  phi_p := fun _ _ => 0.0
  u_g := fun _ _ => (0.0, 0.0, 0.0)
  u_p := fun _ _ => (0.0, 0.0, 0.0)
  p := fun _ _ => 101325.0
  params := defaultDustyGasParameters
}

def ContinuityGas (f : TwoPhaseFlow) (t : Time) (x : Space3) : Prop :=
  f.phi_g t x * (f.rho_g) * (f.params.mu_g) > 0

def ContinuityParticle (f : TwoPhaseFlow) (t : Time) (x : Space3) : Prop :=
  f.phi_p t x * (f.rho_p) * (f.params.mu_p) > 0

def MomentumGas (f : TwoPhaseFlow) (t : Time) (x : Space3) : Prop :=
  f.rho_g * (f.params.mu_g) > 0

def MomentumParticle (f : TwoPhaseFlow) (t : Time) (x : Space3) : Prop :=
  f.rho_p * (f.params.mu_p) > 0

def TwoPhaseFlowConsistent (f : TwoPhaseFlow) : Prop :=
  (∀ t x, ContinuityGas f t x) ∧ (∀ t x, ContinuityParticle f t x) ∧
  (∀ t x, MomentumGas f t x) ∧ (∀ t x, MomentumParticle f t x)

def defaultTwoPhaseFlowConsistent : TwoPhaseFlowConsistent defaultTwoPhaseFlow := by
  unfold TwoPhaseFlowConsistent
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))
  · intro t x; unfold ContinuityGas defaultTwoPhaseFlow; simp
  · intro t x; unfold ContinuityParticle defaultTwoPhaseFlow; simp
  · intro t x; unfold MomentumGas defaultTwoPhaseFlow; simp
  · intro t x; unfold MomentumParticle defaultTwoPhaseFlow; simp

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse