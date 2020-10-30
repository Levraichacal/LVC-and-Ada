------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                       L V C . P W M . T I M E R 3                        --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--    Copyright (C) 2015 Bardot Sébastien                                   --
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
--    This package needs the LVC one and the LVC.PWM one to be called, make --
--    sure they are in the project folder.                                  --
--    This package and its children are based on AVR-Ada Library.           --
--                                                                          --
--                                                                          --
------------------------------------------------------------------------------


with AVR;
with AVR.MCU;
with Interfaces;

use AVR;
use Interfaces;

package body LVC.PWM.TIMER3 is

-- Variable permettant de savoir si le timer à déjà été configuré
   Timer3_init : Boolean := False;

   procedure init_Timer3 is
   begin
   -- Activation du timer
      MCU.PRR1_Bits (MCU.PRTIM3_Bit) := False;
   -- Configuration du timer 1 pour fonctionner en PWM
      MCU.TCCR3A_Bits := (MCU.WGM31_Bit  => True,
                          others => False);
      MCU.TCCR3B_Bits := (MCU.WGM32_Bit => True,
                      MCU.WGM33_Bit => True,
                      MCU.CS31_Bit => True,
                      others => False);

      MCU.ICR3 := 40000;
      Timer3_init := True;
   end init_Timer3;


   procedure Init_Port_PWM(numeroPort : Interfaces.Unsigned_8) is
   begin
      case numeroPort is
         when 2 => MCU.DDRE_Bits (4) := DD_Output; -- D2 en sortie
            if(Timer3_init = False) then
               init_Timer3;
            end if;
            MCU.TCCR3A_Bits(5) := True; -- Equivalent à mettre COM3B1 à 1
         when 3 => MCU.DDRE_Bits (5) := DD_Output; -- D3 en sortie
            if(Timer3_init = False) then
               init_Timer3;
            end if;
            MCU.TCCR3A_Bits(3) := True; -- Equivalent à mettre COM3C1 à 1
         when 5 => MCU.DDRE_Bits (3) := DD_Output; -- D5 en sortie
            if(Timer3_init = False) then
               init_Timer3;
            end if;
            MCU.TCCR3A_Bits(7) := True; -- Equivalent à mettre COM3A1 à 1
         when others => null;
      end case;
   end Init_Port_PWM;

   procedure Write_PWM(numeroPort : Interfaces.Unsigned_8; valeur_PWM : Interfaces.Unsigned_16) is
   begin
      case numeroPort is
         when 2 => MCU.OCR3B := valeur_PWM*2;
         when 3 => MCU.OCR3C := valeur_PWM*2;
         when 5 => MCU.OCR3A := valeur_PWM*2;
         when others => null;
      end case;
   end Write_PWM;

end LVC.PWM.TIMER3;
