with AVR;
with AVR.MCU;
with AVR.Interrupts;

use AVR;
use AVR.MCU;

package body HC_SR04 is

   FirstValue, StateD8 : Boolean;
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
                      MCU.CS10_Bit => True,
                      others => False);
   -- Définition de la fréquence de fonctionnement
      MCU.ICR1 := 15000;  -- 16000000/64*0.06 (60ms) = 15000
   end Init_Timer1;

   procedure Init_Echo_Interrupt is
   begin
      -- MCU.PCIFR_Bits (MCU.PCIF0_Bit) := False;
      MCU.PCICR_Bits (MCU.PCIE0_Bit) := True;
      MCU.PCMSK0_Bits (MCU.PCINT0_Bit) := True;
   end Init_Echo_Interrupt;

   procedure Echo_Interrupt;
   pragma Machine_Attribute (Entity         => Echo_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Echo_Interrupt, MCU.Sig_PCINT1_String);

   procedure Echo_Interrupt is
      tempState : Boolean;
      tempTime : Unsigned_16;
   begin
      tempTime := MCU.TCNT1;
      tempState := MCU.PINB_Bits(0);
      if(tempState /= StateD8) then
         MCU.PCMSK0_Bits (MCU.PCINT0_Bit) := False;
         StateD8 := tempState;
         if(FirstValue) then
            StartTime := tempTime;
         else
            Time := tempTime - StartTime;
         end if;
         FirstValue := not (FirstValue);
         MCU.PCMSK0_Bits (MCU.PCINT0_Bit) := True;
      end if;
   end Echo_Interrupt;

   procedure Init_HC_SR04 is
   begin
      FirstValue := True;              -- Pour suivre le déclenchement de la capture
      StartTime := 0;                  -- Initialisation à 0 de StartTime
      Time :=0;                        -- Initialisation à 0 de Time
      MCU.DDRB_Bits (0) := DD_Input;   -- D8 en entrée
      MCU.DDRB_Bits (1) := DD_Output;  -- D9 en sortie
      AVR.Interrupts.Disable;          -- On désactive les interrruptions
      StateD8 := MCU.PINB_Bits(0);     -- The state of D8 pin
      Init_Timer1;                     -- Initialisation du Timer1
      Init_Echo_Interrupt;             -- Initialisation des interruption sur Echo
      MCU.TCCR1A_Bits(7) := True;      -- Equivalent à mettre COM1A1 à 1
      MCU.OCR1A := 3;                  -- Trigger 12 uS
      AVR.Interrupts.Enable;           -- On réactive les interrruptions
   end Init_HC_SR04;

   function GetTime return Unsigned_16 is
   begin
      return Time;
   end GetTime;

end HC_SR04;
