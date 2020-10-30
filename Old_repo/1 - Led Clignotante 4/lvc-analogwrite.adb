with AVR;
with AVR.MCU;
with LVC.PINS;
with LVC.PINMODE;
with LVC.DIGITALWRITE;
with Interfaces;

use AVR;
use AVR.MCU;
use LVC.PINS;
use LVC.PINMODE;
use LVC.DIGITALWRITE;
use Interfaces;
-- Corps du package de la fonction analogwrite
-- Chercher les timers pour les sorties.

package body LVC.ANALOGWRITE is

procedure analogWrite(nomPort : lvcPins; niveauSortie : Unsigned_8)
is
begin

   --pinMode(nomPort,Output);
   if (niveauSortie = 0) then
    --digitalWrite(nomPort,false);
    null;
   else
    if (niveauSortie = 255) then
     -- digitalWrite(nomPort,true);
     null;
    else
  --MCU.PRTIM0_Bit := 0;
    case nomPort is
     -- Le port D3 de l'Arduino correspond aussi à la sortie OC2B
     when D3 => sbi(TCCR2A, COM2B1);--TCCR2B_Bits := (COM2B1_Bit => true);
		OCR2B := niveauSortie;
                --digitalWrite(D3,true);
                 return;
     --           OCR2B := niveauSortie;
     -- Le port D5 de l'Arduino correspond aussi à la sortie OC0B
     --when D5 => TCCR0B_Bits := (COM0B1_Bit => true); OCR0B := niveauSortie;
      -- Le port D6 de l'Arduino correspond aussi à la sortie OC0A
     --when D6 => TCCR0A_Bits := (COM0A1_Bit => true); OCR0A := niveauSortie;
      -- Le port D9 de l'Arduino correspond aussi à la sortie OC1A
     --when D9 => TCCR1A_Bits := (COM1A1_Bit => true); OCR1A := niveauSortie;
      -- Le port D10 de l'Arduino correspond aussi à la sortie OC1B
     --when D10 => TCCR1B_Bits := (COM1B1_Bit => true); OCR1B := niveauSortie;
      -- Le port D11 de l'Arduino correspond aussi à la sortie OC2A
     --when D11 => TCCR2A_Bits := (COM2A1_Bit => true); OCR2A := niveauSortie;
     when others => null;
      --if (niveauSortie < 127) then null;
        --digitalWrite(nomPort,false);
       --else null;
        --digitalWrite(nomPort,true);
      --end if;
    end case;
   end if;
 end if;
end analogWrite;

end LVC.ANALOGWRITE;
