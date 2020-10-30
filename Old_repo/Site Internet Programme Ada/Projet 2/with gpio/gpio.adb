package body GPIO is

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

   procedure digitalWrite(nomPort : lvcPins; niveauPort : Boolean) is
   begin
      case nomPort is
         when D0 => D0_P := niveauPort;
         when D1 => D1_P := niveauPort;
         when D2 => D2_P := niveauPort;
         when D3 => D3_P := niveauPort;
         when D4 => D4_P := niveauPort;
         when D5 => D5_P := niveauPort;
         when D6 => D6_P := niveauPort;
         when D7 => D7_P := niveauPort;
         when D8 => D8_P := niveauPort;
         when D9 => D9_P := niveauPort;
         when D10 => D10_P := niveauPort;
         when D11 => D11_P := niveauPort;
         when D12 => D12_P := niveauPort;
         when D13 => D13_P := niveauPort;
         when A0 => A0_P := niveauPort;
         when A1 => A1_P := niveauPort;
         when A2 => A2_P := niveauPort;
         when A3 => A3_P := niveauPort;
         when A4 => A4_P := niveauPort;
         when A5 => A5_P := niveauPort;
         when others => null;
      end case;
   end digitalWrite;

   procedure pinMode(nomPort : lvcPins; modePort : lvcMode) is
      mode : Boolean;
   begin
      case modePort is
         when Input => mode := DD_Input;
         when Output => mode := DD_Output;
         when others => mode := DD_Input;
      end case;
      case nomPort is
         when D0 => D0_M := mode;
         when D1 => D1_M := mode;
         when D2 => D2_M := mode;
         when D3 => D3_M := mode;
         when D4 => D4_M := mode;
         when D5 => D5_M := mode;
         when D6 => D6_M := mode;
         when D7 => D7_M := mode;
         when D8 => D8_M := mode;
         when D9 => D9_M := mode;
         when D10 => D10_M := mode;
         when D11 => D11_M := mode;
         when D12 => D12_M := mode;
         when D13 => D13_M := mode;
         when A0 => A0_M := mode;
         when A1 => A1_M := mode;
         when A2 => A2_M := mode;
         when A3 => A3_M := mode;
         when A4 => A4_M := mode;
         when A5 => A5_M := mode;
         when others => null;
      end case;
   end pinMode;
end GPIO;
