-- Import et utilisation  des packages Ada nécessaires
with LIB_74HC595;
with AVR.Real_Time.Delays;

use LIB_74HC595;
with LVC.PINS;
use LVC.PINS;

-- Déclaration du programme

procedure Test_74hc595 is
   Chip1 : T_74HC795;
   Chip2 : T_74HC795;
   temp1 : T_Register := (True, False, False, True, False, True, False, True);
   temp2 : T_Register := (True, True, False, True, False, True, False, True);
begin
   Init(Chip1, D8, D9, D10);
   Init(Chip2, D8, D11, D10);
   loop
      ClearRegister(Chip1);
      WriteRegister(Chip1);
      ClearRegister(Chip2);
      WriteRegister(Chip2);
      delay 2.5;
      ClearRegister(Chip1);
      WriteRegister(Chip1, temp1);
      ClearRegister(Chip2);
      WriteRegister(Chip2, temp2);
      delay 2.5;
      ClearRegister(Chip1);
      WriteRegister(Chip1);
      EmptyRegister(Chip2);
      WriteRegister(Chip2);
      delay 2.5;
      EmptyRegister(Chip1);
      WriteRegister(Chip1);
      ClearRegister(Chip2);
      WriteRegister(Chip2);
      delay 2.5;
      for i in T_Register'Range loop
         SetRegisterValue(Chip1,i,False);
         WriteRegister(Chip1);
         SetRegisterValue(Chip2,i,True);
         WriteRegister(Chip2);
         delay 2.5;
      end loop;
   end loop;
end Test_74hc595;

