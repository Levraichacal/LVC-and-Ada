with AVR;
with AVR.MCU;
with AVR.Interrupts;
with AVR.UART;

use AVR;
use AVR.MCU;


with Interfaces;
use Interfaces;

package body L298N is

   --(In1 : lvcPins; In2 : lvcPins; In3 : lvcPins; In4 : lvcPins)
   -- In1 : D5
   -- In2 : D6
   -- In3 : D10
   -- In4 : D11
   procedure Init_L298N is
   begin
      MCU.DDRD_Bits (5) := DD_Output;  -- D5 en sortie
      MCU.DDRD_Bits (6) := DD_Output;  -- D6 en sortie
      MCU.DDRB_Bits (2) := DD_Output;  -- D10 en sortie
      MCU.DDRB_Bits (3) := DD_Output;  -- D11 en sortie
   end Init_L298N;

   procedure Avance is
   begin
      MCU.PORTD_Bits(5) := False;       -- Low on D5
      MCU.PORTD_Bits(6) := True;       -- High on D6
      MCU.PORTB_Bits(2) := False;       -- Low on D10
      MCU.PORTB_Bits(3) := True;       -- High on D11
   end Avance;

   procedure Recule is
   begin
      MCU.PORTD_Bits(5) := True;       -- Low on D5
      MCU.PORTD_Bits(6) := False;       -- High on D6
      MCU.PORTB_Bits(2) := True;       -- Low on D10
      MCU.PORTB_Bits(3) := False;       -- High on D11
   end Recule;

   procedure Droite is
   begin
      MCU.PORTD_Bits(5) := False;       -- Low on D5
      MCU.PORTD_Bits(6) := True;       -- High on D6
      MCU.PORTB_Bits(2) := False;       -- Low on D10
      MCU.PORTB_Bits(3) := False;       -- High on D11
   end Droite;

   procedure Gauche is
   begin
      MCU.PORTD_Bits(5) := False;       -- Low on D5
      MCU.PORTD_Bits(6) := False;       -- High on D6
      MCU.PORTB_Bits(2) := False;       -- Low on D10
      MCU.PORTB_Bits(3) := True;       -- High on D11
   end Gauche;

   procedure Stop is
   begin
      MCU.PORTD_Bits(5) := False;       -- Low on D5
      MCU.PORTD_Bits(6) := False;       -- High on D6
      MCU.PORTB_Bits(2) := False;       -- Low on D10
      MCU.PORTB_Bits(3) := False;       -- High on D11
   end Stop;

end L298N;
