-- Ce programme permet d'envoyer une trame de PPM via un port UART construite à partir de signaux PWM en entrée
-- Pour correspondre à ce que l'on veut, il nous faut 3 signaux pour la gimball et 6 pour la caméra. Le schéma
-- de branchement est donné ci-après
--                  ___    ___
--        RST--PC6 -   \__/   - PC5
--         RX--PD0 -          - PC4--CAM3
--         TX--PD1 -          - PC3--CAM2
--             PD2 -          - PC2--CAM1
--             PD3 -          - PC1--Servo2
--             PD4 -          - PC0--Servo1
--             VCC -          - GND
--             GND -          - AREF
--       OSC1--PB6 -          - AVCC
--       OSC2--PB7 -          - PB5--LEDSTATUS
--             PD5 -          - PB4
--             PD6 -          - PB3
--             PD7 -          - PB2
--             PB0 -__________- PB1
--
-- Le principe de fonctionnement est le suivant :
-- Une interruption matérielle est déclenchée quand il y a un changement sur l'un des port en entrée (CH ou CAM)
-- L'interruption est traitée et suivant le status du port:
--    soit un temps de début d'impulsion est stocké dans un tableau
--    soit une largeur d'impulsion est déterminée et est stockée dans un tableau
-- Il faut pour la partie concernant les signaux PWM, un timer pour noter le temps, deux tableaux permettant de
-- stocker les temps de début d'impulsion et les largeurs, et les fonctions permettant de capter les interruptions
-- matérielles générées par le changement de port.
-- Il faut pour la partie envoi de donnée, le TX du port série. J'ai choisi de baser l'envoi de données sur les
-- interruptions générées à chaque fin d'envoi de data. Je mets aussi un watchdog pour être sur que l'envoi de
-- données s'effectue correctement, sinon, PB5 s'allume
-- Le train de données est le suivant:
--
-- -- -------- -------- -------- -------- ------- ---------------------------------------
--  | |      | |      | |      | |      | |     | |
--  | |      | |      | |      | |      | |     | |
--  ---      ---      ---      ---      ---     ---
--      SER1     SER2     CAM1     CAM2    CAM3


with Interfaces;
with AVR;
with AVR.MCU;
with AVR.Interrupts;
with LVC.PINS;


use AVR;
use Interfaces;
use LVC.PINS;



package body Pwmtoserial is

-----------------------------------------------------------------------------------------------------------
--  LE TYPE de stockage des temps
-----------------------------------------------------------------------------------------------------------

   type Tableau_Data is array (1..5) of Unsigned_16;

-----------------------------------------------------------------------------------------------------------
--  LES VARIABLES
-----------------------------------------------------------------------------------------------------------
   PWM_Init : Unsigned_16 := 3000; -- 1500µs
   servo_start : Tableau_Data := (0,0,0,0,0);
   servo_width : Tableau_Data := (PWM_Init,PWM_Init,PWM_Init,PWM_Init,PWM_Init);
   PINC_Old : Unsigned_8 := 0;
   startValue : Unsigned_8 := 16#FF#;
   f1Value : Unsigned_8 := 16#F1#; -- A0
   f2Value : Unsigned_8 := 16#F2#; -- A1
   f3Value : Unsigned_8 := 16#F3#; -- A2
   f4Value : Unsigned_8 := 16#F4#; -- A3
   f5Value : Unsigned_8 := 16#F5#; -- A4
   valueSend : Unsigned_8 := 1;

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
      -- Set Baud rate Fosc = 16MHz, baud 57600 => UBRR = Fosc/16/baud-1 = 16
      MCU.UBRR0 := Unsigned_16(25);
      MCU.UCSR0A := 0;
      --Set Format bit : 8N1
      MCU.UCSR0C := +(MCU.UCSZ00_Bit => True,
                      MCU.UCSZ01_Bit => True,
                      others => False);
      -- Enable Transmitter
      MCU.UCSR0B := +(MCU.TXEN0_Bit => True,
                      others => False);
   end init_Serial_Com;

   procedure init_PortC is
   begin
      pinMode(A0, Input); -- Servo1
      pinMode(A1, Input); -- Servo2
      pinMode(A2, Input); -- CAM1
      pinMode(A3, Input); -- CAM2
      pinMode(A4, Input); -- CAM3
      digitalWrite(A0,Low_lvl); -- V1.1 : pull down resistor
      digitalWrite(A1,Low_lvl); -- V1.1 : pull down resistor
      digitalWrite(A2,Low_lvl); -- V1.1 : pull down resistor
      digitalWrite(A3,Low_lvl); -- V1.1 : pull down resistor
      digitalWrite(A4,Low_lvl); -- V1.1 : pull down resistor
   end init_PortC;

   procedure init_Port is
   begin
      init_PortC;
      init_Serial_Com;
   end init_Port;

   procedure init_InterruptC is
   begin
      MCU.PCICR_Bits (MCU.PCIE1_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := True;-- A0
      MCU.PCMSK1_Bits (MCU.PCINT9_Bit) := True;-- A1
      MCU.PCMSK1_Bits (MCU.PCINT10_Bit) := True;-- A2
      MCU.PCMSK1_Bits (MCU.PCINT11_Bit) := True;-- A3
      MCU.PCMSK1_Bits (MCU.PCINT12_Bit) := True;-- A4
   end init_InterruptC;


   procedure init_InterruptCom is
   begin
      -- Interruption sur l'émission
      MCU.UCSR0B_Bits (MCU.TXCIE0_Bit) := True;
   end init_InterruptCom;


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
         -- Servo1 - A0
         when 16#01# =>
            MCU.PCMSK1_Bits(MCU.PCINT8_Bit) := False;
            if (PINC_Stat(0)) then
               servo_start(1) := time;
            else
               if(time >= servo_start(1)) then
                  servo_width(1) := (time - servo_start(1));
               else
                  servo_width(1) := (65535 - servo_start(1) + time);
               end if;
            end if;
            MCU.PCMSK1_Bits(MCU.PCINT8_Bit) := True;

         -- Servo2 - A1
         when 16#02# =>
            MCU.PCMSK1_Bits(MCU.PCINT9_Bit) := False;
            if (PINC_Stat(1)) then
               servo_start(2) := time;
            else
               if(time >= servo_start(2)) then
                  servo_width(2) := (time - servo_start(2));
               else
                  servo_width(2) := (65535 - servo_start(2) + time);
               end if;
            end if;
            MCU.PCMSK1_Bits(MCU.PCINT9_Bit) := True;

         -- Camera1 - A2
         when 16#04# =>
            MCU.PCMSK1_Bits(MCU.PCINT10_Bit) := False;
            if (PINC_Stat(2)) then
               servo_start(3) := time;
            else
               if(time >= servo_start(3)) then
                  servo_width(3) := (time - servo_start(3));
               else
                  servo_width(3) := (65535 - servo_start(3) + time);
               end if;
            end if;
            MCU.PCMSK1_Bits(MCU.PCINT10_Bit) := True;

         -- Camera2 - A3
         when 16#08# =>
            MCU.PCMSK1_Bits(MCU.PCINT11_Bit) := False;
            if (PINC_Stat(3)) then
               servo_start(4) := time;
            else
               if(time >= servo_start(4)) then
                  servo_width(4) := (time - servo_start(4));
               else
                  servo_width(4) := (65535 - servo_start(4) + time);
               end if;
            end if;
            MCU.PCMSK1_Bits(MCU.PCINT11_Bit) := True;

         -- Camera3 - A4
         when 16#10# =>
            MCU.PCMSK1_Bits(MCU.PCINT12_Bit) := False;
            if (PINC_Stat(4)) then
               servo_start(5) := time;
            else
               if(time >= servo_start(5)) then
                  servo_width(5) := (time - servo_start(5));
               else
                  servo_width(5) := (65535 - servo_start(5) + time);
               end if;
            end if;
            MCU.PCMSK1_Bits(MCU.PCINT12_Bit) := True;

         when others => null;

      end case;
   end PCINT_PORTC_Interrupt;


   procedure TX_UART_Interrupt;

   pragma Machine_Attribute (Entity         => TX_UART_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, TX_UART_Interrupt, MCU.Sig_USART_TX_String);

-- Stop interrupts during writing the register value!
   procedure TX_UART_Interrupt is
   begin
      case valueSend is
         when 1 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := startValue;
            AVR.Interrupts.Enable;
            valueSend := 2;
         when 2 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := f1Value; -- A0
            AVR.Interrupts.Enable;
            valueSend := 3;
         when 3 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := High_Byte (servo_width(1));
            AVR.Interrupts.Enable;
            valueSend := 4;
         when 4 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := Low_Byte (servo_width(1));
            AVR.Interrupts.Enable;
            valueSend := 5;
         when 5 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := startValue;
            AVR.Interrupts.Enable;
            valueSend := 6;
         when 6 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := f2Value; -- A1
            AVR.Interrupts.Enable;
            valueSend := 7;
         when 7 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := High_Byte (servo_width(2));
            AVR.Interrupts.Enable;
            valueSend := 8;
         when 8 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := Low_Byte (servo_width(2));
            AVR.Interrupts.Enable;
            valueSend := 9;
         when 9 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := startValue;
            AVR.Interrupts.Enable;
            valueSend := 10;
         when 10 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := f3Value; -- A2
            AVR.Interrupts.Enable;
            valueSend := 11;
         when 11 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := High_Byte (servo_width(3));
            AVR.Interrupts.Enable;
            valueSend := 12;
         when 12 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := Low_Byte (servo_width(3));
            AVR.Interrupts.Enable;
            valueSend := 13;
         when 13 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := startValue;
            AVR.Interrupts.Enable;
            valueSend := 14;
         when 14 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := f4Value; -- A3
            AVR.Interrupts.Enable;
            valueSend := 15;
         when 15 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := High_Byte (servo_width(4));
            AVR.Interrupts.Enable;
            valueSend := 16;
         when 16 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := Low_Byte (servo_width(4));
            AVR.Interrupts.Enable;
            valueSend := 17;
         when 17 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := startValue;
            AVR.Interrupts.Enable;
            valueSend := 18;
         when 18 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := f5Value; -- A4
            AVR.Interrupts.Enable;
            valueSend := 19;
         when 19 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := High_Byte (servo_width(5));
            AVR.Interrupts.Enable;
            valueSend := 20;
         when 20 =>
            AVR.Interrupts.Disable;
            MCU.UDR0 := Low_Byte (servo_width(5));
            AVR.Interrupts.Enable;
            valueSend := 1;
        when others =>
            null;
      end case;
   end TX_UART_Interrupt;

-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      init_Port;
      init_Timer1;
      init_InterruptC;
      init_InterruptCom;
      MCU.UDR0 := 16#00#;-- Send a first to data to start the TX_UART_Interrupt!
      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Pwmtoserial ;
