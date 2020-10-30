with Interfaces;                   use Interfaces;
with AVR;                          use AVR;
with AVR.MCU;
--with AVR.Ext_Int;
with AVR.Timer1;
with AVR.UART;

with Clock;

package body Pins is
   --  Arduino digital pins 0..7 are mapped to Atmega8/168/328 port D
   --  pins 0..7.  Those correspond to the PCINT pins 16..23

   --  Port D pins 0..1 are also used for UART communication.
   --  Therefore we only use pins 2..7 in the logic analyzer.


   Mask8 : Unsigned_8;

   -- Set the masked pins to output and set the pull-up resistor.
   -- Enable pin change interrupt on the selected pins.
   procedure Init (Mask : Bits_In_Byte := Default_Mask)
   is
   begin
      Mask8 := +Mask;

      --  setting the DDRD bits to low means intput. All pins that are
      --  masked True in the mask must be set to input (= low),
      --  i.e. we have to invert the mask.
      MCU.DDRD := MCU.DDRD and (not Mask8);
      --  setting PORTD bits to high means enabling the pull-up.
      MCU.PORTD := MCU.PORTD or Mask8;

      -- Ext_Int.Select_Pins_For_PCI2 (Mask8);
      -- Ext_Int.Enable_Pin_Change_Interrupt_2;

   end Init;


   Recording_Is_Enabled : Boolean := False;
   pragma Volatile (Recording_Is_Enabled);


   type Pin_Capture_Entry_T is record
      Time : Clock.Timestamp;
      Value : Unsigned_8;
   end record;

   Buffer_Length : constant := 1024;
   type Buffer_Index is range 0 .. Buffer_Length;
   subtype Buffer_Range is Buffer_Index range 1 .. Buffer_Length;

   --  type Pin_Capture_Buffer is array (Buffer_Range) of Pin_Capture_Entry_T;
   type Pin_Capture_Buffer is array (Buffer_Range) of Unsigned_8;
   Pin_Captures : Pin_Capture_Buffer;
   Next_Pin_Capture : Buffer_Index;


   --  start recording pin changes to the internal buffer
   procedure Start_Recording
   is begin
      Recording_Is_Enabled := True;
      Next_Pin_Capture := 0;
      Clock.Init;

      Recording_Loop: loop
         Timing_Loop : while Timer1.Counter > 4 loop null; end loop Timing_Loop;
         if Next_Pin_Capture = Buffer_Length then
            exit Recording_Loop;
         else
            Next_Pin_Capture := Next_Pin_Capture + 1;
         end if;
         Pin_Captures (Next_Pin_Capture) := MCU.PIND;
      end loop Recording_Loop;

   end Start_Recording;


   procedure Reset_Records
   is begin
      for Rec of Pin_Captures loop
         -- Rec := (0, 0);
         Rec := 0;
      end loop;
   end Reset_Records;


   --  while recording is active return True
   function Is_Recording return Boolean
   is begin
      return Recording_Is_Enabled;
   end Is_Recording;


   --  transmit the recorded values to the external device
   --  (typ. serial interface)
   procedure Send_Records
   is
   begin
      for Rec of Pin_Captures loop -- Idx in Buffer_Index'(1) .. Next_Pin_Capture loop
         AVR.UART.Put_Raw (Rec and Mask8);
      end loop;
   end Send_Records;


   procedure Send_Records_Text
   is
      use AVR.UART;
   begin
      Put_Line ("sending captured data as text");
      for Idx in Buffer_Index'(1) .. Next_Pin_Capture loop
         -- Put (Unsigned_32 (Pin_Captures(Idx).Time));
         -- Put (", ");
         -- Put (Pin_Captures(Idx).Value, Base => 2);
         Put (Pin_Captures(Idx) and Mask8, Base => 2);
         New_Line;
      end loop;
   end Send_Records_Text;


   procedure Record_Single_Entry;
   pragma Machine_Attribute (Entity         => Record_Single_Entry,
                             Attribute_Name => "signal");
   --  pragma Export (C, Record_Single_Entry, Ext_Int.Signal_Pin_Change_Int2);
   pragma Export (C, Record_Single_Entry, Timer1.Signal_Compare);

   procedure Record_Single_Entry is
   begin
      if Next_Pin_Capture = Buffer_Length then
         Recording_Is_Enabled := False;
         return;
      else
         Next_Pin_Capture := Next_Pin_Capture + 1;
      end if;
      -- Pin_Captures (Next_Pin_Capture) := (MCU.PIND and Mask8);
      Pin_Captures (Next_Pin_Capture) := MCU.PIND;
   end Record_Single_Entry;


end Pins;
