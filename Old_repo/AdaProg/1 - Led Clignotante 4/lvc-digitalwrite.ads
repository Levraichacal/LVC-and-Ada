-- Ce package contient la fonction pinMode
with LVC.PINS;

use LVC.PINS;

package LVC.DIGITALWRITE is
    procedure digitalWrite(nomPort : lvcPins; niveauPort : boolean);
end LVC.DIGITALWRITE;
