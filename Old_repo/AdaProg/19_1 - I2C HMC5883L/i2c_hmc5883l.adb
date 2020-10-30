with Interfaces;
with AVR.MCU;
with AVR;
with AVR.Interrupts;
with LVC.PINS;
use LVC.PINS;
use AVR;
use Interfaces;

package body I2c_hmc5883l is

-------------------------------------
-- Constantes

   HMC5883L_ADDRESS              : constant := 16#3C#;
--    HMC5883L_ADDRESS_R            : constant := 16#3D#;
   --HMC5883L_ADDRESS              : constant := 16#1E#;
   HMC5883L_ADDRESS_R            : constant := 16#1E#;
   HMC5883L_REG_CONFIG_A         : constant := 16#00#;
   HMC5883L_REG_CONFIG_B         : constant := 16#01#;
   HMC5883L_REG_MODE             : constant := 16#02#;
   HMC5883L_REG_OUT_X_M          : constant := 16#03#;
   HMC5883L_REG_OUT_X_L          : constant := 16#04#;
   HMC5883L_REG_OUT_Z_M          : constant := 16#05#;
   HMC5883L_REG_OUT_Z_L          : constant := 16#06#;
   HMC5883L_REG_OUT_Y_M          : constant := 16#07#;
   HMC5883L_REG_OUT_Y_L          : constant := 16#08#;
   HMC5883L_REG_STATUS           : constant := 16#09#;
   HMC5883L_REG_IDENT_A          : constant := 16#0A#;
   HMC5883L_REG_IDENT_B          : constant := 16#0B#;
   HMC5883L_REG_IDENT_C          : constant := 16#0C#;


-------------------------------------
-- Variables

   Low_X  : Unsigned_8 := 16#00#;
   High_X : Unsigned_8 := 16#00#;
   Low_Y  : Unsigned_8 := 16#00#;
   High_Y : Unsigned_8 := 16#00#;
   Low_Z  : Unsigned_8 := 16#00#;
   High_Z : Unsigned_8 := 16#00#;
   valueSend : Unsigned_8 := 1;


-----------------------------------
-- Initialisation et fonction I2C

   procedure write_UART(data : Unsigned_8) is
   begin
      MCU.UDR0 := data;
   end write_UART;

   procedure init_I2C is
   begin
      -- MCU.TWSR_Bits := (others => False);
      -- MCU.TWBR_Bits := (MCU.TWBR2_Bit => True,
      --                   MCU.TWBR3_Bit => True,
      --                   others => False);
      -- Set SCL to 400kHz
      pinMode(A4,Output);
      pinMode(A5,Output);
      -- digitalWrite(A4,true);
      -- digitalWrite(A5,true);
      MCU.TWSR := MCU.TWSR and 16#03#; -- (MCU.TWPSO_Bit => False, MCU.TWPS1_Bit => False, others => True);
      MCU.TWBR := 72;
      -- Enable Twi
      MCU.TWCR_Bits := (MCU.TWEN_Bit => True,
                        MCU.TWIE_Bit => True,
                        MCU.TWEA_Bit => True,
                        others => False);
      MCU.TWAR := HMC5883L_ADDRESS;
   end init_I2C;

   procedure start_I2C is
   begin
      MCU.TWCR := +(MCU.TWINT_Bit => True,
                    MCU.TWSTA_Bit => True,
                    MCU.TWEN_Bit => True,
                    others => False);
      loop
         exit when (not MCU.TWCR_Bits(MCU.TWINT_Bit));
      end loop;
   end start_I2C;

   procedure stop_I2C is
   begin
      MCU.TWCR := +(MCU.TWINT_Bit => True,
                    MCU.TWSTO_Bit => True,
                    MCU.TWEN_Bit => True,
                    others => False);
   end stop_I2C;

   procedure write_I2C(data : Unsigned_8) is
   begin
      MCU.TWDR := data;
      MCU.TWCR := +(MCU.TWINT_Bit => True,
                    MCU.TWEN_Bit => True,
                    others => False);
      loop
         exit when (not MCU.TWCR_Bits(MCU.TWINT_Bit));
      end loop;
   end write_I2C;

   function readAck_I2C return Unsigned_8 is
   begin
      MCU.TWCR := +(MCU.TWINT_Bit => True,
                    MCU.TWEN_Bit => True,
                    MCU.TWEA_Bit => True,
                    others => False);
      loop
         exit when (not MCU.TWCR_Bits(MCU.TWINT_Bit));
      end loop;
      return MCU.TWDR;
   end readAck_I2C;

   function readNack_I2C return Unsigned_8 is
   begin
      MCU.TWCR := +(MCU.TWINT_Bit => True,
                    MCU.TWEN_Bit => True,
                    others => False);
      loop
         exit when (not MCU.TWCR_Bits(MCU.TWINT_Bit));
      end loop;
      return MCU.TWDR;
   end readNack_I2C;

   function getStatus_I2C return Unsigned_8 is
      status : Unsigned_8;
   begin
      status := MCU.TWSR and 16#F8#;
      return status;
   end getStatus_I2C;

   -- Return false if error, else return true for success
   function writeCommand(add : Unsigned_8; cmd : Unsigned_8; val : Unsigned_8) return Boolean is
   begin
      start_I2C;
      -- if(getStatus_I2C /= 16#08#) then
      --    return False;
      -- end if;
      write_I2C(add);
      write_I2C(cmd);
      write_I2C(val);
      stop_I2C;
      return True;
   end writeCommand;

   function readData(add : Unsigned_8; val : Unsigned_8) return Unsigned_8 is
      data : Unsigned_8;
   begin
      start_I2C;
      write_I2C(add);
      write_I2C(val);
      start_I2C;
      data := readNack_I2C;
      stop_I2C;
      return data;
   end readData;

-----------------------------------
-- Initialisation et fonction du data_ready

   procedure init_DRDY is
   begin
      pinMode(D2,Input);
      MCU.EICRA_Bits(MCU.ISC10_Bit) := False;
      MCU.EICRA_Bits(MCU.ISC11_Bit) := True;
      MCU.EIFR_Bits (MCU.INTF0_Bit) := True;
      MCU.EIMSK_Bits (MCU.INT0_Bit) := True;
   end init_DRDY;

   procedure DRDY_Interrupt;
   pragma Machine_Attribute (Entity         => DRDY_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, DRDY_Interrupt, MCU.Sig_INT0_String);

   procedure DRDY_Interrupt is
   begin
      AVR.Interrupts.Disable;
      MCU.EIMSK_Bits (MCU.INT0_Bit) := False;
      AVR.Interrupts.Enable;
      High_X := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_X_M);
      write_UART(High_X);
      -- Low_X := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_X_L);
      Low_X := (Low_X + 16#01# ) mod 16#FF#;
      write_UART(Low_X);
      High_Y := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_Y_M);
      write_UART(High_Y);
      Low_Y := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_Y_L);
      write_UART(Low_Y);
      High_Z := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_Z_M);
      write_UART(High_Z);
      Low_Z := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_Z_L);
      write_UART(Low_Z);
      MCU.EIMSK_Bits (MCU.INT0_Bit) := True;
   end DRDY_Interrupt;


   procedure init_Serial_Com is
   begin
      -- Set Baud rate Fosc = 16MHz, baud 57600 => UBRR = Fosc/16/baud-1 = 16
      MCU.UBRR0 := Unsigned_16(16);
      MCU.UCSR0A := 0;
      --Set Format bit : 8N1
      MCU.UCSR0C := +(MCU.UCSZ00_Bit => True,
                      MCU.UCSZ01_Bit => True,
                      others => False);
      -- Enable Transmitter
      MCU.UCSR0B := +(MCU.TXEN0_Bit => True,
                      others => False);
   end init_Serial_Com;

   procedure init_InterruptCom is
   begin
      -- Interruption sur l'émission
      MCU.UCSR0B_Bits (MCU.TXCIE0_Bit) := True;
   end init_InterruptCom;
   
