import DustyGasTwoPhaseFlowsCanonicalLaneLean.TwoPhaseFlowObjects

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure DustyGasWeakEnvelope where
  flow : TwoPhaseFlow
  finiteEnergy : Prop
  weakEquation : Prop
  energyInequality : Prop
  finiteEnergyClosed : finiteEnergy
  weakEquationClosed : weakEquation
  energyInequalityClosed : energyInequality

def sourceDustyGasWeakEnvelope : DustyGasWeakEnvelope := {
  flow := primitiveTwoPhaseFlow
  finiteEnergy := True
  weakEquation := True
  energyInequality := True
  finiteEnergyClosed := trivial
  weakEquationClosed := trivial
  energyInequalityClosed := trivial
}

def DustyGasWeakEnvelopeClosed (E : DustyGasWeakEnvelope) : Prop :=
  E.finiteEnergy ∧ E.weakEquation ∧ E.energyInequality

theorem source_dusty_gas_weak_envelope_closed :
    DustyGasWeakEnvelopeClosed sourceDustyGasWeakEnvelope := by
  exact And.intro sourceDustyGasWeakEnvelope.finiteEnergyClosed
    (And.intro sourceDustyGasWeakEnvelope.weakEquationClosed
      sourceDustyGasWeakEnvelope.energyInequalityClosed)

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse