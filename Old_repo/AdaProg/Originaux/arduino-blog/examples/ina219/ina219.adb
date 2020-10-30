-- Software License Agreement (BSD License)
--
-- Copyright (c) 2012, Adafruit Industries
-- Copyright (c) 2013, Tero Koskinen <tero.koskinen@iki.fi>
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
-- 1. Redistributions of source code must retain the above copyright
-- notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
-- 3. Neither the name of the copyright holders nor the
-- names of its contributors may be used to endorse or promote products
-- derived from this software without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ''AS IS'' AND ANY
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


with AVR.UART;
with AVR.Strings;

with Two_Wire;

package body INA219 is
   use Interfaces;
   use type Two_Wire.TWI_Error_Enum;

   INA219_Address : constant := 16#40#;

   procedure Log (S : AVR.Strings.AVR_String) is
   begin
      AVR.UART.Put (S); AVR.UART.CRLF;
   end Log;

   -- Register addresses
   CONFIGURATION_REGISTER : constant := 0;
   SHUNT_VOLTAGE_REGISTER : constant := 1;
   BUS_VOLTAGE_REGISTER   : constant := 2;
   POWER_REGISTER         : constant := 3;
   CURRENT_REGISTER       : constant := 4;
   CALIBRATION_REGISTER   : constant := 5;

   -- Configuration register bits
   CONFIG_BUS_VOLTAGE_RANGE_32V   : constant := 2#0010_0000_0000_0000#;
   CONFIG_GAIN_8_320MV            : constant := 2#0001_1000_0000_0000#;
   CONFIG_BUS_ADC_RES_12BIT       : constant := 2#0000_0100_0000_0000#;
   CONFIG_SHUNT_ADC_RES_1S_532US  : constant := 2#0000_0000_0001_1000#;
   CONFIG_MODE_SHUNT_AND_BUS_CONT : constant := 2#0000_0000_0000_0111#;

   procedure Write_Reg (Reg_Addr : Unsigned_8; Value : Unsigned_16;
                        Status : out Boolean) is
      Command : Two_Wire.Data_Buffer (1 .. 3);
   begin
      Command (1) := Reg_Addr;
      Command (2) := Unsigned_8 (Value / 256);
      Command (3) := Unsigned_8 (Value and 16#FF#);

      Two_Wire.Write_Data (INA219_Address, Command);
      if Two_Wire.Get_Error /= Two_Wire.TWI_No_Error then
         Log ("Write_Reg: Write_Data ERROR");
         Status := False;
      else
         Status := True;
      end if;
   end Write_Reg;

   procedure Read_Reg (Reg_Addr : Unsigned_8;
                       Value : out Unsigned_16;
                       Status : out Boolean) is
      Command : Two_Wire.Data_Buffer (1..1) := (1 => Reg_Addr);
      V       : Unsigned_16;
      Counter : Unsigned_16;
   begin
      Value := 0;

      Two_Wire.Write_Data (INA219_Address, Command);
      if Two_Wire.Get_Error /= Two_Wire.TWI_No_Error then
         Log ("Read_Reg: Write_Data error");
         Status := False;
         return;
      end if;

      Two_Wire.Request_Data(INA219_Address, 2);

      if Two_Wire.Get_Error /= Two_Wire.TWI_No_Error then
         Status := False;
         return;
      end if;

      Counter := 0;
      loop
         exit when Two_Wire.Data_Available;
         -- Counter := Counter + 1;

         if Counter > 1000 then
            Status := False;
            return;
         end if;
      end loop;
      V := Unsigned_16 (Two_Wire.Receive);
      V := V * 256 + Unsigned_16 (Two_Wire.Receive);
      Value := V;
      Status := True;
   end Read_Reg;

   procedure Init is
   begin
      Two_Wire.Init;
      if Two_Wire.Get_Error /= Two_Wire.TWI_No_Error then
         Log ("Init: Two_Wire.Init error");
         return;
      end if;

      delay 0.01;
      Set_Calibration_32V_2A;

      if Two_Wire.Get_Error /= Two_Wire.TWI_No_Error then
         Log ("INA219.Init: Calibration error");
         return;
      end if;
   end Init;

   function Get_Bus_Voltage return Interfaces.Unsigned_16 is
      V : Unsigned_16;
      S : Boolean;
   begin
      Read_Reg (Reg_Addr => BUS_VOLTAGE_REGISTER, Value => V, Status => S);

      -- D0 = OVF, D1 = CNVR, D2 = null, LSB = 4mV
      return (V / 8) * 4;
   end Get_Bus_Voltage;

   function Get_Shunt_Voltage return Interfaces.Unsigned_16 is
      V : Unsigned_16;
      S : Boolean;
   begin
      Read_Reg (Reg_Addr => SHUNT_VOLTAGE_REGISTER, Value => V, Status => S);
      return V;
   end Get_Shunt_Voltage;

   function Get_Current return Interfaces.Unsigned_16 is
      V : Unsigned_16;
      S : Boolean;
   begin
      Read_Reg (Reg_Addr => CURRENT_REGISTER, Value => V, Status => S);
      return V;
   end Get_Current;

   function Get_Power return Interfaces.Unsigned_16 is
      V : Unsigned_16;
      S : Boolean;
   begin
      Read_Reg (Reg_Addr => POWER_REGISTER, Value => V, Status => S);
      return V;
   end Get_Power;

   procedure Set_Calibration_32V_2A is
      V : Unsigned_16;
      S : Boolean;
   begin
      Log ("INA219.Set_Calibration_32V_2A begin");
      -- Taken from Adafruit INA219 example code.
      -- See https://github.com/adafruit/Adafruit_INA219/blob/master/Adafruit_INA219.cpp#L155
      -- for explanation
      Write_Reg (CALIBRATION_REGISTER, 16#1000#, S);
      if not S then
         Log ("Set_Calibration_32V_2A: Write_Reg (1) failed");
         return;
      end if;

      V := CONFIG_BUS_VOLTAGE_RANGE_32V or
           CONFIG_GAIN_8_320MV or
           CONFIG_BUS_ADC_RES_12BIT or
           CONFIG_SHUNT_ADC_RES_1S_532US or
           CONFIG_MODE_SHUNT_AND_BUS_CONT;
      Write_Reg (CONFIGURATION_REGISTER, V, S);
      if not S then
         Log ("Set_Calibration_32V_2A: Write_Reg (2) failed");
         return;
      end if;
      Log ("INA219.Set_Calibration_32V_2A ok");
   end Set_Calibration_32V_2A;

   function Get_Error return Boolean is
   begin
      return Two_Wire.Get_Error /= Two_Wire.TWI_No_Error;
   end Get_Error;
end INA219;

