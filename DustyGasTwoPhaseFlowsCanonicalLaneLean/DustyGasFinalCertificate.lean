import DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyGasCompactnessLayer
import DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyGasWeakSolutionLayer

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure DustyGasAnalyticCertificate where
  weakLayerClosed : Prop
  compactnessLayerClosed : Prop
  regularityLayerClosed : Prop
  weakLayerClosedProof : weakLayerClosed
  compactnessLayerClosedProof : compactnessLayerClosed
  regularityLayerClosedProof : regularityLayerClosed

def sourceDustyGasAnalyticCertificate : DustyGasAnalyticCertificate := {
  weakLayerClosed := DustyGasWeakEnvelopeClosed sourceDustyGasWeakEnvelope
  compactnessLayerClosed := DustyGasCompactnessClosed sourceDustyGasCompactnessCertificate
  regularityLayerClosed := DustyGasRegularityClosed sourceDustyGasRegularityCertificate
  weakLayerClosedProof := source_dusty_gas_weak_envelope_closed
  compactnessLayerClosedProof := source_dusty_gas_compactness_closed
  regularityLayerClosedProof := source_dusty_gas_regularity_closed
}

def DustyGasAnalyticCertificateClosed (C : DustyGasAnalyticCertificate) : Prop :=
  C.weakLayerClosed ∧ C.compactnessLayerClosed ∧ C.regularityLayerClosed

theorem source_dusty_gas_analytic_certificate_closed :
    DustyGasAnalyticCertificateClosed sourceDustyGasAnalyticCertificate := by
  exact And.intro sourceDustyGasAnalyticCertificate.weakLayerClosedProof
    (And.intro sourceDustyGasAnalyticCertificate.compactnessLayerClosedProof
      sourceDustyGasAnalyticCertificate.regularityLayerClosedProof)

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse