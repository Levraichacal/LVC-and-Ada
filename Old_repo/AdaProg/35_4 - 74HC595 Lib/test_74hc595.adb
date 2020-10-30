-- Import et utilisation  des packages Ada nécessaires
with LIB_74HC595;
with AVR.Real_Time.Delays;

use LIB_74HC595;

-- Déclaration du programme

procedure Test_74hc595 is
   temp : T_Register := (True, True, False, True, False, True, False, True);
begin
   Init;
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
end Test_74hc595;

