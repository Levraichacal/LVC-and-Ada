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

package body Visca841 is

-----------------------------------------------------------------------------------------------------------
--  LE TYPE de stockage des commandes et des temps
-----------------------------------------------------------------------------------------------------------


--   type Command is (CommandAddress, IfClear, ZoomIn, ZoomOut, ZoomStop, FocusIn, FocusOut, FocusStop, CommandCancel);
   type Command is (CommandAddress, IfClear, ZoomIn, ZoomOut, ZoomStop, FocusAuto, FocusInfiny, CommandCancel);

   type Tableau_Data is array (1..4) of Unsigned_16;
   type servoStep is (A1,A2,B1,B2,C1,C2,D1,D2);

-----------------------------------------------------------------------------------------------------------
--  LES VARIABLES
-----------------------------------------------------------------------------------------------------------

   PWM_Min : Unsigned_16 := 1200; -- 600 µs
   PWM_Max : Unsigned_16 := 4800; -- 2400µs
   PWM_Safe : Unsigned_16 := 3000; -- 1500µs
   PWM_ZM_Min : Unsigned_16 := 2800; -- 1400µs
   PWM_ZM_Max : Unsigned_16 := 3200; -- 1600µs
   servo_width : Tableau_Data := (PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe);
   servo_width_temp : Tableau_Data := (PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe);
   servoPin : servoStep := A1;
   temp : Unsigned_16 := 0;

   valueStep : Unsigned_8 := 1;
   Commande  : Command;
   Zoom : Boolean := False;
   FocusI : Boolean := False;
   Wait_Second_ID_Part : Boolean := False;
   Wait_RX_Data : Boolean := False;
--   Focus : Boolean;


