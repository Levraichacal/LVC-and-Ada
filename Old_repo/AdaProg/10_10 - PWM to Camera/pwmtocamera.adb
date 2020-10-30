with Interfaces;
with AVR;
with AVR.MCU;
with AVR.Interrupts;
with LVC.PINS;

-- Ce programme permet de piloter le zoom de la FCB-6300EH avec un PWM vie un arduino.
-- Entrée sur le port A0 pour le pwm.
-- Commande via les ports D0-D1 (RX-TX).
--                  ___    ___
--        RST--PC6 -   \__/   - PC5
--  CAMERA TX--PD0 -          - PC4
--  CAMERA RX--PD1 -          - PC3
--             PD2 -          - PC2
--             PD3 -          - PC1
--             PD4 -          - PC0--ZOOM IN (PWM)
--             VCC -          - GND
--             GND -          - AREF
--       OSC1--PB6 -          - AVCC
--       OSC2--PB7 -          - PB5
--             PD5 -          - PB4
--             PD6 -          - PB3
--             PD7 -          - PB2
--             PB0 -__________- PB1
--
-- Le principe de fonctionnement est le suivant :
-- Une interruption matérielle est déclenchée quand il y a un changement sur le port en entrée (ZOOM IN)
-- L'interruption est traitée et suivant le status du port:
--    soit un temps de début d'impulsion est stocké
--    soit une largeur d'impulsion est déterminée et est utilisée
-- L'envoie des données est effectué que si le PWM est dans la plage de changement

use AVR;
use Interfaces;
use LVC.PINS;



package body Pwmtocamera is

-----------------------------------------------------------------------------------------------------------
--  LE TYPE de stockage des commandes
-----------------------------------------------------------------------------------------------------------
   type Command is (Init, ZoomIn, ZoomOut, ZoomStop, CommandCancel);
