package MS5611 is

   type MS5611_Command is (Cmd_Rst, Cmd_Read_Temp, Cmd_Read_P, Cmd_Read_Prom);

   procedure Start;

   procedure Init;

   procedure Stop;

   procedure Request(cmd: MS5611_Command);

end MS5611;
