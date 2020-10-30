with Two_Wire;
use Two_Wire;
with Ada.Unchecked_Conversion;

package body I2c_hmc5883l is

-----------------------------------

   function U8_To_U16 is
      new Ada.Unchecked_Conversion (Source => Unsigned_8,
                                    Target => Unsigned_16);
--    function U8_To_DataBuffer is
--       new Ada.Unchecked_Conversion (Source => Unsigned_8,
--                                     Target => Data_Buffer);

   function U8_To_U32 is
      new Ada.Unchecked_Conversion (Source => Unsigned_8,
                                    Target => Unsigned_32);

   function fastRegister8 (reg : Unsigned_8) return Unsigned_8 is
      value : Unsigned_8;
      temp : Data_Buffer(1..2);
   begin
      temp(1) := reg;
      Write_Data(HMC5883L_ADDRESS,temp(1..1));
      Request_Data(HMC5883L_ADDRESS,2);
      value := Receive;
      return value;
   end fastRegister8;

   procedure setRange(HMC5883L_range : T_HMC5883L_Range) is
      temp : Data_Buffer(1..2);
      val : Unsigned_8;
   begin
      case HMC5883L_range is
         when HMC5883L_RANGE_0_88GA =>
            val := 2#000#;
            mgPerDigit := 730; -- 0.73;

         when HMC5883L_RANGE_1_3GA =>
            val := 2#001#;
            mgPerDigit := 920; -- 0.92;

         when HMC5883L_RANGE_1_9GA =>
            val := 2#010#;
            mgPerDigit := 1220; -- 1.22;

         when HMC5883L_RANGE_2_5GA =>
            val := 2#011#;
            mgPerDigit := 1520; -- 1.52;

         when HMC5883L_RANGE_4GA =>
            val := 2#100#;
            mgPerDigit := 2270; -- 2.27;

         when HMC5883L_RANGE_4_7GA =>
            val := 2#101#;
            mgPerDigit := 2560; -- 2.56;

         when HMC5883L_RANGE_5_6GA =>
            val := 2#110#;
            mgPerDigit := 3030; -- 3.03;

         when HMC5883L_RANGE_8_1GA =>
            val := 2#111#;
            mgPerDigit := 4350; -- 4.35;

      end case;
      temp(1) := HMC5883L_REG_CONFIG_B;
      temp(2) := val*2#10000#;
      Write_Data(HMC5883L_ADDRESS,temp);
   end setRange;

   procedure setMeasurementMode(HMC5883L_MeasurementMode : T_HMC5883L_Mode) is
      val : Unsigned_8;
      temp : Data_Buffer(1..2);
   begin
      temp(1) := HMC5883L_REG_MODE;
      Write_Data(HMC5883L_ADDRESS,temp(1..1));
      Request_Data(HMC5883L_ADDRESS,1);
      val := Receive;
      val := val and 2#11111100#;
      case HMC5883L_MeasurementMode is
         when HMC5883L_CONTINOUS =>
            val := val or 2#00#;
         when HMC5883L_SINGLE =>
            val := val or 2#01#;
         when HMC5883L_IDLE =>
            val := val or 2#10#;
      end case;
      temp(2) := val;
      Write_Data(HMC5883L_ADDRESS,temp);
   end setMeasurementMode;

   procedure setDataRate(HMC5883L_DataRate : T_HMC5883L_DataRate) is
      val : Unsigned_8;
      temp : Data_Buffer(1..2);
   begin
      temp(1) := HMC5883L_REG_CONFIG_A;
      Write_Data(HMC5883L_ADDRESS,temp(1..1));
      Request_Data(HMC5883L_ADDRESS,1);
      val := Receive;
      val := val and 2#11100011#;
      case HMC5883L_DataRate is
         when HMC5883L_DATARATE_0_75_HZ =>
            val := val or (2#000#*2#10#);
         when HMC5883L_DATARATE_1_5HZ =>
            val := val or (2#001#*2#10#);
         when HMC5883L_DATARATE_3HZ =>
            val := val or (2#010#*2#10#);
         when HMC5883L_DATARATE_7_5HZ =>
            val := val or (2#011#*2#10#);
         when HMC5883L_DATARATE_15HZ =>
            val := val or (2#100#*2#10#);
         when HMC5883L_DATARATE_30HZ =>
            val := val or (2#101#*2#10#);
         when HMC5883L_DATARATE_75HZ =>
            val := val or (2#110#*2#10#);
      end case;
      temp(2) := val;
      Write_Data(HMC5883L_ADDRESS,temp);
   end setDataRate;

   procedure setSamples(HMC5883L_sample : T_HMC5883L_Sample) is
      val : Unsigned_8;
      temp : Data_Buffer(1..2);
   begin
      temp(1) := HMC5883L_REG_CONFIG_A;
      Write_Data(HMC5883L_ADDRESS,temp(1..1));
      Request_Data(HMC5883L_ADDRESS,1);
      val := Receive;
      val := val and 2#10011111#;
      case HMC5883L_sample is
         when HMC5883L_SAMPLES_1 =>
            val := val or (2#00#*2#10000#);
         when HMC5883L_SAMPLES_2 =>
            val := val or (2#01#*2#10000#);
         when HMC5883L_SAMPLES_4 =>
            val := val or (2#10#*2#10000#);
         when HMC5883L_SAMPLES_8 =>
            val := val or (2#11#*2#10000#);
      end case;
      temp(2) := val;
      Write_Data(HMC5883L_ADDRESS,temp);
   end setSamples;

   function readRaw return Vector is
      temp : Unsigned_8;
      tempVector : Vector;
      tempBuff : Data_Buffer(1..3);
   begin
      tempBuff(1) := HMC5883L_REG_OUT_X_M;
      tempBuff(2) := HMC5883L_REG_OUT_Y_M;
      tempBuff(3) := HMC5883L_REG_OUT_Z_M;
      Write_Data(HMC5883L_ADDRESS,tempBuff(1..1));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.X := Integer_16(U8_To_U16(temp)*256 + U8_To_U16(Receive) - U8_To_U16(xOffset));
      Write_Data(HMC5883L_ADDRESS,tempBuff(2..2));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.Y := Integer_16(U8_To_U16(temp)*256 + U8_To_U16(Receive)- U8_To_U16(yOffset));
      Write_Data(HMC5883L_ADDRESS,tempBuff(3..3));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.Z := Integer_16(U8_To_U16(temp)*256 + U8_To_U16(Receive));
      return tempVector;
   end readRaw;

   function readNormalize return Vectorf is
      temp : Unsigned_8;
      tempVectorF : Vectorf;
      --tempBuff : Data_Buffer(1..3);
      tempVector: Vector;
   begin
      -- tempBuff(1) := HMC5883L_REG_OUT_X_M;
      -- tempBuff(2) := HMC5883L_REG_OUT_Y_M;
      -- tempBuff(3) := HMC5883L_REG_OUT_Z_M;
      -- Write_Data(HMC5883L_ADDRESS,tempBuff(1..1));
      -- Request_Data(HMC5883L_ADDRESS,2);
      -- temp := Receive;
      -- tempVector.X := Integer_32((U8_To_U32(temp)*256 + U8_To_U32(Receive) - U8_To_U32(xOffset)))*mgPerDigit;
      -- Write_Data(HMC5883L_ADDRESS,tempBuff(2..2));
      -- Request_Data(HMC5883L_ADDRESS,2);
      -- temp := Receive;
      -- tempVector.Y := Integer_32((U8_To_U32(temp)*256 + U8_To_U32(Receive)- U8_To_U32(yOffset)))*mgPerDigit;
      -- Write_Data(HMC5883L_ADDRESS,tempBuff(3..3));
      -- Request_Data(HMC5883L_ADDRESS,2);
      -- temp := Receive;
      -- tempVector.Z := Integer_32((U8_To_U32(temp)*256 + U8_To_U32(Receive)))*mgPerDigit;
      tempVector := readRaw;
      tempVectorF.X := Integer_32(tempVector.X)*mgPerDigit;
      tempVectorF.Y := Integer_32(tempVector.Y)*mgPerDigit;
      tempVectorF.Z := Integer_32(tempVector.Z)*mgPerDigit;
      return tempVectorF;
   end readNormalize;

   function beginHMC5883L return Boolean is
   begin
      Two_Wire.Init;
      if ((not((fastRegister8(HMC5883L_REG_IDENT_A) = 16#48#)))
           or (not((fastRegister8(HMC5883L_REG_IDENT_B) = 16#34#)))
           or (not((fastRegister8(HMC5883L_REG_IDENT_C) = 16#33#)))) then
         return False;
      end if;
      setRange(HMC5883L_RANGE_1_3GA); -- HMC5883L_RANGE_1_3GA);
      setMeasurementMode(HMC5883L_CONTINOUS);
      setDataRate(HMC5883L_DATARATE_15HZ); -- HMHMC5883L_DATARATE_15HZ);
      setSamples(HMC5883L_SAMPLES_1);
      return True;
   end beginHMC5883L;

   procedure setOffset(X0 : Unsigned_8; Y0 : Unsigned_8) is
   begin
      xOffset := X0;
      yOffset := Y0;
   end setOffset;

   function getRange return T_HMC5883L_Range is
      TempRange : T_HMC5883L_Range;
      value : Unsigned_8;
   begin
      value := fastRegister8(HMC5883L_REG_CONFIG_B);
      value := value/2#10000#;
      TempRange := T_HMC5883L_Range'Val(value);
      return TempRange;
   end getRange;

   function getMeasurementMode return T_HMC5883L_Mode is
      TempMode : T_HMC5883L_Mode;
      value : Unsigned_8;
   begin
      value := fastRegister8(HMC5883L_REG_MODE);
      value := value and 2#00000011#;
      TempMode := T_HMC5883L_Mode'Val(value);
      return TempMode;
   end getMeasurementMode;

   function getDataRate return T_HMC5883L_DataRate is
      TempDataRate: T_HMC5883L_DataRate;
      value : Unsigned_8;
   begin
      value := fastRegister8(HMC5883L_REG_CONFIG_A);
      value := value and 2#00011100#;
      value := value/2#10#;
      TempDataRate := T_HMC5883L_DataRate'Val(value);
      return TempDataRate;
   end getDataRate;

   function getSamples return T_HMC5883L_Sample is
      TempSample : T_HMC5883L_Sample;
      value : Unsigned_8;
   begin
      value := fastRegister8(HMC5883L_REG_CONFIG_A);
      value := value and 2#01100000#;
      value := value/2#10000#;
      TempSample := T_HMC5883L_Sample'Val(value);
      return TempSample;
   end getSamples;

end I2c_hmc5883l;
