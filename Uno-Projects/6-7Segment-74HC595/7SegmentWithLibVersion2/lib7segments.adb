with GPIO;
use GPIO;

package body lib7segments is

   procedure Init(Chip : in out T_7Segments; Common_Cathod : Boolean; Led_A : lvcPins;
                  Led_B : lvcPins; Led_C : lvcPins; Led_D : lvcPins; Led_E : lvcPins;
                  Led_F : lvcPins; Led_G : lvcPins; Led_DP : lvcPins) is
   begin
      Chip.T_7Segments_Common_Cathod :=  Common_Cathod ;
      Chip.T_7Segments_LED_A := Led_A;
      Chip.T_7Segments_LED_B := Led_B;
      Chip.T_7Segments_LED_C := Led_C;
      Chip.T_7Segments_LED_D := Led_D;
      Chip.T_7Segments_LED_E := Led_E;
      Chip.T_7Segments_LED_F := Led_F;
      Chip.T_7Segments_LED_G := Led_G;
      Chip.T_7Segments_LED_DP := Led_DP;
      Chip.T_7Segments_Common_Cathod_False := not Common_Cathod;
      PinMode(Chip.T_7Segments_LED_A, Output);
      PinMode(Chip.T_7Segments_LED_B, Output);
      PinMode(Chip.T_7Segments_LED_C, Output);
      PinMode(Chip.T_7Segments_LED_D, Output);
      PinMode(Chip.T_7Segments_LED_E, Output);
      PinMode(Chip.T_7Segments_LED_F, Output);
      PinMode(Chip.T_7Segments_LED_G, Output);
      PinMode(Chip.T_7Segments_LED_DP, Output);
   end Init;


   procedure Init(Chip : in out T_7Segments; Common_Cathod : Boolean) is
   begin
      Init(Chip, Common_Cathod, D2, D3, D4, D5, D6, D7, D8, D9);
   end Init;

   procedure Write7Segments(Chip : T_7Segments;
                            A : Boolean;
                            B : Boolean;
                            C : Boolean;
                            D : Boolean;
                            E : Boolean;
                            F : Boolean;
                            G : Boolean;
                            DP : Boolean) is
   begin
      DigitalWrite(Chip.T_7Segments_LED_A,A);
      DigitalWrite(Chip.T_7Segments_LED_B,B);
      DigitalWrite(Chip.T_7Segments_LED_C,C);
      DigitalWrite(Chip.T_7Segments_LED_D,D);
      DigitalWrite(Chip.T_7Segments_LED_E,E);
      DigitalWrite(Chip.T_7Segments_LED_F,F);
      DigitalWrite(Chip.T_7Segments_LED_G,G);
      DigitalWrite(Chip.T_7Segments_LED_DP,DP);
   end Write7Segments;

   procedure PrintNumber7Segments(Chip : T_7Segments; Number : Character) is
   begin
      case Number is
         when '0' => -- Print 0
            Write7Segments(Chip, Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod_False);
         when '1' => -- Print 1
            Write7Segments(Chip, Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod_False);
         when '2' => -- Print 2
            Write7Segments(Chip, Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False);
         when '3' => -- Print 3
            Write7Segments(Chip, Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False);
         when '4' => -- Print 4
            Write7Segments(Chip, Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False);
         when '5' => -- Print 5
            Write7Segments(Chip, Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False);
         when '6' => -- Print 6
            Write7Segments(Chip, Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False);
         when '7' => -- Print 7
            Write7Segments(Chip, Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod_False);
         when '8' => -- Print 8
            Write7Segments(Chip, Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False);
         when '9' => -- Print 9
            Write7Segments(Chip, Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod,
            Chip.T_7Segments_Common_Cathod, Chip.T_7Segments_Common_Cathod_False);
         when '.' => -- Print Dot Point
            Write7Segments(Chip, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod_False, Chip.T_7Segments_Common_Cathod_False,
            Chip.T_7Segments_Common_Cathod);
         when others => null;
      end case;
   end PrintNumber7Segments;
end lib7segments;
