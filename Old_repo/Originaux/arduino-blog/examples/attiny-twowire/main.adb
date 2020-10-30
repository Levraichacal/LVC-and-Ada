--
-- USI I2C package for AVR-Ada
--
-- Copyright (C) 2013  Tero Koskinen <tero.koskinen@iki.fi>
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
-- USA.
--
-- As a special exception, if other files instantiate generics from this
-- unit,  or  you  link  this  unit  with  other  files  to  produce  an
-- executable   this  unit  does  not  by  itself  cause  the  resulting
-- executable to  be  covered by the  GNU General  Public License.  This
-- exception does  not  however  invalidate  any  other reasons why  the
-- executable file might be covered by the GNU Public License.
--



with AVR;
with AVR.UART;
with AVR.Wait;
with AVR.MCU;
with AVR.Strings;
with AVR.Int_Img;
with AVR.Real_Time.Delays; -- for delay x.x
with Attiny_TWI;
with Attiny_TWI.Master;
with Interfaces;
use type AVR.Strings.AVR_String;


use AVR;
use Interfaces;

procedure Main is
   procedure Wait_10_000us is
       new AVR.Wait.Generic_Wait_USecs (Crystal_Hertz => 8_000_000,
                                        Micro_Seconds => 10_000);
   EEPROM_Address : constant := 16#50#;
   Buffer  : Attiny_TWI.Data_Buffer (1..1) := (1 => 16#FF#);
   Command : Attiny_TWI.Data_Buffer (1 .. 1) := (1 => 50);
   State : Boolean := False;

   I : AVR.Strings.AStr3;
begin
   -- Turning various leds (pins) on to show the current state of the program
   AVR.MCU.DDRB_Bits (3) := DD_Output;
   AVR.MCU.PortB_Bits (3) := True;

   AVR.UART.Init (51); -- 9600 @8MHz

   AVR.MCU.DDRD_Bits (4) := DD_Output;
   AVR.MCU.PortD_Bits (4) := True;

   Attiny_TWI.Master.Init;

   AVR.MCU.DDRD_Bits (3) := DD_Output;
   AVR.MCU.PortD_Bits (3) := True;

   AVR.UART.Put ("Init done"); UART.CRLF;

   Attiny_TWI.Master.Write_Data (EEPROM_Address, Command);
   AVR.MCU.DDRD_Bits (2) := DD_Output;
   AVR.MCU.PortD_Bits (2) := True;
   UART.Put("Write data done"); UART.CRLF;
   Attiny_TWI.Master.Request_Data(EEPROM_Address, Buffer);
   -- Attiny_TWI.Master.Write_Data(EEPROM_Address, Buffer);
   UART.Put("Request data done"); UART.CRLF;

   I (1..3) := "   ";
   AVR.Int_Img.U8_HEX_Img (Data => Buffer (1),
                           Target => I (1..2));
   AVR.UART.Put("Got: ");
   AVR.UART.Put(I (1..2));
   AVR.UART.CRLF;

   AVR.MCU.PortB_Bits (3) := False;

   -- Enter a loop where we simply blink the led
   -- This way we know that we have finished the program.
   loop
      Wait_10_000us;
      AVR.MCU.PortB_Bits (5) := State;
      State := not State;
      -- AVR.UART.Put ("XXX"); UART.CRLF;
   end loop;
end Main;
