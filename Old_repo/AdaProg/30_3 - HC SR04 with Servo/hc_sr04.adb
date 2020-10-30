with AVR;
with AVR.MCU;
with AVR.Interrupts;
with AVR.UART;

use AVR;
use AVR.MCU;



package body HC_SR04 is

   FirstValue, StateD11 : Boolean;
   StartTime, Time : Unsigned_16;

   procedure Init_Timer1 is
   begin
   -- Activation du timer;
      MCU.PRR_Bits (MCU.PRTIM1_Bit) := False;
   -- Configuration du timer 1 pour fonctionner en PWM
      MCU.TCCR1A_Bits := (MCU.WGM11_Bit  => True,
                          others => False);
      MCU.TCCR1B_Bits := (MCU.WGM12_Bit => True,
                      MCU.WGM13_Bit => True,
                      MCU.CS11_Bit => True,
                      others => False);
   -- Définition de la fréquence de fonctionnement
      MCU.ICR1 := 40000;  -- 50 Hz => 16000000/8/50 = 40000
   end Init_Timer1;

   procedure Init_Timer2 is
   begin
   -- Activation du timer;
      MCU.PRR_Bits (MCU.PRTIM2_Bit) := False;
   -- Configuration du timer 2 pour fonctionner en PWM
      MCU.TCCR2A_Bits := (MCU.WGM21_Bit  => True,
                          others => False);
      MCU.TCCR2B_Bits := (MCU.CS21_Bit => True,
                          others => False);
   -- Définition de la fréquence de fonctionnement
      -- MCU.ICR2 := 255;  -- 16000000/64*0.06 (60ms) = 15000
      --MCU.TCNT2 := 235;
      MCU.OCR2A := 20;
      MCU.TIMSK2_Bits(MCU.OCIE2A_Bit) := True;
   end Init_Timer2;

   procedure Stop_Timer2 is
   begin
   -- Desactivation du timer;
      MCU.PRR_Bits (MCU.PRTIM2_Bit) := True;
      MCU.TIMSK2_Bits(MCU.OCIE2A_Bit) := False;
   end Stop_Timer2;

   procedure Init_Echo_Interrupt is
   begin
      --MCU.PCIFR_Bits (MCU.PCIF0_Bit) := False;
      MCU.PCICR_Bits (MCU.PCIE0_Bit) := True;
      MCU.PCMSK0_Bits (MCU.PCINT5_Bit) := True; -- D13
   end Init_Echo_Interrupt;

   procedure Echo_Interrupt;
   pragma Machine_Attribute (Entity         => Echo_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Echo_Interrupt, MCU.Sig_PCINT0_String);

   procedure Echo_Interrupt is
      tempState : Boolean;
      tempTime : Unsigned_16;
   begin
      tempTime := MCU.TCNT1;
      tempState := MCU.PINB_Bits(5);
      if(tempState /= StateD11) then
         MCU.PCMSK0_Bits (MCU.PCINT5_Bit) := False;
         StateD11 := tempState;
         if(FirstValue) then
            StartTime := tempTime;
         else
            Time := tempTime - StartTime;
            AVR.UART.Put(Time/116);
         end if;
         FirstValue := not (FirstValue);
         MCU.PCMSK0_Bits (MCU.PCINT5_Bit) := True;
     end if;
   end Echo_Interrupt;

   procedure Set_Servo9(valeur_PWM : Interfaces.Unsigned_16) is
   begin
      MCU.OCR1A := valeur_PWM *2;
   end Set_Servo9;
   

   procedure Init_Servo9 is
   begin
      MCU.DDRB_Bits (1) := DD_Output; -- D9 en sortie
      MCU.TCCR1A_Bits(7) := True; -- Equivalent à mettre COM1A1 à 1
      Set_Servo9(1500); -- PWM à 1500 TODO fonction trim
   end Init_Servo9;



   procedure Init_HC_SR04 is
   begin
      FirstValue := True;              -- Pour suivre le déclenchement de la capture
      StartTime := 0;                  -- Initialisation à 0 de StartTime
      Time :=0;                        -- Initialisation à 0 de Time
      MCU.DDRB_Bits (5) := DD_Input;   -- D13 en entrée
      MCU.DDRB_Bits (4) := DD_Output;  -- D12 en sortie
      MCU.PORTB_Bits(5) := True;       -- Pull up on D13
      AVR.Interrupts.Disable;          -- On désactive les interrruptions
      StateD11 := MCU.PINB_Bits(5);    -- The state of D13 pin
      Init_Timer1;                     -- Initialisation du Timer1
      Init_Echo_Interrupt;             -- Initialisation des interruption sur Echo
      AVR.Interrupts.Enable;           -- On réactive les interrruptions
      Init_Servo9; 
   end Init_HC_SR04;

   procedure GetDistance is
   begin
      Init_Timer2;
      MCU.PORTB_Bits(4) := True;
   end GetDistance;

   procedure Fin_Trigger;
   pragma Machine_Attribute (Entity         => Fin_Trigger,
                             Attribute_Name => "signal");
   pragma Export (C, Fin_Trigger, MCU.Sig_TIMER2_COMPA_String);

   procedure Fin_Trigger is
   begin
      MCU.PORTB_Bits(4) := False;
      Stop_Timer2;
   end Fin_Trigger;
end HC_SR04;
