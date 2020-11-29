-- Ce package contient la fonction pinMode
with LVC.PINS;
use LVC.PINS;

package LVC.PINMODE is
   procedure pinMode(nomPort : lvcPins; modePort : lvcMode);
end LVC.PINMODE;
