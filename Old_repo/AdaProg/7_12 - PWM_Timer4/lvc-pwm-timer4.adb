------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                       L V C . P W M . T I M E R 4                        --
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

package body LVC.PWM.TIMER4 is

-- Variable permettant de savoir si le timer à déjà été configuré
   Timer4_init : Boolean := False;

   procedure init_Timer4 is
   begin
      MCU.PRR1_Bits (MCU.PRTIM4_Bit) := False;
      MCU.TCCR4A_Bits := (MCU.WGM41_Bit  => True,
                          others => False);
      MCU.TCCR4B_Bits := (MCU.WGM42_Bit => True,
                      MCU.WGM43_Bit => True,
                      MCU.CS41_Bit => True,
                      others => False);
      MCU.ICR4 := 40000;
      Timer4_init := True;
   end init_Timer4;


   procedure Init_Port_PWM(numeroPort : Interfaces.Unsigned_8) is
   begin
      case numeroPort is
         when 6 => MCU.DDRH_Bits (3) := DD_Output; -- D6 en sortie
            if(Timer4_init = False) then
               init_Timer4;
            end if;
            MCU.TCCR4A_Bits(7) := True; -- Equivalent à mettre COM4A1 à 1
         when 7 => MCU.DDRH_Bits (4) := DD_Output; -- D7 en sortie
            if(Timer4_init = False) then
               init_Timer4;
            end if;
            MCU.TCCR4A_Bits(5) := True; -- Equivalent à mettre COM4B1 à 1
         when 8 => MCU.DDRH_Bits (5) := DD_Output; -- D8 en sortie
            if(Timer4_init = False) then
               init_Timer4;
            end if;
            MCU.TCCR4A_Bits(3) := True; -- Equivalent à mettre COM4C1 à 1
         when others => null;
      end case;
   end Init_Port_PWM;

   procedure Write_PWM(numeroPort : Interfaces.Unsigned_8; valeur_PWM : Interfaces.Unsigned_16) is
   begin
      case numeroPort is
         when 6 => MCU.OCR4A := valeur_PWM*2;
         when 7 => MCU.OCR4B := valeur_PWM*2;
         when 8 => MCU.OCR4C := valeur_PWM*2;
         when others => null;
      end case;
   end Write_PWM;

end LVC.PWM.TIMER4;
