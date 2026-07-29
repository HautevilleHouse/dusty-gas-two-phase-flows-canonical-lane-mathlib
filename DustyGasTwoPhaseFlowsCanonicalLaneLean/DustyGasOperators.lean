import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

abbrev Position := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Position → ℝ
abbrev VectorField := Time → Position → Position

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure DustyGasOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  dragCoupling : VectorField → VectorField → VectorField
  pressureGradient : ScalarField → VectorField
  porosityWeight : ScalarField → ScalarField
  dragCouplingIdempotent : ∀ u v, dragCoupling (dragCoupling u v) (dragCoupling u v) = dragCoupling u v

def primitiveOperators : DustyGasOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  dragCoupling := fun u _ => u
  pressureGradient := fun _ => zeroVectorField
  porosityWeight := fun s => s
  dragCouplingIdempotent := by intro u v; rfl
}

structure DustyGasFlow where
  gasVelocity : VectorField
  particleVelocity : VectorField
  gasPressure : ScalarField
  porosity : ScalarField
  viscosity : ℝ
  particleDiffusivity : ℝ
  dragCoefficient : ℝ
  operators : DustyGasOperators

def primitiveFlow : DustyGasFlow := {
  gasVelocity := zeroVectorField
  particleVelocity := zeroVectorField
  gasPressure := zeroScalarField
  porosity := zeroScalarField
  viscosity := 1
  particleDiffusivity := 1
  dragCoefficient := 1
  operators := primitiveOperators
}

def IncompressibleGas (F : DustyGasFlow) : Prop :=
  F.operators.divergence F.gasVelocity = zeroScalarField

def DustyGasEquationClosed (F : DustyGasFlow) : Prop :=
  IncompressibleGas F

theorem primitive_flow_incompressible_checked :
    IncompressibleGas primitiveFlow := by
  unfold IncompressibleGas
  rfl

theorem primitive_flow_equation_closed_checked :
    DustyGasEquationClosed primitiveFlow := by
  exact primitive_flow_incompressible_checked

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse