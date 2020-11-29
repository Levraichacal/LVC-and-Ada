with LVC.PINMODE;
use LVC.PINMODE;

with LVC.DIGITALWRITE;
use LVC.DIGITALWRITE;

package body LIB_74HC595 is

   Register_74hc595 : T_Register := (others=> False);
   Ser_74hc595 : lvcPins;
   Rclk_74hc595 : lvcPins;
   Srclk_74hc595 : lvcPins;

   procedure Init(ser : lvcPins; rclk : lvcPins; srclk : lvcPins) is
   begin
      Ser_74hc595 := ser;
      Rclk_74hc595 := rclk;
      Srclk_74hc595 := srclk;
      pinMode(Ser_74hc595, Output);
      pinMode(Rclk_74hc595, Output);
      pinMode(Srclk_74hc595, Output);
      ClearRegister;
      WriteRegister;
   end Init;

   procedure Init is
   begin
      -- D8, D9 et D10 en sortie
      Init(D8, D9, D10);
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
      digitalWrite(Rclk_74hc595, False);
      for i in Register_74hc595'Range loop
         digitalWrite(Srclk_74hc595, False);
         temp := Register_74hc595(i);
         digitalWrite(Ser_74hc595, temp);
         digitalWrite(Srclk_74hc595, True);
      end loop;
      digitalWrite(Rclk_74hc595, True);
   end WriteRegister;

   procedure WriteRegister (register : T_Register) is
      temp : Boolean := False;
   begin
      Register_74hc595 := register;
      digitalWrite(Rclk_74hc595, False);
      for i in reverse Register_74hc595'Range loop
         digitalWrite(Srclk_74hc595, False);
         temp := Register_74hc595(i);
         digitalWrite(Ser_74hc595, temp);
         digitalWrite(Srclk_74hc595, True);
      end loop;
      digitalWrite(Rclk_74hc595, True);
   end WriteRegister;

   procedure SetRegisterValue (index: Integer; value : Boolean) is
   begin
      Register_74hc595(index) := value;
   end SetRegisterValue;


end LIB_74HC595;
