with AVR;
with AVR.MCU;

use AVR;


package body L298N is

   procedure Init_Timer0 is
   begin
   -- Activation du timer;
      MCU.PRR_Bits (MCU.PRTIM0_Bit) := False;
   -- Configuration du timer 0 pour fonctionner en PWM
      MCU.TCCR0A_Bits := (MCU.WGM01_Bit  => True,
                          MCU.WGM00_Bit  => True,
                          others => False);
   -- Configuration en 250Hz (environ)
      MCU.TCCR0B_Bits := (MCU.CS02_Bit => True,
                          others => False);
      MCU.TCCR0A_Bits(7) := True; -- Equivalent à mettre COM0A1 à 1
      MCU.TCCR0A_Bits(5) := True; -- Equivalent à mettre COM0B1 à 1
      MCU.OCR0A := 80; 
      MCU.OCR0B := 80;  
   end Init_Timer0;

   --(In1 : lvcPins; In2 : lvcPins; In3 : lvcPins; In4 : lvcPins)
   -- In1 : D7
   -- In2 : D8
   -- In3 : D10
   -- In4 : D11
   -- ENA : D5 (OCR0B)
   -- ENB : D6 (OCR0A)
   procedure Init_L298N is
   begin
      MCU.DDRD_Bits (5) := DD_Output;  -- D5 en sortie OCR0B
      MCU.DDRD_Bits (6) := DD_Output;  -- D6 en sortie OCR0A
      MCU.DDRD_Bits (7) := DD_Output;  -- D7 en sortie
      MCU.DDRB_Bits (0) := DD_Output;  -- D8 en sortie
      MCU.DDRB_Bits (2) := DD_Output;  -- D10 en sortie
      MCU.DDRB_Bits (3) := DD_Output;  -- D11 en sortie
      Init_Timer0;
      -- MCU.PORTD_Bits(5) := True;        -- High on D5
      -- MCU.PORTD_Bits(6) := True;        -- High on D6
   end Init_L298N;

   procedure Avance is
   begin
      MCU.PORTD_Bits(7) := False;       -- Low on D7
      MCU.PORTB_Bits(0) := True;        -- High on D8
      MCU.PORTB_Bits(2) := True;        -- High on D10
      MCU.PORTB_Bits(3) := False;       -- Low on D11
   end Avance;

   procedure Avance(valeur : Unsigned_8) is
   begin
      MCU.OCR0A := valeur;
      MCU.OCR0B := valeur;
      Avance;
   end Avance;

   procedure Recule is
   begin
      MCU.PORTD_Bits(7) := True;        -- High on D7
      MCU.PORTB_Bits(0) := False;       -- Low on D8
      MCU.PORTB_Bits(2) := False;       -- Low on D10
      MCU.PORTB_Bits(3) := True;        -- High on D11
   end Recule;

   procedure Recule(valeur : Unsigned_8) is
   begin
      MCU.OCR0A := valeur;
      MCU.OCR0B := valeur;
      Recule;
   end Recule;

   procedure Droite is
   begin
      MCU.PORTD_Bits(7) := False;       -- Low on D7
      MCU.PORTB_Bits(0) := True;        -- High on D8
      MCU.PORTB_Bits(2) := False;       -- Low on D10
      MCU.PORTB_Bits(3) := False;       -- Low on D11
   end Droite;

   procedure Droite(valeur : Unsigned_8)  is
   begin
      MCU.OCR0A := valeur;
      MCU.OCR0B := valeur/2;
      Avance;
   end Droite;

   procedure Gauche is
   begin
      MCU.PORTD_Bits(7) := False;       -- Low on D7
      MCU.PORTB_Bits(0) := False;       -- Low on D8
      MCU.PORTB_Bits(2) := False;       -- Low on D10
      MCU.PORTB_Bits(3) := True;        -- High on D11
   end Gauche;

   procedure Gauche(valeur : Unsigned_8)  is
   begin
      MCU.OCR0A := valeur/2;
      MCU.OCR0B := valeur;
      Avance;
   end Gauche;

   procedure Stop is
   begin
      MCU.PORTD_Bits(7) := False;       -- Low on D7
      MCU.PORTB_Bits(0) := False;       -- Low on D8
      MCU.PORTB_Bits(2) := False;       -- Low on D10
      MCU.PORTB_Bits(3) := False;       -- Low on D11
   end Stop;

end L298N;
