--with Two_Wire;

with Ada.Unchecked_Conversion;
with AVR.MCU;
with AVR;
with AVR.Interrupts;

package body I2c_hmc5883l is
   use AVR;
   use AVR.MCU;

   mgPerDigit : Integer_16;
-----------------------------------
-- Initialisation et fonction I2C
-- Besoin de init, write_data et request_data
-- Data_Buffer, Receive
--    procedure Init is
--    begin
--       Two_Wire.Init;
--    end Init;
   type TWI_Error_Enum is (TWI_No_Error, TWI_Bus_Error, TWI_Lost_Arbitration,
                           TWI_NACK);

   type TWI_State_Enum is (TWI_Ready, TWI_MRX, TWI_MTX);

   subtype Buffer_Size is Interfaces.Unsigned_8 range 0 .. 32;

   type Data_Buffer is array (Buffer_Size range <>) of Interfaces.Unsigned_8;

   subtype Buffer_Range is Buffer_Size range 1 .. 32;

   TWI_Error_State : TWI_Error_Enum;
   pragma Volatile (TWI_Error_State);

   TW_READ  : constant := 1;
   TW_WRITE : constant := 0;

   -- Start condition
   TW_START        : constant := 16#08#;
   TW_REP_START    : constant := 16#10#;

   -- Master transmitter
   TW_MT_SLA_ACK   : constant := 16#18#; -- SLA+W transmitted, ACK got
   TW_MT_SLA_NACK  : constant := 16#20#; -- SLA+W transmitted, NACK got

   TW_MT_DATA_ACK  : constant := 16#28#; -- data transmitted, ACK got
   TW_MT_DATA_NACK : constant := 16#30#; -- data transmitted, NACK got

   -- Master receiver
   TW_MR_SLA_ACK   : constant := 16#40#; -- SLA+R transmitted, ACK got
   TW_MR_SLA_NACK  : constant := 16#48#; -- SLA+R transmitted, NACK got

   TW_MR_DATA_ACK  : constant := 16#50#; -- data transmitted, ACK got
   TW_MR_DATA_NACK : constant := 16#58#; -- data transmitted, NACK got

   -- Generic errors
   TW_BUS_ERROR    : constant := 0;
   TW_NO_INFO      : constant := 16#F8#; -- no information available
   TW_ARB_LOST     : constant := 16#38#; -- arbitr. lost in SLA+W/R or data


   Buffer : array (Buffer_Range) of Interfaces.Unsigned_8;

   Data_Index : Buffer_Range;
   Data_Max   : Buffer_Size;
   Data_Received : Buffer_Size;
   Data_Sent  : Boolean; -- All data sent?

   TWI_State : TWI_State_Enum;
   pragma Volatile (TWI_State);
   TWI_SLA_RW : Interfaces.Unsigned_8;
   pragma Volatile (TWI_SLA_RW);
   procedure Init is
   begin
      Data_Index := Buffer_Range'First;
      Data_Max := Buffer_Range'First;
      Data_Sent := False;
      TWI_State := TWI_Ready;

      -- Init twi ports (portc 4&5)
      PortC_Bits (4) := True;
      PortC_Bits (5) := True;

      -- Init twi prescaler and bitrate
      TWSR_Bits (TWPS0_Bit) := False;
      TWSR_Bits (TWPS1_Bit) := False;
      TWBR := 72; -- Interfaces.Unsigned_8 (((CPU_Speed / TWI_FREQ) - 16) / 2);

      -- Enable twi, acks, and interrupt
      TWCR_Bits :=
        (TWEN_Bit => True,
         TWIE_Bit => True,
         TWEA_Bit => True,
         others => False);

      AVR.Interrupts.Enable;

   end Init;

   procedure Request_Data (Address : Interfaces.Unsigned_8;
                           Amount  : Buffer_Size) is
      use type Interfaces.Unsigned_8;
   begin
      Data_Index := Buffer_Range'First;
      Data_Max   := Amount;
      Data_Received := 0;
      TWI_Error_State := TWI_No_Error;
      TWI_State := TWI_MRX;

      TWI_SLA_RW := TW_READ or (Address * 2);

      TWCR_Bits :=
        (TWEN_Bit => True,
         TWIE_Bit => True,
         TWEA_Bit => True,
         TWINT_Bit => True,
         TWSTA_Bit => True,
         others => False);

      loop
         exit when TWI_State /= TWI_MRX;
      end loop;
   end Request_Data;

   procedure Write_Data (Address : Interfaces.Unsigned_8;
                         Data    : Data_Buffer)
   is
      use type Interfaces.Unsigned_8;

      Index : Buffer_Range := Buffer_Range'First;
   begin
      Data_Sent := False;
      for I in Data'Range loop
         Buffer (Index) := Data (I);
         Index := Index + 1;
      end loop;
      Data_Index := Buffer_Range'First;
      Data_Max   := Index - 1;

      TWI_State := TWI_MTX;
      TWI_Error_State := TWI_No_Error;

      TWI_SLA_RW := TW_WRITE or (Address * 2);

      -- Send start condidion
      TWCR_Bits :=
        (TWEN_Bit => True,
         TWIE_Bit => True,
         TWEA_Bit => True,
         TWINT_Bit => True,
         TWSTA_Bit => True,
         others => False);

      loop
         exit when TWI_State /= TWI_MTX;
      end loop;
   end Write_Data;

   function Receive return Interfaces.Unsigned_8 is
      use type Interfaces.Unsigned_8;
      Ret_Val : Interfaces.Unsigned_8 := 0;
   begin
      if Data_Index <= Data_Received then
         Ret_Val := Buffer (Data_Index);
         Data_Index := Data_Index + 1;
      end if;
      return Ret_Val;
   end Receive;

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
      tempVector.X := Integer_16(temp)*256 + Integer_16(Receive);
      Write_Data(HMC5883L_ADDRESS,tempBuff(2..2));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.Y := Integer_16(temp)*256 + Integer_16(Receive);
      Write_Data(HMC5883L_ADDRESS,tempBuff(3..3));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.Z := Integer_16(temp)*256 + Integer_16(Receive);
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
      tempVector.X := (Integer_16(temp)*256 + Integer_16(Receive))*mgPerDigit;
      Write_Data(HMC5883L_ADDRESS,tempBuff(2..2));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.Y := (Integer_16(temp)*256 + Integer_16(Receive))*mgPerDigit;
      Write_Data(HMC5883L_ADDRESS,tempBuff(3..3));
      Request_Data(HMC5883L_ADDRESS,2);
      temp := Receive;
      tempVector.Z := (Integer_16(temp)*256 + Integer_16(Receive))*mgPerDigit;
      return tempVector;
   end readNormalize;

   function beginHMC5883L return Boolean is
   begin
      Init;
      setRange(HMC5883L_RANGE_1_3GA); -- HMC5883L_RANGE_1_3GA);
      setMeasurementMode(HMC5883L_CONTINOUS);
      setDataRate(HMC5883L_DATARATE_15HZ); -- HMHMC5883L_DATARATE_15HZ);
      setSamples(HMC5883L_SAMPLES_1);
      return True;
   end beginHMC5883L;


end I2c_hmc5883l;
