with AVR;                          use AVR;
-- with AVR.MCU;
with AVR.Real_Time.Clock;
pragma Unreferenced (AVR.Real_Time.Clock);

with Servos;                       use Servos;
with LED;
with AVR.UART;


procedure Main is
   S1 : constant Servo_Index_Range := 2;
begin
   UART.Init (UART.Baud_19200_16MHz);
   UART.Put_Line ("start program");
   LED.Init;
   Servos.Init;
   UART.Put_Line ("after init, set mid position, LED on");

   Servo_Position(S1) := Mid_Position;
   LED.On_1;

   UART.Put_Line ("wait one second");
   delay 1.0;

   loop
      UART.Put_Line ("set left position, LED off");
      Servo_Position (S1) := Full_Left_Position;
      LED.Off_1;

      UART.Put_Line ("wait one second");
      delay 1.0;

      UART.Put_Line ("set right position, LED on");
      Servo_Position (S1) := Full_Right_Position;
      LED.On_1;

      UART.Put_Line ("wait one second");
      delay 1.0;

   end loop;
end Main;
