-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;
use AVR;

package GPIO is

-- La valeur du port : Haut = true, Bas = false;
   -- Les ports digitaux
   D0_P: Boolean renames MCU.PORTD_Bits (0);
   D1_P: Boolean renames MCU.PORTD_Bits (1);
   D2_P: Boolean renames MCU.PORTD_Bits (2);
   D3_P: Boolean renames MCU.PORTD_Bits (3);
   D4_P: Boolean renames MCU.PORTD_Bits (4);
   D5_P: Boolean renames MCU.PORTD_Bits (5);
   D6_P: Boolean renames MCU.PORTD_Bits (6);
   D7_P: Boolean renames MCU.PORTD_Bits (7);
   D8_P: Boolean renames MCU.PORTB_Bits (0);
   D9_P: Boolean renames MCU.PORTB_Bits (1);
   D10_P: Boolean renames MCU.PORTB_Bits (2);
   D11_P: Boolean renames MCU.PORTB_Bits (3);
   D12_P: Boolean renames MCU.PORTB_Bits (4);
   D13_P: Boolean renames MCU.PORTB_Bits (5);

   -- Les ports analogiques
   A0_P: Boolean renames MCU.PORTC_Bits (0);
   A1_P: Boolean renames MCU.PORTC_Bits (1);
   A2_P: Boolean renames MCU.PORTC_Bits (2);
   A3_P: Boolean renames MCU.PORTC_Bits (3);
   A4_P: Boolean renames MCU.PORTC_Bits (4);
   A5_P: Boolean renames MCU.PORTC_Bits (5);

   -- Le modes du port :
   -- Les ports digitaux
   D0_M: Boolean renames MCU.DDRD_Bits (0);
   D1_M: Boolean renames MCU.DDRD_Bits (1);
   D2_M: Boolean renames MCU.DDRD_Bits (2);
   D3_M: Boolean renames MCU.DDRD_Bits (3);
   D4_M: Boolean renames MCU.DDRD_Bits (4);
   D5_M: Boolean renames MCU.DDRD_Bits (5);
   D6_M: Boolean renames MCU.DDRD_Bits (6);
   D7_M: Boolean renames MCU.DDRD_Bits (7);
   D8_M: Boolean renames MCU.DDRB_Bits (0);
   D9_M: Boolean renames MCU.DDRB_Bits (1);
   D10_M: Boolean renames MCU.DDRB_Bits (2);
   D11_M: Boolean renames MCU.DDRB_Bits (3);
   D12_M: Boolean renames MCU.DDRB_Bits (4);
   D13_M: Boolean renames MCU.DDRB_Bits (5);

   -- Les ports analogiques
   A0_M: Boolean renames MCU.DDRC_Bits (0);
   A1_M: Boolean renames MCU.DDRC_Bits (1);
   A2_M: Boolean renames MCU.DDRC_Bits (2);
   A3_M: Boolean renames MCU.DDRC_Bits (3);
   A4_M: Boolean renames MCU.DDRC_Bits (4);
   A5_M: Boolean renames MCU.DDRC_Bits (5);

   type lvcPins is (D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,A0,A1,A2,A3,A4,A5);

   type lvcMode is (Input,Output);

   type lvcNiveau is (LOW,HIGH);

   procedure pinMode(nomPort : lvcPins; modePort : lvcMode);

   procedure digitalWrite(nomPort : lvcPins; niveauPort : Boolean);

end GPIO;
