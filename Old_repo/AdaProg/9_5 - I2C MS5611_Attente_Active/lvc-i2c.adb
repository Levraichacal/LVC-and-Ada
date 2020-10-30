with Interfaces;
with LVC.PINS;
with AVR;
with AVR.MCU;
with Ada.Unchecked_Conversion;

use AVR;
use LVC.PINS;
use Interfaces;

package body LVC.I2C is

   function U8_To_U32 is
      new Ada.Unchecked_Conversion (Source => Unsigned_8,
                                    Target => Unsigned_32);

   procedure Init (SDA_Port : LVC.PINS.lvcPins; SCL_Port : LVC.PINS.lvcPins) is
   begin
      -- Activate the TWI
--      MCU.PRR0_Bits(MCU.PRTWI_Bit) := False; -- ATmega2560
      MCU.PRR_Bits(MCU.PRTWI_Bit) := False; -- ATmega328
      -- Set the clock speed (SCL) to 400 kHz and clear the status of the TWI
      MCU.TWBR := 12; --_Bits := (others => False);
      MCU.TWSR_Bits := (others => False);
      -- Defining the SDA&SCL ports as outting
      LVC.PINS.pinMode(SDA_Port,Output);
      LVC.PINS.pinMode(SCL_Port,Output);
   end Init;

   function Write_Data(Address : Interfaces.Unsigned_8; Cmd : Interfaces.Unsigned_8) return Error_Status is
   begin
      -- Start
--      MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
--                        MCU.TWEA_Bit => ((MCU.TWCR and MCU.TWEA_Mask) = MCU.TWEA_Mask),
--                        MCU.TWSTA_Bit => True,
--                        MCU.TWSTO_Bit => False,
--                        MCU.TWWC_Bit => ((MCU.TWCR and MCU.TWWC_Mask) = MCU.TWWC_Mask),
--                        MCU.TWEN_Bit => True,
--                        MCU.TWIE_Bit => ((MCU.TWCR and MCU.TWIE_Mask) = MCU.TWIE_Mask),
--                        others => False);
      MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                        MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                        MCU.TWSTA_Bit => True,
                        MCU.TWSTO_Bit => False,
                        MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                        MCU.TWEN_Bit => True,
                        MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                        others => False);

      -- Wait for start
      loop
         exit when (MCU.TWSR <= MCU.TWINT_Mask);--MCU.TWSR = 16#08#);
      end loop;

      -- Check if start or restart works well, else return an error
--      if (MCU.TWSR /= 16#10# or MCU.TWSR /= 16#08#) then
--         return Error_Start;
--      end if;

      -- Load the address in the register and start the transmission
      MCU.TWDR := Address;
      MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                        MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                        MCU.TWSTA_Bit => MCU.TWCR_Bits(MCU.TWSTA_Bit),
                        MCU.TWSTO_Bit => MCU.TWCR_Bits(MCU.TWSTO_Bit),
                        MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                        MCU.TWEN_Bit => True,
                        MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                        others => False);
      -- Wait for the ack
      loop
         exit when (MCU.TWSR <= MCU.TWINT_Mask);--MCU.TWSR = 16#08#);
      end loop;

      -- Check if adress works well, else return an error
--      if (MCU.TWSR /= 16#18#) then
--         return No_Slave_Ack;
--      end if;

      -- Load the command to the register and start the transmission
      MCU.TWDR := Cmd;
      MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                        MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                        MCU.TWSTA_Bit => MCU.TWCR_Bits(MCU.TWSTA_Bit),
                        MCU.TWSTO_Bit => MCU.TWCR_Bits(MCU.TWSTO_Bit),
                        MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                        MCU.TWEN_Bit => True,
                        MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                        others => False);
      -- Wait for the ack
      loop
         exit when (MCU.TWSR <= MCU.TWINT_Mask);--MCU.TWSR = 16#08#);
      end loop;

      -- Check if command works well, else return an error
