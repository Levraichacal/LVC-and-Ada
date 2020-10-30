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
            when 'C' => Temp := B_C;
            when 'D' => Temp := B_D;
            when 'E' => Temp := B_E;
            when 'F' => Temp := B_F;
            when 'G' => Temp := B_G;
            when 'H' => Temp := B_H;
            when 'I' => Temp := B_I;
            when 'J' => Temp := B_J;
            when 'K' => Temp := B_K;
            when 'L' => Temp := B_L;
            when 'M' => Temp := B_M;
            when 'N' => Temp := B_N;
            when 'O' => Temp := B_O;
            when 'P' => Temp := B_P;
            when 'Q' => Temp := B_Q;
            when 'R' => Temp := B_R;
            when 'S' => Temp := B_S;
            when 'T' => Temp := B_T;
            when 'U' => Temp := B_U;
            when 'V' => Temp := B_V;
            when 'W' => Temp := B_W;
            when 'X' => Temp := B_X;
            when 'Y' => Temp := B_Y;
            when 'Z' => Temp := B_Z;
            when ' ' => Temp := SPACE;
            when '0' => Temp := B_0;
            when '1' => Temp := B_1;
            when '2' => Temp := B_2;
            when '3' => Temp := B_3;
            when '4' => Temp := B_4;
            when '5' => Temp := B_5;
            when '6' => Temp := B_6;
            when '7' => Temp := B_7;
            when '8' => Temp := B_8;
            when '9' => Temp := B_9;
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
      -- Write_String("ABCDEF");
      -- Write_String("GHIJKL");
      -- Write_String("MNOPQR");
      -- Write_String("STUVWX");
      -- Write_String(" YZ");
      -- Write_String("000");
      -- Write_String("111");
      -- Write_String("222");
      -- Write_String("333");
      -- Write_String("444");
      -- Write_String("555");
      -- Write_String("666");
      -- Write_String("777");
      -- Write_String("888");
      Write_String("999");
      delay 2.0;
   end loop;
end Test_74hc595;

