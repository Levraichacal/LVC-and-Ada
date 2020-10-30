with LIB_74HC595;
use LIB_74HC595;


package LIB_AFFICHAGE is
   type T_Letter is array (1..6) of T_Register;

   B_A : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (True, False, False, False, True, False, False, False),
                               (True, False, False, False, True, False, False, False),
                               (True, False, False, False, True, False, False, False),
                               (True, True, True, True, True, True, True, True),
                               (False, False, False, False, False, False, False, False));
   SPACE : constant T_Letter := ((False, False, False, False, False, False, False, False),
                                 (False, False, False, False, False, False, False, False),
                                 (False, False, False, False, False, False, False, False),
                                 (False, False, False, False, False, False, False, False),
                                 (False, False, False, False, False, False, False, False),
                                 (False, False, False, False, False, False, False, False));

end LIB_AFFICHAGE;
