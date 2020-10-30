-- Import et utilisation  des packages Ada nécessaires
with LIB_74HC595;
with AVR.Real_Time.Delays;

use LIB_74HC595;
with LVC.PINS;
use LVC.PINS;

-- Déclaration du programme

procedure Test_74hc595 is

   type T_Lettre is array (1..6) of T_Register;

   type T_Chips is array (1..6) of T_74HC795;

   Chip_L1 : T_Chips;
   Chip_L2 : T_Chips;
   Lettre_1 : T_Lettre := ((True, True, True, True, True, True, True, True),
                           (True, True, True, True, True, True, True, False),
                           (True, True, True, True, True, True, False, False),
                           (True, True, True, True, True, False, False, False),
                           (True, True, False, True, False, False, False, False),
                           (False, False, False, False, False, False, False, False));
   Lettre_2 : T_Lettre := ((True, True, True, True, True, True, True, True),
                           (True, False, False, True, False, False, False, False),
                           (True, False, False, True, False, False, False, False),
                           (True, False, False, True, False, False, False, False),
                           (True, True, False, True, False, True, False, True),
                           (False, False, False, False, False, False, False, False));
begin
   Init(Chip_L1(1), D12, D11, D13);
   Init(Chip_L1(2), D12, D10, D13);
   Init(Chip_L1(3), D12, D9, D13);
   Init(Chip_L1(4), D12, D8, D13);
   Init(Chip_L1(5), D12, D7, D13);
   Init(Chip_L1(6), D12, D6, D13);
   Init(Chip_L2(1), D12, D5, D13);
   Init(Chip_L2(2), D12, D4, D13);
   Init(Chip_L2(3), D12, D3, D13);
   Init(Chip_L2(4), D12, D2, D13);
   Init(Chip_L2(5), D12, D1, D13);
   Init(Chip_L2(6), D12, D0, D13);
   loop
      for i in T_Chips'Range loop
         ClearRegister(Chip_L1(i));
         WriteRegister(Chip_L1(i));
         ClearRegister(Chip_L2(i));
         WriteRegister(Chip_L2(i));
      end loop;
      delay 0.25;
      for i in T_Chips'Range loop
         ClearRegister(Chip_L1(i));
         WriteRegister(Chip_L1(i));
         EmptyRegister(Chip_L2(i));
         WriteRegister(Chip_L2(i));
      end loop;
      delay 0.25;
      for i in T_Chips'Range loop
         ClearRegister(Chip_L1(i));
         WriteRegister(Chip_L1(i),Lettre_1(i));
         ClearRegister(Chip_L2(i));
         WriteRegister(Chip_L2(i),Lettre_2(i));
      end loop;
      delay 0.25;
      for i in T_Chips'Range loop
         EmptyRegister(Chip_L1(i));
         WriteRegister(Chip_L1(i));
         ClearRegister(Chip_L2(i));
         WriteRegister(Chip_L2(i));
      end loop;
      delay 0.25;
      for i in T_Chips'Range loop
         for j in T_Register'Range loop
            SetRegisterValue(Chip_L1(i),j,False);
            WriteRegister(Chip_L1(i));
            SetRegisterValue(Chip_L2(i),j,True);
            WriteRegister(Chip_L2(i));
            delay 0.25;
         end loop;
      end loop;
      delay 0.25;
      for i in T_Chips'Range loop
         for j in T_Register'Range loop
            SetRegisterValue(Chip_L1(i),j,True);
            WriteRegister(Chip_L1(i));
            SetRegisterValue(Chip_L2(i),j,False);
            WriteRegister(Chip_L2(i));
            delay 0.25;
         end loop;
      end loop;
   end loop;
end Test_74hc595;

