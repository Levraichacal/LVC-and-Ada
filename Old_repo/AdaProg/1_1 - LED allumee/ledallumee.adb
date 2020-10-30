------------------------------------------------------------------------------
--                                                                          --
--           Programme allumant la LED 13 de la carte arduino               --
--                                                                          --
------------------------------------------------------------------------------

-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;

use AVR;


procedure LEDallumee is
begin
   -- Déclaration du port PB5 comme étant une sortie
   MCU.DDRB_Bits (5) := True;
   -- On attribue au port PB5 la valeur haute pour allumer la LED
   MCU.PORTB_Bits (5) := True;
end LEDallumee;
