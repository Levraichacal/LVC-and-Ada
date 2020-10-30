with AVR;                          use AVR;
with AVR.MCU;

package Servos_Config is
   pragma Preelaborate;


   --  The Ladyada motor shield for Arduino
   --  (http://www.ladyada.net/make/mshield) provides two jacks for
   --  direct connection of standard hobby servos.  The data pins are:
   --
   --           port  port pin         Arduino pin
   --  Servo1   PortB       2              D10
   --  Servo2   PortB       1              D9
   --

   Servos_Port : Bits_In_Byte renames MCU.PORTB_Bits;
   Servos_DDR  : Bits_In_Byte renames MCU.DDRB_Bits;

   Connected_Servos : constant Bits_In_Byte :=
     (0 => False,
      1 => False,
      2 => True,
      3 => False,
      4 => False,
      5 => False,
      6 => False,
      7 => False);

end Servos_Config;
