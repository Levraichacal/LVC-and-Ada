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

with AVR.Real_Time.Delays;
with AVR.UART;
with LCD3310;

procedure Main is
begin

   AVR.UART.Init (103);
   AVR.UART.Put ("Start"); AVR.UART.CRLF;
   LCD3310.Init;
   LCD3310.Clear;

   delay 1.0;
   if True then
      LCD3310.Draw_Char ('X', 1, 1);
      LCD3310.Draw_Char ('X', 1, 6);
      LCD3310.Draw_Char ('X', 10, 1);
      LCD3310.Draw_Char ('X', 10, 6);


      LCD3310.Draw_Char ('Z', 2, 1);
      LCD3310.Draw_Char ('A', 3, 1);
      LCD3310.Draw_Char ('b', 3, 2);
      LCD3310.Draw_Char ('C', 3, 3);
      LCD3310.Draw_Char ('1', 1, 4);
      LCD3310.Draw_Char ('2', 1, 5);
      LCD3310.Update;
      AVR.UART.Put ("1"); AVR.UART.CRLF;
      delay 1.0;
   end if;
   AVR.UART.Put ("2 RAW STARTS"); AVR.UART.CRLF;


   AVR.UART.Put ("5"); AVR.UART.CRLF;

   for A in LCD3310.X_Coords range 1 .. 82 loop
      LCD3310.Draw_Pixel (A,1);
      LCD3310.Draw_Pixel (A,46);
      LCD3310.Draw_Pixel (A,47);
   end loop;
   LCD3310.Draw_Pixel (83,45);
   LCD3310.Draw_Pixel (84,45);

   LCD3310.Draw_Pixel (10,10);
   LCD3310.Draw_Pixel (10,11);
   LCD3310.Draw_Pixel (10,12);
   LCD3310.Draw_Pixel (10,13);

   LCD3310.Draw_Pixel (20,20);
   LCD3310.Draw_Pixel (21,20);
   LCD3310.Draw_Pixel (22,20);

   LCD3310.Draw_Line (10, 10, 80, 40);
   LCD3310.Draw_Line (1, 6, 84, 6);
   LCD3310.Draw_Line (2, 6, 2, 40);
   LCD3310.Update;
   loop
      delay 1.0;
   end loop;
end Main;
