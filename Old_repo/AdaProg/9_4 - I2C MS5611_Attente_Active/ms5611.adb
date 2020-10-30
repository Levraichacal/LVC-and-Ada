-----------------------------------------------------------------
-----------------------------------------------------------------

-- The MS5611 has only fice basic commands:
-- 1. Reset
-- 2. Read PROM (128 biy of calibration words)
-- 3. D1 conversion
-- 4. D2 conversion
-- 5. Read ADC result (24 bit presssure/temperature)
--with AVR;
--with AVR.MCU;
with LVC.I2C;
with LVC.PINS;
with Interfaces;
with Ada.Unchecked_Conversion;

use LVC.I2C;
use Interfaces;
--use AVR;

package body MS5611 is

   MS5611_ADDR_W       : constant := 16#EE#; -- The read address of MS5611
   MS5611_ADDR_R       : constant := 16#EF#; -- The write address of MS5611
   MS5611_RESET        : constant := 16#1E#; -- Reset command
   MS5611_CONVERT_D1   : constant := 16#40#; -- Addon conversion command for D1
   MS5611_CONVERT_D2   : constant := 16#50#; -- Addon conversion command for D2
   MS5611_CONVERT_256  : constant := 16#00#; -- Addon conversion command for OSR = 256
   MS5611_CONVERT_512  : constant := 16#02#; -- Addon conversion command for OSR = 512
   MS5611_CONVERT_1024 : constant := 16#04#; -- Addon conversion command for OSR = 1024
   MS5611_CONVERT_2048 : constant := 16#06#; -- Addon conversion command for OSR = 2048
   MS5611_CONVERT_4096 : constant := 16#08#; -- Addon conversion command for OSR = 4096
   MS5611_PROM_READ    : constant := 16#A0#; -- PROM read command

   Mask_resolution : Unsigned_8 := MS5611_CONVERT_256;

   function U32_To_U16 is
      new Ada.Unchecked_Conversion (Source => Unsigned_32,
                                    Target => Unsigned_16);

   function getTemperature return Unsigned_32 is
      Data : LVC.I2C.Data_Type;
      erreur : LVC.I2C.Error_Status;
   begin
   -- D2
      erreur := LVC.I2C.Write_Data(MS5611_ADDR_W,(MS5611_CONVERT_D2 + Mask_resolution));
      if (erreur = No_Error) then
         erreur := LVC.I2C.Write_Data(MS5611_ADDR_W,16#00#);
         if (erreur = No_Error) then
            Data := LVC.I2C.Read_Data(MS5611_ADDR_R,3);
            if (Data.error_status = No_Error) then
               return Data.data;
            else
               return 5;
            end if;
         else
            return 4;
         end if;
      else
         if (erreur = Error_Start) then
         return 3;
         else
            return 2;
         end if;
      end if;
   end getTemperature;

   function getPressure return Unsigned_32 is
      Data : LVC.I2C.Data_Type;
   begin
   -- D1
      if (LVC.I2C.Write_Data(MS5611_ADDR_W,MS5611_CONVERT_D1 + Mask_resolution) = No_Error) then
         if (LVC.I2C.Write_Data(MS5611_ADDR_W,16#00#) = No_Error) then
            Data := LVC.I2C.Read_Data(MS5611_ADDR_R,3);
            if (Data.error_status = No_Error) then
               return Data.data;
            else
               return 0;
            end if;
         else
            return 0;
         end if;
      else
         return 0;
      end if;
   end getPressure;

   function getCoefficient (Coefficient : MS5611_Coefficient) return Unsigned_16 is
      Data : LVC.I2C.Data_Type;
   begin
      case Coefficient is
         when C1 =>
            if (LVC.I2C.Write_Data(MS5611_ADDR_W,MS5611_PROM_READ + 16#01#) = No_Error) then
               Data := LVC.I2C.Read_Data(MS5611_ADDR_R,2);
               if (Data.error_status = No_Error) then
                  return U32_To_U16(Data.data);
               else
                  return 0;
               end if;
            else
               return 0;
            end if;
         when C2 =>
            if (LVC.I2C.Write_Data(MS5611_ADDR_W,MS5611_PROM_READ + 16#02#) = No_Error) then
               Data := LVC.I2C.Read_Data(MS5611_ADDR_R,2);
               if (Data.error_status = No_Error) then
                  return U32_To_U16(Data.data);
               else
                  return 0;
               end if;
            else
               return 0;
            end if;
         when C3 =>
            if (LVC.I2C.Write_Data(MS5611_ADDR_W,MS5611_PROM_READ + 16#03#) = No_Error) then
               Data := LVC.I2C.Read_Data(MS5611_ADDR_R,2);
               if (Data.error_status = No_Error) then
                  return U32_To_U16(Data.data);
               else
                  return 0;
               end if;
            else
               return 0;
            end if;
         when C4 =>
            if (LVC.I2C.Write_Data(MS5611_ADDR_W,MS5611_PROM_READ + 16#04#) = No_Error) then
               Data := LVC.I2C.Read_Data(MS5611_ADDR_R,2);
               if (Data.error_status = No_Error) then
                  return U32_To_U16(Data.data);
               else
                  return 0;
               end if;
            else
               return 0;
            end if;
         when C5 =>
            if (LVC.I2C.Write_Data(MS5611_ADDR_W,MS5611_PROM_READ + 16#05#) = No_Error) then
               Data := LVC.I2C.Read_Data(MS5611_ADDR_R,2);
               if (Data.error_status = No_Error) then
                  return U32_To_U16(Data.data);
               else
                  return 0;
               end if;
            else
               return 0;
            end if;
         when C6 =>
            if (LVC.I2C.Write_Data(MS5611_ADDR_W,MS5611_PROM_READ + 16#06#) = No_Error) then
               Data := LVC.I2C.Read_Data(MS5611_ADDR_R,2);
               if (Data.error_status = No_Error) then
                  return U32_To_U16(Data.data);
               else
                  return 0;
               end if;
            else
               return 0;
            end if;
         when others => null;
      end case;
      return 0;
   end getCoefficient;

   procedure setResolution (Resolution : MS5611_Resolution) is
   begin
      case Resolution is
         when D256 => Mask_resolution := MS5611_CONVERT_256;
         when D512 => Mask_resolution := MS5611_CONVERT_512;
         when D1024 => Mask_resolution := MS5611_CONVERT_1024;
         when D2048 => Mask_resolution := MS5611_CONVERT_2048;
         when D4096 => Mask_resolution := MS5611_CONVERT_4096;
         when others => null;
      end case;
   end setResolution;

   procedure Init(SDA_Port : LVC.PINS.lvcPins; SCL_Port : LVC.PINS.lvcPins) is
   begin
      LVC.I2C.Init(SDA_Port,SCL_Port);
   end Init;

   procedure Stop is
   begin
      LVC.I2C.Stop;
   end Stop;

   function Reset return Error_Status is
   begin
      return LVC.I2C.Write_Data(MS5611_ADDR_W,MS5611_RESET);
   end Reset;

end MS5611;
