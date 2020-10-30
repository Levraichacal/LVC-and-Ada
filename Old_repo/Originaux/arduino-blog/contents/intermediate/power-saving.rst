Saving power with AVR-Ada
=========================

:tags: ina219, power
:date: 2013-11-05 00:01

.. image:: http://farm4.staticflickr.com/3756/10463877875_4901d394f6.jpg
   :target: http://www.flickr.com/photos/terokoskinen/10463877875/
   :height: 375
   :width: 500

As I got my INA219 sensor `working`_, the next logical step was to actually
find out how you can save some power with Arduinos.

Sparkfun provides `a nice article <https://www.sparkfun.com/tutorials/309>`_
about the subject and atmega328p datasheet is also an useful information source.

To save power, I basically did following things:

1. Turned off all unnecessary peripherals.
2. Turned off brown-out-detection (BOD, either via software or via FUSE bits).
3. Slow down CPU frequency
4. Put the processor in power save mode.

Turn off unnecessary peripherals
--------------------------------

Turning off unnecessary things is pretty easy, you just flip some bits:

::

   -- Disable ADC
   ADCSRA_Bits (ADEN_Bit) := False;
   ACSR_Bits (ACD_Bit)     := True;
   PRR_Bits (PRADC_Bit)    := True;
   -- Disable SPI
   PRR_Bits (PRSPI_Bit) := True;
   -- Disable TWI
   PRR_Bits (PRTWI_Bit) := True;
   -- Disable USART0
   PRR_Bits (PRUSART0_Bit) := True;
   -- Disable timers 0 and 1
   PRR_Bits (PRTIM0_Bit) := True;
   PRR_Bits (PRTIM1_Bit) := True;

Brown-out-detection
-------------------

Disabling the brown out detection is somewhat trickier. You can do it in software, but
you need to flip the bits within certain time and if I interpreted the generated
code correctly, gcc generates too big/slow code from AVR-Ada code. Anyway,
here is how it would be done:

::

   procedure Disable_BOD is
      use AVR.MCU;
   begin
      MCUCR_Bits (BODS_Bit) := True;
      MCUCR_Bits (BODSE_Bit) := True;
      MCUCR_Bits (BODS_Bit) := True;
      MCUCR_Bits (BODSE_Bit) := False;
   end Disable_BOD;
   pragma Inline_Always(Disable_BOD);

Generated code for this is:

::

   in r24,0x35
   ori r24,lo8(64)
   out 0x35,r24
   in r18,0x35
   ori r18,lo8(32)
   out 0x35,r18
   in r19,0x35
   ori r19,lo8(64)
   out 0x35,r19
   in r20,0x35
   andi r20,lo8(-33)
   out 0x35,r20

And in avr-libc same is done as inline assembly (much shorter):

::

    #define sleep_bod_disable() \
    do { \
      uint8_t tempreg; \
      __asm__ __volatile__("in %[tempreg], %[mcucr]" "\n\t" \
                           "ori %[tempreg], %[bods_bodse]" "\n\t" \
                           "out %[mcucr], %[tempreg]" "\n\t" \
                           "andi %[tempreg], %[not_bodse]" "\n\t" \
                           "out %[mcucr], %[tempreg]" \
                           : [tempreg] "=&d" (tempreg) \
                           : [mcucr] "I" _SFR_IO_ADDR(MCUCR), \
                             [bods_bodse] "i" (_BV(BODS) | _BV(BODSE)), \
                             [not_bodse] "i" (~_BV(BODSE))); \
    } while (0)


Because of this, I also created a small dosleep.c helper (in C) to do
the bod disabling, but in the end I didn't find it to have a huge difference
in power usage.

Slowing down the CPU frequency
------------------------------

CPU frequency control happens via CLKPR register. You are expected to write value
16#80# first into the register and after that the scaling value into the same register.

For this, I created two helper procedures (Slow_CPU and Fast_CPU):

::

   procedure Slow_CPU is
      CPU_125khz : constant := 16#07#;
      Status : Interfaces.Unsigned_8;
   begin
      Status := Interrupts.Save_And_Disable;
      AVR.MCU.CLKPR := 16#80#;
      AVR.MCU.CLKPR := CPU_125khz;
      Interrupts.Restore (Status);
   end Slow_CPU;

   procedure Fast_CPU is
      CPU_16MHz : constant := 16#00#;
      Status : Interfaces.Unsigned_8;
   begin
      Status := Interrupts.Save_And_Disable;
      AVR.MCU.CLKPR := 16#80#;
      AVR.MCU.CLKPR := CPU_16MHz;
      Interrupts.Restore (Status);
   end Fast_CPU;


The constants names as CPU_125khz and CPU_16MHz make only sense if your AVR processor is clocked by 16MHz crystal.

Also, *an important note*: Once your processor is running at 125khz, avrdude might have problems programming it.

With Olimexino-328 board I didn't have any programming problems (programming via serial console and normal avrdude parameters worked fine),
but Arduino UNO and Arduino Duemilanove boards required programming with USBTinyISP and with "-B 32" avrdude parameter.

Power saving mode
-----------------

AVR processor have many power saving modes. With atmega328p, I used one called "POWER SAVE",
which pretty much turns off everything except Timer 2 and watchdog.

If you don't need timer 2, you can also use "POWER DOWN" mode, but then you cannot use timer 2 to
wake up the processor.

I wanted timer 2 to wake the processor every 2 seconds, so I did following initialization:

