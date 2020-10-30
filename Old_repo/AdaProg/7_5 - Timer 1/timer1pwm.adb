with AVR;
with AVR.MCU;
with Interfaces;

use AVR;
use Interfaces;

package body Timer1pwm is

   Timer1_init : Boolean := False;
   procedure init_Timer1 is
   begin
   
   -- Activation du timer; 
      MCU.PRR0_Bits (MCU.PRTIM1_Bit) := False;
   -- Définition des ports PB5, PB6 et PB7 en sortie
 --     MCU.DDRB_Bits (5) := DD_Output; --D11
 --     MCU.DDRB_Bits (6) := DD_Output; --D12
 --     MCU.DDRB_Bits (7) := DD_Output; --D13
   -- Configuration du timer 1 pour fonctionner en PWM   
      MCU.TCCR1A_Bits := (MCU.WGM11_Bit  => True,
                          others => False);
      MCU.TCCR1B_Bits := (MCU.WGM12_Bit => True,
                      MCU.WGM13_Bit => True,
                      MCU.CS11_Bit => True,  -- Prescale 8
                      others => False);  
    -- Ecriture sur les ports d'une valeur initial sur les PWM                  
 --     MCU.OCR1A := 3000; -- pwm*2 =>1500 PB5 -> D11
 --     MCU.OCR1B := 2000; -- pwm*2 =>1000 PB6 -> D12
 --     MCU.OCR1C := 4000; -- pwm*2 =>2000 PB7 -> D13 
    -- Définition de la fréquence de fonctionnement  
      MCU.ICR1 := 40000;  -- 50 Hz => 16000000/8/50 = 40000
      Timer1_init := True;
   end init_Timer1;

   
   procedure Init_Port_PWM(numeroPort : Interfaces.Unsigned_8) is
   begin
      case numeroPort is
         when 11 => MCU.DDRB_Bits (5) := DD_Output; --D11 en sortie
                    if(Timer1_init = False) then
                       init_Timer1;
                    end if;
                    MCU.TCCR1A_Bits(7) := True; -- Equivalent à mettre COM1A1 à 1
         when 12 => MCU.DDRB_Bits (6) := DD_Output; --D12 en sortie
                    if(Timer1_init = False) then
                       init_Timer1;
                    end if;
                    MCU.TCCR1A_Bits(5) := True; -- Equivalent à mettre COM1B1 à 1
         when 13 => MCU.DDRB_Bits (7) := DD_Output; --D13 en sortie
                    if(Timer1_init = False) then
                       init_Timer1;
                    end if;
                    MCU.TCCR1A_Bits(3) := True; -- Equivalent à mettre COM1C1 à 1           
         when others => null;
      end case;
   end Init_Port_PWM; 
   
   procedure Write_PWM(numeroPort : Interfaces.Unsigned_8; valeur_PWM : Interfaces.Unsigned_16) is
   begin
      case numeroPort is
         when 11 => MCU.OCR1A := valeur_PWM*2;
         when 12 => MCU.OCR1B := valeur_PWM*2;
         when 13 => MCU.OCR1C := valeur_PWM*2;
         when others => null;
      end case;   
   end Write_PWM;

   procedure Run is
   begin
   --init_PWM1;
   Init_Port_PWM(11);
   Init_Port_PWM(12);
   Init_Port_PWM(13);
      loop
         Write_PWM(11,1000);
         Write_PWM(12,1500);
         Write_PWM(13,2000);
      end loop;
   end Run;
end Timer1pwm;
