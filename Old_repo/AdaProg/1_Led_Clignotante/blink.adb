-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;
with AVR.Real_Time.Delays;

use AVR;
-- Déclaration du programme
procedure Blink is
   -- Déclaration des variables
   -- Déclaration de la variable interne Led_On qui est un booléen
   Led_On : Boolean := False;
   -- Déclaration de la variable LED_PIN comme étant constante de valeur 5
   LED_PIN : constant := 5;
-- Début du programme
begin
   -- Déclaration du port PB5 comme étant une sortie 
   MCU.DDRB_Bits (LED_PIN) := DD_Output;
   -- Boucle qui va s'éxecuter à l'infini
   loop
      -- On change la valeur du booléen à son opposé ie Faux devient vrai et inversement
      Led_On := not Led_On;
      -- On attribue au port PB5 la valeur du booléen
      MCU.PORTB_Bits (LED_PIN) := Led_On;
      -- On attend 1 seconde
      delay 1.0;
   end loop;
end Blink;
