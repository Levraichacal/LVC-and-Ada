-- with System;
with Interfaces;                   use Interfaces;
with AVR;                          use AVR;
with AVR.Timer2;
with Servos_Config;                use Servos_Config;


package body Servos is


   Clock_Frequency : constant := 16_000_000;

   --  set the pin of the first servo to high. set the reset time in
   --  the timer overflow.  When the first delay expires, set the
   --  corrspondig pin to low and activate the next servo.  Continue
   --  for all configured servos. At the end wait for 8ms, then
   --  restart.

   --  The minimum cycle time is for only one servo at the left most
   --  position 1ms + 8ms = 9ms. The maximum cycle time is for 8
   --  servos at the right most position 8 * 2ms + 8ms = 24ms.


   --  prescaling of the timer, i.e. the timer ticks don't run at 16MHz
   --  but at 16MHz/Prescale.
   Prescale   : constant := 128;

   --  cycle time is 20 ms = 0.02 s
   -- Cycle_Ticks : constant := 20 * Clock_Frequency / Prescale / 1000;  -- = 40,000 ticks

   --  all named numbers are time spans in micro seconds, i.e. 10-6 s.
   Mid_Pos_Delay   : constant := 1500;
   Left_Pos_Delay  : constant := 1000;  --   800
   Right_Pos_Delay : constant := 2000;  --  2200

   --  max travelling distance (from full_left_position to
   --  full_right_position)
   Max_Delay_Diff  : constant := Right_Pos_Delay - Left_Pos_Delay;


   --  Die Anzahl der µC-Schritte für eine bestimmte Zeit:
   --  Time  * Freq  = Steps
   --  2.0ms * 16MHz = 32000
   --  1.5ms * 16MHz = 24000
   --  1.0ms * 16MHz = 16000

   --  (orig. Freq) 16Mhz / (prescale) 8 = 2MHz
   --  Time  * Freq  = Steps
   --  2.0ms *  2MHz =  4000
   --  1.5ms *  2MHz =  3000
   --  1.0ms *  2MHz =  2000

   --  (orig. Freq) 16Mhz / (prescale) 64 = 250kHz
   --  Time  * Freq  = Steps
   --  2.0ms *  250kHz = 500
   --  1.5ms *  250kHz = 375
   --  1.0ms *  250kHz = 250

   --  (orig. Freq) 16Mhz / (prescale) 128 = 125kHz
   --  Time  * Freq  = Steps
   --  2.0ms *  125kHz = 250
   --  1.5ms *  125kHz = 187
   --  1.0ms *  125kHz = 125


   Wait_2ms : constant Unsigned_8 := 250;


   function Timer_Steps_For_Pos (P : Position) return Unsigned_8
   is
      --  delay time per position
      Alpha : constant := Max_Delay_Diff / 2 / Full_Right_Position;  --  5
      --  timer steps per position
      -- A     : constant := Alpha * Clock_Frequency / 1_000_000 / Prescale; -- 5/8
      --  timer steps to wait for the mid position (1.5ms)
      Mid   : constant := Mid_Pos_Delay * Clock_Frequency / 1_000_000 / Prescale; -- 187,5
   begin
      return Unsigned_8(Integer_16(P) * 5 / 8 + Mid);
   end Timer_Steps_For_Pos;


   Servo_Index : Servo_Index_Range;
   Cycle_Wait_Count : Nat8;


   procedure Timer_Action;
   pragma Machine_Attribute (Entity         => Timer_Action,
                             Attribute_Name => "signal");
   pragma Export (C, Timer_Action, Timer2.Signal_Compare);

   procedure Timer_Action
   is
   begin
      if Cycle_Wait_Count > 0 then
         Cycle_Wait_Count := Cycle_Wait_Count - 1;
         Timer2.Set_Overflow_At (Wait_2ms);

      elsif Connected_Servos (Servo_Index) then
         --  reset pulse
         Servos_Port (Servo_Index) := Low;
      end if;

      if Servo_Index = 7 then
         Servo_Index := 0;
         Cycle_Wait_Count := 4;
      else
         Servo_Index := Servo_Index + 1;
      end if;

      if Connected_Servos (Servo_Index) then
         --  set pulse
         Servos_Port (Servo_Index) := High;
         Timer2.Set_Overflow_At (Timer_Steps_For_Pos (Servo_Position (Servo_Index)));
      end if;

   end Timer_Action;


   procedure Init is
   begin
      --  set the pins as Output
      Servos_DDR := Servos_DDR or Connected_Servos;
      --  initialze pins to low value
      Servos_Port := Servos_Port and (not Connected_Servos);

      Servo_Index := 0;
      Cycle_Wait_Count := 0;

      Servo_Position := (others => Mid_Position);

      Timer2.Init_CTC (Timer2.Scale_By_128, Wait_2ms);

   end Init;

end Servos;
