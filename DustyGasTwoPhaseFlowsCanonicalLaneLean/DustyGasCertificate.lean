import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyGasClosureLayer
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyGasFinalTheorem

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure DustyGasCertificate where
  closureLayer : DustyGasClosureLayer
  closureLayerClosed : DustyGasClosureLayerClosed closureLayer
  admissibleClass : AdmissibleClass
  constrainedClosure : ConstrainedDustyGasClosure admissibleClass

def defaultDustyGasCertificate : DustyGasCertificate := {
  closureLayer := defaultDustyGasClosureLayer
  closureLayerClosed := dusty_gas_closure_layer_closed_default
  admissibleClass := {
    object := { sourceKey := "dusty_gas_two_phase_flows", theoremObject := "Dusty Gas Flow Model", claimBoundary := "Test" },
    endpointSatisfied := True,
    remainderRecorded := True,
    gateWitness := Or.inl trivial
  }
  constrainedClosure := constrained_dusty_gas_closure _
}

theorem dusty_gas_certificate_valid : DustyGasCertificateClosed defaultDustyGasCertificate := by
  exact And.intro defaultDustyGasCertificate.closureLayerClosed defaultDustyGasCertificate.constrainedClosure

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse