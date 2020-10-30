-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;
with AVR.Real_Time.Delays;

use AVR;
-- Relay sur D11
-- LED sur D13

-- Déclaration du programme
procedure Relay is
   -- Déclaration des variables
   RelayValue : Boolean := False;
-- Début du programme
begin
   -- Déclaration du port PB3 et PB5 comme étant une sortie
   MCU.DDRB_Bits (3) := True;
   MCU.DDRB_Bits (5) := True;
   -- Boucle qui va s'éxecuter à l'infini
   loop
      -- On attribue au port PB3 et PB5 la valeur du booléen
      MCU.PORTB_Bits (3) := RelayValue;
      MCU.PORTB_Bits (5) := RelayValue;
      -- On attend 1 seconde
      delay 2.0;
      RelayValue := not RelayValue;
   end loop;
end Relay;

