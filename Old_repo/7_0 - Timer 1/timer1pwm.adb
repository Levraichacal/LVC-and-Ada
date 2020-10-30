with AVR;
with AVR.MCU;

use AVR;


package body Timer1pwm is

   procedure init_PWM1 is
   begin
   -- Activation du timer; 
      MCU.PRR0_Bits (MCU.PRTIM1_Bit) := False;
   -- Définition des ports PB5, PB6 et PB7 en sortie
      MCU.DDRB_Bits (5) := DD_Output;
      MCU.DDRB_Bits (6) := DD_Output;
      MCU.DDRB_Bits (7) := DD_Output;
   -- Configuration du timer 1 pour fonctionner en PWM   
      MCU.TCCR1A_Bits := (MCU.COM1A1_Bit => True,
                   MCU.COM1B1_Bit => True,
                   MCU.COM1C1_Bit  => True,
                   MCU.WGM11_Bit  => True,
                   others => False);
      MCU.TCCR1B_Bits := (MCU.WGM12_Bit => True,
                      MCU.WGM13_Bit => True,
                      MCU.CS11_Bit => True,  -- Prescale 8
                      others => False);  
    -- Ecriture sur les ports d'une valeur initial sur les PWM                  
      MCU.OCR1A := 3000; -- pwm*2 =>1500 PB5 -> D11
      MCU.OCR1B := 2000; -- pwm*2 =>1000 PB6 -> D12
      MCU.OCR1C := 4000; -- pwm*2 =>2000 PB7 -> D13 
    -- Définition de la fréquence de fonctionnement  
      MCU.ICR1 := 40000;  -- 50 Hz => 16000000/8/50 = 40000
   end init_PWM1;

   

   procedure Run is
   begin
   init_PWM1;
      loop
         null;
      end loop;
   end Run;
end Timer1pwm;
