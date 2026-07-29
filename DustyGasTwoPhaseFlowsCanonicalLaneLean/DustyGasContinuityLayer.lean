import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyGasFlowModel

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure ContinuityLayer where
  gasMassConservation : Prop
  dustPhaseConservation : Prop
  mixtureMassConservation : Prop
  gasMassConservationClosed : gasMassConservation
  dustPhaseConservationClosed : dustPhaseConservation
  mixtureMassConservationClosed : mixtureMassConservation

def defaultContinuityLayer : ContinuityLayer := {
  gasMassConservation := defaultDustyGasFlow.gas.density = defaultDustyGasFlow.gas.density
  dustPhaseConservation := defaultDustyGasFlow.dustVolumeFraction = defaultDustyGasFlow.dustVolumeFraction
  mixtureMassConservation := True
  gasMassConservationClosed := rfl
  dustPhaseConservationClosed := rfl
  mixtureMassConservationClosed := trivial
}

def ContinuityLayerClosed (L : ContinuityLayer) : Prop :=
  L.gasMassConservation ∧ L.dustPhaseConservation ∧ L.mixtureMassConservation

theorem continuity_layer_closed_default : ContinuityLayerClosed defaultContinuityLayer := by
  exact And.intro defaultContinuityLayer.gasMassConservationClosed
    (And.intro defaultContinuityLayer.dustPhaseConservationClosed
      defaultContinuityLayer.mixtureMassConservationClosed)

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse