with AVR;
with AVR.MCU;
with AVR.UART;
with AVR.Interrupts;

with Interfaces;
use Interfaces;
use AVR;
use AVR.MCU;


package body IRreceiver is
   FirstValue, StateD11 : Boolean;
   StartTime, Time : Unsigned_8;

   procedure Init_Timer0 is
   begin
      -- Activation du timer;
      MCU.PRR_Bits (MCU.PRTIM0_Bit) := False;
      -- Configuration du timer 2 pour fonctionner en PWM
      MCU.TCCR0A_Bits := (MCU.WGM01_Bit  => True,
                                       others => False);
      -- Configuration en 250Hz (environ)
      MCU.TCCR0B_Bits := (MCU.CS02_Bit => True,
                                       others => False);
      -- Fonctionnement à 50uS
      -- MCU.OCR2A := 100;
      -- Remise à 0 du timer
      -- MCU.TCNT0 := 0;
   end Init_Timer0;

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

   -- This is the init_Port  procedure
   procedure init_Port is
   begin
      MCU.DDRB_Bits (3) := False; -- D11 en entrée
   end init_Port;

   procedure Init_Port_Interrupt is
   begin
      --MCU.PCIFR_Bits (MCU.PCIF0_Bit) := False;
      MCU.PCICR_Bits (MCU.PCIE0_Bit) := True;
      MCU.PCMSK0_Bits (MCU.PCINT3_Bit) := True; -- D11
   end Init_Port_Interrupt;

   -- This is the init_Port  procedure
   procedure init is
   begin
      AVR.UART.Init (103); --9600 @16MHz
      AVR.UART.Put ("Initialisation : ");
      AVR.UART.CRLF;
      FirstValue := True;              -- Pour suivre le déclenchement de la capture
      StartTime := 0;                  -- Initialisation à 0 de StartTime
      Time :=0;                        -- Initialisation à 0 de Time
      AVR.Interrupts.Disable;          -- On désactive les interrruptions
      StateD11 := MCU.PINB_Bits(3);    -- The state of D11 pin
      Init_Timer0;                     -- Initialisation du Timer1
      init_Port;             -- Initialisation des interruption sur Echo
      Init_Port_Interrupt;
      AVR.Interrupts.Enable;           -- On réactive les interrruptions
   end init;

   procedure Port_Interrupt;
   pragma Machine_Attribute (Entity         => Port_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Port_Interrupt, MCU.Sig_PCINT0_String);

   procedure Port_Interrupt is
      tempState : Boolean;
      tempTime : Unsigned_8;
   begin
      tempTime := MCU.TCNT0;
      tempState := MCU.PINB_Bits(3);
      if(tempState /= StateD11) then
         MCU.PCMSK0_Bits (MCU.PCINT3_Bit) := False;
         StateD11 := tempState;
         if(FirstValue) then
            StartTime := tempTime;
         else
            Time := tempTime - StartTime;
            AVR.UART.Put(Time);
            AVR.UART.CRLF;
         end if;
         FirstValue := not (FirstValue);
         MCU.PCMSK0_Bits (MCU.PCINT3_Bit) := True;
     end if;
   end Port_Interrupt;

end IRreceiver;
