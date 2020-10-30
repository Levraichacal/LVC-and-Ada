
with Interfaces;
use Interfaces;
with LVC.PINS;
use LVC.PINS;

package IRreceiver is
   -- Constant taille du buffer
   RAWBUF  : constant := 101;

   -- Differents States Machine
   type ReceiverState is (STATE_IDLE, STATE_MARK, STATE_SPACE, STATE_STOP, STATE_OVERFLOW);

   -- Buffer Types
   type Buffer is array (1..RAWBUF) of Unsigned_8;

   type T_IRparams is record
      rcvstate : ReceiverState;  -- State Machine
      recvpin : lvcPins;               -- receiver Pins
      --blinkpin : lvcPins;              -- Blink Pins
      --blinkflag: Boolean;            -- Blink flags
      rawlen : Integer;           -- Number of entry in raw buff
      timer : Unsigned_8;          -- State timer, counts 50uS ticks.
      rawbuf : Buffer;                 -- Raw data
      overflow : Boolean;          -- Raw buffer
   end record;

   irparams : T_IRparams;

   type T_Result is record
      value : Unsigned_32;   -- Decoded value [max 32-bits]
      rawbuf : Buffer;           -- Raw intervals in 50uS ticks
      rawlen : Integer;         -- Number of records in rawbuf
      overflow : Boolean;     -- true iff IR raw code too long
   end record;

   result : T_Result;

   procedure init_receiver(Recevier_Pin : lvcPins);

   function isIdle return Boolean;

   procedure resume;

   function decodeHash return Boolean;

   --function decode return Boolean;

   function getValue return Unsigned_32;

   function getDataReady return Boolean;

end IRreceiver;
