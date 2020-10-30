-- Les packages LVC sont des packages que j'ai créé car je n'avais pas trouvé
-- d'équivalent. Je les ai testés mais cela n'exclue pas la présence de faute.
-- Ceux-ci peuvent-être réutilisé.
-- Pour plus d'informations sur http://lvcetada.e-monsite.com/ ou vous pouvez
-- me contacter sur lvcetada@gmail.com

with AVR; use AVR;
with AVR.MCU; use AVR.MCU;
with AVR.Interrupts;

package body LVC.TIMER0 is

   procedure Timer0_Interrupt;

   pragma Machine_Attribute (Entity         => Timer0_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Timer0_Interrupt, MCU.Sig_TIMER0_OVF_String);

   procedure Timer0_Interrupt is
      m : Unsigned_32 := Timer0_millis;
      f : Unsigned_8 :=  Timer0_fract;
   begin
      m := m + Unsigned_32(MILLIS_INC);
      f := f + FRACT_INC;
      if (f >= FRACT_MAX) then
         f := f + FRACT_MAX;
         m := m + 1;
      end if;
      Timer0_fract := f;
      Timer0_millis := m;
      Timer0_overflow_count := Timer0_overflow_count + 1;
   end Timer0_Interrupt;


   procedure Init is
   begin
      AVR.Interrupts.Disable;
      MCU.TCCR0A_Bits(MCU.WGM01_Bit) := True;
      MCU.TCCR0A_Bits(MCU.WGM00_Bit) := True;
      -- Set timer 0 precale to 64
      MCU.TCCR0B_Bits(MCU.CS01_Bit) := True;
      MCU.TCCR0B_Bits(MCU.CS00_Bit) := True;
      -- Enable Timer OVF
      MCU.TIMSK0_Bits(MCU.TOIE0_Bit) := True;
      AVR.Interrupts.Enable;
   end Init;

   function millis return Unsigned_32 is
      temp : Unsigned_32 := 0;
   begin
      AVR.Interrupts.Disable;
      temp := Timer0_millis;
      AVR.Interrupts.Enable;
      return temp;
   end millis;

   function micros return Unsigned_32 is
      temp : Unsigned_32 := 0;
      t : Unsigned_8;
   begin
      AVR.Interrupts.Disable;
      temp := Unsigned_32(Timer0_overflow_count);
      t := TCNT0;
      if ((MCU.TIFR0_Bits(MCU.TOV0_Bit)) and (t<255)) then
         temp :=+1;
      end if;
      AVR.Interrupts.Enable;
      return (((temp*256)+Unsigned_32(t))*4);
   end micros;

   procedure wait (time : Unsigned_32) is
      start : Unsigned_16 := Unsigned_16(micros);
      ms : Unsigned_32 := time;
   begin
      while(ms>0) loop
         -- yield;
         if((Unsigned_16(micros) - start) >= 1000) then
            ms :=-1;
            start :=+1000;
         end if;
      end loop;
   end wait;

end LVC.TIMER0;