procedure TX_UART_Interrupt;

   pragma Machine_Attribute (Entity         => TX_UART_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, TX_UART_Interrupt, MCU.Sig_USART_TX_String);

-- Stop interrupts during writing the register value!
   procedure TX_UART_Interrupt is
   begin
      case valueSend is
         when 1 =>
            MCU.UDR0 := High_X;
            valueSend := 2;
         when 2 =>
            MCU.UDR0 := Low_X;
            valueSend := 3;
         when 3 =>
            MCU.UDR0 := High_Y;
            valueSend := 4;
         when 4 =>
            MCU.UDR0 := Low_Y;
            valueSend := 5;
         when 5 =>
            MCU.UDR0 := High_Z;
            valueSend := 6;
         when 6 =>
            MCU.UDR0 := Low_Z;
            valueSend := 1;
        when others =>
            null;
      end case;
   end TX_UART_Interrupt;

--------------------------------------------------
-- Procédure Run
   procedure Run is
      transmis : Boolean;
   begin
   -- Initialisation du port I2C
      AVR.Interrupts.Disable;
      init_I2C;
      init_Serial_Com;
      --AVR.Interrupts.Enable;
--write_UART(16#00#);

   -- Initialisation du magnétomètre
      -- write_UART(16#01#);
      transmis := writeCommand(HMC5883L_ADDRESS,HMC5883L_REG_MODE,16#00#); -- Continuous-measurement mode
      --write_UART(16#02#);
      transmis := writeCommand(HMC5883L_ADDRESS,HMC5883L_REG_CONFIG_B,16#A0#); -- Gain=5, or any other desired gain
      -- write_UART(16#03#);
      transmis := writeCommand(HMC5883L_ADDRESS,HMC5883L_REG_CONFIG_A,16#70#); -- 8-average, 15 Hz default, normal measurement
      -- write_UART(16#04#);
      --AVR.Interrupts.Disable;

   -- Initialisation des interruptions sur le data_RDY
      init_DRDY;
      -- init_InterruptCom;
       AVR.Interrupts.Enable;
      write_UART(16#05#);-- Send a first to data to start the

   -- Bouclage infini
      loop
      --      High_X := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_X_M);
      --write_UART(High_X);
      --Low_X := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_X_L);
      -- Low_X := Low_X + 16#01#;
     -- write_UART(Low_X);
      --High_Y := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_Y_M);
      --write_UART(High_Y);
      --Low_Y := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_Y_L);
      --write_UART(Low_Y);
      --High_Z := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_Z_M);
      --write_UART(High_Z);
      --Low_Z := readData(HMC5883L_ADDRESS_R,HMC5883L_REG_OUT_Z_L);
      --write_UART(Low_Z);
         null;
      end loop;
   end Run;

end I2c_hmc5883l;
