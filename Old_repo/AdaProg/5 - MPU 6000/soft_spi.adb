--
--  MOD-LCD3310 Code for AVR-Ada
--  Copyright (C) 2005 OLIMEX  LTD.
--  Copyright (C) 2013  Tero Koskinen <tero.koskinen@iki.fi>
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
--
--
-- Ada code converted from Olimex example.
-- See
-- https://github.com/OLIMEX/OLINUXINO/tree/master/SOFTWARE/iMX233/MOD-LCD3310
-- for the original code.

with AVR;
with AVR.Config;
with AVR.Wait;
with AVR.MCU;

package body Soft_SPI is
   use AVR;
   MOSI_Pin : Boolean renames AVR.MCU.PORTB_Bits (2); -- uext pin 8 (D51)
   CLK_Pin  : Boolean renames AVR.MCU.PORTB_Bits (1); -- uext pin 9 (D52)
   MOSI_DD : Boolean renames AVR.MCU.DDRB_Bits (2);
   CLK_DD  : Boolean renames AVR.MCU.DDRB_Bits (1);

   procedure Wait_1us is
     new AVR.Wait.Generic_Wait_Usecs
       (Crystal_Hertz => AVR.Config.Clock_Frequency,
        Micro_Seconds => 1);
   pragma Inline_Always (Wait_1us);

   procedure Init is
      use AVR;
   begin
      MOSI_DD := DD_Output;
      CLK_DD  := DD_Output;

      MOSI_Pin := High;
      CLK_Pin  := High;
   end Init;

   procedure Send_Byte (Ch : Unsigned_8) is
      Data : Unsigned_8 := Ch;
   begin
      for I in Unsigned_8 range 1 .. 8 loop
         if (Data and 16#80#) = 16#80# then
            MOSI_Pin := High;
         else
            MOSI_Pin := Low;
         end if;

         Wait_1us;
         CLK_Pin := Low;
         Wait_1us;
         CLK_Pin := High;

         Data := Data * 2;
      end loop;
   end Send_Byte;

end Soft_SPI;
