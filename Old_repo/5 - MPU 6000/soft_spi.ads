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

use Interfaces;

package Soft_SPI is
   procedure Init;
   procedure Send_Byte (Ch : Unsigned_8);
end Soft_SPI;
