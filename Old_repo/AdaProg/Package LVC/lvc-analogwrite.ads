-- Les packages LVC sont des packages que j'ai créé car je n'avais pas trouvé d'équivalent. Je les ai testés mais cela n'exclue pas la présence de faute. Ceux-ci peuvent-être réutilisé.
-- Pour plus d'informations sur http://lvcetada.e-monsite.com/ ou vous pouvez me contacter sur lvcetada@gmail.com
-- Ce package correspond à l'écriture de la fonction analogWrite, l'équivalente (la tradution même) en Ada du même nom de la fonction Arduino.

with AVR.MCU;
with AVR.ADC;

package LVC.ANALOGWRITE is

procedure AnalogWrite(nomPort : lvcPins; niveauSortie : integer);


end LVC.ANALOGWRITE;
