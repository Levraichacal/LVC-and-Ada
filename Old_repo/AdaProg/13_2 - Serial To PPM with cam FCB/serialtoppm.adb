-- Ce programme permet d'envoyer une trame de PPM via un port UART construite à partir de signaux PWM en entrée
-- Pour correspondre à un ppm standard, il y a 8 entrées possibles, le schéma de branchement est donné ci-après
--                  ___    ___
--             PC6 -   \__/   - PC5
--         RX--PD0 -          - PC4
--         TX--PD1 -          - PC3
--       CAM1--PD2 -          - PC2
--       CAM2--PD3 -          - PC1
--       CAM3--PD4 -          - PC0
--             VCC -          - GND
--             GND -          - AREF
--       OSC1--PB6 -          - AVCC
--       OSC2--PB7 -          - PB5--LEDSTATUS
--       CAM4--PD5 -          - PB4
--       CAM5--PD6 -          - PB3
--       CAM6--PD7 -          - PB2--Output PPM
--             PB0 -__________- PB1
--
-- Le principe de fonctionnement est le suivant :
-- Une interruption matérielle est déclenchée quand il y a une data en entrée du port série. Elle effectue les
-- actions suivantes:
--    Lit la trame
--    Affecte les bonnes valeurs dans le Tableau_Data
-- La génération de la trame ppm est faite de façon cyclique (à 50 Hz) sur un timer.
--

with Interfaces;
with AVR;
with AVR.MCU;
with AVR.Interrupts;
with LVC.PINS;
with Ada.Unchecked_Conversion;


use AVR;
use Interfaces;
use LVC.PINS;



package body Serialtoppm is

-----------------------------------------------------------------------------------------------------------
--  LE TYPE de stockage des temps
-----------------------------------------------------------------------------------------------------------

   type Tableau_Data is array (1..9) of Unsigned_16;
   type servoStep is (A1,A2,B1,B2,C1,C2,D1,D2,E1,E2,F1,F2,G1,G2,H1,H2,I1,I2,Z1,Z2);

-----------------------------------------------------------------------------------------------------------
--  LES VARIABLES
-----------------------------------------------------------------------------------------------------------

   PWM_Min : Unsigned_16 := 1840; -- 920 µs
   PWM_Max : Unsigned_16 := 4240; -- 2120µs
   PWM_Safe : Unsigned_16 := 3000; -- 1500µs
   PWM_ZM_Min : Unsigned_16 := 2800; -- 1400µs
   PWM_ZM_Max : Unsigned_16 := 3200; -- 1600µs
   PPM_Inter_Lengh : Unsigned_16 := 600; -- 300µs
   servo_width : Tableau_Data := (PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe);
   servo_width_temp : Tableau_Data := (PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe,PWM_Safe);
   servoPin : servoStep := A1;
   temp : Unsigned_16 := 0;
   numeroServo : servoStep := A1;

