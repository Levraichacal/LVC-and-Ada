with Interfaces;

with Two_Wire;

package body DS1307 is
   use Interfaces;
   -- DS1307_Address : constant := 16#D0#;
   DS1307_Address : constant := 16#68#;

   procedure Init is
   begin
      Two_Wire.Init;
   end Init;

   function Is_Running return Boolean is
      Val     : Unsigned_8;
      Command : Two_Wire.Data_Buffer (1..1) := (1 => 0);
   begin
      Two_Wire.Write_Data (DS1307_Address, Command);
      Two_Wire.Request_Data (DS1307_Address, 1);
      Val := Two_Wire.Receive;

      return not ((Val and 16#80#) = 16#80#);
   end Is_Running;

   function BCD_To_Dec (Val : Unsigned_8) return Unsigned_8 is
   begin
      return Val - (6 * (Val / 16));
   end BCD_To_Dec;

   function Dec_To_BCD (Val : Unsigned_8) return Unsigned_8 is
   begin
      return Val + (6 * (Val / 10));
   end Dec_To_BCD;

   procedure Set_Time (New_Time : Date_Time) is
      Command : Two_Wire.Data_Buffer (1..8) :=
         (1 => 0,
          2 => Dec_To_BCD (New_Time.Seconds) and 2#0111_1111#,
          3 => Dec_To_BCD (New_Time.Minutes),
          4 => Dec_To_BCD (New_Time.Hours) and 2#0011_1111#,
          5 => 0,
          6 => Dec_To_BCD (New_Time.Day),
          7 => Dec_To_BCD (New_Time.Month),
          8 => Dec_To_BCD (New_Time.Year));
   begin
      Two_Wire.Write_Data (DS1307_Address, Command);
   end Set_Time;

   procedure Read_Time (Current_Time : out Date_Time; Status : out Boolean) is
      use type Two_Wire.TWI_Error_Enum;

      Command : Two_Wire.Data_Buffer (1..1) := (1 => 0);

      Seconds, Minutes, Hours, Day, Month, Year : Unsigned_8;
      Err : Two_Wire.TWI_Error_Enum;
   begin
      Two_Wire.Write_Data (DS1307_Address, Command);
      Two_Wire.Request_Data (DS1307_Address, 7);

      Err := Two_Wire.Get_Error;
      if Err /= Two_Wire.TWI_No_Error then
         Status := False;
         return;
      end if;

      Seconds := BCD_To_Dec (Two_Wire.Receive and 16#7F#);
      Minutes := BCD_To_Dec (Two_Wire.Receive);
      Hours   := BCD_To_Dec (Two_Wire.Receive);
      Day     := BCD_To_Dec (Two_Wire.Receive);
      Day     := BCD_To_Dec (Two_Wire.Receive);
      Month   := BCD_To_Dec (Two_Wire.Receive);
      Year    := BCD_To_Dec (Two_Wire.Receive);

      Current_Time := Date_Time'(
        Seconds => Seconds,
        Minutes => Minutes,
        Hours   => Hours,
        Day     => Day,
        Month   => Month,
        Year    => Year
        );

      Status := True;
   end Read_Time;
end DS1307;
