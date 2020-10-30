
package WatchDogEx1 is
   procedure Run;

   procedure Wdr;

private
   pragma Import (Intrinsic, Wdr, "__builtin_avr_wdr");
end WatchDogEx1;
