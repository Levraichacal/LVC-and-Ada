with Interfaces;
with AVR.MCU;
with AVR;
with AVR.Interrupts;
with AVR.Real_Time.Delays;
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

use Interfaces;
use AVR;
use LVC.PINS;

package body Visca2560 is

-----------------------------------------------------------------------------------------------------------
--  LE TYPE de stockage des commandes
-----------------------------------------------------------------------------------------------------------

--   type Tableau_3 is array (1..3) of Unsigned_8;

--   type Tableau_4 is array (1..4) of Unsigned_8;

--   type Tableau_5 is array (1..5) of Unsigned_8;

--   type Tableau_6 is array (1..6) of Unsigned_8;

   type Command is (CommandAddress, IfClear, ZoomIn, ZoomOut, ZoomStop, CommandCancel);
-----------------------------------------------------------------------------------------------------------
--  Les données de commande
-----------------------------------------------------------------------------------------------------------

--   AddressCommand : Tableau_4 := (16#88#, 16#30#, 16#01#, 16#FF#);
--   IfClear : Tableau_5 := (16#88#, 16#01#, 16#00#, 16#01#, 16#FF#);
   --Zoom byte Array
--   ZoomIn : Tableau_6 := (16#81#, 16#01#, 16#04#, 16#07#, 16#22#, 16#FF#); -- Speed 2/7
--   ZoomOut : Tableau_6 := (16#81#, 16#01#, 16#04#, 16#07#, 16#32#, 16#FF#); -- Speed 2/7
--   ZoomStop : Tableau_6 := (16#81#, 16#01#, 16#04#, 16#07#, 16#00#, 16#FF#);
--   CommandCancel : Tableau_3 := (16#81#, 16#21#, 16#FF#);

   valueStep : Unsigned_8 := 1;
   Commande  : Command;

   procedure init_Serial_Com is
   begin
      -- Set Baud rate Fosc = 16MHz, baud 38400 => UBRR = Fosc/16/baud-1 = 25
      MCU.UBRR0 := Unsigned_16(25);
      MCU.UCSR0A := 0;
      --Set Format bit : 8N1
      MCU.UCSR0C := +(MCU.UCSZ00_Bit => True,
                      MCU.UCSZ01_Bit => True,
                      others => False);
      -- Enable Transmitter and Receiver
      MCU.UCSR0B := +(MCU.TXEN0_Bit => True,
                      MCU.RXEN0_Bit => True,
                      others => False);

      -- Set Baud rate Fosc = 16MHz, baud 38400 => UBRR = Fosc/16/baud-1 = 25
      MCU.UBRR1 := Unsigned_16(25);
      MCU.UCSR1A := 0;
      --Set Format bit : 8N1
      MCU.UCSR1C := +(MCU.UCSZ10_Bit => True,
                      MCU.UCSZ11_Bit => True,
                      others => False);
      -- Enable Transmitter and Receiver
      MCU.UCSR1B := +(MCU.TXEN1_Bit => True,
                      MCU.RXEN1_Bit => True,
                      others => False);
   end init_Serial_Com;

   procedure WriteUDR1(value : Unsigned_8) is
   begin
      AVR.Interrupts.Disable;
      MCU.UDR1 := value;
      AVR.Interrupts.Enable;
      valueStep := valueStep + 1;
   end WriteUDR1;

----------------------------------------------------------------------------------
-- Les fonctions d'initialisation des interruptions                             --
----------------------------------------------------------------------------------

   procedure init_InterruptCom1 is
   begin
      -- Interruption sur l'émission
      MCU.UCSR1B_Bits (MCU.TXCIE1_Bit) := True;
   end init_InterruptCom1;


   procedure init_InterruptButton1 is
   begin
      MCU.EICRB_Bits(MCU.ISC40_Bit) := False;
      MCU.EICRB_Bits(MCU.ISC41_Bit) := True;
      MCU.EIFR_Bits (MCU.INTF4_Bit) := True;
      MCU.EIMSK_Bits (MCU.INT4_Bit) := True;
   end init_InterruptButton1;


   procedure init_InterruptButton2 is
   begin
      MCU.EICRB_Bits(MCU.ISC50_Bit) := False;
      MCU.EICRB_Bits(MCU.ISC51_Bit) := True;
      MCU.EIFR_Bits (MCU.INTF5_Bit) := True;
      MCU.EIMSK_Bits (MCU.INT5_Bit) := True;
   end init_InterruptButton2;

----------------------------------------------------------------------------------
-- Les fonctions d'interruptions sur le TX1 et les boutons D2 et D3             --
----------------------------------------------------------------------------------

   procedure TX_UART1_Interrupt;

   pragma Machine_Attribute (Entity         => TX_UART1_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, TX_UART1_Interrupt, MCU.Sig_USART1_TX_String);

-- Stop interrupts during writing the register value!
   procedure TX_UART1_Interrupt is
   begin
      case Commande is
         when CommandAddress => --(16#88#, 16#30#, 16#01#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR1(16#88#);
               when 2 =>
                  WriteUDR1(16#30#);
               when 3 =>
                  WriteUDR1(16#01#);
               when 4 =>
                  WriteUDR1(16#FF#);
               when others => null;
            end case;
         when IfClear => --(16#88#, 16#01#, 16#00#, 16#01#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR1(16#88#);
               when 2 =>
                  WriteUDR1(16#01#);
               when 3 =>
                  WriteUDR1(16#00#);
               when 4 =>
                  WriteUDR1(16#01#);
               when 5 =>
                  WriteUDR1(16#FF#);
               when others => null;
            end case;
         when ZoomIn => --(16#81#, 16#01#, 16#04#, 16#07#, 16#22#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR1(16#81#);
               when 2 =>
                  WriteUDR1(16#01#);
               when 3 =>
                  WriteUDR1(16#04#);
               when 4 =>
                  WriteUDR1(16#07#);
               when 5 =>
                  WriteUDR1(16#22#);
               when 6 =>
                  WriteUDR1(16#FF#);
               when others => null;
            end case;
         when ZoomOut => --(16#81#, 16#01#, 16#04#, 16#07#, 16#32#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR1(16#81#);
               when 2 =>
                  WriteUDR1(16#01#);
               when 3 =>
                  WriteUDR1(16#04#);
               when 4 =>
                  WriteUDR1(16#07#);
               when 5 =>
                  WriteUDR1(16#32#);
               when 6 =>
                  WriteUDR1(16#FF#);
               when others => null;
            end case;
         when ZoomStop => --(16#81#, 16#01#, 16#04#, 16#07#, 16#00#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR1(16#81#);
               when 2 =>
                  WriteUDR1(16#01#);
               when 3 =>
                  WriteUDR1(16#04#);
               when 4 =>
                  WriteUDR1(16#07#);
               when 5 =>
                  WriteUDR1(16#00#);
               when 6 =>
                  WriteUDR1(16#FF#);
               when others => null;
            end case;
         when CommandCancel => -- (16#81#, 16#21#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR1(16#81#);
               when 2 =>
                  WriteUDR1(16#21#);
               when 3 =>
                  WriteUDR1(16#FF#);
               when others => null;
            end case;
         when others => null;
      end case;
   end TX_UART1_Interrupt;


   procedure Button_Interrupt_1;

   pragma Machine_Attribute (Entity         => Button_Interrupt_1,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_1, MCU.Sig_INT4_String);

   procedure Button_Interrupt_1 is
      PINE_Stat : Bits_In_Byte;
   begin
      AVR.Interrupts.Disable;
      PINE_Stat := MCU.PINE_Bits;
      MCU.EIMSK_Bits (MCU.INT4_Bit) := False;
      AVR.Interrupts.Enable;
      if (PINE_Stat(4)) then
         valueStep := 1;
         Commande := ZoomIn;
         WriteUDR1(16#81#);
         MCU.UDR0 := 16#01#;
      else
         valueStep := 1;
         Commande := ZoomStop;
         WriteUDR1(16#81#);
         MCU.UDR0 := 16#00#;
      end if;
      MCU.EIMSK_Bits (MCU.INT4_Bit) := True;
   end Button_Interrupt_1;

   procedure Button_Interrupt_2;

   pragma Machine_Attribute (Entity         => Button_Interrupt_2,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_2, MCU.Sig_INT5_String);

   procedure Button_Interrupt_2 is
      PINE_Stat : Bits_In_Byte;
   begin
      AVR.Interrupts.Disable;
      PINE_Stat := MCU.PINE_Bits;
      MCU.EIMSK_Bits (MCU.INT5_Bit) := False;
      AVR.Interrupts.Enable;
      if (PINE_Stat(5)) then
         valueStep := 1;
         Commande := ZoomOut;
         WriteUDR1(16#81#);
         MCU.UDR0 := 16#02#;
      else
         valueStep := 1;
         Commande := ZoomStop;
         WriteUDR1(16#81#);
         MCU.UDR0 := 16#00#;
      end if;
      MCU.EIMSK_Bits (MCU.INT5_Bit) := True;
   end Button_Interrupt_2;

-----------------------------------------------------------------------------------------------------------
--  LES FONCTIONS ET PROCEDURES UTILES
-----------------------------------------------------------------------------------------------------------

--      AVR.UART.Put (16#0001#,16); --servo 1

-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      AVR.Interrupts.Disable;
      pinMode(D2, Input);
      pinMode(D3, Input);
      pinMode(D13, Output);
      init_Serial_Com;
      init_InterruptCom1;
      AVR.Interrupts.Enable;
      -- Send Address Command
      valueStep := 1;
      Commande := CommandAddress;
      WriteUDR1(16#88#);
      -- On attend 0.5 seconde
      delay 0.5;
      -- Send IF_clear
      valueStep := 1;
      Commande := IfClear;
      WriteUDR1(16#88#);
      -- On attend 0.1 seconde
      delay 0.1;
      AVR.Interrupts.Disable;
      init_InterruptButton1;
      init_InterruptButton2;
      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Visca2560 ;
