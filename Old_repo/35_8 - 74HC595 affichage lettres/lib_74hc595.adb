

package body LIB_74HC595 is

   procedure Init(Chip : in out T_74HC795; Ser : lvcPins; Rclk : lvcPins; Srclk : lvcPins) is
   begin
      Chip.T_74HC795_SER := Ser;
      Chip.T_74HC795_RCLK := Rclk;
      Chip.T_74HC795_SRCLK := Srclk;
      pinMode(Chip.T_74HC795_SER, Output);
      pinMode(Chip.T_74HC795_RCLK, Output);
      pinMode(Chip.T_74HC795_SRCLK, Output);
      ClearRegister(Chip);
      WriteRegister(Chip);
   end Init;

   procedure Init(Chip : in out T_74HC795) is
   begin
      -- D8, D9 et D10 en sortie
      Init(Chip, D8, D9, D10);
   end Init;

   procedure ClearRegister(Chip : in out T_74HC795) is
   begin
      Chip.T_74HC795_Register := (others=> False);
   end ClearRegister;

   procedure EmptyRegister(Chip : in out T_74HC795) is
   begin
      Chip.T_74HC795_Register := (others=> True);
   end EmptyRegister;

   procedure WriteRegister(Chip : in out T_74HC795) is
      Temp : Boolean := False;
   begin
      digitalWrite(Chip.T_74HC795_RCLK, False);
      for i in Chip.T_74HC795_Register'Range loop
         digitalWrite(Chip.T_74HC795_SRCLK, False);
         Temp := Chip.T_74HC795_Register(i);
         digitalWrite(Chip.T_74HC795_SER, Temp);
         digitalWrite(Chip.T_74HC795_SRCLK, True);
      end loop;
      digitalWrite(Chip.T_74HC795_RCLK, True);
   end WriteRegister;

   procedure WriteRegister (Chip : in out T_74HC795; Register : T_Register) is
      Temp : Boolean := False;
   begin
      Chip.T_74HC795_Register := Register;
      digitalWrite(Chip.T_74HC795_RCLK, False);
      for i in Chip.T_74HC795_Register'Range loop
         digitalWrite(Chip.T_74HC795_SRCLK, False);
         Temp := Chip.T_74HC795_Register(i);
         digitalWrite(Chip.T_74HC795_SER, Temp);
         digitalWrite(Chip.T_74HC795_SRCLK, True);
      end loop;
      digitalWrite(Chip.T_74HC795_RCLK, True);
   end WriteRegister;

   procedure SetRegisterValue (Chip : in out T_74HC795; Index: Integer; Value : Boolean) is
   begin
      Chip.T_74HC795_Register(Index) := Value;
   end SetRegisterValue;


end LIB_74HC595;
