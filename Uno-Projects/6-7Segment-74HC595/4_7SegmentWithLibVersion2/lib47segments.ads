---------------------------------------------------------------------------
--                 Library of 7 segments                                 --
--                                                                       --
--  This library is free software                                        --
--                                                                       --
---------------------------------------------------------------------------

with GPIO;
use GPIO;

package lib47segments is

   --  A type to store the four digits
   type T_4Chars is array (1..4) of Character;

   --  A type control the 4*7 segments
   type T_47Segments is private;

   --  Initialisation of the 4*7Segments
   --  Parameters:
   --   - LED A  - 11
   --   - LED B  -  7
   --   - LED C  -  4
   --   - LED D  -  2
   --   - LED E  -  1
   --   - LED F  - 10
   --   - LED G  -  5
   --   - LED DP -  3
   --   - COM 1  - 12
   --   - COM 2  -  9
   --   - COM 3  -  8
   --   - COM 4  -  6
   -- Example
   procedure Init(Chip : in out T_47Segments; Led_A : lvcPins;
                  Led_B : lvcPins; Led_C : lvcPins; Led_D : lvcPins; Led_E : lvcPins;
                  Led_F : lvcPins; Led_G : lvcPins; Led_DP : lvcPins;
                  Com_1 : lvcPins; Com_2 : lvcPins; Com_3 : lvcPins; Com_4 : lvcPins);

   --  Initialisation of the 4*7Segments with A on D2, B on D3, C on D4, D on D5,
   --  E on D6, F on D7, G on D8, DP on D9, Com_1 on D10, Com_2 on D11, Com_3 on D12,
   --  Com_4 on D13.
   procedure Init(Chip : in out T_47Segments);

   --  Write the Print Number to the SegmentNumber Segments
   procedure PrintNumber47Segments(Chip : in out T_47Segments; SegmentNumber : Integer; Number : Character);

   --  Write the Print Numbers
   procedure PrintNumber47Segments(Chip : in out T_47Segments; Numbers : T_4Chars);

   --  Update Screen
   procedure Update47Segments(Chip : T_47Segments);

   --  Clear the segment number SegmentNumber from 47Segment
   procedure ClearSegmentNumberFrom47Segment(Chip : in out T_47Segments; SegmentNumber : Integer);

   --  Clear the 47segment
   procedure Clear47Segment(Chip : in out T_47Segments);

private

   type T_47Segments is record
      T_47Segments_LED_A : lvcPins;
      T_47Segments_LED_B : lvcPins;
      T_47Segments_LED_C : lvcPins;
      T_47Segments_LED_D : lvcPins;
      T_47Segments_LED_E : lvcPins;
      T_47Segments_LED_F : lvcPins;
      T_47Segments_LED_G : lvcPins;
      T_47Segments_LED_DP : lvcPins;
      T_47Segments_COM_1 : lvcPins;
      T_47Segments_COM_2 : lvcPins;
      T_47Segments_COM_3 : lvcPins;
      T_47Segments_COM_4 : lvcPins;
      T_47Segments_Numbers : T_4Chars;
   end record;

end lib47segments;
