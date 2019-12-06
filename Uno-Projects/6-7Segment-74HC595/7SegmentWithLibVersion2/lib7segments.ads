---------------------------------------------------------------------------
--                 Library of 7 segments                                 --
--                                                                       --
--  This library is free software                                        --
--                                                                       --
---------------------------------------------------------------------------

with GPIO;
use GPIO;

package lib7segments is

   --  A type control the 7 segments
   type T_7Segments is private;

   --  Initialisation of the 7Segments
   --  Parameters:
   --   - Common_Cathode: Boolean => True for common cathode, false for common anode
   --   - LED A
   --   - LED B
   --   - LED C
   --   - LED D
   --   - LED E
   --   - LED F
   --   - LED G
   --   - LED DP
   -- Example
   procedure Init(Chip : in out T_7Segments; Common_Cathod : Boolean; Led_A : lvcPins;
                  Led_B : lvcPins; Led_C : lvcPins; Led_D : lvcPins; Led_E : lvcPins;
                  Led_F : lvcPins; Led_G : lvcPins; Led_DP : lvcPins);

   --  Initialisation of the 7Segments with A on D2, B on D3, C on D4, D on D5,
   --  E on D6, F on D7, G on D8, DP on D9
   procedure Init(Chip : in out T_7Segments; Common_Cathod : Boolean);

   --  Write the Print Number to the 7 Segments
   procedure PrintNumber7Segments(Chip : T_7Segments; Number : Character);

private

   type T_7Segments is record
      T_7Segments_Common_Cathod : Boolean;
      T_7Segments_LED_A : lvcPins;
      T_7Segments_LED_B : lvcPins;
      T_7Segments_LED_C : lvcPins;
      T_7Segments_LED_D : lvcPins;
      T_7Segments_LED_E : lvcPins;
      T_7Segments_LED_F : lvcPins;
      T_7Segments_LED_G : lvcPins;
      T_7Segments_LED_DP : lvcPins;
      T_7Segments_Common_Cathod_False : Boolean;
   end record;

end lib7segments;
