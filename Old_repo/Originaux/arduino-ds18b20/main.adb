with AVR;
with AVR.MCU;
-- with AVR.Wait.Delays;
with AVR.Wait;
with AVR.UART;
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

use AVR;

procedure Main is
   Input_Buffer : aliased AVR.Nat8_Array := (0, 0, 0, 0);

   I_Ptr : AVR.UART.Buffer_Ptr :=
      AVR.UART.Buffer_Ptr'(Input_Buffer'Unchecked_Access);

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

   procedure Wait_Long is
   begin
      for J in 1 .. 800 loop
         Wait_1ms;
      end loop;
   end;

   procedure Wait_Input (Enter_Menu : out Boolean) is
      use AVR.Real_Time;
      Start_Time : AVR.Real_Time.Time;
      Ch : Character;
   begin
      Start_Time := AVR.Real_Time.Clock;
      Enter_Menu := False;
      loop
         exit when AVR.Real_Time.Clock - Start_Time > 10.0;
         delay 0.5;
         AVR.UART.Put (".");
         if AVR.UART.Have_Input then
            AVR.UART.Put ("Entering menu"); AVR.UART.CRLF;
            Enter_Menu := True;
            begin
               -- Flush all input
               loop
                  exit when not UART.Have_Input;
                  Ch := AVR.UART.Get;
               end loop;
               null;
            end;
            exit;
         end if;
      end loop;
   end Wait_Input;

   procedure Do_Device_ID_Query is
      use AVR.UART;
      Ch : Character;
   begin
      Put ("Enter one character long ID ([1-9A-Z]):"); CRLF;
      Ch := Get;
      AVR.EEprom.Put
        (EEprom.EEprom_Address (0), Unsigned_8 (Character'Pos (Ch)));
      Put ("Device ID Written."); CRLF;
   end Do_Device_ID_Query;

   procedure Do_Reporting_Cycle_Query is
      use AVR.UART;
      Ch : Character;
   begin
      Put ("Select reporting cycle:"); CRLF;
      Put ("1.  1 minute"); CRLF;
      Put ("2. 10 minutes"); CRLF;
      Put ("3. 30 minutes"); CRLF;
      Put ("4. 60 minutes"); CRLF;
      Put ("5. 3600 minutes"); CRLF;
      Ch := Get;
      if Ch >= '1' and Ch <= '5' then
         AVR.EEprom.Put (EEprom.EEprom_Address (1),
            Unsigned_8 (Character'Pos (Ch)));
         Put ("Cycle time written."); CRLF;
      else
         Put ("Invalid option."); CRLF;
      end if;
   end Do_Reporting_Cycle_Query;

   procedure Do_Main_Menu is
      use AVR.UART;
      Ch : Character;
   begin
      loop
         Put ("---- Menu ----"); CRLF;
         Put ("1. Set Device ID"); CRLF;
         Put ("2. Set reporting cycle"); CRLF;
         Put ("Q  Quit menu"); CRLF;

         Ch := Get;
         if Ch = 'Q' then
            exit;
         elsif Ch = '1' then
            CRLF;
            Do_Device_ID_Query;
         elsif Ch = '2' then
            CRLF;
            Do_Reporting_Cycle_Query;
         end if;
         CRLF;
      end loop;
   end Do_Main_Menu;

   Found : Boolean;
   Serial : One_Wire.ROM.Unique_Serial_Code;
   Crc    : Unsigned_8;
   Temp   : Temperature_12bit;
   Enter_Menu : Boolean;
   Wait_Time : Duration;
   Byte : Unsigned_8;
   Device_Id : Character;

begin
   AVR.UART.Init_Interrupt_Read (AVR.UART.Baud_9600_16MHz, False, I_Ptr);

   MCU.DDRD_Bits (5) := DD_Output;
   MCU.PORTD_Bits (5) := High;

   Wait_Input (Enter_Menu);

   if Enter_Menu then
      Do_Main_Menu;
   end if;

   Byte := EEprom.Get (EEprom.EEprom_Address (0));
   Device_Id := Character'Val (Byte);
   Byte := EEprom.Get (EEprom.EEprom_Address (1));
   AVR.UART.Put ("Wait_Time: ");
   AVR.UART.Put (Character'Val (Byte));
   AVR.UART.CRLF;
   Wait_Time := Get_Delay (Byte);

   One_Wire.Init_Comm;

   Found := One_Wire.Search.First;
   if Found then
      Serial := One_Wire.ROM.Identifier;
      Crc := 0;
      for J in One_Wire.ROM.Serial_Code_Index loop
         Crc := Crc8 (Data => Serial (J), Seed => Crc);
         Uart.Put (Nat8 (Serial (J)), Base => 16);
         Uart.Put (' ');
      end loop;
      UART.Put ("CRC: ");
      UART.Put (Nat8 (Crc), Base => 16);
      AVR.UART.CRLF;
      Wait_Long;

      loop
         One_Wire.ROM.Identifier (1) := 0;
         One_Wire.Temperature_Sensors.Init_T_Conversion;
         Wait_Long;
         One_Wire.ROM.Identifier := Serial;

         Temp := To_Temperature_12bit (Read_Raw_Value);
         UART.Put (Device_Id); UART.Put (": ");
         UART.Put ("Temp: ");
         UART.Put (Image (Temp));
         UART.Put ("C");
         UART.CRLF;
         Wait_Long;
         delay Wait_Time;
      end loop;

   else
      AVR.UART.Put("No onewire sensors found");
      AVR.UART.CRLF;
   end if;

   loop
      AVR.UART.Put(".");
      AVR.UART.CRLF;
      delay 60.0;
   end loop;
end Main;
