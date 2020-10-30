with AVR;                          use AVR;

package Pins is
   --  Arduino digital pins 0..7 are mapped to Atmega8/168/328 port D
   --  pins 0..7.

   --  Port D pins 0..1 are also used for UART communication.
   --  Therefore the pins to be used by the logic analyzer are pins
   --  2..7 per default.

   Default_Mask : constant Bits_In_Byte := (0 => False,
                                            1 => False,
                                            2 => True,
                                            3 => True,
                                            4 => True,
                                            5 => True,
                                            6 => True,
                                            7 => True);

   Trigger_Pattern : Bits_In_Byte;
   Trigger_Mask    : Bits_In_Byte := Default_Mask;

   --  Set the masked pins to output and setup the pull-up resistor.
   --  Enable pin change interrupt on the selected pins.
   procedure Init (Mask : Bits_In_Byte := Default_Mask);


   --  start recording pin changes to the internal buffer
   procedure Start_Recording;

   --  clear capture buffer
   procedure Reset_Records;

   --  while recording is active return True
   function Is_Recording return Boolean;

   --  transmit the recorded values to the external device
   --  (typ. serial interface)
   procedure Send_Records;
   procedure Send_Records_Text;

private
   pragma Inline (Is_Recording);
end Pins;
