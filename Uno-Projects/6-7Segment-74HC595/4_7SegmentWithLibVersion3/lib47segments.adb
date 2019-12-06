with AVR.Interrupts;
with AVR.MCU;
with AVR;
use AVR;
use AVR.MCU;
with GPIO;
use GPIO;

package body lib47segments is

   counter : Integer := 0;

   procedure init_Watchdog is
   begin
      AVR.Interrupts.Disable;
      -- Watchdog reset
      -- Wdr;
      -- Start timed sequence
      MCU.WDTCSR := +(MCU.WDCE_Bit => True,
                      MCU.WDE_Bit => True,
                      others => False);
      -- Set the prescaler 4.0 s and the WatchDog Timer Configuration: just in Interrupt Mode
      MCU.WDTCSR :=  +(MCU.WDIE_Bit => True,
                       MCU.WDE_Bit => False,
                       others => False);
      -- Enable WatchDog Interruption
      AVR.Interrupts.Enable;
   end init_Watchdog;


   procedure Init(Chip : in out T_47Segments; Led_A : lvcPins;
                  Led_B : lvcPins; Led_C : lvcPins; Led_D : lvcPins; Led_E : lvcPins;
                  Led_F : lvcPins; Led_G : lvcPins; Led_DP : lvcPins;
                  Com_1 : lvcPins; Com_2 : lvcPins; Com_3 : lvcPins; Com_4 : lvcPins) is
   begin
      Chip.T_47Segments_LED_A := Led_A;
      Chip.T_47Segments_LED_B := Led_B;
      Chip.T_47Segments_LED_C := Led_C;
      Chip.T_47Segments_LED_D := Led_D;
      Chip.T_47Segments_LED_E := Led_E;
      Chip.T_47Segments_LED_F := Led_F;
      Chip.T_47Segments_LED_G := Led_G;
      Chip.T_47Segments_LED_DP := Led_DP;
      Chip.T_47Segments_COM_1 := Com_1;
      Chip.T_47Segments_COM_2 := Com_2;
      Chip.T_47Segments_COM_3 := Com_3;
      Chip.T_47Segments_COM_4 := Com_4;
      Chip.T_47Segments_Numbers(1) := ' ';
      Chip.T_47Segments_Numbers(2) := ' ';
      Chip.T_47Segments_Numbers(3) := ' ';
      Chip.T_47Segments_Numbers(4) := ' ';
      PinMode(Chip.T_47Segments_LED_A, Output);
      PinMode(Chip.T_47Segments_LED_B, Output);
      PinMode(Chip.T_47Segments_LED_C, Output);
      PinMode(Chip.T_47Segments_LED_D, Output);
      PinMode(Chip.T_47Segments_LED_E, Output);
      PinMode(Chip.T_47Segments_LED_F, Output);
      PinMode(Chip.T_47Segments_LED_G, Output);
      PinMode(Chip.T_47Segments_LED_DP, Output);
      PinMode(Chip.T_47Segments_COM_1, Output);
      PinMode(Chip.T_47Segments_COM_2, Output);
      PinMode(Chip.T_47Segments_COM_3, Output);
      PinMode(Chip.T_47Segments_COM_4, Output);
      init_Watchdog;
   end Init;


   procedure Init(Chip : in out T_47Segments) is
   begin
      Init(Chip, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13);
   end Init;

   procedure Write47Segments(Chip : T_47Segments;
                            A : Boolean;
                            B : Boolean;
                            C : Boolean;
                            D : Boolean;
                            E : Boolean;
                            F : Boolean;
                            G : Boolean;
                            DP : Boolean) is
   begin
      DigitalWrite(Chip.T_47Segments_LED_A,A);
      DigitalWrite(Chip.T_47Segments_LED_B,B);
      DigitalWrite(Chip.T_47Segments_LED_C,C);
      DigitalWrite(Chip.T_47Segments_LED_D,D);
      DigitalWrite(Chip.T_47Segments_LED_E,E);
      DigitalWrite(Chip.T_47Segments_LED_F,F);
      DigitalWrite(Chip.T_47Segments_LED_G,G);
      DigitalWrite(Chip.T_47Segments_LED_DP,DP);
   end Write47Segments;

   procedure PrintNumber47Segments(Chip : in out T_47Segments; SegmentNumber : Integer; Number : Character) is
   begin
      Chip.T_47Segments_Numbers(SegmentNumber) := Number;
   end PrintNumber47Segments;

   procedure PrintNumber47Segments(Chip : in out T_47Segments; Numbers : T_4Chars) is
   begin
      for i in 1..Numbers'Length loop
         PrintNumber47Segments(Chip, i, Numbers(i));
      end loop;
   end PrintNumber47Segments;

   procedure UpdateSegmentNumber(Chip : T_47Segments ; SegmentNumber : Integer) is
   begin
      DigitalWrite(Chip.T_47Segments_COM_1,False);
      DigitalWrite(Chip.T_47Segments_COM_2,False);
      DigitalWrite(Chip.T_47Segments_COM_3,False);
      DigitalWrite(Chip.T_47Segments_COM_4,False);
      case SegmentNumber is
         when 1 => -- COM 1
            DigitalWrite(Chip.T_47Segments_COM_1,True);
         when 2 => -- COM 2
            DigitalWrite(Chip.T_47Segments_COM_2,True);
         when 3 => -- COM 3
            DigitalWrite(Chip.T_47Segments_COM_3,True);
         when 4 => -- COM 4
            DigitalWrite(Chip.T_47Segments_COM_4,True);
         when others => null;
      end case;
      case Chip.T_47Segments_Numbers(SegmentNumber) is
         when '0' => -- Print 0
            Write47Segments(Chip, False, False, False, False, False, False, True, True);
         when '1' => -- Print 1
            Write47Segments(Chip, True, False, False, True, True, True, True, True);
         when '2' => -- Print 2
            Write47Segments(Chip, False, False, True, False, False, True, False, True);
         when '3' => -- Print 3
            Write47Segments(Chip, False, False, False, False, True, True, False, True);
         when '4' => -- Print 4
            Write47Segments(Chip, True, False, False, True, True, False, False, True);
         when '5' => -- Print 5
            Write47Segments(Chip, False, True, False, False, True, False, False, True);
         when '6' => -- Print 6
            Write47Segments(Chip, False, True, False, False, False, False, False, True);
         when '7' => -- Print 7
            Write47Segments(Chip, False, False, False, True, True, True, True, True);
         when '8' => -- Print 8
            Write47Segments(Chip, False, False, False, False, False, False, False, True);
         when '9' => -- Print 9
            Write47Segments(Chip, False, False, False, False, True, False, False, True);
         when '.' => -- Print Dot Point
            Write47Segments(Chip, True, True, True, True, True, True, True, False);
         when ' ' => -- Print Space
            Write47Segments(Chip, True, True, True, True, True, True, True, True);
         when others => null;
      end case;
   end UpdateSegmentNumber;

   procedure Update47Segments(Chip : T_47Segments) is
   begin
      for i in 1..4 loop
         delay 0.01;
         UpdateSegmentNumber(Chip,i);
      end loop;
   end Update47Segments;

   procedure ClearSegmentNumberFrom47Segment(Chip : in out T_47Segments; SegmentNumber : Integer) is
   begin
      PrintNumber47Segments(Chip, SegmentNumber, ' ');
   end ClearSegmentNumberFrom47Segment;

   procedure Clear47Segment(Chip : in out T_47Segments) is
   begin
      for i in 1..4 loop
         ClearSegmentNumberFrom47Segment(Chip, i);
      end loop;
   end Clear47Segment;

   procedure WatchDog_Interrupt(Chip : in  out T_47Segments);

   pragma Machine_Attribute (Entity         => WatchDog_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, WatchDog_Interrupt, MCU.Sig_WDT_String);

   procedure WatchDog_Interrupt(Chip : in  out T_47Segments) is
      --counter : Integer := 0;
   begin
      ClearSegmentNumberFrom47Segment(Chip, counter);
      counter := ( counter + 1 ) mod 4;
   end WatchDog_Interrupt;

end lib47segments;
