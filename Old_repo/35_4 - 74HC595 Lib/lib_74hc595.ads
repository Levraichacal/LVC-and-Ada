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

with LVC.PINS;
use LVC.PINS;

package LIB_74HC595 is

   --  A new type to send and manipulate the eight outputs of the 74HC595
   type T_Register is array (0..7) of Boolean;

   --  Initialisation of the 74HC595 with SER, RCLK, SRCLK where you want for example
   -- Init(D8, D9, D10);
   procedure Init(ser : lvcPins; rclk : lvcPins; srclk : lvcPins);

   --  Initialisation of the 74HC595 with SER on D8, RCLK on D9 and SRCLK on D10
   procedure Init;

   --  Set false to all the values of the register
   procedure ClearRegister;

   --  Set true to all the values of the register
   procedure EmptyRegister;

   --  Write the register to the 74HC595
   procedure WriteRegister;

   --  Write the register register to the 74HC595
   procedure WriteRegister (register : T_Register);

   -- Set the value value at the index index of the 74HC595
   procedure SetRegisterValue (index: Integer; value : Boolean);

end LIB_74HC595;
