------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                       L V C . P W M . T I M E R 1                        --
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
--    This package needs the LVC one and teh LVC.PWM one to be called, make --
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

package body LVC.PWM.TIMER1 is

-- Variable permettant de savoir si le timer à déjà été configuré
   Timer1_init : Boolean := False;

   -- Timer 1

   procedure init_Timer1 is
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
      Timer1_init := True;
   end init_Timer1;


   procedure Init_Port_PWM(numeroPort : Interfaces.Unsigned_8) is
   begin
      case numeroPort is
         when 9 => MCU.DDRB_Bits (1) := DD_Output; -- D9 en sortie
            if(Timer1_init = False) then
               init_Timer1;
            end if;
            MCU.TCCR1A_Bits(7) := True; -- Equivalent à mettre COM1A1 à 1
         when 10 => MCU.DDRB_Bits (2) := DD_Output; -- D10 en sortie
            if(Timer1_init = False) then
               init_Timer1;
            end if;
            MCU.TCCR1A_Bits(5) := True; -- Equivalent à mettre COM1B1 à 1
         when others => null;
      end case;
   end Init_Port_PWM;

   procedure Write_PWM(numeroPort : Interfaces.Unsigned_8; valeur_PWM : Interfaces.Unsigned_16) is
   begin
      case numeroPort is
         when 9 => MCU.OCR1A := valeur_PWM*2;
         when 10 => MCU.OCR1B := valeur_PWM*2;
         when others => null;
      end case;
   end Write_PWM;

end LVC.PWM.TIMER1;
