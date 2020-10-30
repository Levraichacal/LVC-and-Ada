with AVR;
with AVR.MCU;

use AVR;

package body LIB_74HC595 is

   Register_74hc595 : T_Register := (others=> False);

   procedure Init is
   begin
      -- D8, D9 et D10 en sortie
      MCU.DDRB_Bits(0) := True;  -- D8 - Pin 14 - Pin 9
      MCU.DDRB_Bits(1) := True;  -- D9 - Pin 12 - id
      MCU.DDRB_Bits(2) := True;  -- D10 - Pin 11 - id
      ClearRegister;
      WriteRegister;
   end Init;

   procedure ClearRegister is
   begin
      Register_74hc595 := (others=> False);
   end ClearRegister;

   procedure EmptyRegister is
   begin
      Register_74hc595 := (others=> True);
   end EmptyRegister;

   procedure WriteRegister is
      temp : Boolean := False;
   begin
      MCU.PORTB_Bits(1) := False;
      for i in Register_74hc595'Range loop
         MCU.PORTB_Bits(2) := False;
         temp := Register_74hc595(i);
         MCU.PORTB_Bits(0) := temp;
         MCU.PORTB_Bits(2) := True;
      end loop;
      MCU.PORTB_Bits(1) := True;
   end WriteRegister;

   procedure WriteRegister (register : T_Register) is
      temp : Boolean := False;
   begin
      Register_74hc595 := register;
      MCU.PORTB_Bits(1) := False;
      for i in Register_74hc595'Range loop
         MCU.PORTB_Bits(2) := False;
         temp := Register_74hc595(i);
         MCU.PORTB_Bits(0) := temp;
         MCU.PORTB_Bits(2) := True;
      end loop;
      MCU.PORTB_Bits(1) := True;
   end WriteRegister;

   procedure SetRegisterValue (index: Integer; value : Boolean) is
   begin
      Register_74hc595(index) := value;
   end SetRegisterValue;


end LIB_74HC595;
