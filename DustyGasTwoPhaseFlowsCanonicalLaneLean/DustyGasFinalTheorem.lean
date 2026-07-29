import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyGasGateLemmas

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

def ConstrainedDustyGasClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dusty_gas_endgame (A : AdmissibleClass) :
    ConstrainedDustyGasClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse