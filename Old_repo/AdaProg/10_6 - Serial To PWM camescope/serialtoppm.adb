-- V1.0 -- Created by S.BARDOT 12/05/2015
-- V1.1 -- Modify the PWM min and max value, don't change the value if out of range.



with Interfaces;
with AVR;
with AVR.MCU;
with AVR.Interrupts;
with LVC.PINS;
with Ada.Unchecked_Conversion;
with LVC.PWM.TIMER1;
-- Ce programme permet d'envoyer une trame de PPM via un port UART construite à partir de signaux PWM en entrée
-- Pour correspondre à un ppm standard, il y a 8 entrées possibles, le schéma de branchement est donné ci-après
--                  ___    ___
--             PC6 -   \__/   - PC5
--         RX--PD0 -          - PC4
--         TX--PD1 -          - PC3
--             PD2 -          - PC2
--             PD3 -          - PC1
--             PD4 -          - PC0
--             VCC -          - GND
--             GND -          - AREF
--       OSC1--PB6 -          - AVCC
--       OSC2--PB7 -          - PB5--LEDSTATUS
--             PD5 -          - PB4
--             PD6 -          - PB3
--             PD7 -          - PB2--Output PPM
--             PB0 -__________- PB1
--
-- Le principe de fonctionnement est le suivant :
-- Une interruption matérielle est déclenchée quand il y a une data en entrée du port série. Elle effectue les
-- actions suivantes:
--    Lit la trame
--    Affecte les bonnes valeurs dans le Tableau_Data
-- La génération de la trame ppm est faite de façon cyclique (à 50 Hz) sur un timer.
--

use AVR;
use Interfaces;
use LVC.PINS;
use LVC.PWM.TIMER1;

package body Serialtoppm is

-----------------------------------------------------------------------------------------------------------
--  LE TYPE de stockage des temps
-----------------------------------------------------------------------------------------------------------

   type Tableau_Data is array (1..5) of Unsigned_16;
   type servoStep is (A1,A2,B1,B2,C1,C2,D1,D2,E1,E2);

-----------------------------------------------------------------------------------------------------------
--  LES VARIABLES
-----------------------------------------------------------------------------------------------------------

--   PWM_Min : Unsigned_16 := 1840; -- 920 µs
   PWM_Min : Unsigned_16 := 1200; -- 600 µs
--   PWM_Max : Unsigned_16 := 4240; -- 2120µs
   PWM_Max : Unsigned_16 := 4800; -- 2400µs
   PWM_Safe : Unsigned_16 := 3000; -- 1500µs
   PWM_ZM_Min : Unsigned_16 := 2800; -- 1400µs
   PWM_ZM_Max : Unsigned_16 := 3200; -- 1600µs
   servo_width : Tableau_Data := (PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe);
   servo_width_temp : Tableau_Data := (PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe);
   servoPin : servoStep := A1;
   temp : Unsigned_16 := 0;

-----------------------------------------------------------------------------------------------------------
--  LES FONCTIONS ET PROCEDURES UTILES
-----------------------------------------------------------------------------------------------------------


   function U8_To_U16 is
      new Ada.Unchecked_Conversion (Source => Unsigned_8,
                                    Target => Unsigned_16);
   procedure Zoom_In is
   begin
      digitalWrite(D3,Low_lvl);
      digitalWrite(D2,High_lvl);
   end Zoom_In;

   procedure Zoom_Out is
   begin
      digitalWrite(D2,Low_lvl);
      digitalWrite(D3,High_lvl);
   end Zoom_Out;

   procedure Zoom_Stop is
   begin
      digitalWrite(D3,Low_lvl);
      digitalWrite(D2,Low_lvl);
   end Zoom_Stop;


-----------------------------------------------------------------------------------------------------------
--  LES PROCEDURES D'INITIALISATION
-----------------------------------------------------------------------------------------------------------

   procedure init_Serial_Com is
   begin
      -- Set Baud rate Fosc = 16MHz, baud 57600 => UBRR = Fosc/16/baud-1 = 16
      -- Set Baud rate Fosc = 16MHz, baud 9600 => UBRR = Fosc/16/baud-1 = 103
      MCU.UBRR0 := Unsigned_16(8);
      MCU.UCSR0A := 0;
      --Set Format bit : 8N1
      MCU.UCSR0C := +(MCU.UCSZ00_Bit => True,
                      MCU.UCSZ01_Bit => True,
                      others => False);
      -- Enable Receiver and Transmitter
      MCU.UCSR0B := +(MCU.RXEN0_Bit => True,
                      MCU.TXEN0_Bit => True,
                      others => False);
   end init_Serial_Com;

   procedure init_Port is
   begin
      LVC.PWM.TIMER1.Init_Port_PWM(D9);  -- Servo1
      LVC.PWM.TIMER1.Init_Port_PWM(D10);  -- Servo2
      pinMode(D2, Output); -- CAM1 Zoom +
      pinMode(D3, Output); -- CAM1 Zoom -
      pinMode(D4, Output); -- CAM2 Enregistrement
      pinMode(D5, Output); -- CAM3 Photo
      pinMode(D13, Output); -- LEDSTATUS
      LVC.PWM.TIMER1.Write_PWM(D9, servo_width(1)); -- Initialisation Servo1
      LVC.PWM.TIMER1.Write_PWM(D10, servo_width(2)); -- Initialisation Servo2
      Zoom_Stop; -- Initialisation Zoom
      digitalWrite(D4,Low_lvl); --Initialisation Enregistrement
      digitalWrite(D5,Low_lvl); -- Initialisation Photo
   end init_Port;

   procedure init_Interrupt is
   begin
      -- Interruption sur la récéption
      MCU.UCSR0B_Bits (MCU.RXCIE0_Bit) := True;
   end init_Interrupt;


-----------------------------------------------------------------------------------------------------------
--  LES INTERRUPTIONS MATERIELLES ET LEURS PROCEDURES
-----------------------------------------------------------------------------------------------------------

   Wait_Second_ID_Part : Boolean := False;
   Wait_RX_Data : Boolean := False;

   procedure RX_UART_Interrupt;

   pragma Machine_Attribute (Entity         => RX_UART_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, RX_UART_Interrupt, MCU.Sig_USART_RX_String);

-- Stop interrupts during reading the register value!
   procedure RX_UART_Interrupt is
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
               LVC.PWM.TIMER1.Write_PWM(D9, servo_width(1));
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
               LVC.PWM.TIMER1.Write_PWM(D10, servo_width(2));
               --AVR.Interrupts.Enable;
               Wait_RX_Data := False;
            -- Camera1 - D2/D3 (Zoom)
            when C1 =>
               temp := value;
               servoPin := C2;
            when C2 =>
               servo_width_temp(3) := temp*255 + value;
               if ((servo_width_temp(3) >= PWM_Min) and (servo_width_temp(3) <= PWM_ZM_Min)) then
                  Zoom_Out;
               else
                  if((servo_width_temp(3) >= PWM_ZM_Max) and (servo_width_temp(3) <= PWM_Max)) then
                     Zoom_In;
                  else
                     Zoom_Stop;
                  end if;
               end if;
               Wait_RX_Data := False;
            -- Camera1 - D4 (Record)
            when D1 =>
               temp := value;
               servoPin := D2;
            when D2 =>
               servo_width_temp(4) := temp*255 + value;
               if ((servo_width_temp(4) >= PWM_ZM_Max) and (servo_width_temp(4) <= PWM_Max)) then
                  digitalWrite(D4,High_lvl);
               else
                  digitalWrite(D4,Low_lvl);
               end if;
               Wait_RX_Data := False;
            -- Camera1 - D5 (Photo)
            when E1 =>
               temp := value;
               servoPin := E2;
            when E2 =>
               servo_width_temp(5) := temp*255 + value;
               if ((servo_width_temp(5) >= PWM_ZM_Max) and (servo_width_temp(5) <= PWM_Max)) then
                  digitalWrite(D5,High_lvl);
               else
                  digitalWrite(D5,Low_lvl);
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
               when 16#F5# =>
                  Wait_Second_ID_Part := False;
                  servoPin := E1;
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
   end RX_UART_Interrupt;

-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      init_Port;
      init_Serial_Com;
      init_Interrupt;
      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Serialtoppm ;