--      if (MCU.TWSR /= 16#28#) then
--         return No_Data_Ack;
--      end if;

      -- Stop
      MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                        MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                        MCU.TWSTA_Bit => MCU.TWCR_Bits(MCU.TWSTA_Bit),
                        MCU.TWSTO_Bit => True,
                        MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                        MCU.TWEN_Bit => True,
                        MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                        others => False);
      return No_Error;
   end Write_Data;

   function Read_Data(Address : Interfaces.Unsigned_8; Number_Of_Bytes : Interfaces.Unsigned_8) return LVC.I2C.Data_Type is
      msg :LVC.I2C.Data_Type;
      nb_bytes : Unsigned_8;
   begin
      msg.data := 0;
      nb_bytes := Number_Of_Bytes;
      -- Start
      MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                        MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                        MCU.TWSTA_Bit => True,
                        MCU.TWSTO_Bit => False,
                        MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                        MCU.TWEN_Bit => True,
                        MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                        others => False);

      -- Wait for start
      loop
         exit when (MCU.TWSR <= MCU.TWINT_Mask);--MCU.TWSR = 16#08#);
      end loop;

      -- Check if start works well, else return an error
--      if (MCU.TWSR /= 16#10#) then
--         msg.error_status := Error_Start;
--         return msg;
--      end if;

      -- Load the address in the register and start the transmission
      MCU.TWDR := Address;
      MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                        MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                        MCU.TWSTA_Bit => MCU.TWCR_Bits(MCU.TWSTA_Bit),
                        MCU.TWSTO_Bit => MCU.TWCR_Bits(MCU.TWSTO_Bit),
                        MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                        MCU.TWEN_Bit => True,
                        MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                        others => False);
      -- Wait for the ack
      loop
         exit when (MCU.TWSR <= MCU.TWINT_Mask);--MCU.TWSR = 16#08#);
      end loop;

      -- Check if adress works well, else return an error
--      if (MCU.TWSR /= 16#18#) then
--         msg.error_status := No_Slave_Ack;
--         return msg;
--      end if;

      -- Wait and read the register
      loop
         loop
            exit when (MCU.TWSR <= MCU.TWINT_Mask);--MCU.TWSR = 16#08#);
         end loop;
         if (nb_bytes >= 1) then
            msg.data := msg.data * 255 + U8_To_U32(MCU.TWDR);
            MCU.TWSR := MCU.TWSR - MCU.TWINT_Mask;
         end if;
         -- send ack
         if (nb_bytes > 1) then
            MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                              MCU.TWEA_Bit => True,
                              MCU.TWSTA_Bit => False,
                              MCU.TWSTO_Bit => False,
                              MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                              MCU.TWEN_Bit => MCU.TWCR_Bits(MCU.TWEN_Bit),
                              MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                              others => False);
         end if;
         nb_bytes := nb_bytes -1;
         exit when (nb_bytes = 0);
      end loop;
      -- Send Nack
      MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                        MCU.TWEA_Bit => False,
                        MCU.TWSTA_Bit => False,
                        MCU.TWSTO_Bit => False,
                        MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                        MCU.TWEN_Bit => MCU.TWCR_Bits(MCU.TWEN_Bit),
                        MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                        others => False);

      -- Check if command works well, else return an error
--      if (MCU.TWSR /= 16#28#) then
--         msg.error_status := No_Data_Ack;
--         msg.data := 2;
--         return msg;
--      end if;

      -- Stop
      MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                        MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                        MCU.TWSTA_Bit => MCU.TWCR_Bits(MCU.TWSTA_Bit),
                        MCU.TWSTO_Bit => True,
                        MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                        MCU.TWEN_Bit => True,
                        MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                        others => False);

      msg.error_status := No_Error;
      --msg.data := 21;
      return msg;
   end Read_Data;

   procedure Stop is
   begin
      MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                        MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                        MCU.TWSTA_Bit => MCU.TWCR_Bits(MCU.TWSTA_Bit),
                        MCU.TWSTO_Bit => True,
                        MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                        MCU.TWEN_Bit => True,
                        MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                        others => False);
   end Stop;

end LVC.I2C;
