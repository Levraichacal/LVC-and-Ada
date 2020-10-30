-- Les packages Arduino sont les packages présents dans la version d'arduino en C, que j'ai traduit en Ada. Je les ai testés mais cela n'exclue pas la présence de faute. Ceux-ci peuvent-être réutilisé.
-- Pour plus d'informations sur http://lvcetada.e-monsite.com/ ou vous pouvez me contacter sur lvcetada@gmail.com

WITH AVR.Programspace;
WITH AVR;


package ARDUINO is 


HIGH : Boolean renames true;
LOW : Boolean renames false;

INPUT: constant renames 0;
OUTPUT: constant renames 1;
INPUT_PULLUP: constant renames 2;

PI : constant renames 3.1415926535897932384626433832795;
HALF_PI : constant renames 1.5707963267948966192313216916398;
TWO_PI : constant renames 6.283185307179586476925286766559;
DEG_TO_RAD : constant renames 0.017453292519943295769236907684886;
RAD_TO_DEG : constant renames 57.295779513082320876798154814105;

SERIAL: constant renames 0;
DISPLAY : constant renames 1;

LBSFIRST : constant renames 0;
MSBFIRST : constant renames 1;

CHANGE : constant renames 1;
FALLING : constant renames 2;
RISING : constant renames 3;

if ((MCU = ATtiny24) || (MCU = ATtiny44) || (MCU = ATtiny84) || (MCU = ATtiny25) || (MCU = ATtiny45) || (MCU = ATtiny85)) then
DEFAULT : constant renames 0;
EXTERNAL : constant renames 1;
INTERNAL : constant renames 2;
else
if ((MCU = ATmega1280) || (MCU = ATmega2560) || (MCU = ATmega1284) || (MCU = ATmega1284P) || (MCU = ATmega644) || (MCU = ATmega644A) || (MCU = ATmega644P) || (MCU = ATmega644PA)) then
INTERNAL1V1 : constant renames 2;
INTERNAL2V56 : constant renames 3;
else
INTERNAL : constant renames 3;
end if;
DEFAULT : constant renames 0;
EXTERNAL : constant renames 1;
end if;

-- La fonction min renvoie le plus petit des deux, ou le même nombre si A et B sont égaux.
function min(A,B:Nat16) return Nat16;

-- La fonction max renvoie le plus grand des deux, ou le même nombre si A et B sont égaux.
function max(A,B:Nat16) return Nat16;

-- La fonction abs renvoie la valeur absolue d'un nombre
function abs (A:Nat16) return Nat16;

-- La fonction constrain permet de contenir la valeur A entre les valeurs B et C.
function constrain(A,B,C:Nat16) return Nat16;

-- La fonction radians convertie un angle en degrés en radians.
function radians(deg: Nat16) return Nat16;

-- La fonction degrees convertie un angle en radians en degrés.
function degrees(rad: Nat16) return Nat16;

-- La fonction sq renvoie le carré de A
function sq(A: Nat16) return Nat16;




end ARDUINO;
