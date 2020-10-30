-- Import et utilisation  des packages Ada nécessaires
with LIB_74HC595;
with AVR.Real_Time.Delays;
with LIB_AFFICHAGE;

use LIB_74HC595;
with LVC.PINS;
use LVC.PINS;
use LIB_AFFICHAGE;
-- Déclaration du programme

procedure Test_74hc595 is

   type T_Affichage is array (1..12) of T_74HC795;

   Affichage : T_Affichage;

   procedure Init_Affichage is
   begin
      Init(Affichage(12), D12, D11, D13);
      Init(Affichage(11), D12, D10, D13);
      Init(Affichage(10), D12, D9, D13);
      Init(Affichage(9), D12, D8, D13);
      Init(Affichage(8), D12, D7, D13);
      Init(Affichage(7), D12, D6, D13);
      Init(Affichage(6), D12, D5, D13);
      Init(Affichage(5), D12, D4, D13);
      Init(Affichage(4), D12, D3, D13);
      Init(Affichage(3), D12, D2, D13);
      Init(Affichage(2), D12, D1, D13);
      Init(Affichage(1), D12, D0, D13);
   end Init_Affichage;

   procedure Test_Affichage is
   begin
      for j in 1..12 loop
         ClearRegister(Affichage(j));
         WriteRegister(Affichage(j));
      end loop;
      delay 0.5;
      for j in 1..12 loop
         EmptyRegister(Affichage(j));
         WriteRegister(Affichage(j));
      end loop;
   end Test_Affichage;

   procedure Write_String (Text : String) is
      -- Create a new type for stock the text in 74HC595 register form
      type T_Text is array (1..(6*Text'Length)) of T_Register;
      Register_Text : T_Text;
      Temp : T_Letter;
   begin
      --  Convert the string for the ploting
      for i in Text'Range loop
         case Text(i) is
            when 'A' => Temp := B_A;
            when 'B' => Temp := B_B;
            when others => Temp := SPACE;
         end case;
         for j in 1..6 loop
            Register_Text(6*(i-1)+j) := Temp(j);
         end loop;
      end loop;
      for i in T_Text'Range loop
         for j in 1..12 loop
            --  We delete the previous screen
            -- ClearRegister(Affichage(j-i));
            -- WriteRegister(Affichage(j-i));
            --  We update the new screen
            WriteRegister(Affichage(j), Register_Text(i+j-1));
         end loop;
         delay 2.5;
      end loop;
   end Write_String;

begin
   Init_Affichage;
   delay 2.0;
   Test_Affichage;
   delay 2.0;
   loop
      Write_String("ABCABC");
      delay 2.0;
   end loop;
end Test_74hc595;