::

   Elapsed_Seconds : aliased Interfaces.Unsigned_16;
   pragma Volatile (Elapsed_Seconds);

   procedure Tick;
   pragma Machine_Attribute (Entity         => Tick,
                             Attribute_Name => "signal");
   pragma Export (C, Tick, Timer2.Signal_Compare);

   procedure Tick is
      use type Interfaces.Unsigned_16;

      Adjustment : constant := 2;
   begin
      Elapsed_Seconds := Elapsed_Seconds + Adjustment;
   end Tick;

   ...

   Timer2.Init_CTC (Timer2.Scale_By_1024, Overflow => 249);


At 125kHz with scale of 1024 and overflow at 250, timer 2 is triggered about every 2 seconds (1/125000*1024*250 = 2.048).

Putting everything together
---------------------------

To test the setup, I created a simple main procedure:

::

   Sleeper.Init;

   loop
      Sleeper.Sleep (Seconds => 10);
      MCU.PortB_Bits (5) := Flag;
      Flag := not Flag;
   end loop;

The main procedure changes the status of the default LED (at Arduino digital pin 13) every 10 seconds.
This way I know that the processor is still alive and I can also verify that the timing is mostly correct.

The Sleep procedure ended up like this:

::

   procedure Sleep_Instr;
   pragma Inline_Always (Sleep_Instr);
   pragma Import (Intrinsic, Sleep_Instr, "__builtin_avr_sleep");

   procedure Sleep (Seconds : Interfaces.Unsigned_16) is
      procedure Do_Sleep;
      pragma Import (C, Do_Sleep, "dosleep");
   begin
      Slow_CPU;
      Elapsed_Seconds := 0; -- interrupt increases this
      loop
         exit when Elapsed_Seconds >= Seconds;

         if True then
            AVR.Sleep.Set_Mode (AVR.Sleep.Power_Save);
            MCU.MCUCR_Bits (AVR.MCU.SE_Bit) := True;
            Disable_BOD;
            Sleep_Instr;
            MCU.MCUCR_Bits (AVR.MCU.SE_Bit) := False;
         else
            Do_Sleep; -- C version
         end if;
      end loop;
      Fast_CPU;
   end Sleep;

Different Arduinos and Arduino clones compared
----------------------------------------------

Since I have a lot of different Arduino devices around, I was interested in knowing
which draws the least amount of current.

The tested devices were:

1. Official Arduino Duemilanove - older version of Arduino
2. Official Arduino UNOr3 - the latest version of 8-bit Arduino
3. Olimexino-328_ - Arduino clone from `Olimex <http://www.olimex.com>`_
4. `Arduino DIY PTH Kit <https://www.sparkfun.com/products/retired/10523>`_ from Sparkfun (older obsolete version)
5. Diavolino_ from `Evil Mad Scientist <http://shop.evilmadscientist.com/>`_

.. image:: http://farm8.staticflickr.com/7407/10653911055_a0da12f73d.jpg
   :target: http://www.flickr.com/photos/terokoskinen/10653911055/
   :height: 307
   :width: 500

For measurement I used `INA219 sensor <http://www.adafruit.com/products/904>`_ from Adafruit. I have no idea was
the sensor calibrated correctly, so you should not trust the values to be absolute/correct. However, for relative measurements
between above devices, the sensor should be fine. As the power source, I used 9v battery run through 5V regulator,
but probably any other power source would do also.

The setup was same as `before <http://arduino.ada-language.com/measuring-current-with-ina219-sensor.html>`_.

.. image:: http://farm8.staticflickr.com/7344/9361731678_8b441a72f2.jpg
   :target: http://www.flickr.com/photos/terokoskinen/9361731678/
   :height: 299
   :width: 500

The program running on the sleeping Arduino can be found from `here (sleeper-atmega328p.hex) <https://bitbucket.org/tkoskine/arduino-blog/raw/efb5a3fbe62005f709021894d7a43c75f8b1685d/examples/sleeper/sleeper-atmega328p.hex>`_ in ihex format.

The measurement results were:

+------------------+--------------+
| Device           | Current      |
+==================+==============+
| Duemilanove      | 7.50mA       |
+------------------+--------------+
| UNOr3            | 18.10mA      |
+------------------+--------------+
| Olimexino-328    | 4.00mA       |
+------------------+--------------+
| Sparkfun PTH Kit | 7.60mA       |
+------------------+--------------+
| Diavolino        | 0.50mA       |
+------------------+--------------+

The biggest surprise was UNOr3 which was drawing 18.10mA current in the power saving mode.
I made the measurements three times to make sure the result was correct. Unfortunately,
I didn't have another UNOr3, so I could not check if the device was broken.

The low value of Diavolino_ is because that board has no other components than
atmega328p, crystal, and a few resistors. Other boards have regulators, USB-UART, etc
components.

Olimex advertises Olimexino-328_ as low power Arduino clone and based on my results,
it really is. Well, that wasn't unexpected since in general Olimex tends to make
high quality products, like the Olinuxino ARM boards.

Summary
-------

When you need to a lower power Arduino, Diavolino_ or Olimexino-328_ looks like the best bet.

If my measurements are correct, you can run Diavolino on 400mAh battery for one month or even more, if you run the board at 3.3V instead of 5V.

Also, I didn't even try all the available power saving tricks, so it should be possible to go even lower. (See the Sparkfun tutorial for details.)

The complete code is available from my `arduino-blog repository <https://bitbucket.org/tkoskine/arduino-blog/>`_, under examples/sleeper directory.



.. _working: http://arduino.ada-language.com/measuring-current-with-ina219-sensor.html
.. _Olimexino-328: https://www.olimex.com/Products/Duino/AVR/OLIMEXINO-328/
.. _Diavolino: http://shop.evilmadscientist.com/productsmenu/tinykitlist/180-diavolino