-----------------------------------------------------------------------------------------------------------
--  LES PROCEDURES D'INITIALISATION
-----------------------------------------------------------------------------------------------------------

   procedure init_Timer1 is
      SREG_Temp : Unsigned_8;
   begin
   -- Activation du timer;
      MCU.PRR_Bits (MCU.PRTIM1_Bit) := False;
      SREG_Temp := MCU.SREG;
      MCU.TCNT1 := 0;
      MCU.OCR1B := 16#FFFF#;
      MCU.TCCR1A_Bits := (MCU.COM1B0_Bit => True, others => False);
      MCU.TCCR1B_Bits := (MCU.CS11_Bit => True, others => False);
      MCU.TCCR1C := +(MCU.FOC1B_Bit => True, others => False);
      MCU.TIMSK1 := +(MCU.OCIE1B_Bit => True, others => False);
      MCU.SREG := SREG_Temp;
   end init_Timer1;

   procedure init_Serial_Com is
   begin
      -- Set Baud rate Fosc = 16MHz, baud 57600 => UBRR = Fosc/16/baud-1 = 16
      MCU.UBRR0 := Unsigned_16(16);
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
      pinMode(D10, Output); -- Output PPM
      digitalWrite(D10, Low_lvl); -- Pour être sur que cette valeur est à 0
      pinMode(D13, Output); -- LEDSTATUS
      pinMode(D2,Output); -- CAM1
      pinMode(D3,Output); -- CAM2
      pinMode(D4,Output); -- CAM3
      pinMode(D5,Output); -- CAM4
      pinMode(D6,Output); -- CAM5
      pinMode(D7,Output); -- CAM6
   end init_Port;

   procedure init_Interrupt is
   begin
      -- Interruption sur la récéption
      MCU.UCSR0B_Bits (MCU.RXCIE0_Bit) := True;
   end init_Interrupt;

   function U8_To_U16 is
      new Ada.Unchecked_Conversion (Source => Unsigned_8,
                                    Target => Unsigned_16);

   procedure WriteOCR1B (valeur_PWM : Interfaces.Unsigned_16) is
   begin
         AVR.Interrupts.Disable;
         MCU.OCR1B := valeur_PWM ;
         AVR.Interrupts.Enable;
   end WriteOCR1B;

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
            when A1 =>
               temp := value;
               servoPin := A2;
            when A2 =>
               servo_width_temp(1) := temp*255 + value;
               if ((servo_width_temp(1) >= PWM_Min) and (servo_width_temp(1) <= PWM_Max)) then
                  servo_width(1) := servo_width_temp(1);
               else
                  servo_width(1) := PWM_Safe;--PWM_Safe;
               end if;
               Wait_RX_Data := False;
            -- servo 2
            when B1 =>
               temp := value;
               servoPin := B2;
            when B2 =>
               servo_width_temp(2) := temp*255 + value;
               if ((servo_width_temp(2) >= PWM_Min) and (servo_width_temp(2) <= PWM_Max)) then
                  servo_width(2) := servo_width_temp(2);
               else
                  servo_width(2) := PWM_Safe;
               end if;
               Wait_RX_Data := False;
            -- servo 3
            when C1 =>
               temp := value;
               servoPin := C2;
            when C2 =>
               servo_width_temp(3) := temp*255 + value;
               if ((servo_width_temp(3) >= PWM_Min) and (servo_width_temp(3) <= PWM_Max)) then
                  servo_width(3) := servo_width_temp(3);
               else
                  servo_width(3) := PWM_Safe;
               end if;
               Wait_RX_Data := False;
            -- servo 4
            when D1 =>
               temp := value;
               servoPin := D2;
            when D2 =>
               servo_width_temp(4) := temp*255 + value;
               if ((servo_width_temp(4) >= PWM_Min) and (servo_width_temp(4) <= PWM_Max)) then
                  servo_width(4) := servo_width_temp(4);
               else
                  servo_width(4) := PWM_Safe;
               end if;
               Wait_RX_Data := False;
            -- servo 5
            when E1 =>
               temp := value;
               servoPin := E2;
            when E2 =>
               servo_width_temp(5) := temp*255 + value;
               if ((servo_width_temp(5) >= PWM_Min) and (servo_width_temp(5) <= PWM_Max)) then
                  servo_width(5) := servo_width_temp(5);
               else
                  servo_width(5) := PWM_Safe;
               end if;
               if ((servo_width_temp(5) >= PWM_ZM_Max) and (servo_width_temp(5) <= PWM_Max)) then
                  digitalWrite(D7,High_lvl);
               else
                  digitalWrite(D7,Low_lvl);
               end if;
               Wait_RX_Data := False;
            -- servo 6
            when F1 =>
               temp := value;
               servoPin := F2;
            when F2 =>
               servo_width_temp(6) := temp*255 + value;
               if ((servo_width_temp(6) >= PWM_Min) and (servo_width_temp(6) <= PWM_Max)) then
                  servo_width(6) := servo_width_temp(6);
               else
                  servo_width(6) := PWM_Safe;
               end if;
               if ((servo_width_temp(6) >= PWM_ZM_Max) and (servo_width_temp(6) <= PWM_Max)) then
                  digitalWrite(D6,High_lvl);
               else
                  digitalWrite(D6,Low_lvl);
               end if;
               Wait_RX_Data := False;
            -- servo 7
            when G1 =>
               temp := value;
               servoPin := G2;
            when G2 =>
               servo_width_temp(7) := temp*255 + value;
               if ((servo_width_temp(7) >= PWM_Min) and (servo_width_temp(7) <= PWM_Max)) then
                  servo_width(7) := servo_width_temp(7);
               else
                  servo_width(7) := PWM_Safe;
               end if;
               if ((servo_width_temp(7) >= PWM_ZM_Max) and (servo_width_temp(7) <= PWM_Max)) then
                  digitalWrite(D5,High_lvl);
               else
                  digitalWrite(D5,Low_lvl);
               end if;
               Wait_RX_Data := False;
            -- servo 8
            when H1 =>
               temp := value;
               servoPin := H2;
            when H2 =>
               servo_width_temp(8) := temp*255 + value;
               if ((servo_width_temp(8) >= PWM_Min) and (servo_width_temp(8) <= PWM_Max)) then
                  servo_width(8) := servo_width_temp(8);
               else
                  servo_width(8) := PWM_Safe;
               end if;
               if ((servo_width_temp(8) >= PWM_ZM_Max) and (servo_width_temp(8) <= PWM_Max)) then
                  digitalWrite(D4,High_lvl);
               else
                  digitalWrite(D4,Low_lvl);
               end if;
               Wait_RX_Data := False;
            -- servo 9
            when I1 =>
               temp := value;
               servoPin := I2;
            when I2 =>
               servo_width_temp(9) := temp*255 + value;
               if ((servo_width_temp(9) >= PWM_Min) and (servo_width_temp(9) <= PWM_ZM_Min)) then
                  Zoom_Out;
               else
                  if((servo_width_temp(9) >= PWM_ZM_Max) and (servo_width_temp(9) <= PWM_Max)) then
                     Zoom_In;
                  else
                     Zoom_Stop;
                  end if;
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
               when 16#F6# =>
                  Wait_Second_ID_Part := False;
                  servoPin := F1;
                  Wait_RX_Data := True;
               when 16#F7# =>
                  Wait_Second_ID_Part := False;
                  servoPin := G1;
                  Wait_RX_Data := True;
               when 16#F8# =>
                  Wait_Second_ID_Part := False;
                  servoPin := H1;
                  Wait_RX_Data := True;
               when 16#F9# =>
                  Wait_Second_ID_Part := False;
                  servoPin := I1;
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

   Frameleft : Unsigned_16 := 40000;

   procedure PPM_Interrupt;

   pragma Machine_Attribute (Entity         => PPM_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, PPM_Interrupt, MCU.Sig_TIMER1_COMPB_String);

