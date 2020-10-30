------------------------------------------------------------------------------
--                                                                          --
--                                                                          --
--                         A n a l o g   E n t r y                          --
--                                                                          --
--                                M a i n                                   --
--                                                                          --
--    Copyright (C) 2017 Bardot Sébastien                                   --
--    More information on http://lvcetada.e-monsite.com/ or by mail on      --
--    lvcetada@gmail.com                                                    --
--                                                                          --
--    This program is free software: you can redistribute it and/or modify  --
--    it under the terms of the GNU General Public License as published by  --
--    the Free Software Foundation, either version 3 of the License, or     --
--    (at your option) any later version.                                   --
--                                                                          --
--    This program is distributed in the hope that it will be useful,       --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of        --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         --
--    GNU General Public License for more details.                          --
--                                                                          --
--    You should have received a copy of the GNU General Public License     --
--    along with this program.  If not, see <http://www.gnu.org/licenses/>. --
--                                                                          --
--                                                                          --
--    This package and its children are based on AVR-Ada Library.           --
--                                                                          --
--                                                                          --
------------------------------------------------------------------------------

with AVR;
with AVR.MCU;
with AVR.Real_Time.Delays;
with GPIO;
with Interfaces;

use AVR;
use AVR.MCU;
use GPIO;
use Interfaces;

procedure ServoPWM is
   Sens : Boolean;
   Valeur_PWM : Unsigned_16 :=1000;
begin
   -- Activation du timer;
   MCU.PRR_Bits (MCU.PRTIM1_Bit) := False;
   -- Configuration du timer 1 pour fonctionner en PWM
   MCU.TCCR1A_Bits := (MCU.WGM11_Bit  => True,
                       others => False);
   MCU.TCCR1B_Bits := (MCU.WGM12_Bit => True,
                       MCU.WGM13_Bit => True,
                       MCU.CS11_Bit => True,
                       others => False);
   -- Définition de la fréquence de fonctionnement
   MCU.ICR1 := 40000;  -- 50 Hz => 16000000/8/50 = 40000
   PinMode(D9,Output);
   PinMode(D10,Output);
   MCU.TCCR1A_Bits(MCU.COM1A1_Bit) := True; -- Equivalent à mettre COM1A1 à 1
   MCU.TCCR1A_Bits(MCU.COM1B1_Bit) := True; -- Equivalent à mettre COM1B1 à 1
   loop
      if(Valeur_PWM = 2100)then
         Sens := False;
      elsif(Valeur_PWM = 800) then
         Sens := True;
      end if;
      if (Sens) then
         Valeur_PWM := Valeur_PWM + 50;
      else
         Valeur_PWM := Valeur_PWM - 50;
      end if;
      MCU.OCR1A := Valeur_PWM*2;
      MCU.OCR1B := Valeur_PWM*2;
      delay 0.1;
   end loop;
end ServoPWM;
