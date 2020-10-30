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

with Interfaces;
with AVR.Strings;

package LCD3310 is
   use Interfaces;

   X_Resolution : constant := 84;
   Y_Resolution : constant := 48;

   type X_Coords is new Unsigned_16 range 1 .. X_Resolution;
   type Y_Coords is new Unsigned_16 range 1 .. Y_Resolution;

   type Column_Index is new Unsigned_8 range 1 .. X_Resolution / 8;
   type Row_Index is new Unsigned_8 range 1 .. Y_Resolution / 8;

   procedure Init;
   procedure Update;
   procedure Clear;
   procedure Draw_Char (Ch : Character;
                        X_Pos : Column_Index;
                        Y_Pos : Row_Index);
   procedure Draw_Pixel (X_Pos : X_Coords; Y_Pos : Y_Coords);
   procedure Draw_Line (X1 : X_Coords; Y1 : Y_Coords;
                        X2 : X_Coords; Y2 : Y_Coords);

   procedure Put_Line (Str : AVR.Strings.AVR_String; Y_Pos : Row_Index);
end LCD3310;