-- I choose here to disable interrupt before reading/writing on OCR1B and TCNT1 registers
   procedure PPM_Interrupt is
   begin
      case numeroServo is
         when A1 =>
            AVR.Interrupts.Disable;
            MCU.OCR1B := PPM_Inter_Lengh;
            MCU.TCNT1 := 0;
            AVR.Interrupts.Enable;
            Frameleft := Frameleft - PPM_Inter_Lengh;
            numeroServo := A2;
         when A2 =>
            WriteOCR1B (MCU.OCR1B + servo_width(1) - PPM_Inter_Lengh);
            Frameleft := Frameleft - servo_width(1);
            numeroServo := B1;
         when B1 =>
            WriteOCR1B (MCU.OCR1B + PPM_Inter_Lengh);
            Frameleft := Frameleft - PPM_Inter_Lengh;
            numeroServo := B2;
         when B2 =>
            WriteOCR1B (MCU.OCR1B + servo_width(2) - PPM_Inter_Lengh);
            Frameleft := Frameleft - servo_width(2);
            numeroServo := C1;
         when C1 =>
            WriteOCR1B (MCU.OCR1B + PPM_Inter_Lengh);
            Frameleft := Frameleft - PPM_Inter_Lengh;
            numeroServo := C2;
         when C2 =>
            WriteOCR1B (MCU.OCR1B + servo_width(3) - PPM_Inter_Lengh);
            Frameleft := Frameleft - servo_width(3);
            numeroServo := D1;
         when D1 =>
            WriteOCR1B (MCU.OCR1B + PPM_Inter_Lengh);
            Frameleft := Frameleft - PPM_Inter_Lengh;
            numeroServo := D2;
         when D2 =>
            WriteOCR1B (MCU.OCR1B + servo_width(4) - PPM_Inter_Lengh);
            Frameleft := Frameleft - servo_width(4);
            numeroServo := E1;
         when E1 =>
            WriteOCR1B (MCU.OCR1B + PPM_Inter_Lengh);
            Frameleft := Frameleft - PPM_Inter_Lengh;
            numeroServo := E2;
         when E2 =>
            WriteOCR1B (MCU.OCR1B + servo_width(5) - PPM_Inter_Lengh);
            Frameleft := Frameleft - servo_width(5);
            numeroServo := F1;
         when F1 =>
            WriteOCR1B (MCU.OCR1B + PPM_Inter_Lengh);
            Frameleft := Frameleft - PPM_Inter_Lengh;
            numeroServo := F2;
         when F2 =>
            WriteOCR1B (MCU.OCR1B + servo_width(6) - PPM_Inter_Lengh);
            Frameleft := Frameleft - servo_width(6);
            numeroServo := G1;
         when G1 =>
            WriteOCR1B (MCU.OCR1B + PPM_Inter_Lengh);
            Frameleft := Frameleft - PPM_Inter_Lengh;
            numeroServo := G2;
         when G2 =>
            WriteOCR1B (MCU.OCR1B + servo_width(7) - PPM_Inter_Lengh);
            Frameleft := Frameleft - servo_width(7);
            numeroServo := H1;
         when H1 =>
            WriteOCR1B (MCU.OCR1B + PPM_Inter_Lengh);
            Frameleft := Frameleft - PPM_Inter_Lengh;
            numeroServo := H2;
         when H2 =>
            WriteOCR1B (MCU.OCR1B + servo_width(8) - PPM_Inter_Lengh);
            Frameleft := Frameleft - servo_width(8);
            numeroServo := Z1;
         when Z1 =>
            WriteOCR1B (MCU.OCR1B + PPM_Inter_Lengh);
            Frameleft := Frameleft - PPM_Inter_Lengh;
            numeroServo := Z2;
         when Z2 =>
            WriteOCR1B (MCU.OCR1B + Frameleft - PPM_Inter_Lengh);
            numeroServo := A1;
            Frameleft := 40000;
         when others => -- Normalement, on ne rentre jamais la mais si c'est le cas, on fait comme Z2
            WriteOCR1B (MCU.OCR1B + Frameleft - PPM_Inter_Lengh);
            numeroServo := A1;
            Frameleft := 40000;
      end case;
   end PPM_Interrupt;

-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      init_Port;
      init_Serial_Com;
      init_Timer1;
      init_Interrupt;
      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Serialtoppm ;
