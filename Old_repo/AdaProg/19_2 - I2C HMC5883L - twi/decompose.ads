with Interfaces;
use Interfaces;

package Decompose is

  type T_Mantisse_Exp is record
     Expo : Integer;
     Frac : IEEE_Float_32;
  end record;
  
  function decompose(nombre : IEEE_Float_32) return T_Mantisse_Exp;


end Decompose;
