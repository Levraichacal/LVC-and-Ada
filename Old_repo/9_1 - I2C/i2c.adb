with TWI;
with AVR.Real_Time.Delays;

use TWI;

package body I2C is


   procedure Run is
   begin

      loop

         delay 1.0;
      end loop;
   end Run;
end I2C;
