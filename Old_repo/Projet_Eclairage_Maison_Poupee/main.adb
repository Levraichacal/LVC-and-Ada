-- Import et utilisation  des packages Ada nécessaires
with LIB_74HC595;
with Interfaces;
with AVR.Interrupts;
with AVR.MCU;

with AVR;

use LIB_74HC595;
use Interfaces;
use AVR;
use AVR.MCU;


procedure Main is
   temp : T_Register := (True, True, False, True, False, True, False, True);
   deltaT : constant Unsigned_32 := 500;

   -- Toilette command
   toilette_change : Boolean := False;
   toilette_previous_changing_time : Unsigned_32 := 0;

begin
   Init;
   MCU.PCIFR_Bits (MCU.PCIF0_Bit) := False;
   MCU.PCICR_Bits (MCU.PCIE0_Bit) := True;
   MCU.PCMSK0_Bits (MCU.PCINT0_Bit) := True;
   MCU.SREG_Bits(MCU.I_Bit) := True;
   AVR.Interrupts.Enable;

   loop
      ClearRegister;
      WriteRegister;
      delay 2.5;
      ClearRegister;
      WriteRegister(temp);
      delay 2.5;
      ClearRegister;
      WriteRegister;
      delay 2.5;
      EmptyRegister;
      WriteRegister;
      delay 2.5;
      for i in T_Register'Range loop
         SetRegisterValue(i,False);
         WriteRegister;
         delay 2.5;
      end loop;
   end loop;
end Main;

