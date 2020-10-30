with Sleeper;
with AVR;
with AVR.MCU;

procedure Main is
   use AVR;

   Flag : Boolean := True;
begin
   AVR.MCU.DDRB_Bits := (others => DD_Input);
   AVR.MCU.DDRD_Bits := (others => DD_Input);
   AVR.MCU.PortB_Bits := (others => False);
   AVR.MCU.PortD_Bits := (others => False);

   AVR.MCU.DDRB_Bits (5) := DD_Output;
   AVR.MCU.DDRD_Bits (3) := DD_Output;

   Sleeper.Init;
   AVR.MCU.PortB_Bits (5) := Flag;
   AVR.MCU.PortD_Bits (3) := Flag;

   loop
      Sleeper.Sleep (Seconds => 5);
      MCU.PortB_Bits (5) := Flag;
      MCU.PortD_Bits (3) := Flag;
      Flag := not Flag;
   end loop;
end Main;
