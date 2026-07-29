import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

abbrev SpatialDomain := Fin 3 → ℝ
abbrev Time := ℝ

structure GasPhase where
  density : Time → SpatialDomain → ℝ
  velocity : Time → SpatialDomain → SpatialDomain
  pressure : Time → SpatialDomain → ℝ

def defaultGasPhase : GasPhase := {
  density := fun _ _ => 1.0
  velocity := fun _ _ => (fun _ => 0.0)
  pressure := fun _ _ => 1.0
}

structure DustyGasFlow where
  gas : GasPhase
  dustVolumeFraction : Time → SpatialDomain → ℝ
  dustParticleSize : ℝ
  interphaseDragCoefficient : ℝ

def defaultDustyGasFlow : DustyGasFlow := {
  gas := defaultGasPhase
  dustVolumeFraction := fun _ _ => 0.5
  dustParticleSize := 1.0e-5
  interphaseDragCoefficient := 0.1
}

structure FlowOperators where
  divergence : (Time → SpatialDomain → SpatialDomain) → (Time → SpatialDomain → ℝ)
  gradient : (Time → SpatialDomain → ℝ) → (Time → SpatialDomain → SpatialDomain)
  laplacian : (Time → SpatialDomain → SpatialDomain) → (Time → SpatialDomain → SpatialDomain)
  timeDerivative : (Time → SpatialDomain → SpatialDomain) → (Time → SpatialDomain → SpatialDomain)

default divergence, gradient, laplacian, timeDerivative

def defaultFlowOperators : FlowOperators := {
  divergence := fun _ => fun _ _ => 0.0
  gradient := fun _ => fun _ _ => (fun _ => 0.0)
  laplacian := fun u => u
  timeDerivative := fun _ => fun _ _ => (fun _ => 0.0)
}

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse