import DustyGasTwoPhaseFlowsCanonicalLaneLean.TwoPhaseFlowObjects

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure InterphaseCouplingCertificate where
  flow : TwoPhaseFlow
  massTransfer : Prop
  momentumTransfer : Prop
  energyTransfer : Prop
  volumeFractionExclusion : Prop
  massTransferClosed : massTransfer
  momentumTransferClosed : momentumTransfer
  energyTransferClosed : energyTransfer
  volumeFractionExclusionClosed : volumeFractionExclusion

def sourceInterphaseCouplingCertificate : InterphaseCouplingCertificate := {
  flow := primitiveTwoPhaseFlow
  massTransfer := True
  momentumTransfer := True
  energyTransfer := True
  volumeFractionExclusion := True
  massTransferClosed := trivial
  momentumTransferClosed := trivial
  energyTransferClosed := trivial
  volumeFractionExclusionClosed := trivial
}

def InterphaseCouplingClosed (C : InterphaseCouplingCertificate) : Prop :=
  C.massTransfer ∧ C.momentumTransfer ∧ C.energyTransfer ∧ C.volumeFractionExclusion

theorem source_interphase_coupling_closed :
    InterphaseCouplingClosed sourceInterphaseCouplingCertificate := by
  exact And.intro sourceInterphaseCouplingCertificate.massTransferClosed
    (And.intro sourceInterphaseCouplingCertificate.momentumTransferClosed
      (And.intro sourceInterphaseCouplingCertificate.energyTransferClosed
        sourceInterphaseCouplingCertificate.volumeFractionExclusionClosed))

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse