with AVR;
with AVR.MCU;
with AVR.Interrupts;
with AVR.UART;

with Interfaces;
use Interfaces;
use AVR;
use AVR.MCU;


package body IRreceiver is

   procedure Init_Timer2 is
   begin
      -- Activation du timer;
      MCU.PRR_Bits (MCU.PRTIM2_Bit) := False;
      -- Configuration du timer 2 pour fonctionner en PWM
      MCU.TCCR2A_Bits := (MCU.WGM21_Bit  => True,
                                       others => False);
      -- Configuration en 250Hz (environ)
      MCU.TCCR2B_Bits := (MCU.CS21_Bit => True,
                                       others => False);
      -- Configuration output compare match
      MCU.TIMSK2_Bits := (MCU.OCIE2A_Bit => True,
                                       others => False);
      -- Fonctionnement à 50uS
      MCU.OCR2A := 100;
      -- Remise à 0 du timer
      MCU.TCNT2 := 0;
   end Init_Timer2;

   dataRdy : Boolean;

   -- This is the init_receiver  procedure
   procedure init_receiver(Recevier_Pin : lvcPins) is
   begin
      irparams.recvpin := Recevier_Pin;
      irparams.overflow := False;
      irparams.rawlen := 0;
      irparams.timer := 0;
      irparams.rcvstate := STATE_IDLE;
      pinMode(irparams.recvpin, Input);
      Init_Timer2;
      dataRdy := False;
      AVR.Interrupts.Enable;           -- On réactive les interrruptions
   end init_receiver;

   procedure Compa_Timer_Interrupt;
   pragma Machine_Attribute (Entity         => Compa_Timer_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Compa_Timer_Interrupt, Sig_TIMER2_COMPA_String);

   procedure Compa_Timer_Interrupt is
      irData :Boolean;
   begin
      irData := digitalReadValue(irparams.recvpin);
      irparams.timer := irparams.timer + 1;
      if (irparams.rawlen >= RAWBUF)  then
         irparams.rcvstate := STATE_OVERFLOW ;
      end if;
      case irparams.rcvstate is
         when STATE_IDLE =>
            if(not irData) then
               if(irparams.timer < 100) then
                  irparams.timer := 0;
               else
                  irparams.overflow := False;
                  irparams.rawlen := 1;
                  irparams.rawbuf(irparams.rawlen) := irparams.timer;
                  irparams.timer := 0;
                  irparams.rcvstate := STATE_MARK;
               end if;
            end if;

         when STATE_MARK =>
            if(irData) then
               irparams.rawlen := irparams.rawlen +1;
               irparams.rawbuf(irparams.rawlen) := irparams.timer;
               irparams.timer := 0;
               irparams.rcvstate := STATE_SPACE;
            end if;

         when STATE_SPACE =>
            if(not irData) then
               irparams.rawlen := irparams.rawlen +1;
               irparams.rawbuf(irparams.rawlen) := irparams.timer;
               irparams.timer := 0;
               irparams.rcvstate := STATE_MARK;
            else
               if(irparams.timer > 100) then
                  irparams.rcvstate := STATE_STOP;
               end if;
            end if;

         when STATE_STOP =>
            if(not irData) then
               irparams.timer := 0;
               --irparams.rawlen := 1;
               dataRdy := True;
               -- AVR.UART.Put(irparams.rawbuf(1));AVR.UART.Put(" ");
               -- AVR.UART.Put(irparams.rawbuf(2));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(3));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(4));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(5));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(6));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(7));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(8));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(9));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(10));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(11));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(12));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(13));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(14));AVR.UART.Put(" ");
--                AVR.UART.Put(irparams.rawbuf(15));
--                AVR.UART.CRLF;
            end if;

         when STATE_OVERFLOW =>
            irparams.overflow := True ;
            irparams.rcvstate := STATE_STOP ;

      end case;
   end Compa_Timer_Interrupt;

   function isIdle return Boolean is
   begin
      if(irparams.rcvstate = STATE_IDLE or irparams.rcvstate = STATE_STOP) then
         return True;
      else
         return False;
      end if;
   end isIdle;

   procedure resume is
   begin
      irparams.rcvstate := STATE_IDLE;
      irparams.rawlen := 0;
   end resume;

   function compare (old_val : Unsigned_16; new_val : Unsigned_16) return Unsigned_32 is
   begin
      if ((new_val *10) < (old_val * 9 )) then
         return 0;
      else
         if ((old_val *10) < (new_val * 9 )) then
            return 2;
         else
            return 1;
         end if;
      end if;
   end compare;

   function decodeHash return Boolean is
      hash : Unsigned_32;
      val : Unsigned_32;
   begin
      if(result.rawlen <6) then
         return False;
      end if;
      for i in 1 .. result.rawlen-2 loop
         val := compare(Unsigned_16(result.rawbuf(i)), Unsigned_16(result.rawbuf(i+2)));
         --hash := (hash *  FNV_PRIME_32) xor val;
         hash := hash*4 + val;
      end loop;
      result.rawlen := 0;
      result.value := hash;
      return True;
   end decodeHash;

   function decode return Boolean is
   begin
      result.rawbuf := irparams.rawbuf;
      result.rawlen := irparams.rawlen;
      irparams.rawlen := 0;
      result.overflow := irparams.overflow;
      if (irparams.rcvstate /= STATE_STOP)  then
         return False;
         
      end if;
      if (decodeHash) then
         return True;
      end if;
      -- Throw away and start over
      resume;
      return False;
   end decode;

   function getValue return Unsigned_32 is
      temp : Unsigned_32 := result.value;
   begin
      dataRdy := False;
      result.value := 0;
      return temp;
   end getValue;

   function getDataReady return Boolean is
   begin
      return (decode and dataRdy);
   end getDataReady;

end IRreceiver;
