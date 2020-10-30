with AVR;
with AVR.MCU;
with LVC.PIN;

use AVR;
use LVC.PIN;

package body LVC.DIGITALWRITE is

procedure DigitalWrite ( port : LVC_pins;
                        status : Boolean )
is
begin
case port is
   when D0 =>
      MCU.PORTD_Bits (0) := status;
   when D1 =>
      MCU.PORTD_Bits (1) := status;
   when D2 =>
      MCU.PORTD_Bits (2) := status;
   when D3 =>
      MCU.PORTD_Bits (3) := status;
   when D4 =>
      MCU.PORTD_Bits (4) := status;
   when D5 =>
      MCU.PORTD_Bits (5) := status;
   when D6 =>
      MCU.PORTD_Bits (6) := status;
   when D7 =>
      MCU.PORTD_Bits (7) := status;
   when D8 =>
      MCU.PORTB_Bits (0) := status;
   when D9 =>
      MCU.PORTB_Bits (1) := status;
   when D10 =>
      MCU.PORTB_Bits (2) := status;
   when D11 =>
      MCU.PORTB_Bits (3) := status;
   when D12 =>
      MCU.PORTB_Bits (4) := status;
   when D13 =>
      MCU.PORTB_Bits (5) := status;
   when A0 =>
      MCU.PORTC_Bits (0) := status;
   when A1 =>
      MCU.PORTC_Bits (1) := status;
   when A2 =>
      MCU.PORTC_Bits (2) := status;
   when A3 =>
      MCU.PORTC_Bits (3) := status;
   when A4 =>
      MCU.PORTC_Bits (4) := status;
   when A5 =>
      MCU.PORTC_Bits (5) := status;
   when others => null;
end case;

end DigitalWrite;


end LVC.DIGITALWRITE;
