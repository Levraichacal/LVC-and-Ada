
with Interfaces;
use Interfaces;
with LVC.PINS;
use LVC.PINS;

package IRreceiver is

   -- Differents States Machine
   type ReceiverState is (STATE_IDLE, STATE_MARK, STATE_SPACE, STATE_STOP, STATE_OVERFLOW);

   -- Buffer Types
   type Buffer is array (1..8) of Unsigned_8;

   type Data is record
      rcvstate : ReceiverState;  -- State Machine
      recvpin : lvcPins;               -- receiver Pins
      --blinkpin : lvcPins;              -- Blink Pins
      --blinkflag: Boolean;            -- Blink flags
      rawlen : Unsigned_8;        -- Number of entry in raw buff
      timer : Unsigned_8;          -- State timer, counts 50uS ticks.
      rawbuf : Buffer;                 -- Raw data
      overflow : Unsigned_8;      -- Raw buffer
   end record;

   procedure init;


end IRreceiver;
