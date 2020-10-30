with AVR;
with AVR.MCU;
with Interfaces;
with LVC.PINS;

use AVR;
use Interfaces;
use LVC.PINS;
package body Timer2pwm is

-- Variable permettant de savoir si un timer à déjà été configuré
   Timer2_init : Boolean := False;

------------------------------------------------------------------------
--                                                                    --
--                                                                    --
--               Procédures d'nitialisation des Timers                --
--                                                                    --
------------------------------------------------------------------------

   -- Timer 2

   procedure init_Timer2 is
   begin
   -- Activation du timer;
      MCU.PRR_Bits (MCU.PRTIM2_Bit) := False;
   -- Configuration du timer 2 pour fonctionner en PWM
      MCU.TCCR2A_Bits := (MCU.WGM21_Bit  => True,
                          MCU.WGM20_Bit => True,
                          others => False);
      MCU.TCCR2B_Bits := (MCU.CS22_Bit => True,
                          MCU.CS21_Bit => True,
                          MCU.CS20_Bit => True,
                          others => False);
      Timer2_init := True;
   end init_Timer2;



   procedure Init_Port_PWM(numeroPort : lvcPins) is
   begin
      case numeroPort is
         when D3 => pinMode(D3,Output); -- D3 en sortie
            if(Timer2_init = False) then
               init_Timer2;
            end if;
            MCU.TCCR2A_Bits(MCU.COM2B1_Bit) := True; -- Equivalent à mettre COM2B1 à 1 ie clear on compare match!
         when D11 => pinMode(D11,Output); -- D11 en sortie
            if(Timer2_init = False) then
               init_Timer2;
            end if;
            MCU.TCCR2A_Bits(MCU.COM2A1_Bit) := True; -- Equivalent à mettre COM2A1 à 1
         when others => null;
      end case;
   end Init_Port_PWM;

   procedure Write_PWM(numeroPort : lvcPins; valeur_PWM : Interfaces.Unsigned_8) is
   begin
      case numeroPort is
         when D3 => MCU.OCR2B := valeur_PWM;
         when D11 => MCU.OCR2A := valeur_PWM;
         when others => null;
      end case;
   end Write_PWM;

   procedure Run is
   begin
      --init_PWM1;
      Init_Port_PWM(D3);
      Init_Port_PWM(D11);
      loop
         Write_PWM(D3,5);
         Write_PWM(D11,50);
      end loop;
   end Run;
end Timer2pwm;
