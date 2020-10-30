-- Trigger on D12;
-- Echo on D11
with Interfaces;
use Interfaces;

package L298N is

   procedure Init_L298N;

   procedure Avance;

   procedure Recule;

   procedure Droite;

   procedure Gauche;

   procedure Avance(valeur : Unsigned_8); 

   procedure Recule(valeur : Unsigned_8);

   procedure Droite(valeur : Unsigned_8);

   procedure Gauche(valeur : Unsigned_8);

   procedure Stop;

end L298N;
