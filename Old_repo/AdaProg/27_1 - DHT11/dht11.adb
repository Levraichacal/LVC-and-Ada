--                  ___    ___
--        RST--PC6 -   \__/   - PC5--CH6
--         RX--PD0 -          - PC4--CH5
--         TX--PD1 -          - PC3--CH4
--        CH7--PD2 -          - PC2--CH3
--        CH8--PD3 -          - PC1--CH2
--             PD4 -          - PC0--CH1
--             VCC -          - GND
--             GND -          - AREF
--       OSC1--PB6 -          - AVCC
--       OSC2--PB7 -          - PB5--LEDSTATUS
--             PD5 -          - PB4
--             PD6 -          - PB3
--             PD7 -          - PB2--LED1
--             PB0 -__________- PB1--INTER1
--
with AVR.Real_Time.Delays;
--with AVR.Threads;
with LVC.TIMER0;
use LVC.TIMER0;
with System;
use System;

package body DHT11 is

-----------------------------------------------------------------------------------------------------------
--  LES CONSTANTES
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------
--  LES VARIABLES
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------
--  LES FONCTIONS ET PROCEDURES UTILES
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------
--  Les procédures d'initialisation
-----------------------------------------------------------------------------------------------------------
   procedure Init(Pin : lvcPins) is
   begin
      P_Port.Pin := Pin;
      P_Port.Mask := digitalPinToBitMask(Pin);
      P_Port.Port := digitalPinToPort(Pin);
      P_Port.Mode := Output;
      --P_Port.InReg_Add := Unsigned_8(portInputRegister(P_Port.Port));
      --P_Port.OutReg_Add := Unsigned_8(portOutputRegister(P_Port.Port));
      --for P_Port.InReg'Address use To_Address (P_Port.InReg_Add);
      --for P_Port.OutReg'Address use To_Address (P_Port.OutReg_Add);
      LVC.TIMER0.Init;
   end Init;

----------------------------------------------------------------------------------
-- Les fonctions d'initialisation des interruptions                             --
----------------------------------------------------------------------------------
   function GetData return T_DHT11_Data is
      DHT11_Data : T_DHT11_Data;
      TimeOut : Unsigned_16;
      Tempo : Unsigned_32;
      Temp : Unsigned_8 := 0;
      Counter : Unsigned_8 := 0;
      Data : Unsigned_8 := 1;
   begin
      pinMode(P_Port.Pin,P_Port.Mode);
      digitalWrite(P_Port.Pin,Low_lvl);
      delay 0.018;
      digitalWrite(P_Port.Pin,High_lvl);
      delay 0.00004;
      P_Port.Mode := Input;
      pinMode(P_Port.Pin,P_Port.Mode);
      --AVR.Threads.Init;
      TimeOut := 0;
      while((not((portInputRegisterValue(P_Port.Port) and P_Port.Mask) = P_Port.Mask)) and (TimeOut<10000)) loop
         TimeOut := TimeOut +1;
      end loop;
      if(TimeOut = 10000) then
         DHT11_Data.Status := DHT11_TimeOut_Error;
      else
         TimeOut := 0;
         while((not((portInputRegisterValue(P_Port.Port) and P_Port.Mask) = P_Port.Mask)) and (TimeOut<10000)) loop
            TimeOut := TimeOut +1;
         end loop;
         if(TimeOut = 10000) then
            DHT11_Data.Status := DHT11_TimeOut_Error;
         else
            for i in 1..40 loop
               TimeOut := 0;
               while((not((portInputRegisterValue(P_Port.Port) and P_Port.Mask) = P_Port.Mask)) and (TimeOut<10000)) loop
                  TimeOut := TimeOut +1;
               end loop;
               if(TimeOut = 10000) then
                  DHT11_Data.Status := DHT11_TimeOut_Error;
               else
                  Tempo := millis;
                  TimeOut := 0;
                  while((not((portInputRegisterValue(P_Port.Port) and P_Port.Mask) = P_Port.Mask)) and (TimeOut<10000)) loop
                     TimeOut := TimeOut +1;
                  end loop;
                  if(TimeOut = 10000) then
                     DHT11_Data.Status := DHT11_TimeOut_Error;
                  else
                     if((millis - Tempo) > 40) then
                        Temp := Temp*2 +1;
                     else
                        Temp := Temp*2;
                     end if;
                     if (Counter = 6) then
                        Counter :=0;
                        if(Data = 1) then
                           DHT11_Data.Temperature := Temp;
                        else
                           if (Data = 3) then
                              DHT11_Data.Humidity := Temp;
                           else
                              if (Data = 5) then
                                 DHT11_Data.CRC := Temp;
                              end if;
                           end if;
                        end if;
                        Temp := 0;
                        Data := Data + 1;
                     else
                        Counter := Counter + 1;
                     end if;
                  end if;
               end if;
            end loop;
            if (not((DHT11_Data.Temperature + DHT11_Data.Humidity)
                         = DHT11_Data.CRC)) then
               DHT11_Data.Status := DHT11_CheckSum_Error;
            else
               DHT11_Data.Status := DHT11_Success;
            end if;
         end if;
      end if;
      return DHT11_Data;
   end GetData;

end DHT11;
