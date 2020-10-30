with Interfaces;
use Interfaces;

with System;
use System;

with LVC.PINS;
use LVC.PINS;
--with AVR;
--use AVR;

package Visca328p is
   procedure Run;

   type Delay_Table is record
      baud : Unsigned_32;
      rx_delay_centering : Unsigned_16;
      rx_delay_intrabit : Unsigned_16;
      rx_delay_stopbit : Unsigned_16;
      tx_delay : Unsigned_16;
   end record;

   type Tableau_Data_Delay is array (1..12) of Delay_Table;

   procedure Wdr;

private
   pragma Import (Intrinsic, Wdr, "__builtin_avr_wdr");
   G_comactive : Boolean;
   G_bufferOverflow : Boolean;
   G_receive_buffer_tail : Integer;
   G_receive_buffer_head : Integer;
   G_TransmitPin : lvcPins;
   G_TransmitBitMask : Unsigned_8;
   G_TransmitPortRegister : Address;
   G_tx_delay : Unsigned_16;
   G_inverseLogic : Boolean;
end Visca328p ;
