with LVC.PINS;
use LVC.PINS;
with Interfaces;
use Interfaces;
with System;
use System;

package DHT11 is

-----------------------------------------------------------------------------------------------------------
--  LES TYPES
-----------------------------------------------------------------------------------------------------------
   -- The DHT11 status
   type T_DHT11_Status is (DHT11_Success,
                         DHT11_TimeOut_Error,
                         DHT11_CheckSum_Error);

   -- The return Data type
   type T_DHT11_Data is record
      Status       : T_DHT11_Status;
      Temperature  : Unsigned_8;
      Humidity     : Unsigned_8;
      CRC          : Unsigned_8;
   end record;

   -- Procedure for initialize the DHT11
   procedure Init(Pin : lvcPins);

   -- Function for getting Data
   function GetData return T_DHT11_Data;

private
   type T_Port is record
      Pin : lvcPins;
      Mask : Unsigned_8;
      Port : lvcPort;
      Mode : lvcMode;
      -- InReg : Unsigned_8;
      -- OutReg : Unsigned_8;
      -- InReg_Add : Unsigned_8;
      -- OutReg_Add : Unsigned_8;
   end record;

   type T_Ptr_Port is access T_Port;
   P_Port : T_Ptr_Port;

end DHT11 ;
