

package LIB_74HC595 is

   --  A new type to send and manipulate the eight outputs of the 74HC595
   type T_Register is array (0..7) of Boolean;

   --  Initialisation of the 74HC595
   procedure Init;

   --  Set false to all the values of the register
   procedure ClearRegister;

   --  Set true to all the values of the register
   procedure EmptyRegister;

   --  Write the register to the 74HC595
   procedure WriteRegister;

   --  Write the register register to the 74HC595
   procedure WriteRegister (register : T_Register);

   -- Set the value value at the index index of the 74HC595
   procedure SetRegisterValue (index: Integer; value : Boolean);

end LIB_74HC595;
