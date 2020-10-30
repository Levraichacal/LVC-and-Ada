------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                          L V C . C O M . S P I                           --
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
--    This package needs the LVC one and the LVC.COM one to be called, make --
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

package body LVC.COM.SPI is

-- Initialisation of the SPI port
   SPI_Init : Boolean := False;
   MOSI_Pin : Boolean renames AVR.MCU.PORTB_Bits (2);
   SCK_Pin : Boolean renames AVR.MCU.PORTB_Bits (1);
   MISO_Pin : Boolean renames AVR.MCU.PORTB_Bits (3);
   SS_Pin : Boolean renames AVR.MCU.PORTB_Bits (0);
   MOSI_DD : Boolean renames AVR.MCU.DDRB_Bits (2);
   SCK_DD : Boolean renames AVR.MCU.DDRB_Bits (1);
   MISO_DD : Boolean renames AVR.MCU.DDRB_Bits (3);
   SS_DD : Boolean renames AVR.MCU.DDRB_Bits (0);

   procedure Init_SPI(CPOL: Boolean ; CPHA : Boolean) is
   begin
      MOSI_DD := DD_Output;
      SCK_DD := DD_Output;
      MISO_DD := DD_Input;
      SS_DD := DD_Output;
      MOSI_Pin := Low;
      SCK_Pin := Low;
      SS_Pin := High;
      MCU.SPCR_Bits := (MCU.SPE_Bit => True,
                        MCU.MSTR_Bit => True,
                        MCU.CPOL_Bit => CPOL,
                        MCU.CPHA_Bit => CPHA,
                        MCU.SPR1_Bit => False,
                        MCU.SPR0_Bit => True,
                        others => False);
      MCU.SPSR_Bits := (MCU.SPI2X_Bit => True,
                        others => False);
      SPI_Init := True;
   end Init_SPI;


   procedure Transfert_SPI(Data : Unsigned_8) is
   begin
      SS_Pin  := Low;
      MCU.SPDR := Data;
--      loop
--         exit when MCU.SPSR_Bits(MCU.SPIF_Bit);
--      end loop;
--      MCU.SPSR_Bits(MCU.SPIF_Bit) := False;
--      SS_Pin  := High;
   end Transfert_SPI;


   procedure SPI_Interrupt;
   pragma Machine_Attribute (Entity         => SPI_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, SPI_Interrupt, MCU.Sig_SPI_STC_String);

   procedure SPI_Interrupt is
   begin
         MCU.SPSR_Bits(MCU.SPIF_Bit) := False;
         SS_Pin  := High;
         MCU.SPSR_Bits(MCU.SPIF_Bit) := True;
   end SPI_Interrupt;


end LVC.COM.SPI;
