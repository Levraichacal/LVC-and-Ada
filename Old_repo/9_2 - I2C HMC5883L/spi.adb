with LVC.COM.SPI;
with AVR.Real_Time.Delays;

use LVC.COM.SPI;

package body Spi is


   procedure Run is
   begin
      LVC.COM.SPI.Init_SPI(True,True);
      loop
         LVC.COM.SPI.Transfert_SPI(16#0C#);
         delay 1.0;
      end loop;
   end Run;
end Spi;
