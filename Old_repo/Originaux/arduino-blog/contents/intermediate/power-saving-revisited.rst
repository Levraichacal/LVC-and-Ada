Saving power with AVR-Ada, part 2: power down mode and watchdog
===============================================================

:tags: ina219, power, olimex
:date: 2013-11-12 22:15

After my `previous article <http://arduino.ada-language.com/saving-power-with-avr-ada.html>`_,
Olimex people `pointed out <http://olimex.wordpress.com/2013/11/05/experimenting-with-low-power-modes-and-arduino/>`_
that their Olimexino-328 board is able to use much less than 4mA if powered through the battery connector.

So, I went and tested their claims and they were correct, indeed. When running Olimexino-328 at 3.3V using
battery connector, power down mode instead of power save mode, and watchdog to wake up the board once per
minute, I managed to get power usage down to 0.02mA (0.02 milliamps, 20 microamps).

I also made some observations:

* INA219 sensor is pretty accurate when compared to readings from my multimeter
* However, INA219 sensor can measure current only down to 0.1mA, after that I get 0 or negative readings (could be something related to my code)
* The AVR.Watchdog package of AVR-Ada doesn't really support Arduino/atmega328p, so I had to configure the watchdog manually
* At one point, Olimexino-328 was sleeping really deeply and I had to solder ISP header pins to the board because I wasn't able to program the board via serial port

It is somewhat complex to add good watchdog support for atmega328p and also "trigger an interrupt instead of reset" functionality,
so I won't be committing my watchdog code to AVR-Ada repos any time soon. Meanwhile, you can get the code from
from my `arduino-blog repository <https://bitbucket.org/tkoskine/arduino-blog/>`_,
examples/`deep-sleep <https://bitbucket.org/tkoskine/arduino-blog/src/tip/examples/deep-sleep/>`_ directory.

