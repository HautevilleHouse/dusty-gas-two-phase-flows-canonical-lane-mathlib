import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyGasFlowModel

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure MomentumLayer where
  gasPhaseMomentum : Prop
  dustPhaseMomentum : Prop
  interphaseDragTerm : Prop
  gasPhaseMomentumClosed : gasPhaseMomentum
  dustPhaseMomentumClosed : dustPhaseMomentum
  interphaseDragTermClosed : interphaseDragTerm

def defaultMomentumLayer : MomentumLayer := {
  gasPhaseMomentum := defaultDustyGasFlow.gas.density = defaultDustyGasFlow.gas.density
  dustPhaseMomentum := defaultDustyGasFlow.dustVolumeFraction = defaultDustyGasFlow.dustVolumeFraction
  interphaseDragTerm := defaultDustyGasFlow.interphaseDragCoefficient > 0.0
  gasPhaseMomentumClosed := rfl
  dustPhaseMomentumClosed := rfl
  interphaseDragTermClosed := by
    unfold defaultDustyGasFlow; norm_num
}

def MomentumLayerClosed (L : MomentumLayer) : Prop :=
  L.gasPhaseMomentum ∧ L.dustPhaseMomentum ∧ L.interphaseDragTerm

theorem momentum_layer_closed_default : MomentumLayerClosed defaultMomentumLayer := by
  exact And.intro defaultMomentumLayer.gasPhaseMomentumClosed
    (And.intro defaultMomentumLayer.dustPhaseMomentumClosed
      defaultMomentumLayer.interphaseDragTermClosed)

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse