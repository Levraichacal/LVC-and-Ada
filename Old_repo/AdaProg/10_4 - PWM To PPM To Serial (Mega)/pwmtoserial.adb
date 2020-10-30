with Interfaces;
with AVR;
--with Ada.Unchecked_Conversion;
--with System.Unsigned_Types;
--with System.Img_LLU;
--use System.Img_LLU;
with AVR.MCU;
--with AVR.Timer0;
with AVR.UART;
with AVR.Interrupts;
with LVC.PINS;

-- Ce programme permet d'envoyer une trame de PPM via un port UART construite à partir de signaux PWM en entrée
-- Pour correspondre à un ppm standard, il y a 8 entrées possibles, le schéma de branchement est donné ci-après
--                  ___    ___
--        RST--PC6 -   \__/   - PC5--CH6
--         RX--PD0 -          - PC4--CH5
--         TX--PD1 -          - PC3--CH4
--        CH7--PD2 -          - PC2--CH3
--        CH8--PD3 -          - PC1--CH2
--             PD4 -          - PC0--CH1
--             VCC -          - GND
--             GND -          - AREF
--       OSC1--PB6 -          - AVCC
--       OSC2--PB7 -          - PB5--LEDSTATUS
--             PD5 -          - PB4
--             PD6 -          - PB3
--             PD7 -          - PB2--LED1
--             PB0 -__________- PB1--INTER1
--
-- Le principe de fonctionnement est le suivant :
-- Une interruption matérielle est déclenchée quand il y a un changement sur l'un des port en entrée (CH)
-- L'interruption est traitée suivant le status du port:
--    soit un temps de début d'impulsion est stocké dans un tableau
--    soit une largeur d'impulsion est déterminée et est stockée dans un tableau
-- Il faut pour la partie concernant les signaux PWM, un timer pour noter le temps, deux tableaux permettant de
-- stocker les temps de début d'impulsion et les largeurs, et les fonctions permettant de capter les interruptions
-- matérielles générées par le changement de port.
-- Il faut pour la partie envoi, un port RX/TX ie port série pour envoyer les données et un timer pour les envoyer
-- de façon cyclique (à 50 Hz). Je vais utilisé un second timer ici ce qui m'évitera tout conflit avec l'autre.


use AVR;
use Interfaces;
use LVC.PINS;



package body Pwmtoserial is

-----------------------------------------------------------------------------------------------------------
--  LE TYPE de stockage des temps
-----------------------------------------------------------------------------------------------------------

   type Tableau_Data is array (1..8) of Unsigned_16;

-----------------------------------------------------------------------------------------------------------
--  LES VARIABLES
-----------------------------------------------------------------------------------------------------------
   servo_start : Tableau_Data := (0,0,0,0,0,0,0,0);
   servo_width : Tableau_Data := (1500,1500,1500,1500,1500,1500,1500,1500);
   --PORTC_old : Bits_In_Byte := (others => False);
   --PORTD_old : Bits_In_Byte := (others => False);
   PINK_Old : Unsigned_8 := 0;
   startValue : Unsigned_16 := 16#FFF0#;

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
      MCU.PRR0_Bits (MCU.PRTIM1_Bit) := False;
   end init_Timer1;

   procedure init_Timer2 is
   begin
      -- Configuration du timer 2 pour fonctionner en CTC Mode
      MCU.TCCR2A_Bits := (MCU.WGM21_Bit => True, -- CTC Mode
                          others => False);
      MCU.TCCR2B_Bits := (MCU.CS20_Bit => True,  -- Prescaler à 1024
                          MCU.CS21_Bit => True,
                          MCU.CS22_Bit => True,
                          others => False);
      MCU.TCNT2 := 0;
      -- Activation des CTC Interrupt
      MCU.TIMSK2_Bits := (MCU.OCIE2A_Bit => True,
                          others => False);
      -- Fréquence d'activation : 100 Hz : 16 000 000 /1024 /100 = 156.25
      MCU.OCR2A := 156;
      -- Activation du timer;
      MCU.PRR0_Bits (MCU.PRTIM2_Bit) := False;
   end init_Timer2;

   procedure init_Serial_Com is
   begin
      AVR.UART.Init (8); -- 115200 @16MHz
   end init_Serial_Com;

   procedure init_PortB is
   begin
      pinMode(D9, Input); -- INTER1
      pinMode(D10, Output); -- LED1
      pinMode(D13, Output); -- LEDSTATUS
   end init_PortB;

   procedure init_PortInterrupt is
   begin
      pinMode(A8, Input); -- CH1
      pinMode(A9, Input); -- CH2
      pinMode(A10, Input); -- CH3
      pinMode(A11, Input); -- CH4
      pinMode(A12, Input); -- CH5
      pinMode(A13, Input); -- CH6
      pinMode(A14, Input); -- CH7
      pinMode(A15, Input); -- CH8
   end init_PortInterrupt;


   procedure init_Port is
   begin
      init_PortB;
      init_PortInterrupt;
      init_Serial_Com;
   end init_Port;


   procedure init_Interrupt is
   begin
      MCU.PCICR_Bits (MCU.PCIE2_Bit) := True;
      MCU.PCMSK2_Bits (MCU.PCINT16_Bit) := True;
      MCU.PCMSK2_Bits (MCU.PCINT17_Bit) := True;
      MCU.PCMSK2_Bits (MCU.PCINT18_Bit) := True;
      MCU.PCMSK2_Bits (MCU.PCINT19_Bit) := True;
      MCU.PCMSK2_Bits (MCU.PCINT20_Bit) := True;
      MCU.PCMSK2_Bits (MCU.PCINT21_Bit) := True;
      MCU.PCMSK2_Bits (MCU.PCINT22_Bit) := True;
      MCU.PCMSK2_Bits (MCU.PCINT23_Bit) := True;
   end init_Interrupt;

-----------------------------------------------------------------------------------------------------------
--  LES FONCTIONS ET PROCEDURES UTILES
-----------------------------------------------------------------------------------------------------------

--   function micros return Unsigned_16 is
--   begin
--      return MCU.TCNT1;
--   end micros;

   procedure Serial_Send is
   begin
      AVR.UART.Put (startValue + 16#0001#,16); --servo 1
      AVR.UART.Put (servo_width(1),16); -- Send in 16 base to have just 2 packets to received
      AVR.UART.Put (startValue + 16#0002#,16); --servo 2
      AVR.UART.Put (servo_width(2),16);
      AVR.UART.Put (startValue + 16#0003#,16); --servo 3
      AVR.UART.Put (servo_width(3),16);
      AVR.UART.Put (startValue + 16#0004#,16); --servo 4
      AVR.UART.Put (servo_width(4),16);
      AVR.UART.Put (startValue + 16#0005#,16); --servo 5
      AVR.UART.Put (servo_width(5),16);
      AVR.UART.Put (startValue + 16#0006#,16); --servo 6
      AVR.UART.Put (servo_width(6),16);
      AVR.UART.Put (startValue + 16#0007#,16); --servo 7
      AVR.UART.Put (servo_width(7),16);
      AVR.UART.Put (startValue + 16#0008#,16); --servo 8
      AVR.UART.Put (servo_width(8),16);
   end Serial_Send;

-----------------------------------------------------------------------------------------------------------
--  LES INTERRUPTIONS MATERIELLES ET LEURS PROCEDURES
-----------------------------------------------------------------------------------------------------------

   procedure PCINT_PORT_Interrupt;

   pragma Machine_Attribute (Entity         => PCINT_PORT_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, PCINT_PORT_Interrupt, MCU.Sig_PCINT2_String);

   procedure PCINT_PORT_Interrupt is
      Pin_Mask : Unsigned_8;
      time : Unsigned_16;
      PINK_Act : Unsigned_8;
      PINK_Stat : Bits_In_Byte;
   begin
      time := MCU.TCNT1;
      PINK_Act := MCU.PINK;
      PINK_Stat := MCU.PINK_Bits;
      Pin_Mask := (PINK_Act xor PINK_Old);
      PINK_Old := PINK_Act;
      case Pin_Mask is
         -- Channel 1
         when 16#01# =>
            MCU.PCMSK2_Bits(MCU.PCINT16_Bit) := False;
            if (PINK_Stat(0)) then
               servo_start(1) := time;
            else
               if(time >= servo_start(1)) then
                  servo_width(1) := (time - servo_start(1));
               else
                  servo_width(1) := (65535 - servo_start(1) + time);
               end if;
            end if;
            MCU.PCMSK2_Bits(MCU.PCINT16_Bit) := True;

         -- Channel 2
         when 16#02# =>
            MCU.PCMSK2_Bits(MCU.PCINT17_Bit) := False;
            if (PINK_Stat(1)) then
               servo_start(2) := time;
            else
               if(time >= servo_start(2)) then
                  servo_width(2) := (time - servo_start(2));
               else
                  servo_width(2) := (65535 - servo_start(2) + time);
               end if;
            end if;
            MCU.PCMSK2_Bits(MCU.PCINT17_Bit) := True;

         -- Channel 3
         when 16#04# =>
            MCU.PCMSK2_Bits(MCU.PCINT18_Bit) := False;
            if (PINK_Stat(2)) then
               servo_start(3) := time;
            else
               if(time >= servo_start(3)) then
                  servo_width(3) := (time - servo_start(3));
               else
                  servo_width(3) := (65535 - servo_start(3) + time);
               end if;
            end if;
            MCU.PCMSK2_Bits(MCU.PCINT18_Bit) := True;

         -- Channel 4
         when 16#08# =>
            MCU.PCMSK2_Bits(MCU.PCINT19_Bit) := False;
            if (PINK_Stat(3)) then
               servo_start(4) := time;
            else
               if(time >= servo_start(4)) then
                  servo_width(4) := (time - servo_start(4));
               else
                  servo_width(4) := (65535 - servo_start(4) + time);
               end if;
            end if;
            MCU.PCMSK2_Bits(MCU.PCINT19_Bit) := True;

         -- Channel 5
         when 16#10# =>
            MCU.PCMSK2_Bits(MCU.PCINT20_Bit) := False;
            if (PINK_Stat(4)) then
               servo_start(5) := time;
            else
               if(time >= servo_start(5)) then
                  servo_width(5) := (time - servo_start(5));
               else
                  servo_width(5) := (65535 - servo_start(5) + time);
               end if;
            end if;
            MCU.PCMSK2_Bits(MCU.PCINT20_Bit) := True;

         -- Channel 6
         when 16#20# =>
            MCU.PCMSK2_Bits(MCU.PCINT21_Bit) := False;
            if (PINK_Stat(5)) then
               servo_start(6) := time;
            else
               if(time >= servo_start(6)) then
                  servo_width(6) := (time - servo_start(6));
               else
                  servo_width(6) := (65535 - servo_start(6) + time);
               end if;
            end if;
            MCU.PCMSK2_Bits(MCU.PCINT21_Bit) := True;

         -- Channel 7
         when 16#40# =>
            MCU.PCMSK2_Bits(MCU.PCINT22_Bit) := False;
            if (PINK_Stat(6)) then
               servo_start(7) := time;
            else
               if(time >= servo_start(7)) then
                  servo_width(7) := (time - servo_start(7));
               else
                  servo_width(7) := (65535 - servo_start(7) + time);
               end if;
            end if;
            MCU.PCMSK2_Bits(MCU.PCINT22_Bit) := True;

         -- Channel 8
         when 16#80# =>
            MCU.PCMSK2_Bits(MCU.PCINT23_Bit) := False;
            if (PINK_Stat(7)) then
               servo_start(8) := time;
            else
               if(time >= servo_start(8)) then
                  servo_width(8) := (time - servo_start(8));
               else
                  servo_width(8) := (65535 - servo_start(8) + time);
               end if;
            end if;
            MCU.PCMSK2_Bits(MCU.PCINT23_Bit) := True;

         when others => null;
      end case;

   end PCINT_PORT_Interrupt;


   procedure Timer2_Interrupt;

   pragma Machine_Attribute (Entity         => Timer2_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Timer2_Interrupt, MCU.Sig_TIMER2_COMPA_String);


   procedure Timer2_Interrupt is
   begin
      Serial_Send;
   end Timer2_Interrupt;


-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      init_Port;
      init_Timer1;
      init_Timer2;
      init_Interrupt;
      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Pwmtoserial ;
