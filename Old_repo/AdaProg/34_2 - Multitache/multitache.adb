-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;
with AVR.Real_Time.Delays;
with AVR.UART;
use AVR;
with AVR.Strings;                  use AVR.Strings;
-- Déclaration du programme
procedure Multitache is

   altitude, vitesse : integer := 0 ;
   task Verif_Altitude ;

   task body Verif_Altitude is
   begin
      loop
         delay 0.1;
         AVR.UART.Put(AVR_String("Altitude de" & integer'image(altitude) & " metres")) ;
         AVR.UART.CRLF;
      end loop ;
   end Verif_Altitude ;

   task Verif_Vitesse ;

   task body Verif_Vitesse is
   begin
      loop
         delay 0.1;
         AVR.UART.Put(AVR_String("Vitesse de" & integer'image(vitesse) & " km / H")) ;
         AVR.UART.CRLF;
      end loop ;
   end Verif_Vitesse ;

begin
   AVR.UART.Put(AVR_String("3 ... 2 ... 1 ... Decollage !")) ;
   AVR.UART.CRLF;
   while altitude < 10_000 loop
      delay 0.01;
      if altitude < 1000
         then vitesse  := vitesse + 5 ;
              altitude := altitude + 5 ;
         else altitude := altitude + 10 ;
      end if ;
   end loop ;
   AVR.UART.Put(AVR_String("Decollage reussi !")) ;
   AVR.UART.CRLF;
   abort Verif_Altitude ;
   abort Verif_Vitesse ;
end Multitache;

