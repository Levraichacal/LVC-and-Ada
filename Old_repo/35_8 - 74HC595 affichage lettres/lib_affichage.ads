with LIB_74HC595;
use LIB_74HC595;


package LIB_AFFICHAGE is
   type T_Letter is array (1..6) of T_Register;

   B_A : constant T_Letter := ((False, True, True, True, True, True, True, True),
                               (True, False, False, False, True, False, False, False),
                               (True, False, False, False, True, False, False, False),
                               (True, False, False, False, True, False, False, False),
                               (False, True, True, True, True, True, True, True),
                               (False, False, False, False, False, False, False, False));

   B_B : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (False, True, True, False, True, True, True, False),
                               (False, False, False, False, False, False, False, False));

   B_C : constant T_Letter := ((False, True, True, True, True, True, True, False),
                               (True, False, False, False, False, False, False, True),
                               (True, False, False, False, False, False, False, True),
                               (True, False, False, False, False, False, False, True),
                               (False, True, False, False, False, False, True, False),
                               (False, False, False, False, False, False, False, False));

   B_D : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (True, False, False, False, False, False, False, True),
                               (True, False, False, False, False, False, False, True),
                               (False, True, False, False, False, False, True, False),
                               (False, False, True, True, True, True, False, False),
                               (False, False, False, False, False, False, False, False));

   B_E : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (False, False, False, False, False, False, False, False));

   B_F : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (True, False, False, True, False, False, False, False),
                               (True, False, False, True, False, False, False, False),
                               (True, False, False, True, False, False, False, False),
                               (True, False, False, True, False, False, False, False),
                               (False, False, False, False, False, False, False, False));

   B_G : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (True, False, False, False, False, False, False, True),
                               (True, False, False, False, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, True, True, True, False),
                               (False, False, False, False, False, False, False, False));

   B_H : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (False, False, False, True, False, False, False, False),
                               (False, False, False, True, False, False, False, False),
                               (False, False, False, True, False, False, False, False),
                               (True, True, True, False, True, True, True, True),
                               (False, False, False, False, False, False, False, False));

   B_I : constant T_Letter := ((True, False, False, False, False, False, False, True),
                               (True, False, False, False, False, False, False, True),
                               (True, True, True, True, True, True, True, True),
                               (True, False, False, False, False, False, False, True),
                               (True, False, False, False, False, False, False, True),
                               (False, False, False, False, False, False, False, False));

   B_J : constant T_Letter := ((True, False, False, False, True, True, True, False),
                               (True, False, False, False, False, False, False, True),
                               (True, False, False, False, False, False, False, True),
                               (True, True, True, True, True, True, True, True),
                               (True, False, False, False, False, False, False, True),
                               (False, False, False, False, False, False, False, False));

   B_K : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (False, False, False, True, False, False, False, False),
                               (False, False, True, True, True, False, False, False),
                               (False, True, False, False, False, True, False, False),
                               (True, False, False, False, False, False, True, True),
                               (False, False, False, False, False, False, False, False));

   B_L : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (False, False, False, False, False, False, False, True),
                               (False, False, False, False, False, False, False, True),
                               (False, False, False, False, False, False, False, True),
                               (False, False, False, False, False, False, False, True),
                               (False, False, False, False, False, False, False, False));

   B_M : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (False, True, False, False, False, False, False, False),
                               (False, False, True, True, False, False, False, False),
                               (False, True, False, False, False, False, False, False),
                               (True, True, True, True, True, True, True, True),
                               (False, False, False, False, False, False, False, False));

   B_N : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (False, True, True, False, False, False, False, False),
                               (False, False, False, True, True, False, False, False),
                               (False, False, False, False, False, True, True, False),
                               (True, True, True, True, True, True, True, True),
                               (False, False, False, False, False, False, False, False));

   B_O : constant T_Letter := ((False, True, True, True, True, True, True, False),
                               (True, False, False, False, False, False, False, True),
                               (True, False, False, False, False, False, False, True),
                               (True, False, False, False, False, False, False, True),
                               (False, True, True, True, True, True, True, False),
                               (False, False, False, False, False, False, False, False));

   B_P : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (True, False, False, True, False, False, False, False),
                               (True, False, False, True, False, False, False, False),
                               (True, False, False, True, False, False, False, False),
                               (False, True, True, False, False, False, False, False),
                               (False, False, False, False, False, False, False, False));

   B_Q : constant T_Letter := ((False, True, True, True, True, True, True, False),
                               (True, False, False, False, False, False, False, True),
                               (True, False, False, False, False, False, False, True),
                               (True, False, False, False, False, False, False, True),
                               (False, True, True, True, True, True, True, True),
                               (False, False, False, False, False, False, False, False));

   B_R : constant T_Letter := ((True, True, True, True, True, True, True, True),
                               (True, False, False, True, False, False, False, False),
                               (True, False, False, True, True, False, False, False),
                               (True, False, False, True, False, True, False, False),
                               (False, True, True, False, False, False, True, True),
                               (False, False, False, False, False, False, False, False));

   B_S : constant T_Letter := ((True, False, False, True, True, True, True, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (True, True, True, True, False, False, False, True),
                               (False, False, False, False, False, False, False, False));

   B_T : constant T_Letter := ((True, False, False, False, False, False, False, False),
                               (True, False, False, False, False, False, False, False),
                               (True, True, True, True, True, True, True, True),
                               (True, False, False, False, False, False, False, False),
                               (True, False, False, False, False, False, False, False),
                               (False, False, False, False, False, False, False, False));

   B_U : constant T_Letter := ((True, True, True, True, True, True, True, False),
                               (False, False, False, False, False, False, False, True),
                               (False, False, False, False, False, False, False, True),
                               (False, False, False, False, False, False, False, True),
                               (True, True, True, True, True, True, True, False),
                               (False, False, False, False, False, False, False, False));

   B_V : constant T_Letter := ((True, True, True, True, False, False, False, False),
                               (False, False, False, True, True, True, False, False),
                               (False, False, False, False, False, True, True, True),
                               (False, False, False, True, True, True, False, False),
                               (True, True, True, True, False, False, False, False),
                               (False, False, False, False, False, False, False, False));

   B_W : constant T_Letter := ((True, True, True, True, True, True, False, False),
                               (False, False, False, False, False, True, True, True),
                               (False, False, False, True, True, True, False, False),
                               (False, False, False, False, False, True, True, True),
                               (True, True, True, True, True, True, False, False),
                               (False, False, False, False, False, False, False, False));

   B_X : constant T_Letter := ((True, True, False, False, False, False, True, True),
                               (False, True, True, False, True, True, False, False),
                               (False, False, True, True, True, False, False, False),
                               (False, True, True, False, True, True, False, False),
                               (True, True, False, False, False, False, True, True),
                               (False, False, False, False, False, False, False, False));

   B_Y : constant T_Letter := ((True, True, True, False, False, False, False, False),
                               (False, False, True, True, False, False, False, False),
                               (False, False, False, True, True, True, True, True),
                               (False, False, True, True, False, False, False, False),
                               (True, True, True, False, False, False, False, False),
                               (False, False, False, False, False, False, False, False));

   B_Z : constant T_Letter := ((True, True, False, False, False, False, False, True),
                               (True, False, False, False, True, True, False, True),
                               (True, False, False, True, True, False, False, True),
                               (True, False, True, True, False, False, False, True),
                               (True, False, False, False, False, False, True, True),
                               (False, False, False, False, False, False, False, False));

   B_0 : constant T_Letter := ((False, True, True, True, True, True, True, False),
                               (True, True, True, False, False, False, False, True),
                               (True, False, False, True, True, False, False, True),
                               (True, False, False, False, False, True, True, True),
                               (False, True, True, True, True, True, True, False),
                               (False, False, False, False, False, False, False, False));

   B_1 : constant T_Letter := ((False, False, True, False, False, False, False, True),
                               (False, True, False, False, False, False, False, True),
                               (True, True, True, True, True, True, True, True),
                               (False, False, False, False, False, False, False, True),
                               (False, False, False, False, False, False, False, True),
                               (False, False, False, False, False, False, False, False));

   B_2 : constant T_Letter := ((False, True, False, False, False, False, True, True),
                               (True, False, False, False, False, True, False, True),
                               (True, False, False, False, True, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (False, True, True, False, False, False, False, True),
                               (False, False, False, False, False, False, False, False));

   B_3 : constant T_Letter := ((True, False, False, False, True, False, True, False),
                               (True, False, False, True, True, False, False, True),
                               (True, False, True, False, True, False, False, True),
                               (True, True, False, False, True, False, False, True),
                               (True, False, False, False, False, True, True, False),
                               (False, False, False, False, False, False, False, False));

   B_4 : constant T_Letter := ((True, True, True, True, False, False, False, False),
                               (False, False, False, True, False, False, False, False),
                               (False, False, False, True, False, False, False, False),
                               (True, True, True, True, True, True, True, True),
                               (False, False, False, True, False, False, False, False),
                               (False, False, False, False, False, False, False, False));

   B_5 : constant T_Letter := ((True, True, True, True, False, False, True, False),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, False, True, True, True, False),
                               (False, False, False, False, False, False, False, False));

   B_6 : constant T_Letter := ((False, True, True, True, True, True, True, False),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, False, True, False, False, True),
                               (False, True, False, False, True, True, True, False),
                               (False, False, False, False, False, False, False, False));

   B_7 : constant T_Letter := ((True, False, False, False, False, False, False, False),
                               (True, False, False, False, False, False, False, False),
                               (True, False, False, False, False, True, True, True),
                               (True, False, False, True, True, False, False, False),
                               (True, True, True, False, False, False, False, False),
                               (False, False, False, False, False, False, False, False));

   B_8 : constant T_Letter := ((False, True, True, False, True, True, True, False),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (False, True, True, False, True, True, True, False),
                               (False, False, False, False, False, False, False, False));

   B_9 : constant T_Letter := ((False, True, True, False, False, False, True, False),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (True, False, False, True, False, False, False, True),
                               (False, True, True, True, True, True, True, False),
                               (False, False, False, False, False, False, False, False));

   SPACE : constant T_Letter := ((False, False, False, False, False, False, False, False),
                                 (False, False, False, False, False, False, False, False),
                                 (False, False, False, False, False, False, False, False),
                                 (False, False, False, False, False, False, False, False),
                                 (False, False, False, False, False, False, False, False),
                                 (False, False, False, False, False, False, False, False));

end LIB_AFFICHAGE;
