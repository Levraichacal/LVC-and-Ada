---------------------------------------------------------------------------
--                 Library of the 74HC595                                --
--  This library is free software                                        --
--                                                                       --
--   Mapping of the 54HC795                                              --
--       ____  ____                                                      --
--  QB -|1   \/  16| - VCC                                               --
--  QC -|2       15| - QA                                                --
--  QD -|3       14| - SER                                               --
--  QE -|4       13| - /OE                                               --
--  QF -|5       12| - RCLK                                              --
--  QG -|6       11| - SRCLK                                             --
--  QH -|7       10| - /SRCLR                                            --
-- GND -|8        9| - QH'                                               --
--      |__________|                                                     --
---------------------------------------------------------------------------

with GPIO;
use GPIO;

package LIB_74HC595 is

   --  A type to made the difference between the T_74HC795
   type T_74HC795 is private;

   --  A new type to send and manipulate the eight outputs of the 74HC595
   type T_Register is array (0..7) of Boolean;

   --  Initialisation of the 74HC595 with SER, RCLK, SRCLK where you want for example
   -- Init(D8, D9, D10);
   procedure Init(Chip : in out T_74HC795; Ser : lvcPins; Rclk : lvcPins; Srclk : lvcPins);

   --  Initialisation of the 74HC595 with SER on D8, RCLK on D9 and SRCLK on D10
   procedure Init(Chip : in out T_74HC795);

   --  Set false to all the Values of the Register
   procedure ClearRegister(Chip : in out T_74HC795);

   --  Set true to all the Values of the Register
   procedure EmptyRegister(Chip : in out T_74HC795);

   --  Write the Register to the 74HC595
   procedure WriteRegister(Chip : in out T_74HC795);

   --  Write the Register Register to the 74HC595
   procedure WriteRegister (Chip : in out T_74HC795;Register : T_Register);

   -- Set the Value Value at the Index Index of the 74HC595
   procedure SetRegisterValue (Chip : in out T_74HC795; Index: Integer; Value : Boolean);

private

   type T_74HC795 is record
      T_74HC795_Register : T_Register;
      T_74HC795_SER : lvcPins;
      T_74HC795_RCLK : lvcPins;
      T_74HC795_SRCLK : lvcPins;
   end record;
end LIB_74HC595;
