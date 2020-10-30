with Interfaces;
use Interfaces;
with System;

with LVC.PINS;
use LVC.PINS;
use System;
with AVR;
use AVR;

package SoftwareSerial is

   type Delay_Table is record
      baud : Unsigned_32;
      rx_delay_centering : Unsigned_16;
      rx_delay_intrabit : Unsigned_16;
      rx_delay_stopbit : Unsigned_16;
      tx_delay : Unsigned_16;
   end record;

   type Tableau_Data is array (1..12) of Delay_Table;

   procedure Init_SoftSerial(receivePin : lvcPins; transmitPin : lvcPins; inverseLogic : Boolean := False);

   procedure Begin_SoftSerial (speed : Unsigned_32);

   function read_SoftSerial return Unsigned_8;

   function write_SoftSerial (data : Unsigned_8) return Boolean;

   procedure flush_SoftSerial;

   function peek_SoftSerial return Unsigned_8;

   function overflow_SoftSerial return Boolean;

   function available_SoftSerial return Integer;

   procedure end_SoftSerial(pin : lvcPins);

   Max_RX_Buffer : constant := 64;

private
   -------------------------------------------------------------------------------
   -- Type et variable privé                                                    --
   -------------------------------------------------------------------------------
   G_ReceivePin : lvcPins;
   G_ReceiveBitMask : Bit_Number; --Unsigned_8;
   G_ReceivePortRegister : Address;
   G_TransmitPin : lvcPins;
   G_TransmitBitMask : Unsigned_8;
   G_TransmitPortRegister : Address;

   G_rx_delay_centering : Unsigned_16;
   G_rx_delay_intrabit : Unsigned_16;
   G_rx_delay_stopbit : Unsigned_16;
   G_tx_delay : Unsigned_16;

   G_bufferOverflow : Boolean;
   G_inverseLogic : Boolean;

   G_comactive : Boolean;
   G_receive_buffer_tail : Integer;
   G_receive_buffer_head : Integer;
   type buffer is array (0..Max_RX_Buffer) of Unsigned_8;
   G_received_buffer : buffer;

end SoftwareSerial;
