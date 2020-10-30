--
-- I2C package for AVR-Ada
--
-- Copyright (C) 2011  Tero Koskinen <tero.koskinen@iki.fi>
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
-- USA.
--
-- As a special exception, if other files instantiate generics from this
-- unit,  or  you  link  this  unit  with  other  files  to  produce  an
-- executable   this  unit  does  not  by  itself  cause  the  resulting
-- executable to  be  covered by the  GNU General  Public License.  This
-- exception does  not  however  invalidate  any  other reasons why  the
-- executable file might be covered by the GNU Public License.
--

with AVR.MCU;
with AVR;
with AVR.Interrupts;
with AVR.UART;

package body Two_Wire is
   use AVR;
   use AVR.MCU;

   type TWI_State_Enum is (TWI_Ready, TWI_MRX, TWI_MTX);

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

   procedure Stop;
   procedure Reply (Ack : Boolean);
   procedure Release;

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

   function Data_Available return Boolean is
      use type Interfaces.Unsigned_8;
   begin
      return Data_Index <= Data_Received;
   end Data_Available;

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

   procedure Stop is
   begin
      TWCR_Bits :=
        (TWEN_Bit => True,
         TWIE_Bit => True,
         TWEA_Bit => True,
         TWINT_Bit => True,
         TWSTO_Bit => True,
         others => False);
      loop
         exit when not TWCR_Bits (TWSTO_Bit);
      end loop;
      TWI_State := TWI_Ready;
   end Stop;

   procedure Reply (Ack : Boolean) is
   begin
      if Ack then
         TWCR_Bits :=
           (TWEN_Bit => True,
            TWIE_Bit => True,
            TWEA_Bit => True,
            TWINT_Bit => True,
            others => False);
      else
         TWCR_Bits :=
           (TWEN_Bit => True,
            TWIE_Bit => True,
            TWINT_Bit => True,
            others => False);
      end if;
   end Reply;

   procedure Release is
   begin
      TWCR_Bits :=
        (TWEN_Bit => True,
         TWIE_Bit => True,
         TWEA_Bit => True,
         TWINT_Bit => True,
         others => False);
      TWI_State := TWI_Ready;
   end Release;

   procedure TWI_Interrupt;
   pragma Machine_Attribute (Entity         => TWI_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, TWI_Interrupt, SIG_TWI_String);

   procedure TWI_Interrupt is
      use type Interfaces.Unsigned_8;
      -- #define TW_STATUS_MASK (_BV(TWS7)|_BV(TWS6)|_BV(TWS5)|_BV(TWS4)|\
      --                         _BV(TWS3))
      -- #define TW_STATUS      (TWSR & TW_STATUS_MASK)

      TW_Status_Mask : constant Interfaces.Unsigned_8 :=
        TWS7_Mask or TWS6_Mask or TWS5_Mask or TWS4_Mask or TWS3_Mask;
      TW_Status      : constant Interfaces.Unsigned_8 :=
        TWSR and TW_Status_Mask;

   begin
      case TW_Status is
         when TW_START | TW_REP_START =>
            TWDR := TWI_SLA_RW;
            Reply (True);

         when TW_ARB_LOST =>
            TWI_Error_State := TWI_Lost_Arbitration;
            Release;

         -- Master data receive
         --

         -- Address sent, got ack from slave
         when TW_MR_SLA_ACK =>
            if Data_Received  < Data_Max - 1 then
               Reply (True);
            else
               Reply (False);
            end if;

         when TW_MR_SLA_NACK =>
            Stop;

         -- Data available from slave
         when TW_MR_DATA_ACK =>
            Buffer (Data_Received + 1) := TWDR;
            Data_Received := Data_Received + 1;
            if Data_Received < Data_Max then
               Reply (True);
            else
               Reply (False);
            end if;

         -- Final data byte got
         when TW_MR_DATA_NACK =>
            Buffer (Data_Received + 1) := TWDR;
            Data_Received := Data_Received + 1;
            Stop;

         -- Master data transmit
         --

         when TW_MT_SLA_ACK | TW_MT_DATA_ACK =>
            if Data_Index <= Data_Max and (not Data_Sent) then
               TWDR := Buffer (Data_Index);
               if Data_Index < Data_Max then
                  Data_Index := Data_Index + 1;
               else
                  Data_Sent := True;
               end if;
               Reply (True);
            else
               Stop;
            end if;
         when TW_MT_SLA_NACK | TW_MT_DATA_NACK =>
            TWI_Error_State := TWI_NACK;
            Stop;

         when others =>
            null;
      end case;
   end TWI_Interrupt;

   function Get_Error return TWI_Error_Enum is
   begin
      return TWI_Error_State;
   end Get_Error;
end Two_Wire;
