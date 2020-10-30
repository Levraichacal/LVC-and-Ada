Reading button status via interrupt
===================================

:date: 2014-05-12 22:30
:tags: button, debounce, interrupts, input

The normal way to read the button is to read the input pin status in
a loop and handle debouncing_ at the same time.

However, if you want to sleep most of the time, polling is not an option.
Instead, you can use interrupts, like pin change interrupt (PCINTxx).

So, first we need to connect the button to Arduino:

.. image:: https://farm6.staticflickr.com/5444/14090514335_5835fb3f37.jpg
   :target: https://flic.kr/p/nt8z1k
   :alt: Arduino with button

The circuit is relatively simple and taken from `Arduino tutorial <http://arduino.cc/en/tutorial/button>`_.

In addition, I used 100nF capacitor between the Arduino input pin and GND
to reduce the need for debouncing. If you don't have one, you can
simply handle the debouncing fully in software.

The code for pin change interrupt is following:

::

   procedure Button_Interrupt;
   pragma Machine_Attribute (Entity         => Button_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt, MCU.Sig_PCINT1_String);

   procedure Button_Interrupt is
   begin
      if Counter = 0 and MCU.PINC_Bits (3) then
         MCU.PCMSK1_Bits (MCU.PCINT11_Bit) := False;
         Timer0.Init_CTC (Timer0.Scale_By_64, 150);
      end if;
   end Button_Interrupt;

In the pin change interrupt handler, I check if the timer is stopped
and is the button actually pushed down. Then I proceed to disable
the pin change interrupt, and enable the timer.

The timer interrupt is following:

::

   procedure Timer_Interrupt;
   pragma Machine_Attribute (Entity         => Timer_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Timer_Interrupt, Timer0.Signal_Compare);

   procedure Timer_Interrupt is
   begin
      Counter := Counter + 1;
      if Counter > 20 and MCU.PINC_Bits (3) then
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Timer0.Stop;
         Counter := 0;
         MCU.PCMSK1_Bits (MCU.PCINT11_Bit) := True;
      end if;
   end Timer_Interrupt;

The timer checks whether the button is down after some time
has passed. If yes, then we flip the status of the led (Arduino pin 13),
stop the timer and enable the pin change interrupt again.

There are some gotchas you need to be aware of:

* The pin change interrupt will trigger multiple times, because
  when pressed, the push button signal can go up and down multiple
  times before it stabilizes. Your code need to be prepared for this.
* There are many different ways how to handle the debouncing_. I use simple
  logic and just read the button status again after some period.
  If the user presses the button very quickly, the button might be
  pressed more than once during the waiting period and my code misses some
  of the presses. Another approach can be found from `AVR-Ada repository <http://sourceforge.net/p/avr-ada/code/ci/master/tree/apps/debounce/>`_.

Full code is available in the `examples/button-interrupt <https://bitbucket.org/tkoskine/arduino-blog/src/b627f38b479d212225c958081ef52f1026dfcda6/examples/button-interrupt/?at=default>`_ directory.

.. _debouncing: http://arduino.cc/en/Tutorial/Debounce
