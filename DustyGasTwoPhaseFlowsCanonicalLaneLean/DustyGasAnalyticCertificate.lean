import DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyGasPDESubstrate

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure DustyGasAnalyticCertificate where
  substrate : DustyGasPDESubstrate
  operatorsClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceDustyGasAnalyticCertificate : DustyGasAnalyticCertificate := {
  substrate := dustyGasPDESubstrate
  operatorsClosed := DustyGasEquationClosed primitiveFlow
  canonicalCarriageImported := True
  operatorsClosedProof := primitive_flow_equation_closed_checked
  canonicalCarriageImportedProof := trivial
}

def DustyGasAnalyticCertificateClosed (C : DustyGasAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧ C.canonicalCarriageImported

theorem source_dusty_gas_analytic_certificate_closed :
    DustyGasAnalyticCertificateClosed sourceDustyGasAnalyticCertificate := by
  exact And.intro sourceDustyGasAnalyticCertificate.operatorsClosedProof
    sourceDustyGasAnalyticCertificate.canonicalCarriageImportedProof

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse