-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;
with AVR.Real_Time.Delays;
with LVC.PIN;
with LVC.DIGITALWRITE;

use AVR;
use LVC.PIN;
use LVC.DIGITALWRITE;
-- Déclaration du programme
procedure Blink is
   -- Déclaration des variables
   -- Déclaration de la variable interne Led_On qui est un booléen
   Led_On : Boolean := False;
   PinOut : LVC_pins := D13;
-- Début du programme
begin
   -- Déclaration du port D13 comme étant une sortie
   MCU.DDRB_Bits (5) := DD_Output;
   -- Boucle qui va s'éxecuter à l'infini
   loop
      -- On change la valeur du booléen à son opposé ie Faux devient vrai et inversement
      Led_On := not Led_On;
      -- On attribue au port D13 la valeur du booléen
      DigitalWrite(PinOut,Led_On);
      -- On attend 1 seconde
      delay 1.0;
   end loop;
end Blink;
