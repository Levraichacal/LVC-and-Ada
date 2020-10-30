with Two_Wire;
use Two_Wire;
with AVR.Real_Time.Delays;
--with Ada.Unchecked_Conversion;

package body I2c_ms5611 is
-- Internal Type
   type T_MS5611_Coef is array (Integer range 1..6) of Unsigned_16;

-- Internals Variables
   -- C1 : Unsigned_16;
   -- C2 : Unsigned_16;
   -- C3 : Unsigned_16;
   -- C4 : Unsigned_16;
   -- C5 : Unsigned_16;
   -- C6 : Unsigned_16;
   MS5611_Coef : T_MS5611_Coef;
   MS5611_CT : Duration;
   MS5611_UOSR : Unsigned_8;
   MS5611_TEMP2 : Integer_32;
   MS5611_OFF2, MS5611_SENS2 : Integer_64;
   MS5611_AOSR : T_MS5611_Osr;

-- Procedures

   -- Reset the MS5611
   procedure MS5611_Reset is
      temp : Data_Buffer(1..1);
   begin
      temp(1) := MS5611_CMD_RESET;
      Write_Data(MS5611_ADDRESS,temp);
   end MS5611_Reset;

   -- Reset the MS5611
   procedure MS5611_ReadPROM is
      temp : Unsigned_8;
      tempBuff : Data_Buffer(1..1);
   begin
      for i in 1..6 loop
         tempBuff(1) := MS5611_CMD_READ_PROM + Unsigned_8(2*(i-1));
         Write_Data(MS5611_ADDRESS,tempBuff(1..1));
         Request_Data(MS5611_ADDRESS,2);
         temp := Receive;
         MS5611_Coef(i) := Unsigned_16(temp)*256 + Unsigned_16(Receive);
      end loop;
   end MS5611_ReadPROM;

   -- Initialise the MS5611
   function MS5611_Initialise(MS5611_Osr : T_MS5611_Osr := MS5611_HIGH_RES) return Boolean is
   begin
      Init;
      MS5611_Reset;
      MS5611_SetOverSamping(MS5611_Osr);
      delay 0.1;
      MS5611_ReadPROM;
      return True;
   end MS5611_Initialise;

   -- Return the temperature
   function MS5611_ReadRawTemperature return Unsigned_32 is
      temp1, temp2, temp3 : Unsigned_8;
      temp : Unsigned_32;
      tempBuff : Data_Buffer(1..1);
   begin
      tempBuff(1) := MS5611_CMD_CONV_D2 + MS5611_UOSR;
      Write_Data(MS5611_ADDRESS,tempBuff(1..1));
      delay MS5611_CT;
      tempBuff(1) := MS5611_CMD_ADC_READ;
      Write_Data(MS5611_ADDRESS,tempBuff(1..1));
      Request_Data(MS5611_ADDRESS,3);
      temp1 := Receive;
      temp2 := Receive;
      temp3 := Receive;
      temp := Unsigned_32(temp1)*65536 + Unsigned_32(temp2)*256 + Unsigned_32(temp3);
      return temp;
   end MS5611_ReadRawTemperature;

   -- Return the pressure
   function MS5611_ReadRawPressure return Unsigned_32 is
      temp1, temp2 : Unsigned_32;
      tempBuff : Data_Buffer(1..1);
   begin
      tempBuff(1) := MS5611_CMD_CONV_D1 + MS5611_UOSR;
      Write_Data(MS5611_ADDRESS,tempBuff(1..1));
      delay MS5611_CT;
      tempBuff(1) := MS5611_CMD_ADC_READ;
      Write_Data(MS5611_ADDRESS,tempBuff(1..1));
      Request_Data(MS5611_ADDRESS,3);
      temp1 := Unsigned_32(Receive);
      temp2 := Unsigned_32(temp1)*256 + Unsigned_32(Receive);
      temp1 := Unsigned_32(temp2)*256 + Unsigned_32(Receive);
      return temp1;
   end MS5611_ReadRawPressure;

   -- Return the calculate temperature
   function MS5611_ReadTemperature(Compensation : Boolean :=True) return Integer_32 is
      D2 : Unsigned_32;
      dT, TEMP : Integer_32;
   begin
      D2 := MS5611_ReadRawTemperature;
      dT := Integer_32(D2) - Integer_32(MS5611_Coef(5)) *256;
      TEMP := 2000 + (dT*Integer_32(MS5611_Coef(6))/8388608);
      MS5611_TEMP2 := 0;
      if(Compensation) then
         if(TEMP<2000) then
            MS5611_TEMP2 := Integer_32(Integer_64(dT)*Integer_64(dT)/Integer_64((2**30)));
         end if;
      end if;
      TEMP := TEMP - Integer_32(MS5611_TEMP2);
      return TEMP;
   end MS5611_ReadTemperature;

   -- Return the calculate pressure
   function MS5611_ReadPressure(Compensation : Boolean :=True) return Unsigned_32 is
      D1, D2, P : Unsigned_32;
      dT, TEMP : Integer_32;
      OFF, SENS : Integer_64;
   begin
      D1 := MS5611_ReadRawPressure;
      D2 := MS5611_ReadRawTemperature;
      dT := Integer_32(D2) - Integer_32(MS5611_Coef(5)) *256;
      OFF := Integer_64(MS5611_Coef(2)) * 65536 + Integer_64(MS5611_Coef(4)) * Integer_64(dT) /128;
      SENS := Integer_64(MS5611_Coef(1)) * 32768 + Integer_64(MS5611_Coef(3)) * Integer_64(dT) /256;
      if (Compensation) then
         TEMP := 2000 + (dT*Integer_32(MS5611_Coef(6))/8388608);
         MS5611_OFF2 := 0;
         MS5611_SENS2 := 0;
         if (TEMP < 2000) then
            MS5611_OFF2 := 5 * ((Integer_64(TEMP) - 2000) * (Integer_64(TEMP) - 2000)) / 2;
            MS5611_SENS2 := 5 * ((Integer_64(TEMP) - 2000) * (Integer_64(TEMP) - 2000)) / 4;
         end if;
         if (TEMP < -1500) then
            MS5611_OFF2 := MS5611_OFF2 + 7 * ((Integer_64(TEMP) + 1500) * (Integer_64(TEMP) + 1500));
            MS5611_SENS2 := MS5611_SENS2 + 11 * ((Integer_64(TEMP) + 1500) * (Integer_64(TEMP) + 1500)) / 2;
         end if;
         OFF := OFF - MS5611_OFF2;
         SENS := SENS - MS5611_SENS2;
      end if;
      P := (D1 * Unsigned_32(SENS) / 2097152 - Unsigned_32(OFF)) / 32768;
      return P;
   end MS5611_ReadPressure;

   -- Set the OverSampling Mode
   procedure MS5611_SetOverSamping(MS5611_Osr : T_MS5611_Osr) is
   begin
      case MS5611_Osr is
         when MS5611_ULTRA_HIGH_RES =>
            MS5611_CT := Duration(0.010);
            MS5611_UOSR := 16#08#;
         when MS5611_HIGH_RES =>
            MS5611_CT := Duration(0.005);
            MS5611_UOSR := 16#06#;
         when MS5611_STANDARD =>
            MS5611_CT := Duration(0.003);
            MS5611_UOSR := 16#04#;
         when MS5611_LOW_POWER =>
            MS5611_CT := Duration(0.002);
            MS5611_UOSR := 16#02#;
         when MS5611_ULTRA_LOW_POWER =>
            MS5611_CT := Duration(0.001);
            MS5611_UOSR := 16#00#;
      end case;
      MS5611_AOSR := MS5611_Osr;
   end MS5611_SetOverSamping;

   -- Get the OverSampling mode of teh MS5611
   function MS5611_GetOverSampling return T_MS5611_Osr is
   begin
      return MS5611_AOSR;
   end MS5611_GetOverSampling;

end I2c_ms5611;
