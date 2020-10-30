with LVC.PWM.TIMER1;
with Interfaces;
with AVR.Real_Time.Delays;
with AVR.MCU;
with AVR;
with AVR.Interrupts;

use LVC.PWM.TIMER1;
use Interfaces;
use AVR;

package body Timer1pwm is

   procedure PPM_Interrupt;

   pragma Machine_Attribute (Entity         => PPM_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, PPM_Interrupt, MCU.Sig_TIMER1_COMPA_String);

-- PPM Interrupt seems to correctly work
   procedure PPM_Interrupt is
   begin
      MCU.TIMSK1_Bits (MCU.OCIE1A_Bit) := False;
--      LVC.PWM.TIMER1.Write_PWM(9,10000);
      MCU.OCR1A := MCU.OCR1A + 1000;
      MCU.PORTB_Bits(5):= not MCU.PORTB_Bits(5);
      MCU.TIMSK1_Bits (MCU.OCIE1A_Bit) := True;
   end PPM_Interrupt;

   procedure Run is
      j,k : Interfaces.Unsigned_16;
   begin
      AVR.Interrupts.Disable;
      LVC.PWM.TIMER1.Init_Port_PWM(9);
      LVC.PWM.TIMER1.Init_Port_PWM(10);
      MCU.DDRB_Bits (5) := DD_Output; -- D13
      MCU.PORTB_Bits(5):= True;
      MCU.TIMSK1_Bits (MCU.OCIE1A_Bit) := True;
      MCU.TCCR1A_Bits(MCU.COM1A0_Bit) := True;
      AVR.Interrupts.Enable;
      delay 1.0;
      MCU.PORTB_Bits(5):= False;
      loop
         j := 0;
         k := 2000;
         for i in 1..2000 loop
            j := j + 1;
            k := k - 1;
            LVC.PWM.TIMER1.Write_PWM(9,j);
            LVC.PWM.TIMER1.Write_PWM(10,k);
            delay 0.02;
         end loop;
         for i in 1..2000 loop
            j := j - 1;
            k := k + 1;
            LVC.PWM.TIMER1.Write_PWM(9,j);
            LVC.PWM.TIMER1.Write_PWM(10,k);
            delay 0.02;
         end loop;
      end loop;
   end Run;
end Timer1pwm;
