Recovering IBM Thinkpad T42 BIOS password with AVR-Ada and Arduino
==================================================================

:date: 2012-07-08 20:00
:tags: eeprom, arduino, thinkpad, i2c


My father had forgotten the BIOS password of his IBM Thinkpad T42 laptop and
I promised to take a look at it.

It turns out that there is a relatively `easy way <http://www.thinkwiki.org/wiki/Maintenance#Recovering_BIOS_passwords.>`_ to recover the password.

However, I didn't have parts described in `the instructions <http://sodoityourself.com/hacking-ibm-thinkpad-bios-password/>`_, so instead I used Arduino and AVR-Ada.

Soldering
---------

The BIOS password is stored on the EEPROM chip, which uses I2C for
communication. To interface with the EEPROM chip, one needs to solder wires to
the SDA, SCL, and GND pins of the chip and place other ends on the breadboard.
The chip is powered by Thinkpad itself, so VCC pin can be left unconnected.
In pictures below, I soldered the VCC pin also (but left unconnected) just in
case I would have needed to provide external power to the chip.

Pin layout of the EEPROM chip (24RF08) can be found from
`hey-tech0.tripod.com <http://hey-tech0.tripod.com/>`_. Atmel used
to provide AT24RF08 datasheet, but now they only offer
`AT24C02 datasheet <http://www.atmel.com/dyn/resources/prod_documents/doc3256.pdf>`_,
which uses the same pin layout.

.. image:: http://farm8.staticflickr.com/7205/6810647230_7de2b7ea55.jpg
   :target: http://www.flickr.com/photos/66708330@N00/6810647230/

.. image:: http://farm8.staticflickr.com/7210/6956753763_e534f0924d.jpg
   :target: http://www.flickr.com/photos/66708330@N00/6956753763/

From the breadboard, connect the wires to the SDA, SCL, and GND pins
of Arduino UNO r3. If you use some other Arduino, the pin locations might
differ from the picture.

Reading EEPROM with AVR-Ada
---------------------------

To read EEPROM using Arduino and AVR-Ada, I created following program:

::

   ...
   EEPROM_Address : constant := 16#40#;
   ...

   for B in Interfaces.Unsigned_8 range 0 .. 30 loop
 
      Two_Wire.Init;
      Two_Wire.Request_Data(EEPROM_Address + B, 1024);
      UART.Put("Request data done: ");
      AVR.Int_Img.U8_Img (Data => EEPROM_Address + B,
         Target => I,
         Last   => L);
      AVR.UART.Put (I (1 .. L));
      UART.CRLF;
      loop
         exit when not Two_Wire.Data_Available;
         Buffer (1) := Two_Wire.Receive;
         AVR.Int_Img.U8_Img (Data => Buffer (1),
                             Target => I,
                             Last   => L);
         AVR.UART.Put("Got: ");
         AVR.UART.Put(I (1 ..L));
         AVR.UART.CRLF;
      end loop;
      Err := Two_Wire.Get_Error;
      AVR.Int_Img.U8_Img (Data => Unsigned_8 (Two_Wire.TWI_Error_Enum'Pos (Err)),
                          Target => I,
                          Last   => L);
      AVR.UART.Put("Err: ");
      AVR.UART.Put(I (1 ..L));
      AVR.UART.CRLF;
      delay 0.1;
   end loop;


You can find it from my `arduino-thinkpad-bios <https://bitbucket.org/tkoskine/arduino-thinkpad-bios>`_ repository. The source code expects AVR-Ada 1.2 (the development version at the time of writing).

I didn't know the exact I2C address of the EEPROM, so I iterated through
multiple addresses and printed out all the info I was able to get.

Note: The actual reading process happens by turning the laptop on when
the wires are NOT connected to Arduino. Once the laptop is turned on and
the BIOS password query appears, connect the wires and turn on or reset
Arduino and read the data sent by Arduino (via serial console).

Interpreting EEPROM data
------------------------

My AVR-Ada program outputs each byte (of EEPROM contents), in numeric form on its own line:

::

   Got: 33
   Got: 59
   ...

If you want to convert this to binary image form, you can save the output
to a file and feed the file to my `write_blocks.pl <https://bitbucket.org/tkoskine/arduino-thinkpad-bios/src/409d08842f13/write_blocks.pl>`_
Perl script.

The bytes are `IBM keyboard <http://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html#ss1.4>`_
`scancodes <http://en.wikipedia.org/wiki/Scancode>`_. If you have ever done
any DOS games you can probably decode the bytes to characters in your head :).
Otherwise, you need a program, like `IBMpass v2.0 Lite (for Windows) <http://www.allservice.ro/store/utils/>`_ to do the conversion.

Disclaimer
----------

I do not guarantee that these instructions or my program is correct.
It is possible that you will totally brick your laptop when you do
the soldering or when you run the program on Arduino.