-----------------------------------------------------------------------------------------------------------
--  Les fonctions utiles
-----------------------------------------------------------------------------------------------------------

   function U8_To_U16(W : Unsigned_8) return Unsigned_16 is
   begin
      return Unsigned_16 (W and 16#00FF#);
   end U8_To_U16;

-----------------------------------------------------------------------------------------------------------
--  Les procédures d'initialisation
-----------------------------------------------------------------------------------------------------------

   procedure init_Serial_Com is
   begin
      -- Set Baud rate Fosc = 16MHz, baud 115200 => UBRR = Fosc/16/baud-1 = 8
      MCU.UBRR0 := Unsigned_16(8);
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

   procedure CameraZoomIn is
   begin
      if(Commande /= ZoomIn) then
         Zoom := True;
         valueStep:= 1;
         Commande := ZoomIn;
         WriteUDR1(16#81#);
      end if;
      --digitalWrite(D13,High_lvl);
   end CameraZoomIn;

   procedure CameraZoomOut is
   begin
      if(Commande /= ZoomOut) then
         Zoom := True;
         valueStep:= 1;
         Commande := ZoomOut;
         WriteUDR1(16#81#);
      end if;
   end CameraZoomOut;

   procedure CameraZoomStop is
   begin
      -- Permet de ne pas changer de commande si le zoom n'a pas changé
      if(Commande /= ZoomStop and Zoom) then
         valueStep:= 1;
         Commande := ZoomStop;
         Zoom := False;
         WriteUDR1(16#81#);
      end if;
   end CameraZoomStop;


   procedure CameraFocusInfinity is
   begin
      if(Commande /= FocusInfiny) then
         Commande := FocusInfiny;
         FocusI := True;
         WriteUDR1(16#81#);
      end if;
   end CameraFocusInfinity;

   procedure CameraFocusAuto is
   begin
      if(Commande /= FocusAuto and FocusI) then
         Commande := FocusAuto;
         FocusI := False;
         WriteUDR1(16#81#);
      end if;
   end CameraFocusAuto;

--   procedure CameraFocusIn is
--   begin
--      if(Commande /= FocusIn) then
--         Focus := True;
--         valueStep:= 1;
--         Commande : = FocusIn;
--         WriteUDR1(16#81#);
--      end if;
--   end CameraFocusIn;
--
--   procedure CameraFocusOut is
--   begin
--      if(Commande /= FocusOut) then
--         Focus := True;
--         valueStep:= 1;
--         Commande : = FocusOut;
--         WriteUDR1(16#81#);
--      end if;
--   end CameraFocusOut;
--
--   procedure CameraFocusStop is
--   begin
--      -- Permet de ne pas changer de commande si le focus n'a pas changé
--      if(Commande /= FocusStop and Focus) then
--         valueStep:= 1;
--         Commande : = FocusStop;
--         Focus := False;
--         WriteUDR1(16#81#);
--      end if;
--   end CameraFocusStop;




----------------------------------------------------------------------------------
-- Les fonctions d'initialisation des interruptions                             --
----------------------------------------------------------------------------------

   procedure init_InterruptCom1 is
   begin
      -- Interruption sur l'émission
      MCU.UCSR1B_Bits (MCU.TXCIE1_Bit) := True;
   end init_InterruptCom1;

   procedure init_InterruptCom0 is
   begin
      -- Interruption sur la récéption
      MCU.UCSR0B_Bits (MCU.RXCIE0_Bit) := True;
   end init_InterruptCom0;
----------------------------------------------------------------------------------
-- Les fonctions d'interruptions sur le TX1 et le RX0                           --
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
         when FocusAuto => --(16#81#, 16#01#, 16#04#, 16#07#, 16#00#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR1(16#81#);
               when 2 =>
                  WriteUDR1(16#01#);
               when 3 =>
                  WriteUDR1(16#04#);
               when 4 =>
                  WriteUDR1(16#38#);
               when 5 =>
                  WriteUDR1(16#02#);
               when 6 =>
                  WriteUDR1(16#FF#);
               when others => null;
            end case;
         when FocusInfiny => --(16#81#, 16#01#, 16#04#, 16#07#, 16#00#, 16#FF#)
            case valueStep is
               when 1 =>
                  WriteUDR1(16#81#);
               when 2 =>
                  WriteUDR1(16#01#);
               when 3 =>
                  WriteUDR1(16#04#);
               when 4 =>
                  WriteUDR1(16#18#);
               when 5 =>
                  WriteUDR1(16#02#);
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



   procedure RX_UART0_Interrupt;

   pragma Machine_Attribute (Entity         => RX_UART0_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, RX_UART0_Interrupt, MCU.Sig_USART0_RX_String);

-- Stop interrupts during reading the register value!
   procedure RX_UART0_Interrupt is
      value : Unsigned_16;
      value8: Unsigned_8;
   begin
      AVR.Interrupts.Disable;
      value8 := MCU.UDR0;
      AVR.Interrupts.Enable;
      value := U8_To_U16(value8);
      if (Wait_RX_Data) then
         case servoPin is
            -- servo1 - D9
            when A1 =>
               temp := value;
               servoPin := A2;
            when A2 =>
               servo_width_temp(1) := temp*255 + value;
               if ((servo_width_temp(1) >= PWM_Min) and (servo_width_temp(1) <= PWM_Max)) then
                  servo_width(1) := servo_width_temp(1);
               --else On ne modifie pas le servo_width
                  --servo_width(1) := PWM_Safe;
               end if;
               --AVR.Interrupts.Disable;
               --LVC.PWM.TIMER1.Write_PWM(D9, servo_width(1));
               --AVR.Interrupts.Enable;
               Wait_RX_Data := False;
            -- servo 2 - D10
            when B1 =>
               temp := value;
               servoPin := B2;
            when B2 =>
               servo_width_temp(2) := temp*255 + value;
               if ((servo_width_temp(2) >= PWM_Min) and (servo_width_temp(2) <= PWM_Max)) then
                  servo_width(2) := servo_width_temp(2);
               --else On ne modifie pas le servo_width
                  --servo_width(2) := PWM_Safe;
               end if;
               --AVR.Interrupts.Disable;
               --LVC.PWM.TIMER1.Write_PWM(D10, servo_width(2));
               --AVR.Interrupts.Enable;
               Wait_RX_Data := False;
            -- Camera1 - (Zoom)
            when C1 =>
               temp := value;
               servoPin := C2;
            when C2 =>
               servo_width_temp(3) := temp*255 + value;
               if ((servo_width_temp(3) >= PWM_Min) and (servo_width_temp(3) <= PWM_ZM_Min)) then
                  CameraZoomOut;
               else
                  if((servo_width_temp(3) >= PWM_ZM_Max) and (servo_width_temp(3) <= PWM_Max)) then
                     CameraZoomIn;
                  else
                     CameraZoomStop;
                  end if;
               end if;
               Wait_RX_Data := False;
            -- Camera2 - Focus
            when D1 =>
               temp := value;
               servoPin := D2;
            when D2 =>
               servo_width_temp(4) := temp*255 + value;
               if ((servo_width_temp(4) >= PWM_ZM_Max) and (servo_width_temp(4) <= PWM_Max)) then
                  CameraFocusInfinity;
               else
                  CameraFocusAuto;
               end if;
               Wait_RX_Data := False;
            when others =>
               Wait_RX_Data := False;
         end case;
      else
         if (Wait_Second_ID_Part) then
            case value8 is
               when 16#F1# =>
                  Wait_Second_ID_Part := False;
                  servoPin := A1;
                  Wait_RX_Data := True;
               when 16#F2# =>
                  Wait_Second_ID_Part := False;
                  servoPin := B1;
                  Wait_RX_Data := True;
               when 16#F3# =>
                  Wait_Second_ID_Part := False;
                  servoPin := C1;
                  Wait_RX_Data := True;
               when 16#F4# =>
                  Wait_Second_ID_Part := False;
                  servoPin := D1;
                  Wait_RX_Data := True;
               when 16#FF# => -- Au cas ou ce n'était pas un bit de début mais un bit de fin de data
                  null;
               when others =>
                  Wait_RX_Data := False;
                  Wait_Second_ID_Part := False;
            end case;
         else
            if (value8 = 16#FF#) then
               Wait_Second_ID_Part := True;
            else
               digitalWrite(D13, High_lvl); -- The light shine when an error is detected
            end if;
         end if;
      end if;
   end RX_UART0_Interrupt;

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
      init_InterruptCom0;
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
      loop
         null;
      end loop;
   end Run;
end Visca841 ;
