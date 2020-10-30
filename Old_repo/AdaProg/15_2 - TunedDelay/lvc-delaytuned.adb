-- V1.0 -- Created by S.BARDOT 19/05/2015

with Interfaces;
use Interfaces;
with System.Machine_Code;
use System.Machine_Code;

package body LVC.DELAYTUNED is

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
   
end LVC.DELAYTUNED;
