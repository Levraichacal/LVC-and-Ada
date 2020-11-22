-----------------------------------------------------------------
-- This package is use to record if the state of a button have --
-- been change.                                                --
-----------------------------------------------------------------
package LVC.BUTTONS is

   Toilette    : Boolean;
   pragma Volatile (Toilette);
   Entree      : Boolean;
   pragma Volatile (Entree);
   Cuisine     : Boolean;
   pragma Volatile (Cuisine);
   Salon       : Boolean;
   pragma Volatile (Salon);
   Bureau      : Boolean;
   pragma Volatile (Bureau);
   SalleDeBain : Boolean;
   pragma Volatile (SalleDeBain);
   Chambre     : Boolean;
   pragma Volatile (Chambre);

end LVC.BUTTONS;
