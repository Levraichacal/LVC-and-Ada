------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                                G P I O                                   --
--                                                                          --
--                                B o d y                                   --
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

-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;
use AVR;
use AVR.MCU;

with Ada.Unchecked_Conversion;


package body GPIO is

   -- La valeur du port : Haut = true, Bas = false;
   -- Les ports digitaux
   D0_P: Boolean renames MCU.PORTD_Bits (0);
   D1_P: Boolean renames MCU.PORTD_Bits (1);
   D2_P: Boolean renames MCU.PORTD_Bits (2);
   D3_P: Boolean renames MCU.PORTD_Bits (3);
   D4_P: Boolean renames MCU.PORTD_Bits (4);
   D5_P: Boolean renames MCU.PORTD_Bits (5);
   D6_P: Boolean renames MCU.PORTD_Bits (6);
   D7_P: Boolean renames MCU.PORTD_Bits (7);
   D8_P: Boolean renames MCU.PORTB_Bits (0);
   D9_P: Boolean renames MCU.PORTB_Bits (1);
   D10_P: Boolean renames MCU.PORTB_Bits (2);
   D11_P: Boolean renames MCU.PORTB_Bits (3);
   D12_P: Boolean renames MCU.PORTB_Bits (4);
   D13_P: Boolean renames MCU.PORTB_Bits (5);

   -- Les ports analogiques
   A0_P: Boolean renames MCU.PORTC_Bits (0);
   A1_P: Boolean renames MCU.PORTC_Bits (1);
   A2_P: Boolean renames MCU.PORTC_Bits (2);
   A3_P: Boolean renames MCU.PORTC_Bits (3);
   A4_P: Boolean renames MCU.PORTC_Bits (4);
   A5_P: Boolean renames MCU.PORTC_Bits (5);

   -- Le modes du port :
   -- Les ports digitaux
   D0_M: Boolean renames MCU.DDRD_Bits (0);
   D1_M: Boolean renames MCU.DDRD_Bits (1);
   D2_M: Boolean renames MCU.DDRD_Bits (2);
   D3_M: Boolean renames MCU.DDRD_Bits (3);
   D4_M: Boolean renames MCU.DDRD_Bits (4);
   D5_M: Boolean renames MCU.DDRD_Bits (5);
   D6_M: Boolean renames MCU.DDRD_Bits (6);
   D7_M: Boolean renames MCU.DDRD_Bits (7);
   D8_M: Boolean renames MCU.DDRB_Bits (0);
   D9_M: Boolean renames MCU.DDRB_Bits (1);
   D10_M: Boolean renames MCU.DDRB_Bits (2);
   D11_M: Boolean renames MCU.DDRB_Bits (3);
   D12_M: Boolean renames MCU.DDRB_Bits (4);
   D13_M: Boolean renames MCU.DDRB_Bits (5);

   -- Les ports analogiques
   A0_M: Boolean renames MCU.DDRC_Bits (0);
   A1_M: Boolean renames MCU.DDRC_Bits (1);
   A2_M: Boolean renames MCU.DDRC_Bits (2);
   A3_M: Boolean renames MCU.DDRC_Bits (3);
   A4_M: Boolean renames MCU.DDRC_Bits (4);
   A5_M: Boolean renames MCU.DDRC_Bits (5);

   procedure PinMode(nomPort : lvcPins; modePort : lvcMode) is
      mode : Boolean;
   begin
      case modePort is
         when Input => mode := DD_Input;
         when Output => mode := DD_Output;
         when AnalogOutput => mode := DD_Output;
         when others => mode := DD_Input;
      end case;
      case nomPort is
         when D0 => D0_M := mode;
         when D1 => D1_M := mode;
         when D2 => D2_M := mode;
         when D3 => D3_M := mode;
         when D4 => D4_M := mode;
         when D5 => D5_M := mode;
         when D6 => D6_M := mode;
         when D7 => D7_M := mode;
         when D8 => D8_M := mode;
         when D9 => D9_M := mode;
         when D10 => D10_M := mode;
         when D11 => D11_M := mode;
         when D12 => D12_M := mode;
         when D13 => D13_M := mode;
         when A0 => A0_M := mode;
         when A1 => A1_M := mode;
         when A2 => A2_M := mode;
         when A3 => A3_M := mode;
         when A4 => A4_M := mode;
         when A5 => A5_M := mode;
         when others => null;
      end case;
      if (modePort = AnalogOutput) then
         case nomPort is
            when D3 | D11 => -- Timer 2
               TCCR2A_Bits := (WGM20_Bit  => True,
                               WGM21_Bit  => True,
                               others => False);
               TCCR2B_Bits := (WGM22_Bit => False,
                               CS20_Bit => True,
                               CS21_Bit => False,
                               CS22_Bit => False,
                               others => False);
            when D5 | D6 => -- Timer 0
               TCCR0A_Bits := (WGM00_Bit  => True,
                               WGM01_Bit  => True,
                               others => False);
               TCCR0B_Bits := (WGM02_Bit => False,
                               CS00_Bit => True,
                               CS01_Bit => False,
                               CS02_Bit => False,
                               others => False);
            when D9 | D10 => -- Timer 1
               TCCR1A_Bits := (WGM10_Bit  => True,
                               WGM11_Bit  => False,
                               others => False);
               TCCR1B_Bits := (WGM12_Bit => True,
                               WGM13_Bit => False,
                               CS10_Bit => True,
                               CS11_Bit => False,
                               CS12_Bit => False,
                               others => False);
            when others => null;
         end case;
      end if;
   end PinMode;

   procedure DigitalWrite(nomPort : lvcPins; niveauPort : Boolean) is
   begin
      case nomPort is
         when D0 => D0_P := niveauPort;
         when D1 => D1_P := niveauPort;
         when D2 => D2_P := niveauPort;
         when D3 => D3_P := niveauPort;
         when D4 => D4_P := niveauPort;
         when D5 => D5_P := niveauPort;
         when D6 => D6_P := niveauPort;
         when D7 => D7_P := niveauPort;
         when D8 => D8_P := niveauPort;
         when D9 => D9_P := niveauPort;
         when D10 => D10_P := niveauPort;
         when D11 => D11_P := niveauPort;
         when D12 => D12_P := niveauPort;
         when D13 => D13_P := niveauPort;
         when A0 => A0_P := niveauPort;
         when A1 => A1_P := niveauPort;
         when A2 => A2_P := niveauPort;
         when A3 => A3_P := niveauPort;
         when A4 => A4_P := niveauPort;
         when A5 => A5_P := niveauPort;
         when others => null;
      end case;
   end DigitalWrite;

   function To_Uint8 is new Ada.Unchecked_Conversion (Target => Unsigned_8,
                                                      Source => Unsigned_16);

   procedure AnalogWrite(nomPort : lvcPins; value : Unsigned_16) is
   begin
      case nomPort is
         when D3 => -- OC2B
            TCCR2A_Bits(COM2B1_Bit) := True;
            MCU.OCR2B := To_Uint8(value);
         when D5 => -- OC0B
            TCCR0A_Bits(COM0B1_Bit) := True;
            MCU.OCR0B := To_Uint8(value);
         when D6 => -- OC0A
            TCCR0A_Bits(COM0A1_Bit) := True;
            MCU.OCR0A := To_Uint8(value);
         when D9 => -- OC1A
            TCCR1A_Bits(COM1A1_Bit) := True;
            MCU.OCR1A := value;
         when D10 => -- OC1B
            TCCR1A_Bits(COM1B1_Bit) := True;
            MCU.OCR1B := value;
         when D11 => -- OC2A
            TCCR2A_Bits(COM2A1_Bit) := True;
            MCU.OCR2A := To_Uint8(value);
         when others =>
            if (value < 128) then
               DigitalWrite(nomPort, False);
            else
               DigitalWrite(nomPort, True);
            end if;
      end case;
   end AnalogWrite;

end GPIO;
