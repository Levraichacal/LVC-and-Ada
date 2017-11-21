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

   -- La valeur sur l'entrée: Haut = true, Bas = false;
   -- Les ports digitaux
   D0_I: Boolean renames MCU.PIND_Bits (0);
   D1_I: Boolean renames MCU.PIND_Bits (1);
   D2_I: Boolean renames MCU.PIND_Bits (2);
   D3_I: Boolean renames MCU.PIND_Bits (3);
   D4_I: Boolean renames MCU.PIND_Bits (4);
   D5_I: Boolean renames MCU.PIND_Bits (5);
   D6_I: Boolean renames MCU.PIND_Bits (6);
   D7_I: Boolean renames MCU.PIND_Bits (7);
   D8_I: Boolean renames MCU.PINB_Bits (0);
   D9_I: Boolean renames MCU.PINB_Bits (1);
   D10_I: Boolean renames MCU.PINB_Bits (2);
   D11_I: Boolean renames MCU.PINB_Bits (3);
   D12_I: Boolean renames MCU.PINB_Bits (4);
   D13_I: Boolean renames MCU.PINB_Bits (5);

   -- Les ports analogiques
   A0_I: Boolean renames MCU.PINC_Bits (0);
   A1_I: Boolean renames MCU.PINC_Bits (1);
   A2_I: Boolean renames MCU.PINC_Bits (2);
   A3_I: Boolean renames MCU.PINC_Bits (3);
   A4_I: Boolean renames MCU.PINC_Bits (4);
   A5_I: Boolean renames MCU.PINC_Bits (5);

   AnalogRef : analogReference := Default;

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

   function DigitalRead(nomPort : lvcPins) return Boolean is
      temp : Boolean := True;
   begin
      case nomPort is
         when D0 => temp := D0_I;
         when D1 => temp := D1_I;
         when D2 => temp := D2_I;
         when D3 => temp := D3_I;
         when D4 => temp := D4_I;
         when D5 => temp := D5_I;
         when D6 => temp := D6_I;
         when D7 => temp := D7_I;
         when D8 => temp := D8_I;
         when D9 => temp := D9_I;
         when D10 => temp := D10_I;
         when D11 => temp := D11_I;
         when D12 => temp := D12_I;
         when D13 => temp := D13_I;
         when A0 => temp := A0_I;
         when A1 => temp := A1_I;
         when A2 => temp := A2_I;
         when A3 => temp := A3_I;
         when A4 => temp := A4_I;
         when A5 => temp := A5_I;
         when others => temp := False;
      end case;
      return temp;
   end DigitalRead;

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

   procedure SetAnalogReference(ARef : analogReference) is
   begin
      AnalogRef := ARef;
   end SetAnalogReference;

   -- Internal procedure to initiate on analog port.
   -- use to simplify AnalogRead function
   procedure InitAnalogPort(nomPort : lvcPins) is
   begin
      -- Set the prescaler to 128 for a maximum resolution
      -- and activate the CAN
      ADCSRA_Bits := (ADEN_Bit => True,
                      ADPS0_Bit => True,
                      ADPS1_Bit => True,
                      ADPS2_Bit => True,
                      others => False);

      -- Set the Reference voltage
      case AnalogRef is
         when Default => ADMUX_Bits(REFS0_Bit) := True;
            ADMUX_Bits(REFS1_Bit) := False;
         when External => ADMUX_Bits(REFS0_Bit) := False;
            ADMUX_Bits(REFS1_Bit) := False;
         when Internal => ADMUX_Bits(REFS0_Bit) := True;
            ADMUX_Bits(REFS1_Bit) := True;
         when others => null;
      end case;
      -- Initiate the Analog port
      case nomPort is
         when A0 => ADMUX_Bits(MUX0_Bit) := False;
            ADMUX_Bits(MUX1_Bit) := False;
            ADMUX_Bits(MUX2_Bit) := False;
            ADMUX_Bits(MUX3_Bit) := False;
         when A1 => ADMUX_Bits(MUX0_Bit) := True;
            ADMUX_Bits(MUX1_Bit) := False;
            ADMUX_Bits(MUX2_Bit) := False;
            ADMUX_Bits(MUX3_Bit) := False;
         when A2 => ADMUX_Bits(MUX0_Bit) := False;
            ADMUX_Bits(MUX1_Bit) := True;
            ADMUX_Bits(MUX2_Bit) := False;
            ADMUX_Bits(MUX3_Bit) := False;
         when A3 => ADMUX_Bits(MUX0_Bit) := True;
            ADMUX_Bits(MUX1_Bit) := True;
            ADMUX_Bits(MUX2_Bit) := False;
            ADMUX_Bits(MUX3_Bit) := False;
         when A4 => ADMUX_Bits(MUX0_Bit) := False;
            ADMUX_Bits(MUX1_Bit) := False;
            ADMUX_Bits(MUX2_Bit) := True;
            ADMUX_Bits(MUX3_Bit) := False;
         when A5 => ADMUX_Bits(MUX0_Bit) := True;
            ADMUX_Bits(MUX1_Bit) := False;
            ADMUX_Bits(MUX2_Bit) := True;
            ADMUX_Bits(MUX3_Bit) := False;
         when A6 => ADMUX_Bits(MUX0_Bit) := False;
            ADMUX_Bits(MUX1_Bit) := True;
            ADMUX_Bits(MUX2_Bit) := True;
            ADMUX_Bits(MUX3_Bit) := False;
         when A7 => ADMUX_Bits(MUX0_Bit) := True;
            ADMUX_Bits(MUX1_Bit) := True;
            ADMUX_Bits(MUX2_Bit) := True;
            ADMUX_Bits(MUX3_Bit) := False;
         when others => null;
      end case;
   end InitAnalogPort;

   function AnalogRead (nomPort : lvcPins) return Unsigned_16 is
      temp: Unsigned_16 := 0;
   begin
      case nomPort is
         when D0 | D1| D2| D3| D4| D5| D6| D7| D8| D9| D10 | D11 | D12 | D13 =>
            if(DigitalRead(nomPort) = False) then
               temp := 0;
            else
               temp := 1023;
            end if;
         when A0 | A1 | A2 | A3 | A4 | A5 |A6 |A7 =>
            InitAnalogPort(nomPort);
            ADCSRA_Bits(ADSC_Bit) := True;
            -- Wait the conversion
            while(ADCSRA_Bits(ADSC_Bit)) loop
               null;
            end loop;
            temp := ADC;
         when others => temp := 0;
      end case;
      return temp;
   end AnalogRead;
end GPIO;
