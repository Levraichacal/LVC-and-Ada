-- Trigger on D12;
-- Echo on D13
-- Servo on D9
with Interfaces;
use Interfaces;

package HC_SR04 is

   procedure Init_HC_SR04;

   procedure GetDistance;

   procedure Set_Servo9(valeur_PWM : Interfaces.Unsigned_16);

end HC_SR04;
