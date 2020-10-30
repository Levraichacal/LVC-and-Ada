with Interfaces;
use Interfaces;
with LVC.PINS;
use LVC.PINS;
with AVR.MCU;
use AVR.MCU;
with AVR.Interrupts;
with System.Machine_Code;
use System.Machine_Code;
--with System;                   use System;  --   make Address visible

package body SoftwareSerial is

   function U32_To_U16(W : Unsigned_32) return Unsigned_16 is
   begin
      return Unsigned_16 (W and 16#0000FFFF#);
   end U32_To_U16;



   procedure tunedDelay( delayTime: Unsigned_16) is
      temp : Unsigned_16;
      use ASCII;
   begin
      Asm ("1: sbiw %0, 0x01" & LF & HT &
           "brne 1b",
           Outputs => (Unsigned_16'Asm_Output("=w",temp)),
           Inputs => (Unsigned_16'Asm_Input("0",delayTime)),
           Volatile => True);
   end tunedDelay;

   function rx_pin_read_SoftSerial return Boolean is
   begin
      return (digitalReadValue(G_ReceivePin));
   end rx_pin_read_SoftSerial;

   procedure recv_SoftSerial is
      d : Unsigned_8 :=0;
   begin
      if(G_inverseLogic = rx_pin_read_SoftSerial) then
         tunedDelay(G_rx_delay_centering);
         for i in 0..7 loop
            tunedDelay(G_rx_delay_intrabit);
            if(rx_pin_read_SoftSerial) then
               if ((d and 2**i) = 0) then
                  d := d + 2**i;
               end if;
            else
               d:= d and (not (2**i));
            end if;
         end loop;
         -- skip the stop bit
         tunedDelay(G_rx_delay_stopbit);
         if(G_inverseLogic) then
            d := not d;
         end if;
         -- if buffer full, set the overflow flag
         if (((G_receive_buffer_tail + 1) mod Max_RX_Buffer) /= G_receive_buffer_head) then
            G_received_buffer(G_receive_buffer_tail) := d;
            G_receive_buffer_tail := (G_receive_buffer_tail + 1) mod Max_RX_Buffer;
         else
            G_bufferOverflow := True;
         end if;
      end if;
   end recv_SoftSerial;

   package RX_0 is

      procedure initRXSoftInterrupt;

   end RX_0;

   package body RX_0 is

      procedure initRXSoftInterrupt is
      begin
         PCMSK0_Bits (G_ReceiveBitMask) := True;
      end initRXSoftInterrupt;

      procedure RX_Interrupt_0;
      pragma Machine_Attribute (Entity         => RX_Interrupt_0,
                                Attribute_Name => "signal");
      pragma Export (C, RX_Interrupt_0, Sig_PCINT0_String);

      procedure RX_Interrupt_0 is
      begin
         PCMSK0_Bits (G_ReceiveBitMask) := False;
         recv_SoftSerial;
         PCMSK0_Bits (G_ReceiveBitMask) := True;
      end RX_Interrupt_0;

   end RX_0;


   package RX_1 is

      procedure initRXSoftInterrupt;

   end RX_1;

   package body RX_1 is

      procedure initRXSoftInterrupt is
      begin
         PCMSK1_Bits (G_ReceiveBitMask) := True;
      end initRXSoftInterrupt;

      procedure RX_Interrupt_1;
      pragma Machine_Attribute (Entity         => RX_Interrupt_1,
                                Attribute_Name => "signal");
      pragma Export (C, RX_Interrupt_1, Sig_PCINT1_String);

      procedure RX_Interrupt_1 is
      begin
         PCMSK1_Bits (G_ReceiveBitMask) := False;
         recv_SoftSerial;
         PCMSK1_Bits (G_ReceiveBitMask) := True;
      end RX_Interrupt_1;

   end RX_1;


   package RX_2 is

      procedure initRXSoftInterrupt;

   end RX_2;

   package body RX_2 is

      procedure initRXSoftInterrupt is
      begin
         PCMSK2_Bits (G_ReceiveBitMask) := True;
      end initRXSoftInterrupt;

      procedure RX_Interrupt_2;
      pragma Machine_Attribute (Entity         => RX_Interrupt_2,
                                Attribute_Name => "signal");
      pragma Export (C, RX_Interrupt_2, Sig_PCINT2_String);

      procedure RX_Interrupt_2 is
      begin
         PCMSK2_Bits (G_ReceiveBitMask) := False;
         recv_SoftSerial;
         PCMSK2_Bits (G_ReceiveBitMask) := True;
      end RX_Interrupt_2;

   end RX_2;


   procedure setInterrupt(port : lvcPort) is
   begin
      case port is
         when PB =>
            RX_0.initRXSoftInterrupt;
         when PC =>
            RX_1.initRXSoftInterrupt;
         when PD =>
            RX_2.initRXSoftInterrupt;
         when others => null;
      end case;
   end setInterrupt;

   table : Tableau_Data;
   procedure init is
   begin
--      table(1) := (115200,1,17,17,12); -- Origine
--    --  table(1) := (115200,1,21,21,16); fonctionne mais donne du 7N1
      table(1) := (115200,1,21,21,15); -- sembre bien fonctionner
      --table(1) := (115200,3,28,21,18);
      table(2) := (57600,10,37,37,33);
--      table(3) := (38400,10,57,57,54); -- Origine
      table(3) := (38400,37,85,85,81);
      table(4) := (31250,31,70,70,68);
      table(5) := (28800,34,77,77,74);
      table(6) := (19200,54,117,117,114);
      table(7) := (14400,74,156,156,153);
      table(8) := (9600,114,236,236,233);
      table(9) := (4800,233,474,474,474);
      table(10) := (2400,471,950,950,947);
      table(11) := (1200,947,1902,1902,1899);
      table(12) := (300,3804,7617,7617,7614);
   end init;

   function listening_SoftSerial return Boolean is
   begin
      return G_comactive;
   end listening_SoftSerial;

   procedure listen_SoftSerial is
      oldSREG: Unsigned_8;
   begin
      if(G_comactive = False) then
         G_bufferOverflow := False;
         oldSREG := AVR.MCU.SREG;
         AVR.Interrupts.cli;
         G_receive_buffer_tail := 0;
         G_receive_buffer_head := 0;
         G_comactive := True;
         AVR.MCU.SREG := oldSREG;
      end if;
   end listen_SoftSerial;

   procedure tx_pin_write_SoftSerial(level : Boolean) is
   begin
      if (level = False) then
         digitalWrite(G_TransmitPin, Low_lvl);
      else
         digitalWrite(G_TransmitPin, High_lvl);
      end if;
   end tx_pin_write_SoftSerial;

   procedure setTx(transmitPin : lvcPins) is
      port : lvcPort;
   begin
      pinMode(transmitPin,Output);
      digitalWrite(transmitPin,High_lvl);
      G_TransmitPin := transmitPin;
      G_TransmitBitMask := digitalPinToBitMask(transmitPin);
      port := digitalPinToPort(transmitPin);
      G_TransmitPortRegister := portOutputRegister(port);
   end setTx;

   procedure setRx(receivePin : lvcPins) is
      port : lvcPort;
   begin
      pinMode(receivePin,Input);
      if( not G_inverseLogic) then
         digitalWrite(receivePin,High_lvl);
      end if;
      G_ReceivePin := receivePin;
      G_ReceiveBitMask := digitalPinToPCMSKbit(receivePin); --digitalPinToBitMask(receivePin);
      port := digitalPinToPort(receivePin);
      setInterrupt(port);
      G_ReceivePortRegister := portInputRegister(port);
   end setRx;

   procedure Init_SoftSerial(receivePin : lvcPins; transmitPin : lvcPins; inverseLogic : Boolean := False) is
   begin
      init;
      G_rx_delay_centering := 0;
      G_rx_delay_intrabit := 0;
      G_rx_delay_stopbit := 0;
      G_tx_delay := 0;
      G_bufferOverflow := False;
      G_inverseLogic := inverseLogic;
      G_comactive := False;
      setTx(transmitPin);
      setRx(receivePin);
   end Init_SoftSerial;

   function subtract_cap (num1 : Unsigned_16; num2 : Unsigned_16) return Unsigned_16 is
   begin
      if (num1>num2) then
         return num1 - num2;
      else
         return 1;
      end if;
   end subtract_cap;


   procedure Begin_SoftSerial (speed : Unsigned_32) is
      baud : Unsigned_32;
--      Bit_Delay : Unsigned_16;
   begin
--      Bit_Delay := U32_To_U16((16000000 / speed) /4);
--      G_tx_delay := subtract_cap(Bit_Delay, 15/4);
--      G_rx_delay_centering := subtract_cap(Bit_Delay/2, (4 + 4 + 75 + 17- 23)/4);
--      G_rx_delay_intrabit := subtract_cap(Bit_Delay, 23/4);
--      G_rx_delay_stopbit := subtract_cap(Bit_Delay * 3/4, (37 + 11)/4);
      G_rx_delay_centering := 0;
      G_rx_delay_intrabit  := 0;
      G_rx_delay_stopbit  := 0;
      G_tx_delay  := 0;
      for i in table'Range loop
         baud := table(i).baud;
         if(baud = speed) then
            G_rx_delay_centering := table(i).rx_delay_centering;
            G_rx_delay_intrabit := table(i).rx_delay_intrabit;
            G_rx_delay_stopbit := table(i).rx_delay_stopbit;
            G_tx_delay := table(i).tx_delay;
            exit;
         end if;
      end loop;
      -- Si il a une valeur d'attibuée
      if(G_rx_delay_stopbit > 0) then
         -- Si il a une adresse de PCICR register
         if(digitalPinToPCICR(digitalPinToPort(G_ReceivePin))<16#FFFF#) then
            writeToPCICRRegister(digitalPinToPort(G_ReceivePin));
            writeToPCMSKRegister(G_ReceivePin);
         end if;
         tunedDelay(G_tx_delay); -- Si niveau bas, c'est que l'on est à la fin
      end if;
      listen_SoftSerial;
   end Begin_SoftSerial;

   procedure end_SoftSerial(pin : lvcPins) is
   begin
      writeToPCMSKRegister(pin,False);
   end end_SoftSerial;

   function read_SoftSerial return Unsigned_8 is
      dat : Unsigned_8;
   begin
      if(not listening_SoftSerial) then
         return -1;
      end if;
      if (G_receive_buffer_tail = G_receive_buffer_head) then
         return -1;
      end if;
      dat := G_received_buffer(G_receive_buffer_head);
      G_receive_buffer_head := (G_receive_buffer_head +1) mod Max_RX_Buffer;
      return dat;
   end read_SoftSerial;

   function available_SoftSerial return Integer is
   begin
      if(not listening_SoftSerial) then
         return 0;
      end if;
      return ((G_receive_buffer_tail + Max_RX_Buffer - G_receive_buffer_head) mod Max_RX_Buffer);
   end available_SoftSerial;

   function write_SoftSerial (data : Unsigned_8) return Boolean is
      oldSREG : Unsigned_8;
   begin
      if(G_tx_delay = 0) then
         return False;
      end if;
      oldSREG := AVR.MCU.SREG;
      AVR.Interrupts.cli;
      tx_pin_write_SoftSerial(G_inverseLogic);
      --tunedDelay(G_tx_delay + 2); -- That's great! --115200
      tunedDelay(G_tx_delay + 15); -- That's great! --38400
      if(G_inverseLogic = True) then
         for i in 0..7 loop
            if ((data and 2**i) = 2**i) then
               tx_pin_write_SoftSerial(False);
            else
               tx_pin_write_SoftSerial(True);
            end if;
            tunedDelay(G_tx_delay);
         end loop;
         tx_pin_write_SoftSerial(False);
      else
         for i in 0..7 loop
            if ((data and 2**i) = 2**i) then
               tx_pin_write_SoftSerial(True);
            else
               tx_pin_write_SoftSerial(False);
            end if;
            tunedDelay(G_tx_delay);
         end loop;
         tx_pin_write_SoftSerial(True);
      end if;
      AVR.MCU.SREG := oldSREG;
      tx_pin_write_SoftSerial(not G_inverseLogic);
      tunedDelay(G_tx_delay);
      AVR.Interrupts.sei;
      return True;
   end write_SoftSerial;

   procedure flush_SoftSerial is
      oldSREG : Unsigned_8;
   begin
      if( listening_SoftSerial ) then
         oldSREG := AVR.MCU.SREG;
         AVR.Interrupts.cli;
         G_receive_buffer_tail := 0;
         G_receive_buffer_head := 0;
         AVR.MCU.SREG := oldSREG;
      end if;
   end flush_SoftSerial;

   function overflow_SoftSerial return Boolean is
      over : Boolean;
   begin
      over := G_bufferOverflow;
      G_bufferOverflow := False;
      return over;
   end overflow_SoftSerial;

   function peek_SoftSerial return Unsigned_8 is
      dat : Unsigned_8;
   begin
      if( not listening_SoftSerial) then
         return -1;
      end if;
      if (G_receive_buffer_tail = G_receive_buffer_head) then
         return -1;
      end if;
      dat := G_received_buffer(G_receive_buffer_head);
      return dat;
   end peek_SoftSerial;

   procedure init_Serial_Com is
   begin
      -- Set Baud rate Fosc = 16MHz, baud 115200 => UBRR = Fosc/16/baud-1 = 7!!!! , Sinon ça ne fonctionne pas, ne pas perdere 2h30 en plus
      -- Set Baud rate Fosc = 16MHz, baud 57600 => UBRR = Fosc/16/baud-1 = 16
      -- Set Baud rate Fosc = 16MHz, baud 38400 => UBRR = Fosc/16/baud-1 = 25
      -- Set Baud rate Fosc = 16MHz, baud 9600 => UBRR = Fosc/16/baud-1 = 103
      MCU.UBRR0 := Unsigned_16(7);
      MCU.UCSR0A := 0;
      --Set Format bit : 8N1
      MCU.UCSR0C := +(MCU.UCSZ00_Bit => True,
                      MCU.UCSZ01_Bit => True,
                      others => False);
      -- Enable Receiver and Transmitter
      MCU.UCSR0B := +(MCU.RXEN0_Bit => True,
                      MCU.TXEN0_Bit => True,
                      others => False);
   end init_Serial_Com;

   procedure init_Interrupt_Com is
   begin
      -- Interruption sur la récéption
      MCU.UCSR0B_Bits (MCU.RXCIE0_Bit) := True;
   end init_Interrupt_Com;


   procedure RX_UART_Interrupt;

   pragma Machine_Attribute (Entity         => RX_UART_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, RX_UART_Interrupt, MCU.Sig_USART_RX_String);

-- Stop interrupts during reading the register value!
   procedure RX_UART_Interrupt is
      value8: Unsigned_8;
      status : Boolean;
   begin
      AVR.Interrupts.Disable;
      value8 := MCU.UDR0;
      AVR.Interrupts.Enable;
      status := write_SoftSerial(value8);
   end RX_UART_Interrupt;
end SoftwareSerial;