--   AddressCommand : Tableau_4 := (16#88#, 16#30#, 16#01#, 16#FF#);
--   IfClear : Tableau_5 := (16#88#, 16#01#, 16#00#, 16#01#, 16#FF#);
--   ZoomIn : Tableau_6 := (16#81#, 16#01#, 16#04#, 16#07#, 16#22#, 16#FF#); -- Speed 2/7
--   ZoomOut : Tableau_6 := (16#81#, 16#01#, 16#04#, 16#07#, 16#32#, 16#FF#); -- Speed 2/7
--   ZoomStop : Tableau_6 := (16#81#, 16#01#, 16#04#, 16#07#, 16#00#, 16#FF#);
--   CommandCancel : Tableau_3 := (16#81#, 16#21#, 16#FF#);


-----------------------------------------------------------------------------------------------------------
--  LES VARIABLES
-----------------------------------------------------------------------------------------------------------
   servo_start : Unsigned_16 := 0 ;
   servo_width : Unsigned_16 := 1500 ;
   PINC_Old : Unsigned_8 := 0;
   valueStep : Unsigned_8 := 1;
   Commande  : Command;
   Zoom : Boolean := False;


-----------------------------------------------------------------------------------------------------------
--  LES PROCEDURES D'INITIALISATION
-----------------------------------------------------------------------------------------------------------
   procedure init_Timer1 is
   begin
      -- Configuration des interrupt flag, aucun n'est activé
      MCU.TIFR1_Bits := (others => False);
      MCU.TCCR1A_Bits := (others => False);
      MCU.TCCR1B_Bits := (others => False);
      MCU.TCNT1 := 0;
      MCU.TCCR1B_Bits := (MCU.CS11_Bit => True, -- prescale de 8 ie à 2MHz
                          others => False);
   -- Activation du timer;
      MCU.PRR_Bits (MCU.PRTIM1_Bit) := False;
   end init_Timer1;

   procedure init_Serial_Com is
   begin
      -- Set Baud rate Fosc = 16MHz, baud 38400 => UBRR = Fosc/16/baud-1 = 25
      MCU.UBRR0 := Unsigned_16(25);
      MCU.UCSR0A := 0;
      --Set Format bit : 8N1
      MCU.UCSR0C := +(MCU.UCSZ00_Bit => True,
                      MCU.UCSZ01_Bit => True,
                      others => False);
      -- Enable Transmitter and receiver
      MCU.UCSR0B := +(MCU.TXEN0_Bit => True,
                      MCU.RXEN0_Bit => True,
                      others => False);
   end init_Serial_Com;


   procedure init_PortC is
   begin
      pinMode(A0, Input); -- PWM IN
   end init_PortC;

   procedure init_Port is
   begin
      init_PortC;
      init_Serial_Com;
   end init_Port;

   procedure init_InterruptC is
   begin
      MCU.PCICR_Bits (MCU.PCIE1_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := True;
   end init_InterruptC;

   procedure init_InterruptCom is
   begin
      -- Interruption sur l'émission
      MCU.UCSR0B_Bits (MCU.TXCIE0_Bit) := True;
   end init_InterruptCom;

   procedure WriteUDR0(value : Unsigned_8) is
   begin
      AVR.Interrupts.Disable;
      MCU.UDR0 := value;
      AVR.Interrupts.Enable;
      valueStep := valueStep + 1;
   end WriteUDR0;

   procedure CameraZoomIn is
   begin
      if(Commande /= ZoomIn) then
         Zoom := True;
         valueStep:= 1;
         Commande := ZoomIn;
         WriteUDR0(16#81#);
      end if;
   end CameraZoomIn;

   procedure CameraZoomOut is
   begin
      if(Commande /= ZoomOut) then
         Zoom := True;
         valueStep:= 1;
         Commande := ZoomOut;
         WriteUDR0(16#81#);
      end if;
   end CameraZoomOut;

   procedure CameraZoomStop is
   begin
      -- Permet de ne pas changer de commande si le zoom n'a pas changé
      if(Commande /= ZoomStop and Zoom) then
         valueStep:= 1;
         Commande := ZoomStop;
         Zoom := False;
         WriteUDR0(16#81#);
      end if;
   end CameraZoomStop;


-----------------------------------------------------------------------------------------------------------
--  LES INTERRUPTIONS MATERIELLES ET LEURS PROCEDURES
-----------------------------------------------------------------------------------------------------------

   procedure PCINT_PORTC_Interrupt;

   pragma Machine_Attribute (Entity         => PCINT_PORTC_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, PCINT_PORTC_Interrupt, MCU.Sig_PCINT1_String);

-- Disable interrupts during reading value or register
   procedure PCINT_PORTC_Interrupt is
      Pin_Mask : Unsigned_8;
      time : Unsigned_16;
      PINC_Act : Unsigned_8;
      PINC_Stat : Bits_In_Byte;
   begin
      AVR.Interrupts.Disable;
      time := MCU.TCNT1;
      PINC_Act := MCU.PINC;
      PINC_Stat := MCU.PINC_Bits;
      AVR.Interrupts.Enable;
      Pin_Mask := (PINC_Act xor PINC_Old);
      PINC_Old := PINC_Act;
      case Pin_Mask is
         -- Channel 1
         when 16#01# =>
            MCU.PCMSK1_Bits(MCU.PCINT8_Bit) := False;
            if (PINC_Stat(0)) then
               servo_start := time;
            else
               if(time >= servo_start) then
                  servo_width := (time - servo_start);
               else
                  servo_width := (65535 - servo_start + time);
               end if;
               if (servo_width < 2800) then -- PWM 1400us
                  CameraZoomIn;
               else
                  if (servo_width > 3200) then -- PWM 1600 us
                     CameraZoomOut;
                  else
                     CameraZoomStop;
                  end if;
               end if;
            end if;
            MCU.PCMSK1_Bits(MCU.PCINT8_Bit) := True;
         when others => null;
      end case;
   end PCINT_PORTC_Interrupt;


   procedure TX_UART0_Interrupt;

   pragma Machine_Attribute (Entity         => TX_UART0_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, TX_UART0_Interrupt, MCU.Sig_USART_TX_String);

-- Stop interrupts during writing the register value!
   procedure TX_UART0_Interrupt is
   begin
      case Commande is
         when Init => -- Address command, IfClear, Focus Infinity
            case valueStep is
            -- CommandAddress => --(16#88#, 16#30#, 16#01#, 16#FF#)
               when 1 =>
                  WriteUDR0(16#88#);
               when 2 =>
                  WriteUDR0(16#30#);
               when 3 =>
                  WriteUDR0(16#01#);
               when 4 =>
                  WriteUDR0(16#FF#);
            -- IfClear => --(16#88#, 16#01#, 16#00#, 16#01#, 16#FF#)
               when 5 =>
                  WriteUDR0(16#88#);
               when 6 =>
                  WriteUDR0(16#01#);
               when 7 =>
                  WriteUDR0(16#00#);
               when 8 =>
                  WriteUDR0(16#01#);
               when 9 =>
                  WriteUDR0(16#FF#);
            -- Focus_Infinity => -- (16#81#, 16#01#, 16#04#, 16#18#, 16#02#, 16#FF#)
               when 10 =>
                  WriteUDR0(16#81#);
               when 11 =>
                  WriteUDR0(16#01#);
               when 12 =>
                  WriteUDR0(16#04#);
               when 13 =>
                  WriteUDR0(16#18#);
               when 14 =>
                  WriteUDR0(16#02#);
               when 15 =>
                  WriteUDR0(16#FF#);
               when 16 =>
                  digitalWrite(D13, High_lvl);
               when others => null;
            end case;
         when ZoomIn => --(16#81#, 16#01#, 16#04#, 16#07#, 16#22#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR0(16#81#);
               when 2 =>
                  WriteUDR0(16#01#);
               when 3 =>
                  WriteUDR0(16#04#);
               when 4 =>
                  WriteUDR0(16#07#);
               when 5 =>
                  WriteUDR0(16#22#);
               when 6 =>
                  WriteUDR0(16#FF#);
               when others => null;
            end case;
         when ZoomOut => --(16#81#, 16#01#, 16#04#, 16#07#, 16#32#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR0(16#81#);
               when 2 =>
                  WriteUDR0(16#01#);
               when 3 =>
                  WriteUDR0(16#04#);
               when 4 =>
                  WriteUDR0(16#07#);
               when 5 =>
                  WriteUDR0(16#32#);
               when 6 =>
                  WriteUDR0(16#FF#);
               when others => null;
            end case;
         when ZoomStop => --(16#81#, 16#01#, 16#04#, 16#07#, 16#00#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR0(16#81#);
               when 2 =>
                  WriteUDR0(16#01#);
               when 3 =>
                  WriteUDR0(16#04#);
               when 4 =>
                  WriteUDR0(16#07#);
               when 5 =>
                  WriteUDR0(16#00#);
               when 6 =>
                  WriteUDR0(16#FF#);
               when others => null;
            end case;
         when CommandCancel => -- (16#81#, 16#21#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR0(16#81#);
               when 2 =>
                  WriteUDR0(16#21#);
               when 3 =>
                  WriteUDR0(16#FF#);
               when others => null;
            end case;
         when others => null;
      end case;
   end TX_UART0_Interrupt;

-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      init_Port;
      init_Timer1;
      init_InterruptC;
      init_InterruptCom;
      pinMode(D13, Output);
      AVR.Interrupts.Enable;
      -- Initialisation
      valueStep := 1;
      Commande := Init;
      WriteUDR0(16#88#);      
      delay 0.5;
      loop
         null;
      end loop;
   end Run;
end Pwmtocamera ;
