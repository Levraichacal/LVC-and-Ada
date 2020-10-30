pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E18 : Short_Integer; pragma Import (Ada, E18, "avr__real_time__clock_E");
   E20 : Short_Integer; pragma Import (Ada, E20, "avr__real_time__clock_impl_E");
   E16 : Short_Integer; pragma Import (Ada, E16, "avr__real_time__delays_E");
   E41 : Short_Integer; pragma Import (Ada, E41, "i2c_hmc5883l_E");
   E45 : Short_Integer; pragma Import (Ada, E45, "i2c_mpu6050_E");
   E47 : Short_Integer; pragma Import (Ada, E47, "i2c_ms5611_E");
   E43 : Short_Integer; pragma Import (Ada, E43, "two_wire_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E20 := E20 + 1;
      E18 := E18 + 1;
      E16 := E16 + 1;
      E43 := E43 + 1;
      E47 := E47 + 1;
      E45 := E45 + 1;
      E41 := E41 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma No_Return (Ada_Main_Program);
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/ada.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-calend.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-except.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-stoele.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-unstyp.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-caldel.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/23_1 - I2C HMC5883L MPU6050 MS5611 - twi/objects/main.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/23_1 - I2C HMC5883L MPU6050 MS5611 - twi/objects/two_wire.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/23_1 - I2C HMC5883L MPU6050 MS5611 - twi/objects/i2c_ms5611.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/23_1 - I2C HMC5883L MPU6050 MS5611 - twi/objects/i2c_mpu6050.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/23_1 - I2C HMC5883L MPU6050 MS5611 - twi/objects/i2c_hmc5883l.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/23_1 - I2C HMC5883L MPU6050 MS5611 - twi/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
