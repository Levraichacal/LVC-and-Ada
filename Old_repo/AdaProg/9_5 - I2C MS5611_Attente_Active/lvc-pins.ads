
package LVC.PINS is

   type lvcPins is (D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,A0,A1,A2,A3,A4,A5);

   subtype lvcMode is Boolean;
   Input : lvcMode renames False;
   Output : lvcMode renames True;

   subtype lvcLevel is Boolean;
   LOW : lvcLevel renames False;
   HIGH : lvcLevel renames True;

   procedure pinMode (port: lvcPins; mode : lvcMode);

   procedure digitalWrite (port: lvcPins; level : lvcLevel);

end LVC.PINS;
