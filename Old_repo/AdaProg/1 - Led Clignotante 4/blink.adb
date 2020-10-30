-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;
with AVR.Real_Time.Delays;
with LVC.PINS;
with LVC.PINMODE;
with LVC.DIGITALWRITE;
with LVC.ANALOGWRITE;

use AVR;
use LVC.PINS;
use LVC.PINMODE;
use LVC.DIGITALWRITE;
use LVC.ANALOGWRITE;

-- Déclaration du programme
procedure Blink is
   -- Déclaration des variables
   -- Déclaration de la variable interne Led_On qui est un booléen
   Led_On : boolean := false;
   -- Déclaration de la variable LED_PIN comme étant constante de valeur 5
   
-- Début du programme
begin
   -- Déclaration du port PB5 comme étant une sortie 
   --D13_M := DD_Output;
   pinMode(D13,Output);
   pinMode(D3,Output);
   -- Boucle qui va s'éxecuter à l'infini
   loop
      -- On change la valeur du booléen à son opposé ie Faux devient vrai et inversement
      Led_On := not Led_On;
      -- On attribue au port PB5 la valeur du booléen
      digitalWrite(D13,Led_On);
      analogWrite(D3,1);
      -- On attend 1 seconde
      delay 1.0;
   end loop;
end Blink;

