-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;
use AVR;

with System;
use System;

package body LVC.PINS is

   procedure pinMode (pin: lvcPins; mode : lvcMode) is
   begin
      case pin is
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


   procedure digitalWrite(pin : lvcPins; level : lvcLevel) is
   begin
      case pin is
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


   function digitalPinToBitMask(pin: lvcPins) return Unsigned_8 is
   begin
      case pin is
         when D0 => return MCU.PORTD0_Mask;
         when D1 => return MCU.PORTD1_Mask;
         when D2 => return MCU.PORTD2_Mask;
         when D3 => return MCU.PORTD3_Mask;
         when D4 => return MCU.PORTD4_Mask;
         when D5 => return MCU.PORTD5_Mask;
         when D6 => return MCU.PORTD6_Mask;
         when D7 => return MCU.PORTD7_Mask;
         when D8 => return MCU.PORTB0_Mask;
         when D9 => return MCU.PORTB1_Mask;
         when D10 => return MCU.PORTB2_Mask;
         when D11 => return MCU.PORTB3_Mask;
         when D12 => return MCU.PORTB4_Mask;
         when D13 => return MCU.PORTB5_Mask;
         when A0 => return MCU.PORTC0_Mask;
         when A1 => return MCU.PORTC1_Mask;
         when A2 => return MCU.PORTC2_Mask;
         when A3 => return MCU.PORTC3_Mask;
         when A4 => return MCU.PORTC4_Mask;
         when A5 => return MCU.PORTC5_Mask;
         --when others => return null;
      end case;
   end digitalPinToBitMask;

   function digitalReadValue(pin: lvcPins) return Boolean is
   begin
      case pin is
         when D0 => return MCU.PIND_Bits(0);
         when D1 => return MCU.PIND_Bits(1);
         when D2 => return MCU.PIND_Bits(2);
         when D3 => return MCU.PIND_Bits(3);
         when D4 => return MCU.PIND_Bits(4);
         when D5 => return MCU.PIND_Bits(5);
         when D6 => return MCU.PIND_Bits(6);
         when D7 => return MCU.PIND_Bits(7);
         when D8 => return MCU.PINB_Bits(0);
         when D9 => return MCU.PINB_Bits(1);
         when D10 => return MCU.PINB_Bits(2);
         when D11 => return MCU.PINB_Bits(3);
         when D12 => return MCU.PINB_Bits(4);
         when D13 => return MCU.PINB_Bits(5);
         when A0 => return MCU.PINC_Bits(0);
         when A1 => return MCU.PINC_Bits(1);
         when A2 => return MCU.PINC_Bits(2);
         when A3 => return MCU.PINC_Bits(3);
         when A4 => return MCU.PINC_Bits(4);
         when A5 => return MCU.PINC_Bits(5);
         --when others => return null;
      end case;
   end digitalReadValue;

   function digitalPinToPort(pin: lvcPins) return lvcPort is
   begin
      case pin is
         when D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 =>
            return PD;
         when D8 | D9 | D10 | D11 | D12 | D13 =>
            return PB;
         when A0 | A1 | A2 | A3 | A4 | A5 =>
            return PC;
         --when others => return 0;
      end case;
   end digitalPinToPort;

   function portOutputRegister(port: lvcPort) return Address is
   begin
      case port is
         when PB =>
            return MCU.PORTB_Addr;
         when PC =>
            return MCU.PORTC_Addr;
         when PD =>
            return MCU.PORTD_Addr;
         when others => return 16#FFFF#;
      end case;
   end portOutputRegister;


   function portInputRegister(port: lvcPort) return Address is
   begin
      case port is
         when PB =>
            return MCU.PINB_Addr;
         when PC =>
            return MCU.PINC_Addr;
         when PD =>
            return MCU.PIND_Addr;
         when others => return 16#FFFF#;
      end case;
   end portInputRegister;

   function digitalPinToPCICRbit(port: lvcPort) return Bit_Number is
   begin
      case port is
         when PB =>
            return MCU.PCIE0_Bit;
         when PC =>
            return MCU.PCIE1_Bit;
         when PD =>
            return MCU.PCIE2_Bit;
         when others => return 7;
      end case;
   end digitalPinToPCICRbit;

   function digitalPinToPCICR(port: lvcPort) return Address is
   begin
      case port is
         when PB | PC | PD=>
            return MCU.PCICR_Addr;
         when others => return 16#FFFF#;
      end case;
   end digitalPinToPCICR;

   function digitalPinToPCMSKbit(pin: lvcPins) return Bit_Number is
   begin
      case pin is
         when D0 => return MCU.PCINT16_Bit;
         when D1 => return MCU.PCINT17_Bit;
         when D2 => return MCU.PCINT18_Bit;
         when D3 => return MCU.PCINT19_Bit;
         when D4 => return MCU.PCINT20_Bit;
         when D5 => return MCU.PCINT21_Bit;
         when D6 => return MCU.PCINT22_Bit;
         when D7 => return MCU.PCINT23_Bit;
         when D8 => return MCU.PCINT0_Bit;
         when D9 => return MCU.PCINT1_Bit;
         when D10 => return MCU.PCINT2_Bit;
         when D11 => return MCU.PCINT3_Bit;
         when D12 => return MCU.PCINT4_Bit;
         when D13 => return MCU.PCINT5_Bit;
         when A0 => return MCU.PCINT8_Bit;
         when A1 => return MCU.PCINT9_Bit;
         when A2 => return MCU.PCINT10_Bit;
         when A3 => return MCU.PCINT11_Bit;
         when A4 => return MCU.PCINT12_Bit;
         when A5 => return MCU.PCINT13_Bit;
         --when others => return null;
      end case;
   end digitalPinToPCMSKbit;


   procedure writeToPCICRRegister(port: lvcPort) is
   begin
      if(port = PB or port = PC or port = PD) then
         MCU.PCICR_Bits(digitalPinToPCICRbit(port)) := True;
      end if;
   end writeToPCICRRegister;

   procedure writeToPCMSKRegister(pin: lvcPins; value :Boolean := True) is
      port : lvcPort;
      bit : Bit_Number;
   begin
      port := digitalPinToPort(pin);
      bit := digitalPinToPCMSKbit(pin);
      case port is
         when PB =>
            MCU.PCMSK0_Bits(bit) := value;
         when PC =>
            MCU.PCMSK1_Bits(bit) := value;
         when PD =>
            MCU.PCMSK2_Bits(bit) := value;
         when others => null;
      end case;
   end writeToPCMSKRegister;

   function readToPCMSKRegister(pin: lvcPins) return Boolean is
      port : lvcPort;
      bit : Bit_Number;
   begin
      port := digitalPinToPort(pin);
      bit := digitalPinToPCMSKbit(pin);
      case port is
         when PB =>
            return MCU.PCMSK0_Bits(bit);
         when PC =>
            return MCU.PCMSK1_Bits(bit);
         when PD =>
            return MCU.PCMSK2_Bits(bit);
         when others =>
            return False;
      end case;
   end readToPCMSKRegister;

end LVC.PINS;

