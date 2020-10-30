with LVC.I2C;
with LVC.PINS;
with Interfaces;

use LVC.I2C;
use Interfaces;

package MS5611 is

   type MS5611_Coefficient is (C1,C2,C3,C4,C5,C6);

   type MS5611_Resolution is (D256,D512,D1024,D2048,D4096);

   function getTemperature return Unsigned_32;

   function getPressure return Unsigned_32;

   function getCoefficient (Coefficient : MS5611_Coefficient) return Unsigned_16;

   procedure setResolution (Resolution : MS5611_Resolution);

   procedure Init(SDA_Port : LVC.PINS.lvcPins; SCL_Port : LVC.PINS.lvcPins);

   procedure Stop;

   function Reset return Error_Status;

end MS5611;
