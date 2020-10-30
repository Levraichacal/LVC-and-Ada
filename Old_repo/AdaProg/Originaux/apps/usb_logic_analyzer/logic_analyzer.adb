---------------------------------------------------------------------------
-- The AVR-Ada Library is free software;  you can redistribute it and/or --
-- modify it under terms of the  GNU General Public License as published --
-- by  the  Free Software  Foundation;  either  version 2, or  (at  your --
-- option) any later version.  The AVR-Ada Library is distributed in the --
-- hope that it will be useful, but  WITHOUT ANY WARRANTY;  without even --
-- the  implied warranty of MERCHANTABILITY or FITNESS FOR A  PARTICULAR --
-- PURPOSE. See the GNU General Public License for more details.         --
--                                                                       --
-- As a special exception, if other files instantiate generics from this --
-- unit,  or  you  link  this  unit  with  other  files  to  produce  an --
-- executable   this  unit  does  not  by  itself  cause  the  resulting --
-- executable to  be  covered by the  GNU General  Public License.  This --
-- exception does  not  however  invalidate  any  other reasons why  the --
-- executable file might be covered by the GNU Public License.           --
---------------------------------------------------------------------------

--  Abstract :
--
--  a logic analyzer based on the Arduino platform
--
with Interfaces;                   use Interfaces;
with AVR;                          use AVR;
with AVR.UART;

with Clock;
with Pins;
with Sump_Commands;                use Sump_Commands;

procedure Logic_Analyzer
is
   Cmd         : Command;
   Cmd_Args    : AVR.Nat8_Array(1..4);
   UART_Buffer : aliased Nat8_Array := (0, 0, 0, 0);

   procedure Read_Cmd_Args
   is begin
      for I in Cmd_Args'Range loop
         Cmd_Args(I) := UART.Get_Raw;
      end loop;
   end Read_Cmd_Args;

begin
   Clock.Init;
   Pins.Init;
   UART.Init_Interrupt_Read (AVR.UART.Baud_57600_16MHz, -- Baud = 115200 = 57600*2
                             Double_Speed   => True,    -- Baud =  38400 = 19200*2
                             Receive_Buffer => UART_Buffer'Unrestricted_Access);

   -- UART.Put_Line ("Logic Analyzer RE");

   SUMP_Command_Loop : loop
      if UART.Have_Input then
         Cmd := UART.Get_Raw;
         UART.Put_Raw (Cmd);
         case Cmd is
         when Reset =>
            null;  -- ignore for now

         when Run =>
            Pins.Reset_Records;
            Pins.Start_Recording;
            while Pins.Is_Recording loop null; end loop;
            Pins.Send_Records;

         when Get_Id =>
            UART.Put ("1ALS");

         when Set_Divider =>
            Read_Cmd_Args;
            Clock.Divider := Unsigned_32 (Cmd_Args (3));
            Clock.Divider := Clock.Divider * 256;
            Clock.Divider := Clock.Divider + Unsigned_32 (Cmd_Args (2));
            Clock.Divider := Clock.Divider * 256;
            Clock.Divider := Clock.Divider + Unsigned_32 (Cmd_Args (1));

         when Get_Metadata =>
            UART.Put_Raw (Unsigned_8'(1));
            UART.Put ("AGLAv0");
            UART.Put_Raw (Unsigned_8'(0));

            --  version string
            UART.Put_Raw (Unsigned_8'(2));
            UART.Put ("0.01");
            UART.Put_Raw (Unsigned_8'(0));

            --  capture buffer size: 1024
            UART.Put_Raw (Unsigned_8'(16#21#));
            UART.Put_Raw (Unsigned_8'(0));
            UART.Put_Raw (Unsigned_8'(0));
            UART.Put_Raw (Unsigned_8'(4));
            UART.Put_Raw (Unsigned_8'(0));

            --  number of channels: 6
            UART.Put_Raw (Unsigned_8'(16#40#));
            UART.Put_Raw (Unsigned_8'(6));

            --  protocol version: 2
            UART.Put_Raw (Unsigned_8'(16#41#));
            UART.Put_Raw (Unsigned_8'(2));

            UART.Put_Raw (Unsigned_8'(0));

         when Trigger_Mask =>
            Read_Cmd_Args;
            Pins.Trigger_Pattern := +Cmd_Args(1);

         when Trigger_Config =>
            Read_Cmd_Args;
            -- do nothing

         when Set_Read_Delay_Count =>
            Read_Cmd_Args;
            Read_Count := 4 * (Cmd_Args(2)*256 + Cmd_Args(1) + 1);
            if Read_Count > Pins.Buffer_Length then
               Read_Count := Pins.Buffer_Length;
            end if;
            Delay_Count := 4 * (Cmd_Args(4)*256 + Cmd_Args(3) + 1);
            if Delay_Count > Pins.Buffer_Length then
               Delay_Count := Pins.Buffer_Length;
            end if;

         when Debug =>
            UART.Put_Line ("debug");

         when Debug_Data =>
            Pins.Send_Records_Text;

         when others =>
            -- empty read buffer
            while UART.Have_Input loop
               Cmd := UART.Get_Raw;
            end loop;
         end case;
      else
         null;
      end if;
   end loop SUMP_Command_Loop;
end Logic_Analyzer;
