with AVR;
with AVR.MCU;
with Interfaces;

use AVR;
use Interfaces;

package body Timer0pwm is

-- Variable permettant de savoir si un timer à déjà été configuré
   Timer0_init : Boolean := False;
   
------------------------------------------------------------------------
--                                                                    --
--                                                                    --
--               Procédures d'nitialisation des Timers                --
--                                                                    --
------------------------------------------------------------------------

   -- Timer 0
   
   procedure init_Timer0 is
   begin
      MCU.PRR0_Bits (MCU.PRTIM0_Bit) := False;
      MCU.TCCR0A_Bits := (MCU.WGM01_Bit  => True,
                          others => False);
      MCU.TCCR0B_Bits := (MCU.WGM02_Bit => True,
                      --MCU.WGM03_Bit => True,
                      MCU.CS01_Bit => True,
                      others => False);
      Timer0_init := True;
   end init_Timer0;
   
   
   procedure Init_Port_PWM(numeroPort : Interfaces.Unsigned_8) is
   begin
      case numeroPort is
         when 2 => MCU.DDRE_Bits (4) := DD_Output; -- D2 en sortie
                    if(Timer3_init = False) then
                       init_Timer3;
                    end if;
                    MCU.TCCR3A_Bits(5) := True; -- Equivalent à mettre COM3B1 à 1
         when 3 => MCU.DDRE_Bits (5) := DD_Output; -- D3 en sortie
                    if(Timer3_init = False) then
                       init_Timer3;
                    end if;
                    MCU.TCCR3A_Bits(3) := True; -- Equivalent à mettre COM3C1 à 1
         when 5 => MCU.DDRE_Bits (3) := DD_Output; -- D5 en sortie
                    if(Timer3_init = False) then
                       init_Timer3;
                    end if;
                    MCU.TCCR3A_Bits(7) := True; -- Equivalent à mettre COM3A1 à 1
         when 6 => MCU.DDRH_Bits (3) := DD_Output; -- D6 en sortie
                    if(Timer4_init = False) then
                       init_Timer4;
                    end if;
                    MCU.TCCR4A_Bits(7) := True; -- Equivalent à mettre COM4A1 à 1
         when 7 => MCU.DDRH_Bits (4) := DD_Output; -- D7 en sortie
                    if(Timer4_init = False) then
                       init_Timer4;
                    end if;
                    MCU.TCCR4A_Bits(5) := True; -- Equivalent à mettre COM4B1 à 1
         when 8 => MCU.DDRH_Bits (5) := DD_Output; -- D8 en sortie
                    if(Timer4_init = False) then
                       init_Timer4;
                    end if;
                    MCU.TCCR4A_Bits(3) := True; -- Equivalent à mettre COM4C1 à 1                                                               
         when 11 => MCU.DDRB_Bits (5) := DD_Output; -- D11 en sortie
                    if(Timer1_init = False) then
                       init_Timer1;
                    end if;
                    MCU.TCCR1A_Bits(7) := True; -- Equivalent à mettre COM1A1 à 1
         when 12 => MCU.DDRB_Bits (6) := DD_Output; -- D12 en sortie
                    if(Timer1_init = False) then
                       init_Timer1;
                    end if;
                    MCU.TCCR1A_Bits(5) := True; -- Equivalent à mettre COM1B1 à 1
         when 13 => MCU.DDRB_Bits (7) := DD_Output; -- D13 en sortie
                    if(Timer1_init = False) then
                       init_Timer1;
                    end if;
                    MCU.TCCR1A_Bits(3) := True; -- Equivalent à mettre COM1C1 à 1           
         when 44 => MCU.DDRL_Bits (3) := DD_Output; -- D44 en sortie
                    if(Timer5_init = False) then
                       init_Timer5;
                    end if;
                    MCU.TCCR5A_Bits(3) := True; -- Equivalent à mettre COM5C1 à 1
         when 45 => MCU.DDRL_Bits (4) := DD_Output; -- D45 en sortie
                    if(Timer5_init = False) then
                       init_Timer5;
                    end if;
                    MCU.TCCR5A_Bits(5) := True; -- Equivalent à mettre COM5B1 à 1
         when 46 => MCU.DDRL_Bits (5) := DD_Output; -- D46 en sortie
                    if(Timer5_init = False) then
                       init_Timer5;
                    end if;
                    MCU.TCCR5A_Bits(7) := True; -- Equivalent à mettre COM5A1 à 1   
         when others => null;
      end case;
   end Init_Port_PWM; 
   
   procedure Write_PWM(numeroPort : Interfaces.Unsigned_8; valeur_PWM : Interfaces.Unsigned_16) is
   begin
      case numeroPort is
         when 2 => MCU.OCR3B := valeur_PWM*2;
         when 3 => MCU.OCR3C := valeur_PWM*2;
         when 5 => MCU.OCR3A := valeur_PWM*2;      
         when 6 => MCU.OCR4A := valeur_PWM*2;
         when 7 => MCU.OCR4B := valeur_PWM*2;
         when 8 => MCU.OCR4C := valeur_PWM*2;
         when 11 => MCU.OCR1A := valeur_PWM*2;
         when 12 => MCU.OCR1B := valeur_PWM*2;
         when 13 => MCU.OCR1C := valeur_PWM*2;
         when 44 => MCU.OCR5C := valeur_PWM*2;
         when 45 => MCU.OCR5B := valeur_PWM*2;
         when 46 => MCU.OCR5A := valeur_PWM*2;
         when others => null;
      end case;   
   end Write_PWM;

   procedure Run is
   begin
   --init_PWM1;
   Init_Port_PWM(11);
   Init_Port_PWM(12);
   Init_Port_PWM(13);
   Init_Port_PWM(2);
   Init_Port_PWM(3);
   Init_Port_PWM(5);
   Init_Port_PWM(6);
   Init_Port_PWM(7);
   Init_Port_PWM(8);
   Init_Port_PWM(44);
   Init_Port_PWM(45);
   Init_Port_PWM(46);
      loop
         Write_PWM(11,1000);
         Write_PWM(12,1500);
         Write_PWM(13,2000);
         Write_PWM(2,1250);
         Write_PWM(3,1750);
         Write_PWM(5,1700);
         Write_PWM(6,1100);
         Write_PWM(7,1200);
         Write_PWM(8,1300);
         Write_PWM(44,1400);
         Write_PWM(45,1600);
         Write_PWM(46,1800);
      end loop;
   end Run;
end Timer0pwm;
