with Interfaces;
with LVC.PINS;

package LVC.I2C is

   type Error_Status is (No_Error, Error_Start, No_Slave_Ack, No_Data_Ack);

   type Data_Type is record
      error_status : LVC.I2C.Error_Status;
      data : Interfaces.Unsigned_32;
   end record;

   procedure Init (SDA_Port : LVC.PINS.lvcPins; SCL_Port : LVC.PINS.lvcPins);

   function Write_Data(Address : Interfaces.Unsigned_8; Cmd : Interfaces.Unsigned_8) return Error_Status;

   function Read_Data(Address : Interfaces.Unsigned_8; Number_Of_Bytes : Interfaces.Unsigned_8) return LVC.I2C.Data_Type;

   procedure Stop;

end LVC.I2C;
