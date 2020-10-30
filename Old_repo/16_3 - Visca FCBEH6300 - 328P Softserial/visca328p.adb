with Interfaces;
with AVR.MCU;
with AVR;
with AVR.Interrupts;
--with AVR.Real_Time.Delays;
with LVC.PINS;
with System.Machine_Code;
use System.Machine_Code;
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


with LVC.PWM.TIMER1;
use LVC.PWM.TIMER1;

package body Visca328p is

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
   Data_To_Send : Boolean := False;
--   Focus : Boolean;


-----------------------------------------------------------------------------------------------------------
--  Les fonctions utiles
-----------------------------------------------------------------------------------------------------------

   function U8_To_U16(W : Unsigned_8) return Unsigned_16 is
   begin
      return Unsigned_16 (W and 16#00FF#);
   end U8_To_U16;

-----------------------------------------------------------------------------------------------------------
--  Les fonctions du SoftSerial
-----------------------------------------------------------------------------------------------------------

   procedure tunedDelay( delayTime: Unsigned_16) is
      temp : Unsigned_16;
      use ASCII;
   begin
      Asm ("1: sbiw %0, 0x01" & LF & HT &
           "brne 1b",
           Outputs => (Unsigned_16'Asm_Output("=w",temp)),
           Inputs => (Unsigned_16'Asm_Input("0",delayTime)),
           Volatile => True);
   end tunedDelay;

   table : Tableau_Data_Delay ;
   procedure init is
   begin
--      table(1) := (115200,1,17,17,12); -- Origine
--    --  table(1) := (115200,1,21,21,16); fonctionne mais donne du 7N1
      table(1) := (115200,1,21,21,15); -- sembre bien fonctionner
      --table(1) := (115200,3,28,21,18);
      table(2) := (57600,10,37,37,33);
--      table(3) := (38400,10,57,57,54); -- Origine
      table(3) := (38400,37,85,85,81);
      table(4) := (31250,31,70,70,68);
      table(5) := (28800,34,77,77,74);
      table(6) := (19200,54,117,117,114);
      table(7) := (14400,74,156,156,153);
      table(8) := (9600,114,236,236,233);
      table(9) := (4800,233,474,474,474);
      table(10) := (2400,471,950,950,947);
      table(11) := (1200,947,1902,1902,1899);
      table(12) := (300,3804,7617,7617,7614);
   end init;

   procedure listen_SoftSerial is
      oldSREG: Unsigned_8;
   begin
      if(G_comactive = False) then
         G_bufferOverflow := False;
         oldSREG := AVR.MCU.SREG;
         AVR.Interrupts.cli;
         G_receive_buffer_tail := 0;
         G_receive_buffer_head := 0;
         AVR.MCU.SREG := oldSREG;
      end if;
   end listen_SoftSerial;

   procedure tx_pin_write_SoftSerial(level : Boolean) is
   begin
      if (level = False) then
         digitalWrite(G_TransmitPin, Low_lvl);
      else
         digitalWrite(G_TransmitPin, High_lvl);
      end if;
   end tx_pin_write_SoftSerial;

   procedure setTx(transmitPin : lvcPins) is
      port : lvcPort;
   begin
      pinMode(transmitPin,Output);
      digitalWrite(transmitPin,High_lvl);
      G_TransmitPin := transmitPin;
      G_TransmitBitMask := digitalPinToBitMask(transmitPin);
      port := digitalPinToPort(transmitPin);
      G_TransmitPortRegister := portOutputRegister(port);
   end setTx;


   procedure Init_SoftSerial(transmitPin : lvcPins; inverseLogic : Boolean := False) is
   begin
      init;
      --G_rx_delay_centering := 0;
      --G_rx_delay_intrabit := 0;
      --G_rx_delay_stopbit := 0;
      G_tx_delay := 0;
      G_bufferOverflow := False;
      G_inverseLogic := inverseLogic;
      G_comactive := False;
      setTx(transmitPin);
   end Init_SoftSerial;



   procedure Begin_SoftSerial (speed : Unsigned_32) is
      baud : Unsigned_32;
--      Bit_Delay : Unsigned_16;
   begin
--      Bit_Delay := U32_To_U16((16000000 / speed) /4);
--      G_tx_delay := subtract_cap(Bit_Delay, 15/4);
--      G_rx_delay_centering := subtract_cap(Bit_Delay/2, (4 + 4 + 75 + 17- 23)/4);
--      G_rx_delay_intrabit := subtract_cap(Bit_Delay, 23/4);
--      G_rx_delay_stopbit := subtract_cap(Bit_Delay * 3/4, (37 + 11)/4);
      --G_rx_delay_centering := 0;
      --G_rx_delay_intrabit  := 0;
      --G_rx_delay_stopbit  := 0;
      G_tx_delay  := 0;
      for i in table'Range loop
         baud := table(i).baud;
         if(baud = speed) then
            --G_rx_delay_centering := table(i).rx_delay_centering;
            --G_rx_delay_intrabit := table(i).rx_delay_intrabit;
            --G_rx_delay_stopbit := table(i).rx_delay_stopbit;
            G_tx_delay := table(i).tx_delay;
            exit;
         end if;
      end loop;
      -- Si il a une valeur d'attibuée
      --if(G_rx_delay_stopbit > 0) then
         -- Si il a une adresse de PCICR register
         --if(digitalPinToPCICR(digitalPinToPort(G_ReceivePin))<16#FFFF#) then
         --   writeToPCICRRegister(digitalPinToPort(G_ReceivePin));
         --   writeToPCMSKRegister(G_ReceivePin);
         --end if;
         tunedDelay(G_tx_delay); -- Si niveau bas, c'est que l'on est à la fin
      --end if;
      listen_SoftSerial;
   end Begin_SoftSerial;


   function write_SoftSerial (data : Unsigned_8) return Boolean is
      oldSREG : Unsigned_8;
   begin
      if(G_tx_delay = 0) then
         return False;
      end if;
      oldSREG := AVR.MCU.SREG;
      AVR.Interrupts.cli;
      tx_pin_write_SoftSerial(G_inverseLogic);
      --tunedDelay(G_tx_delay + 2); -- That's great! --115200
      tunedDelay(G_tx_delay + 15); -- That's great! --38400
      if(G_inverseLogic = True) then
         for i in 0..7 loop
            if ((data and 2**i) = 2**i) then
               tx_pin_write_SoftSerial(False);
            else
               tx_pin_write_SoftSerial(True);
            end if;
            tunedDelay(G_tx_delay);
         end loop;
         tx_pin_write_SoftSerial(False);
      else
         for i in 0..7 loop
            if ((data and 2**i) = 2**i) then
               tx_pin_write_SoftSerial(True);
            else
               tx_pin_write_SoftSerial(False);
            end if;
            tunedDelay(G_tx_delay);
         end loop;
         tx_pin_write_SoftSerial(True);
      end if;
      AVR.MCU.SREG := oldSREG;
      tx_pin_write_SoftSerial(not G_inverseLogic);
      tunedDelay(G_tx_delay);
      AVR.Interrupts.sei;
      return True;
   end write_SoftSerial;



-----------------------------------------------------------------------------------------------------------
--  Les procédures d'initialisation
-----------------------------------------------------------------------------------------------------------

   procedure init_Serial_Com is
   begin
      -- Set Baud rate Fosc = 16MHz, baud 115200 => UBRR = Fosc/16/baud-1 = 7 sinon et bien ça merde!!
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

   end init_Serial_Com;

   procedure WriteUDR1(value : Unsigned_8) is
      status : Boolean;
   begin
      --AVR.Interrupts.Disable;
      status := write_SoftSerial(value);
      --MCU.UDR1 := value;
      --AVR.Interrupts.Enable;
      valueStep := valueStep + 1;
   end WriteUDR1;

   procedure CameraZoomIn is
   begin
      if(Commande /= ZoomIn) then
         Zoom := True;
         valueStep:= 1;
         Commande := ZoomIn;
         Data_To_Send := True;
         --WriteUDR1(16#81#);
      end if;
      --digitalWrite(D13,High_lvl);
   end CameraZoomIn;

   procedure CameraZoomOut is
   begin
      if(Commande /= ZoomOut) then
         Zoom := True;
         valueStep:= 1;
         Commande := ZoomOut;
         Data_To_Send := True;
         --WriteUDR1(16#81#);
      end if;
   end CameraZoomOut;

   procedure CameraZoomStop is
   begin
      -- Permet de ne pas changer de commande si le zoom n'a pas changé
      if(Commande /= ZoomStop and Zoom) then
         valueStep:= 1;
         Commande := ZoomStop;
         Zoom := False;
         Data_To_Send := True;
         --WriteUDR1(16#81#);
      end if;
   end CameraZoomStop;


   procedure CameraFocusInfinity is
   begin
      if(Commande /= FocusInfiny) then
         Commande := FocusInfiny;
         FocusI := True;
         Data_To_Send := True;
         --WriteUDR1(16#81#);
      end if;
   end CameraFocusInfinity;

   procedure CameraFocusAuto is
   begin
      if(Commande /= FocusAuto and FocusI) then
         Commande := FocusAuto;
         FocusI := False;
         Data_To_Send := True;
         --WriteUDR1(16#81#);
      end if;
   end CameraFocusAuto;


----------------------------------------------------------------------------------
-- Les fonctions d'initialisation des interruptions                             --
----------------------------------------------------------------------------------

   procedure init_InterruptCom0 is
   begin
      -- Interruption sur la récéption
      MCU.UCSR0B_Bits (MCU.RXCIE0_Bit) := True;
   end init_InterruptCom0;


   procedure init_Watchdog is
   begin
      AVR.Interrupts.Disable;
      -- Watchdog reset
      Wdr;
      -- Clear the WatchDog Flag in the MCU Status Register
--      MCU.MCUSR_Bits := (MCU.WDRF_Bit => False,
--                         MCU.PORF_Bit => MCU.MCUSR_Bits(MCU.PORF_Bit),
--                         MCU.EXTRF_Bit => MCU.MCUSR_Bits (MCU.EXTRF_Bit),
--                         MCU.BORF_Bit => MCU.MCUSR_Bits (MCU.BORF_Bit),
--                         others => False);
      -- Start timed sequence
      MCU.WDTCSR_Bits := (MCU.WDCE_Bit => True,
                          MCU.WDE_Bit => True,
                     others => False);
      -- Set the prescaler 16.0 ms and the WatchDog Timer Configuration: just in Interrupt Mode
      MCU.WDTCSR :=  +(MCU.WDIE_Bit => True,
                       MCU.WDE_Bit => False,
                       others => False);
      -- WatchDog Timer Configuration: just in Interrupt Mode
--      MCU.WDTCSR_Bits(MCU.WDIE_Bit) := True;
--      MCU.WDTCSR_Bits(MCU.WDE_Bit) := False;
      -- Enable WatchDog Interruption

      AVR.Interrupts.Enable;
   end init_Watchdog;

----------------------------------------------------------------------------------
-- Les fonctions d'interruptions sur le TX1 et le RX0                           --
----------------------------------------------------------------------------------

   procedure WatchDog_Interrupt;

   pragma Machine_Attribute (Entity         => WatchDog_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, WatchDog_Interrupt, MCU.Sig_WDT_String);

   procedure WatchDog_Interrupt is
   begin
      if(Data_To_Send = True)  then
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
                     Data_To_Send := False;
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
                     Data_To_Send := False;
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
                     Data_To_Send := False;
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
                     Data_To_Send := False;
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
                     Data_To_Send := False;
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
                     Data_To_Send := False;
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
                     Data_To_Send := False;
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
                     Data_To_Send := False;
                  when others => null;
               end case;
            when others => null;
         end case;
      end if;
   end WatchDog_Interrupt;



   procedure RX_UART0_Interrupt;

   pragma Machine_Attribute (Entity         => RX_UART0_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, RX_UART0_Interrupt, MCU.Sig_USART_RX_String);

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
               --LVC.PWM.TIMER1.
               Write_PWM(D9, servo_width(1));
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
               --LVC.PWM.TIMER1.
               Write_PWM(D10, servo_width(2));
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
--      pinMode(D2, Input);
--      pinMode(D3, Input);
      pinMode(D13, Output);
      init_Serial_Com;
      Init_SoftSerial(A0);
      Begin_SoftSerial(38400);
      Init_Port_PWM(D9);  -- Servo1
      Init_Port_PWM(D10);  -- Servo2
      AVR.Interrupts.Enable;
      init_Watchdog;
      -- Send Address Command
      valueStep := 1;
      Commande := CommandAddress;
      Data_To_Send := True;
      --WriteUDR1(16#88#);
      -- Send IF_clear
      valueStep := 1;
      Commande := IfClear;
      Data_To_Send := True;
      init_InterruptCom0;
      Write_PWM(D9, servo_width(1)); -- Initialisation Servo1
      Write_PWM(D10, servo_width(2)); -- Initialisation Servo1
      --WriteUDR1(16#88#);
      loop
         null;
      end loop;
   end Run;
end Visca328p ;
