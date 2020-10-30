with Two_Wire;
use Two_Wire;
with Ada.Unchecked_Conversion;

package body I2c_hmc5883l is

   mgPerDigit : Unsigned_32;
-----------------------------------
-- Initialisation et fonction I2C
--    procedure Init is
--    begin
--       Two_Wire.Init;
--    end Init;
   function U8_To_U16 is
      new Ada.Unchecked_Conversion (Source => Unsigned_8,
                                    Target => Unsigned_16);
--    function U8_To_DataBuffer is
--       new Ada.Unchecked_Conversion (Source => Unsigned_8,
--                                     Target => Data_Buffer);

   function U8_To_U32 is
      new Ada.Unchecked_Conversion (Source => Unsigned_8,
                                    Target => Unsigned_32);

   procedure setRange(HMC5883L_range : T_HMC5883L_Range) is
      temp : Data_Buffer(1..2);
      val : Unsigned_8;
   begin
      case HMC5883L_range is
         when HMC5883L_RANGE_0_88GA =>
            val := 2#000#;
            mgPerDigit := 73; -- 0.073;

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
      tempVector.X := U8_To_U16(temp)*256 + U8_To_U16(Receive);
      Write_Data(HMC5883L_ADDRESS,tempBuff(2..2));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.Y := U8_To_U16(temp)*256 + U8_To_U16(Receive);
      Write_Data(HMC5883L_ADDRESS,tempBuff(3..3));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.Z := U8_To_U16(temp)*256 + U8_To_U16(Receive);
      return tempVector;
   end readRaw;

   function readNormalize return Vectorf is
      temp : Unsigned_8;
      tempVector : Vectorf;
      tempBuff : Data_Buffer(1..3);
   begin
      tempBuff(1) := HMC5883L_REG_OUT_X_M;
      tempBuff(2) := HMC5883L_REG_OUT_Y_M;
      tempBuff(3) := HMC5883L_REG_OUT_Z_M;
      Write_Data(HMC5883L_ADDRESS,tempBuff(1..1));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.X := (U8_To_U32(temp)*256 + U8_To_U32(Receive))*mgPerDigit;
      Write_Data(HMC5883L_ADDRESS,tempBuff(2..2));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.Y := (U8_To_U32(temp)*256 + U8_To_U32(Receive))*mgPerDigit;
      Write_Data(HMC5883L_ADDRESS,tempBuff(3..3));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.Z := (U8_To_U32(temp)*256 + U8_To_U32(Receive))*mgPerDigit;
      return tempVector;
   end readNormalize;

   function beginHMC5883L return Boolean is
   begin
      Two_Wire.Init;
      setRange(HMC5883L_RANGE_1_3GA); -- HMC5883L_RANGE_1_3GA);
      setMeasurementMode(HMC5883L_CONTINOUS);
      setDataRate(HMC5883L_DATARATE_15HZ); -- HMHMC5883L_DATARATE_15HZ);
      setSamples(HMC5883L_SAMPLES_1);
      return True;
   end beginHMC5883L;


end I2c_hmc5883l;
