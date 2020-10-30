-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;
with AVR.Real_Time.Delays;

use AVR;

-- Déclaration du programme

procedure Test_74hc595 is

   type T_Register is array (0..7) of Boolean;
   Register_74hc595 : T_Register := (others=> False);

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

   procedure Init is
   begin
      -- D8, D9 et D10 en sortie
      MCU.DDRB_Bits(0) := True;  -- D8
      MCU.DDRB_Bits(1) := True;  -- D9
      MCU.DDRB_Bits(2) := True;  -- D10
      ClearRegister;
      WriteRegister;
   end Init;

   procedure SetRegisterValue (index: Integer; value : Boolean) is
   begin
      Register_74hc595(index) := value;
   end SetRegisterValue;
   
begin
   Init;
   loop
      ClearRegister;
      WriteRegister;
      delay 2.5;
      EmptyRegister;
      WriteRegister;
      delay 2.5;
      for i in Register_74hc595'Range loop
         SetRegisterValue(i,False);
         WriteRegister;
         delay 2.5;
      end loop;
   end loop;
end Test_74hc595;

