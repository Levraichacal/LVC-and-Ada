with System;
use System;
with Interfaces;
use Interfaces;
with AVR;
use AVR;

package LVC.PINS is

   type lvcPins is (D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,A0,A1,A2,A3,A4,A5);

   type lvcPort is (PA,PB,PC,PD,PE,PF,PG,PH,PJ,PK,PL);

   subtype lvcMode is Boolean;
   Input : lvcMode renames False;
   Output : lvcMode renames True;

   subtype lvcLevel is Boolean;
   Low_lvl : lvcLevel renames False;
   High_lvl : lvcLevel renames True;

   procedure pinMode (pin: lvcPins; mode : lvcMode);

   procedure digitalWrite (pin: lvcPins; level : lvcLevel);

   function digitalPinToBitMask(pin: lvcPins) return Unsigned_8;

   function digitalPinToPort(pin: lvcPins) return lvcPort;

   function portOutputRegister(port: lvcPort) return Address;

   function portOutputRegisterValue(port: lvcPort) return Unsigned_8;

   function portInputRegister(port: lvcPort) return Address;

   function portInputRegisterValue(port: lvcPort) return Unsigned_8;

   function portModeRegister(port: lvcPort) return Unsigned_8;

   function digitalPinToPCICRbit(port: lvcPort) return Bit_Number;

   function digitalPinToPCICR(port: lvcPort) return Address;

   function digitalPinToPCMSKbit(pin: lvcPins) return Bit_Number;

   procedure writeToPCICRRegister(port: lvcPort);

   procedure writeToPCMSKRegister(pin: lvcPins; value :Boolean := True);

   function readToPCMSKRegister(pin: lvcPins) return Boolean;

   function digitalReadValue(pin: lvcPins) return Boolean;

end LVC.PINS;
