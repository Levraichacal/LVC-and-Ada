with Interfaces;                   use Interfaces;
with AVR;                          use AVR;

package Servos is

   --  set the actual wiring in Servos_Config for all servos that you
   --  use.


   --
   --  Servo Position
   --
   Full_Right_Position : constant  := +100;
   Mid_Position        : constant  :=    0;
   Full_Left_Position  : constant  := -100;

   type Position is
     new Integer_8 range Full_Left_Position .. Full_Right_Position;

   --  only the index values as indicated in Servos_Config may and can
   --  be used.
   subtype Servo_Index_Range is AVR.Bit_Number;
   Servo_Position : array (Servo_Index_Range) of Position;
   --  as the array elements are 8bit onla, we don't need a pragma Volatile

   procedure Init;

end Servos;
