------------------------------------------------------------------------------
--                                                                          --
--                            L V C COMPONENTS                              --
--                                                                          --
--                             L V C . P I N S                              --
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
------------------------------------------------------------------------------
with AVR;
with AVR.MCU;
use AVR;

package body LVC.PINS is

   procedure pinMode (port: lvcPins; mode : lvcMode) is
   begin
      case port is
         when D0 => MCU.DDRD_Bits (0) := mode;
         when D1 => MCU.DDRD_Bits (1) := mode;
         when D2 => MCU.DDRD_Bits (2) := mode;
         when D3 => MCU.DDRD_Bits (3) := mode;
         when D4 => MCU.DDRD_Bits (4) := mode;
         when D5 => MCU.DDRD_Bits (5) := mode;
         when D6 => MCU.DDRD_Bits (6) := mode;
         when D7 => MCU.DDRD_Bits (7) := mode;
         when D8 => MCU.DDRB_Bits (0) := mode;
         when D9 => MCU.DDRB_Bits (1) := mode;
         when D10 => MCU.DDRB_Bits (2) := mode;
         when D11 => MCU.DDRB_Bits (3) := mode;
         when D12 => MCU.DDRB_Bits (4) := mode;
         when D13 => MCU.DDRB_Bits (5) := mode;
         when A0 => MCU.DDRC_Bits (0) := mode;
         when A1 => MCU.DDRC_Bits (1) := mode;
         when A2 => MCU.DDRC_Bits (2) := mode;
         when A3 => MCU.DDRC_Bits (3) := mode;
         when A4 => MCU.DDRC_Bits (4) := mode;
         when A5 => MCU.DDRC_Bits (5) := mode;
         when others => null;
      end case;
   end pinMode;


   procedure digitalWrite(port : lvcPins; level : lvcLevel) is
   begin
      case port is
         when D0 => MCU.PORTD_Bits (0) := level;
         when D1 => MCU.PORTD_Bits (1) := level;
         when D2 => MCU.PORTD_Bits (2) := level;
         when D3 => MCU.PORTD_Bits (3) := level;
         when D4 => MCU.PORTD_Bits (4) := level;
         when D5 => MCU.PORTD_Bits (5) := level;
         when D6 => MCU.PORTD_Bits (6) := level;
         when D7 => MCU.PORTD_Bits (7) := level;
         when D8 => MCU.PORTB_Bits (0) := level;
         when D9 => MCU.PORTB_Bits (1) := level;
         when D10 => MCU.PORTB_Bits (2) := level;
         when D11 => MCU.PORTB_Bits (3) := level;
         when D12 => MCU.PORTB_Bits (4) := level;
         when D13 => MCU.PORTB_Bits (5) := level;
         when A0 => MCU.PORTC_Bits (0) := level;
         when A1 => MCU.PORTC_Bits (1) := level;
         when A2 => MCU.PORTC_Bits (2) := level;
         when A3 => MCU.PORTC_Bits (3) := level;
         when A4 => MCU.PORTC_Bits (4) := level;
         when A5 => MCU.PORTC_Bits (5) := level;
         when others => null;
      end case;
   end digitalWrite;

end LVC.PINS;

