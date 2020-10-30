-- V1.0 -- Created by S.BARDOT 12/05/2015
-- V1.1 -- 15/05/2015 : Modify the PWM min and max value, don't change the value if out of range, keep the previous one.

with Interfaces;
use Interfaces;
with System.Machine_Code;
use System.Machine_Code;
with AVR.MCU;
use AVR.MCU;

procedure Main is

   procedure TunedDelay (temps : Unsigned_16) is
      temp : Unsigned_16;
      use ASCII;
   begin
      Asm ("1: sbiw %0, 0x01" & LF & HT &
           "brne 1b",
           Outputs => (Unsigned_16'Asm_Output("=w",temp)),
           Inputs => (Unsigned_16'Asm_Input("0",temps)),
           Volatile => True);
   end TunedDelay;
begin
   DDRB_Bits(5) := True;
   loop
      PORTB_Bits(5) := True;
      TunedDelay(1);
      PORTB_Bits(5) := False;
      TunedDelay(1);
   end loop;
end Main;
