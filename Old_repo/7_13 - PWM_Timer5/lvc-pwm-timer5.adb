------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                       L V C . P W M . T I M E R 5                        --
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

package body LVC.PWM.TIMER5 is

-- Variable permettant de savoir si le timer à déjà été configuré
   Timer5_init : Boolean := False;

   procedure init_Timer5 is
   begin
      MCU.PRR1_Bits (MCU.PRTIM5_Bit) := False;
      MCU.TCCR5A_Bits := (MCU.WGM51_Bit  => True,
                          others => False);
      MCU.TCCR5B_Bits := (MCU.WGM52_Bit => True,
                      MCU.WGM53_Bit => True,
                      MCU.CS51_Bit => True,
                      others => False);
      MCU.ICR5 := 40000;
      Timer5_init := True;
   end init_Timer5;


   procedure Init_Port_PWM(numeroPort : Interfaces.Unsigned_8) is
   begin
      case numeroPort is
         when 44 => MCU.DDRL_Bits (3) := DD_Output; -- D44 en sortie
            if(Timer5_init = False) then
               init_Timer5;
            end if;
            MCU.TCCR5A_Bits(3) := True; -- Equivalent à mettre COM5C1 à 1
         when 45 => MCU.DDRL_Bits (4) := DD_Output; -- D45 en sortie
            if(Timer5_init = False) then
               init_Timer5;
            end if;
            MCU.TCCR5A_Bits(5) := True; -- Equivalent à mettre COM5B1 à 1
         when 46 => MCU.DDRL_Bits (5) := DD_Output; -- D46 en sortie
            if(Timer5_init = False) then
               init_Timer5;
            end if;
            MCU.TCCR5A_Bits(7) := True; -- Equivalent à mettre COM5A1 à 1
         when others => null;
      end case;
   end Init_Port_PWM;

   procedure Write_PWM(numeroPort : Interfaces.Unsigned_8; valeur_PWM : Interfaces.Unsigned_16) is
   begin
      case numeroPort is
         when 44 => MCU.OCR5C := valeur_PWM*2;
         when 45 => MCU.OCR5B := valeur_PWM*2;
         when 46 => MCU.OCR5A := valeur_PWM*2;
         when others => null;
      end case;
   end Write_PWM;

end LVC.PWM.TIMER5;
