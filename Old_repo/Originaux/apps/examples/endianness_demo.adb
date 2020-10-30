
pragma Ada_2005;
with System; use System;
with AVR.UART; use AVR.UART;

procedure Endianness_Demo is

   -------------------------
   -- Common declarations --
   -------------------------

   subtype Yr_Type is Natural range 0 .. 127;
   subtype Mo_Type is Natural range 1 .. 12;
   subtype Da_Type is Natural range 1 .. 31;

   type Date is record
      Years_Since_1980 : Yr_Type;
      Month            : Mo_Type;
      Day_Of_Month     : Da_Type;
   end record;

   for Date use record
      Years_Since_1980 at 0 range 0  ..  6;
      Month            at 0 range 7  .. 10;
      Day_Of_Month     at 0 range 11 .. 15;
   end record;
   --  endianness_demo.adb:23:35: info: reverse bit order in machine scalar of length 16
   --  endianness_demo.adb:23:35: info: little-endian range for component "Years_Since_1980" is 9 .. 15
   --  endianness_demo.adb:24:35: info: reverse bit order in machine scalar of length 16
   --  endianness_demo.adb:24:35: info: little-endian range for component "Month" is 5 .. 8
   --  endianness_demo.adb:25:35: info: reverse bit order in machine scalar of length 16
   --  endianness_demo.adb:25:35: info: little-endian range for component "Day_Of_Month" is 0 .. 4

   ------------------------------------------------------------
   -- Derived types with different representation attributes --
   ------------------------------------------------------------

   --  Bit order only

   type Date_LE_Bits is new Date;
   for Date_LE_Bits'Bit_Order use System.Low_Order_First;

   type Date_BE_Bits is new Date;
   for Date_BE_Bits'Bit_Order use System.High_Order_First;

   --  Bit order and scalar storage order (note: if the latter is specified,
   --  it must be consistent with the former).

   type Date_LE is new Date;
   for Date_LE'Bit_Order use System.Low_Order_First;
   for Date_LE'Scalar_Storage_Order use System.Low_Order_First;

   type Date_BE is new Date;
   for Date_BE'Bit_Order use System.High_Order_First;
   -- for Date_BE'Scalar_Storage_Order use System.High_Order_First;
   -- "sorry, unimplemented: non-default Scalar_Storage_Order"

   ----------------------------
   -- Show bits at address A --
   ----------------------------

   procedure Show (A : System.Address) is
      Arr : AVR.Nat8_Array (1 .. 2);
      for Arr'Address use A;
      pragma Import (Ada, Arr);
   begin
      for J in Arr'Range loop
         Put (' '); Put (Arr (J));
      end loop;
      New_Line;
   end Show;

   D_N  : Date    := (32, 12, 12);
   --  Native storage (no attribute specified)

   D_LE_Bits : Date_LE_Bits := (32, 12, 12);
   D_BE_Bits : Date_BE_Bits := (32, 12, 12);

   D_LE : Date_LE := (32, 12, 12);
   D_BE : Date_BE := (32, 12, 12);

begin
   AVR.UART.Init (Baud_19200_16MHz);

   if System.Default_Bit_Order = System.Low_Order_First then
      Put_Line ("Default bit order: Low_Order_First");
   else
      Put_Line ("Default bit order: High_Order_First");
   end if;

   Put ("N      :"); Show (D_N 'Address);

   Put ("LE_Bits:"); Show (D_LE_Bits'Address);
   Put ("BE_Bits:"); Show (D_BE_Bits'Address);

   Put ("LE:     "); Show (D_LE'Address);
   Put ("BE:     "); Show (D_BE'Address);
   Put_Line ("###################################");
end Endianness_Demo;

--  Output:
--  Default bit order: Low_Order_First
--  N      : 32 102
--  LE_Bits: 32 102
--  BE_Bits: 140 65
--  LE:      32 102
--  BE:      140 65
