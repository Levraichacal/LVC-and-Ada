with Sleeper;
with AVR;
with AVR.MCU;

procedure Main is
   use AVR;

   Flag : Boolean := False;
begin
   AVR.MCU.DDRB_Bits := (others => DD_Input);
   AVR.MCU.DDRD_Bits := (others => DD_Input);
   AVR.MCU.PortB_Bits := (others => True);
   AVR.MCU.PortD_Bits := (others => True);

   AVR.MCU.DDRB_Bits (5) := DD_Output;
   Sleeper.Init;

   loop
      Sleeper.Sleep (Seconds => 10);
      MCU.PortB_Bits (5) := Flag;
      Flag := not Flag;
   end loop;
end Main;
