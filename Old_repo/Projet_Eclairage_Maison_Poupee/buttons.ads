------------------------------------------------------
-- The package contains all the interruptions when a
-- button inside the house is press

package BUTTONS is

   procedure Init;

   procedure Wdr;

private
   pragma Import (Intrinsic, Wdr, "__builtin_avr_wdr");

end BUTTONS;
