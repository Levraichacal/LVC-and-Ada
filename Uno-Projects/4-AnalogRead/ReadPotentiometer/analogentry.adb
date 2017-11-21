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
with AVR.UART;

use AVR;
use AVR.MCU;

procedure AnalogEntry is
begin
   -- Set the prescaler to 128 for a maximum resolution
   -- and activate the CAN
   ADCSRA_Bits := (ADEN_Bit => True,
                   ADPS0_Bit => True,
                   ADPS1_Bit => True,
                   ADPS2_Bit => True,
                   others => False);

   -- Set the Reference voltage to AVCC with external capacitor at AREF pin
   ADMUX_Bits := (REFS0_Bit => True,
                  others => False);

   -- Initialise the serial port
   AVR.UART.Init (103);

   loop
      -- Set the ADSC_Bit to true to initialise the conversion
      ADCSRA_Bits(ADSC_Bit) := True;
      -- Wait the conversion
      while(ADCSRA_Bits(ADSC_Bit)) loop
         null;
      end loop;
      -- Print the result and return to a new line
      AVR.UART.Put(ADC);
      AVR.UART.CRLF;
      delay 0.1;
   end loop;
end AnalogEntry;
