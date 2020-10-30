-- Les packages LVC sont des packages que j'ai créé car je n'avais pas trouvé
-- d'équivalent. Je les ai testés mais cela n'exclue pas la présence de faute.
-- Ceux-ci peuvent-être réutilisé.
-- Pour plus d'informations sur http://lvcetada.e-monsite.com/ ou vous pouvez
-- me contacter sur lvcetada@gmail.com

--with AVR;
--with AVR.MCU;

with Interfaces;
use Interfaces;

package LVC.TIMER0 is

   -- Time in microsecond to handle the overflow
   MICROSECONDS_PER_TIMER0_OVERFLOW : constant := 1024;

   -- Time in millisecond to handle the overflow
   MILLIS_INC : constant := 1.024;

   -- Fractionnal number of milliseconds per timer0 overflow
   -- ((MICROSECONDS_PER_TIMER0_OVERFLOW % 1000) >> 3)
   FRACT_INC : constant := 3;

   -- Max Fractionnal
   -- (1000 >> 3) et inf à 255 OK :)
   FRACT_MAX : constant := 125;

   procedure Init;

   function millis return Unsigned_32;

   function micros return Unsigned_32;

   procedure wait (time : Unsigned_32);

private
   Timer0_overflow_count : Unsigned_32;
   Timer0_millis         : Unsigned_32;
   Timer0_fract          : Unsigned_8;

end LVC.TIMER0;
