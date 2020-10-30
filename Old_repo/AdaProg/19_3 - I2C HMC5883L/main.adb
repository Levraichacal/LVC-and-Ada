with I2c_hmc5883l;
with AVR.UART;
use I2c_hmc5883l;
with AVR.Real_Time.Delays;
with Interfaces;
use Interfaces;
with Ada.Unchecked_Conversion;

procedure Main is
   I2COK : Boolean;
   vectorTemp : Vector;
   vectorTempF : Vectorf;
   function U32_To_U16 is
      new Ada.Unchecked_Conversion (Source => Unsigned_32,
                                    Target => Unsigned_16);

begin
   AVR.UART.Init (103); -- 9600 @16MHz
   AVR.UART.Put ("Initialisation du HMC5883L");
   AVR.UART.CRLF;
   I2COK  := I2c_hmc5883l.beginHMC5883L;
   AVR.UART.Put ("Initialisation OK");
   AVR.UART.CRLF;
   loop
      vectorTemp := I2c_hmc5883l.readRaw;
      AVR.UART.Put ("X : ");AVR.UART.Put (vectorTemp.X);
      AVR.UART.Put("    ");
      AVR.UART.Put ("Y : ");AVR.UART.Put (vectorTemp.Y);
      AVR.UART.Put("    ");
      AVR.UART.Put ("Z : ");AVR.UART.Put (vectorTemp.Z);
      AVR.UART.Put("    ");
      AVR.UART.Put ("X : ");AVR.UART.Put (Integer_16(Integer_32(vectorTemp.X)*920/1000));
      AVR.UART.Put("    ");
      AVR.UART.Put ("Y : ");AVR.UART.Put (Integer_16(Integer_32(vectorTemp.Y)*920/1000));
      AVR.UART.Put("    ");
      AVR.UART.Put ("Z : ");AVR.UART.Put (Integer_16(Integer_32(vectorTemp.Z)*920/1000));
      -- vectorTempF := I2c_hmc5883l.readNormalize;
      -- AVR.UART.Put ("Xf : ");AVR.UART.Put ((vectorTempF.X/1000));AVR.UART.Put (".");AVR.UART.Put ((vectorTempF.X - (vectorTempF.X/1000)*1000));
      -- AVR.UART.Put("    ");
      -- AVR.UART.Put ("Yf : ");AVR.UART.Put ((vectorTempF.Y/1000));AVR.UART.Put (".");AVR.UART.Put ((vectorTempF.Y - (vectorTempF.Y/1000)*1000));
      -- AVR.UART.Put("    ");
      -- AVR.UART.Put ("Zf : ");AVR.UART.Put ((vectorTempF.Z/1000));AVR.UART.Put (".");AVR.UART.Put ((vectorTempF.Z - (vectorTempF.Z/1000)*1000));
      AVR.UART.CRLF;
      delay 0.5;
   end loop;
end Main;
