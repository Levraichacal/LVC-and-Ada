with AVR;                          use AVR;
with AVR.MCU;

private package LCD.Wiring is
   pragma Preelaborate;

   type Bus_Mode is (Mode_4bit, Mode_8bit);

   Bus_Width         : constant Bus_Mode := Mode_4bit;

   -- Data_Port         : Nat8 renames MCU.PORTD;
   -- Data_DD           : Nat8 renames MCU.DDRD;

   -- Data0             : Boolean renames MCU.PORTB_Bits (1);
   -- Data1             : Boolean renames MCU.PORTB_Bits (2);
   -- Data2             : Boolean renames MCU.PORTB_Bits (3);
   -- Data3             : Boolean renames MCU.PORTB_Bits (4);
   -- Data0_DD          : Boolean renames MCU.DDRB_Bits (1);
   -- Data1_DD          : Boolean renames MCU.DDRB_Bits (2);
   -- Data2_DD          : Boolean renames MCU.DDRB_Bits (3);
   -- Data3_DD          : Boolean renames MCU.DDRB_Bits (4);

   Data0             : Boolean renames MCU.PORTB_Bits (0); -- D8
   Data1             : Boolean renames MCU.PORTD_Bits (5); -- D5
   Data2             : Boolean renames MCU.PORTC_Bits (3); -- A3
   Data3             : Boolean renames MCU.PORTB_Bits (4); -- D12
   Data0_DD          : Boolean renames MCU.DDRB_Bits (0);
   Data1_DD          : Boolean renames MCU.DDRD_Bits (5);
   Data2_DD          : Boolean renames MCU.DDRC_Bits (3);
   Data3_DD          : Boolean renames MCU.DDRB_Bits (4);


   -- LCD pin 4
   RegisterSelect    : Boolean renames MCU.PORTD_Bits (3); -- D3
   RegisterSelect_DD : Boolean renames MCU.DDRD_Bits (3);

   -- LCD pin 5
   ReadWrite         : Boolean renames MCU.PORTC_Bits (2); -- A2
   ReadWrite_DD      : Boolean renames MCU.DDRC_Bits (2);

   -- LCD pin 6
   Enable            : Boolean renames MCU.PORTD_Bits (4);  -- D4
   Enable_DD         : Boolean renames MCU.DDRD_Bits (4);

   --

   Processor_Speed   : constant := 16_000_000;

end LCD.Wiring;
