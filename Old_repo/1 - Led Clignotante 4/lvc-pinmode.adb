with AVR;
with AVR.MCU;
with LVC.PINS;

use AVR;
use LVC.PINS;

package body LVC.PINMODE is

procedure pinMode(nomPort : lvcPins; modePort : lvcMode)
is
--port : boolean;
mode : boolean;
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

end LVC.PINMODE;
