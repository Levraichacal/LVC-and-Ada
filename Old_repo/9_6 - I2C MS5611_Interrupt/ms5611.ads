with LVC.PINS;   use LVC.PINS;
with Interfaces; use Interfaces;


package MS5611 is

   procedure Start;

--   procedure Init(SCL_Port : lvcPins; SDA_Port : lvcPins; Speed : Unsigned_16 := 1000000);

   procedure Init(SCL_Port : lvcPins ; SDA_Port : lvcPins);

   procedure Stop;

   function GetC1 return Unsigned_16;

   function GetC2 return Unsigned_16;

   function GetC3 return Unsigned_16;

   function GetC4 return Unsigned_16;

   function GetC5 return Unsigned_16;

   function GetC6 return Unsigned_16;

   function GetTemperature return Unsigned_32;

   function GetPressure return Unsigned_32;

end MS5611;
