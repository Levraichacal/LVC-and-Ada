-- V1.0 -- Created by S.BARDOT 19/05/2015


with LVC.PINS;
use LVC.PINS;
with Interfaces;
use Interfaces;
with LVC.DELAYTUNED;
use LVC.DELAYTUNED;

package body Tuneddelay is

   procedure init_Port is
   begin
      pinMode(D13, Output); -- LEDSTATUS
      digitalWrite(D13,Low_lvl);
   end init_Port;
-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      init_Port;
      loop
         digitalWrite(D13,Low_lvl);
         LVC.DELAYTUNED.TunedDelay(1);
         digitalWrite(D13,High_lvl);
         LVC.DELAYTUNED.TunedDelay(1);
      end loop;
   end Run;
end Tuneddelay;
