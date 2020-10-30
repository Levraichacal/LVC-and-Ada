Measuring current with INA219 sensor
====================================

:tags: ina219, i2c, power
:date: 2013-08-26 22:30

To optimize the power usage of my Arduino devices, I first needed to
measure the power usage.

I could have done it traditionally with multimeter, but then I found
Adafruit's `INA219 sensor breakout board <https://www.adafruit.com/products/904>`_.

.. image:: http://farm4.staticflickr.com/3804/9358734151_73017e60f7.jpg
   :target: http://www.flickr.com/photos/terokoskinen/9358734151/
   :width: 320
   :height: 192


Adafruit also has nice `tutorial <http://learn.adafruit.com/adafruit-ina219-current-sensor-breakout>`_
for the sensor (which I actually bought from `oomlout.co.uk <http://www.oomlout.co.uk>`_ to avoid customs/extra taxes as European).

So, for the setup I gathered following parts:

* Arduino UNO, for reading the INA219 sensor
* The INA219 sensor itself
* `Olimexino-328 <https://www.olimex.com/Products/Duino/AVR/OLIMEXINO-328/>`_ as a target device for measurements
* Sparkfun `Breadboard Power Supply <https://www.sparkfun.com/products/114>`_ for providing power to Olimexino-328.
* A small breadboard and a few jumper wires

When assembled together, the setup looks like this:

.. image:: http://farm8.staticflickr.com/7344/9361731678_8b441a72f2.jpg
   :target: http://www.flickr.com/photos/terokoskinen/9361731678/
   :height: 299
   :width: 500

Code
----

The code consists of my I2C package and translation
of Adafruit's INA219 code (written in C) to Ada.

The INA219 Ada package interface looks like this::

   package INA219 is
      procedure Init;

      function Get_Bus_Voltage return Interfaces.Unsigned_16;
      function Get_Shunt_Voltage return Interfaces.Unsigned_16;
      function Get_Current return Interfaces.Unsigned_16;
      function Get_Power return Interfaces.Unsigned_16;

      function Get_Error return Boolean;

      procedure Set_Calibration_32V_2A;
   end INA219;

Procedure Init needs to be called before other functions.
It initializes the I2C bus and sets the default calibration.

Once the device is initialized and calibrated, you can query
voltage, current, and power values with the related functions.

::

   INA219.Init;
   ...
   loop
      AVR.UART.Put ("   ***"); AVR.UART.CRLF;
      AVR.UART.Put (INA219.Get_Bus_Voltage); AVR.UART.CRLF;
      AVR.UART.Put (INA219.Get_Shunt_Voltage); AVR.UART.CRLF;
      AVR.UART.Put (INA219.Get_Current); AVR.UART.CRLF;
      AVR.UART.Put (INA219.Get_Power); AVR.UART.CRLF;
      delay 1.0;
   end loop;

Using the above program and opening the serial console,
we can see how much power our target device draws. If you want
to know how to change this value, you need to either do it
by yourself or wait for future articles about AVR
power saving using AVR-Ada :).

The code for the program is available in my
`arduino-blog repository <https://bitbucket.org/tkoskine/arduino-blog/>`_
(see examples/ina219 directory).