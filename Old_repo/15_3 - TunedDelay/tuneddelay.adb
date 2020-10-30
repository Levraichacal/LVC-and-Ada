-- V1.0 -- Created by S.BARDOT 19/05/2015


with LVC.PINS;
use LVC.PINS;
with Interfaces;
use Interfaces;
with System.Machine_Code;
use System.Machine_Code;

package body Tuneddelay is

   procedure init_Port is
   begin
      pinMode(D13, Output); -- LEDSTATUS
      digitalWrite(D13,Low_lvl);
   end init_Port;

   procedure TunedDelay (temps : Unsigned_16) is
      temp : Unsigned_16;
      use ASCII;
   begin
      Asm ("1: sbiw %0, 0x01" & LF & HT &
--           "\n\t" & LF & HT &
           "brne 1b",
           Outputs => (Unsigned_16'Asm_Output("=w",temp)),
           Inputs => (Unsigned_16'Asm_Input("0",temps)),
           Volatile => True);
--      Asm("nop");
   end TunedDelay;
-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      init_Port;
      loop
         digitalWrite(D13,Low_lvl);
         TunedDelay(65535);
         digitalWrite(D13,High_lvl);
         TunedDelay(65535);
      end loop;
   end Run;
end Tuneddelay ;
