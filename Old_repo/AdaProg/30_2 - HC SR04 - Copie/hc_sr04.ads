-- Trigger on D9;
-- Echo on D8
with Interfaces;
use Interfaces;

package HC_SR04 is

   procedure Init_HC_SR04;

   function GetTime return Unsigned_16;

end HC_SR04;
