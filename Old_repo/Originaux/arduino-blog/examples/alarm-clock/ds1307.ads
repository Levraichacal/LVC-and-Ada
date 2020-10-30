with Interfaces;

package DS1307 is
   subtype Year_Number     is Interfaces.Unsigned_8; -- offset to the year 2000
   subtype Month_Number    is Interfaces.Unsigned_8 range 1 .. 12;
   subtype Day_Number      is Interfaces.Unsigned_8 range 1 .. 31;
   subtype Hour_Number     is Interfaces.Unsigned_8 range 0 .. 23;
   subtype Minute_Number   is Interfaces.Unsigned_8 range 0 .. 59;
   subtype Second_Number   is Interfaces.Unsigned_8 range 0 .. 59;

   type Date_Time is record
      Seconds : Second_Number;
      Minutes : Minute_Number;
      Hours   : Hour_Number;
      Day     : Day_Number;
      Month   : Month_Number;
      Year    : Year_Number;
   end record;

   procedure Init;
   function Is_Running return Boolean;
   procedure Set_Time (New_Time : Date_Time);
   procedure Read_Time (Current_Time : out Date_Time; Status : out Boolean);
end DS1307;
