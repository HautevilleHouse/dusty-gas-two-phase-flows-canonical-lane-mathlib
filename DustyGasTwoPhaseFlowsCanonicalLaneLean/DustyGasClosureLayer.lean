import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyGasContinuityLayer
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyGasMomentumLayer

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure DustyGasClosureLayer where
  continuity : ContinuityLayer
  momentum : MomentumLayer
  equationClosed : Prop
  equationClosedProof : equationClosed

def defaultDustyGasClosureLayer : DustyGasClosureLayer := {
  continuity := defaultContinuityLayer
  momentum := defaultMomentumLayer
  equationClosed := ContinuityLayerClosed defaultContinuityLayer ∧ MomentumLayerClosed defaultMomentumLayer
  equationClosedProof := And.intro continuity_layer_closed_default momentum_layer_closed_default
}

def DustyGasClosureLayerClosed (L : DustyGasClosureLayer) : Prop :=
  ContinuityLayerClosed L.continuity ∧ MomentumLayerClosed L.momentum ∧ L.equationClosed

theorem dusty_gas_closure_layer_closed_default : DustyGasClosureLayerClosed defaultDustyGasClosureLayer := by
  exact And.intro continuity_layer_closed_default (And.intro momentum_layer_closed_default defaultDustyGasClosureLayer.equationClosedProof)

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse