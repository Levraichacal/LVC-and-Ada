with AVR;
with AVR.MCU;
-- with AVR.Wait.Delays;
with AVR.Wait;
--with AVR.UART;
with AVR.EEprom;
with AVR.Real_Time.Delays;
with AVR.Real_Time;
with AVR.Real_Time.Clock;
with System;

with Interfaces; use Interfaces;

with One_Wire;                     use One_Wire;
with One_Wire.Search;
with One_Wire.ROM;
with One_Wire.Temperature_Sensors; use One_Wire.Temperature_Sensors;
with Crc8;

with Temperatures; use Temperatures;

with LCD;
use AVR;

procedure Main is


   procedure Wait_1ms is new
     AVR.Wait.Generic_Wait_Usecs (Crystal_Hertz => 16_000_000,
                                  Micro_Seconds => 1000);

   function Get_Delay (Option : Character) return Duration is
   begin
      case Option is
         when '1' => return 1.0 * 60.0;
         when '2' => return 10.0 * 60.0;
         when '3' => return 30.0 * 60.0;
         when '4' => return 60.0 * 60.0;
         when '5' => return 86400.0;
         when others => return 1.0;
      end case;
   end Get_Delay;

   function Get_Delay (Option : Unsigned_8) return Duration is
   begin
      return Get_Delay (Character'Val (Option));
   end Get_Delay;


   Found : Boolean;
   Serial : One_Wire.ROM.Unique_Serial_Code;
   Crc    : Unsigned_8;
   Temp   : Temperature_12bit;
   Enter_Menu : Boolean;
   -- Wait_Time : Duration;
   Byte : Unsigned_8;
   Device_Id : Character;
   --test,dec : Unsigned_16;

begin

   MCU.DDRD_Bits (5) := DD_Output;
   MCU.PORTD_Bits (5) := High;

   Byte := EEprom.Get (EEprom.EEprom_Address (0));
   Device_Id := Character'Val (Byte);
   Byte := EEprom.Get (EEprom.EEprom_Address (1));
   -- AVR.UART.Put ("Wait_Time: ");
   -- AVR.UART.Put (Character'Val (Byte));
   -- AVR.UART.CRLF;
   -- Wait_Time := Get_Delay (Byte);
   LCD.Init;
   LCD.Clear_Screen;
   LCD.Put("Screen Init");
   One_Wire.Init_Comm;

   Found := One_Wire.Search.First;
   if Found then
      Serial := One_Wire.ROM.Identifier;
      -- Crc := 0;
      -- for J in One_Wire.ROM.Serial_Code_Index loop
         -- Crc := Crc8 (Data => Serial (J), Seed => Crc);
         -- LCD.Clear_Screen;
         -- LCD.GotoXY(1,1);
         -- LCD.Put (Unsigned_8 (Serial (J)), Base => 16);
         -- LCD.Put (' ');
      -- end loop;
      -- LCD.Clear_Screen;
      -- LCD.GotoXY(1,1);
      -- LCD.Put ("CRC: ");
      -- LCD.Put (Unsigned_8 (Crc), Base => 16);
      -- AVR.UART.CRLF;
         -- Wait_Long;
         delay 1.0;

      loop
         One_Wire.ROM.Identifier (1) := 0;
         One_Wire.Temperature_Sensors.Init_T_Conversion;
         -- Wait_Long;
         delay 0.8;
         One_Wire.ROM.Identifier := Serial;
         LCD.Clear_Screen;

         Temp := To_Temperature_12bit (Read_Raw_Value);
         -- UART.Put (Device_Id); UART.Put (": ");
         LCD.GotoXY(1,1);
         --test := Unsigned_16(Temp/To_Temperature_12bit (1));
         LCD.Put ("Temp: ");
         --LCD.Put (test);
         --LCD.Put (".");
         --dec := Unsigned_16(Unsigned_16(10*Temp) - 10*test);
         -- LCD.Put (dec);
         -- dec := Unsigned_16(100*Temp) - 100*test;
         --LCD.Put (dec);
         LCD.Put (Image (Temp));
         LCD.Put ("C");
         --UART.CRLF;
         --Wait_Long;
         delay 2.0;
      end loop;

   else
      LCD.Clear_Screen;
      LCD.GotoXY(1,1);
      LCD.Put("No onewire");
      LCD.GotoXY(1,2);
      LCD.Put("sensors found");
      -- AVR.UART.CRLF;
   end if;
      LCD.Clear_Screen;
      LCD.GotoXY(1,1);
      LCD.Put("Exit");

   -- loop
      -- AVR.UART.Put(".");
      -- AVR.UART.CRLF;
      -- delay 60.0;
   --end loop;
end Main;
