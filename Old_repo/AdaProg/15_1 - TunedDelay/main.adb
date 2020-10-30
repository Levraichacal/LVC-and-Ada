-- V1.0 -- Created by S.BARDOT 12/05/2015
-- V1.1 -- 15/05/2015 : Modify the PWM min and max value, don't change the value if out of range, keep the previous one.

with Tuneddelay;

procedure Main is

begin
   Tuneddelay.Run;
end Main;
