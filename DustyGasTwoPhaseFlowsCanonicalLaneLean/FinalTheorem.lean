import DustyGasTwoPhaseFlowsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

def ConstrainedDustGasClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dust_gas_endgame (A : AdmissibleClass) :
    ConstrainedDustGasClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse