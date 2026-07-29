import DustyGasTwoPhaseFlowsCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

structure GasPhase where
  density : ScalarField
  velocity : VectorField
  temperature : ScalarField
  pressure : ScalarField

def zeroGasPhase : GasPhase := {
  density := fun _ _ => 0
  velocity := fun _ _ _ => 0
  temperature := fun _ _ => 0
  pressure := fun _ _ => 0
}

structure DustPhase where
  density : ScalarField
  velocity : VectorField
  temperature : ScalarField
  diameter : ScalarField  -- particle diameter field

def zeroDustPhase : DustPhase := {
  density := fun _ _ => 0
  velocity := fun _ _ _ => 0
  temperature := fun _ _ => 0
  diameter := fun _ _ => 0
}

structure TwoPhaseOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  dragForce : VectorField → VectorField → VectorField   -- interphase drag
  heatTransfer : ScalarField → ScalarField → ScalarField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

def primitiveTwoPhaseOperators : TwoPhaseOperators := {
  divergence := fun _ => fun _ _ => 0
  gradient := fun _ => fun _ _ _ => 0
  laplacian := fun u => u
  timeDerivative := fun _ => fun _ _ _ => 0
  dragForce := fun _ _ => fun _ _ _ => 0
  heatTransfer := fun _ _ => fun _ _ => 0
  pressureProjection := fun u => u
  pressureProjectionIdempotent := by intro u; rfl
}

structure TwoPhaseFlow where
  gas : GasPhase
  dust : DustPhase
  viscosity : ℝ
  thermalConductivity : ℝ
  operators : TwoPhaseOperators

def primitiveTwoPhaseFlow : TwoPhaseFlow := {
  gas := zeroGasPhase
  dust := zeroDustPhase
  viscosity := 1
  thermalConductivity := 1
  operators := primitiveTwoPhaseOperators
}

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse