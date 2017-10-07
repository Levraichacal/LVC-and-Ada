-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;
use AVR;

package GPIO is

   type lvcPins is (D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,A0,A1,A2,A3,A4,A5);

   type lvcMode is (Input,Output);

   procedure PinMode(nomPort : lvcPins; modePort : lvcMode);

   procedure DigitalWrite(nomPort : lvcPins; niveauPort : Boolean);
   
end GPIO;
