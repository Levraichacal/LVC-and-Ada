

package LIB_74HC595 is

   type T_Register is array (0..7) of Boolean;

   procedure Init;

   procedure ClearRegister;

   procedure EmptyRegister;

   procedure WriteRegister;

   procedure SetRegisterValue (index: Integer; value : Boolean);

end LIB_74HC595;
