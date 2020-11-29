-- Import et utilisation  des packages Ada nécessaires
with LIB_74HC595;
with AVR.Interrupts;
with LVC.BUTTONS;
with AVR;
with LVC.BUTTONS.INTERRUPTS;
with LVC.PINS;
with LVC.TIME;

use LIB_74HC595;
use AVR;
use LVC.BUTTONS;
use LVC.BUTTONS.INTERRUPTS;
use LVC.PINS;

procedure Main is

   -- Toilette command
   Toilette_Status_1    : Boolean := False;
   Entree_Status_2      : Boolean := False;
   Cuisine_Status_3     : Boolean := False;
   Salon_Status_4       : Boolean := False;
   Bureau_Status_5      : Boolean := False;
   SalleDeBain_Status_6 : Boolean := False;
   Chambre_Status_7     : Boolean := False;
begin
   LIB_74HC595.Init(A0, A1, A2);
   LVC.BUTTONS.INTERRUPTS.Init;
   LVC.TIME.Start_Timer;
   AVR.Interrupts.Enable;

   loop
      if (LVC.BUTTONS.Toilette) then
         Toilette_Status_1 := not Toilette_Status_1;
      end if;
      if (LVC.BUTTONS.Entree) then
         Entree_Status_2 := not Entree_Status_2;
      end if;
      if (LVC.BUTTONS.Cuisine) then
         Cuisine_Status_3 := not Cuisine_Status_3;
      end if;
      if (LVC.BUTTONS.Salon) then
         Salon_Status_4 := not Salon_Status_4;
      end if;
      if (LVC.BUTTONS.Bureau) then
         Bureau_Status_5 := not Bureau_Status_5;
      end if;
      if (LVC.BUTTONS.SalleDeBain) then
         SalleDeBain_Status_6 := not SalleDeBain_Status_6;
      end if;
      if (LVC.BUTTONS.Chambre) then
         Chambre_Status_7 := not Chambre_Status_7;
      end if;
      SetRegisterValue(1, Toilette_Status_1);
      SetRegisterValue(2, Entree_Status_2);
      SetRegisterValue(3, Cuisine_Status_3);
      SetRegisterValue(4, Salon_Status_4);
      SetRegisterValue(5, Bureau_Status_5);
      SetRegisterValue(6, SalleDeBain_Status_6);
      SetRegisterValue(7, Chambre_Status_7);
      WriteRegister;
   end loop;
end Main;

