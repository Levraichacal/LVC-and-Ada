with I2c_hmc5883l;
with AVR.UART;
use I2c_hmc5883l;
with AVR.Real_Time.Delays;
with Interfaces;
use Interfaces;
with Ada.Unchecked_Conversion;

procedure Main is
   I2COK : Boolean;
   rang : T_HMC5883L_Range;
   mode : T_HMC5883L_Mode;
   dataRate : T_HMC5883L_DataRate;
   sample : T_HMC5883L_Sample;
   vectorTemp : Vector;
   vectorTempF : Vectorf;
   test : IEEE_Float_32 := 1.03;
   temp : Integer_32;
   function I32_To_I16 is
      new Ada.Unchecked_Conversion (Source => Integer_32,
                                    Target => Integer_16);
   function I16_To_I32 is
      new Ada.Unchecked_Conversion (Source => Integer_16,
                                    Target => Integer_32);

begin
   AVR.UART.Init (103); -- 9600 @16MHz
   AVR.UART.Put ("Initialisation du HMC5883L : ");
   AVR.UART.Put(Integer_16(test));AVR.UART.Put(".");AVR.UART.Put(Integer_16(test*100.0));
   AVR.UART.CRLF;
   I2COK  := I2c_hmc5883l.beginHMC5883L;
   if(I2COK) then
      AVR.UART.Put ("Initialisation OK");
      AVR.UART.CRLF;
      rang := I2c_hmc5883l.getRange;
      case rang is
         when HMC5883L_RANGE_0_88GA =>
            AVR.UART.Put("HMC5883L_RANGE_0_88GA");
         when HMC5883L_RANGE_1_3GA =>
            AVR.UART.Put("HMC5883L_RANGE_1_3GA");
         when HMC5883L_RANGE_1_9GA =>
            AVR.UART.Put("HMC5883L_RANGE_1_9GA ");
         when HMC5883L_RANGE_2_5GA =>
            AVR.UART.Put("HMC5883L_RANGE_2_5GA");
         when HMC5883L_RANGE_4GA =>
            AVR.UART.Put("HMC5883L_RANGE_4GA");
         when HMC5883L_RANGE_4_7GA =>
            AVR.UART.Put("HMC5883L_RANGE_4_7GA");
         when HMC5883L_RANGE_5_6GA =>
            AVR.UART.Put("HMC5883L_RANGE_5_6GA");
         when HMC5883L_RANGE_8_1GA =>
            AVR.UART.Put("HMC5883L_RANGE_8_1GA");
      end case;
      AVR.UART.CRLF;
      delay 1.5;
      mode := I2c_hmc5883l.getMeasurementMode;
      case mode is
         when HMC5883L_CONTINOUS =>
            AVR.UART.Put("HMC5883L_CONTINOUS");
         when HMC5883L_SINGLE =>
            AVR.UART.Put("HMC5883L_SINGLE");
         when HMC5883L_IDLE =>
            AVR.UART.Put("HMC5883L_IDLE");
      end case;
      AVR.UART.CRLF;
      delay 1.5;
      dataRate := I2c_hmc5883l.getDataRate;
      case dataRate is
         when HMC5883L_DATARATE_0_75_HZ =>
            AVR.UART.Put("HMC5883L_DATARATE_0_75_HZ");
         when HMC5883L_DATARATE_1_5HZ =>
            AVR.UART.Put("HMC5883L_DATARATE_1_5HZ");
         when HMC5883L_DATARATE_3HZ =>
            AVR.UART.Put("HMC5883L_DATARATE_3HZ");
         when HMC5883L_DATARATE_7_5HZ =>
            AVR.UART.Put("HMC5883L_DATARATE_7_5HZ");
         when HMC5883L_DATARATE_15HZ =>
            AVR.UART.Put("HMC5883L_DATARATE_15HZ");
         when HMC5883L_DATARATE_30HZ =>
            AVR.UART.Put("HMC5883L_DATARATE_30HZ");
         when HMC5883L_DATARATE_75HZ =>
            AVR.UART.Put("HMC5883L_DATARATE_75_HZ");
      end case;
      AVR.UART.CRLF;
      delay 1.5;
      sample := I2c_hmc5883l.getSamples;
      case sample is
         when HMC5883L_SAMPLES_1 =>
            AVR.UART.Put("HMC5883L_SAMPLES_1");
         when HMC5883L_SAMPLES_2 =>
            AVR.UART.Put("HMC5883L_SAMPLES_2");
         when HMC5883L_SAMPLES_4 =>
            AVR.UART.Put("HMC5883L_SAMPLES_4");
         when HMC5883L_SAMPLES_8 =>
            AVR.UART.Put("HMC5883L_SAMPLES_8");
      end case;
      delay 1.5;
      AVR.UART.CRLF;
      loop
         vectorTemp := I2c_hmc5883l.readRaw;
         --AVR.UART.Put ("X : ");
         AVR.UART.Put (vectorTemp.X);
         --AVR.UART.CRLF;
         AVR.UART.Put ("    ");
         AVR.UART.Put (vectorTemp.Y);
         --AVR.UART.CRLF;
         AVR.UART.Put  ("    ");
         AVR.UART.Put (vectorTemp.Z);
         -- AVR.UART.CRLF;
         vectorTempF := I2c_hmc5883l.readNormalize;
         AVR.UART.Put  ("    ");
         temp := vectorTempF.X;
         if(temp<0) then
            temp := - temp;
            AVR.UART.Put ("-");
         end if;
         AVR.UART.Put ( I32_To_I16(temp/1000));
         AVR.UART.Put (".");
         AVR.UART.Put ( I32_To_I16(temp/100 - (temp/1000)*10));
         AVR.UART.Put ( I32_To_I16(temp/10 - (temp/100)*10));
         AVR.UART.Put ( I32_To_I16(temp - (temp/10)*10));
         --AVR.UART.CRLF;
         AVR.UART.Put  ("    ");
         temp := vectorTempF.Y;
         if(temp<0) then
            temp := - temp;
            AVR.UART.Put ("-");
         end if;
         AVR.UART.Put ( I32_To_I16(temp/1000));
         AVR.UART.Put (".");
         AVR.UART.Put ( I32_To_I16(temp/100 - (temp/1000)*10));
         AVR.UART.Put ( I32_To_I16(temp/10 - (temp/100)*10));
         AVR.UART.Put ( I32_To_I16(temp - (temp/10)*10));
         temp := vectorTempF.Z;
         AVR.UART.Put  ("    ");
         if(temp<0) then
            temp := - temp;
            AVR.UART.Put ("-");
         end if;
         AVR.UART.Put ( I32_To_I16(temp/1000));
         AVR.UART.Put (".");
         AVR.UART.Put ( I32_To_I16(temp/100 - (temp/1000)*10));
         AVR.UART.Put ( I32_To_I16(temp/10 - (temp/100)*10));
         AVR.UART.Put ( I32_To_I16(temp - (temp/10)*10));
         --AVR.UART.Put ( I32_To_I16(vectorTempF.Y/1000));
         --AVR.UART.Put (".");
         --AVR.UART.Put ( I32_To_I16(vectorTempF.Y/100 - (vectorTempF.Y/1000)*10));
         --AVR.UART.Put ( I32_To_I16(vectorTempF.Y/10 - (vectorTempF.Y/100)*10));
         --AVR.UART.Put ( I32_To_I16(vectorTempF.Y - (vectorTempF.Y/10)*10));
         AVR.UART.CRLF;
         delay 0.5;
      end loop;
   else
      AVR.UART.Put("Probleme!!!");
   end if;
end Main;
