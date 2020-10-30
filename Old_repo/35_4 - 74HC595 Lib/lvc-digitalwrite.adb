with LVC.PINS;
use LVC.PINS;

package body LVC.DIGITALWRITE is

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

end LVC.DIGITALWRITE;
