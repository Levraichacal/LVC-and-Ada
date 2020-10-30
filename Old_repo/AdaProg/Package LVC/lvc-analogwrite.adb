with AVR.MCU;
with LVC.PINS;
with LVC.PINMODE;

use AVR.MCU;
use LVC.PINS;
use LVC.PINMODE;

-- Corps du package de la fonction analogwrite
-- Chercher les timers pour les sorties.

package body LVC.ANALOGWRITE is

procedure analogWrite(nomPort : lvcPins; niveauSortie : integer)--(uint8_t pin, int val) 
is

begin


	-- We need to make sure the PWM output is enabled for those pins that support it, as we turn it off when digitally reading or writing with them.  Also, make sure the pin is in output mode for consistenty with Wiring, which doesn't require a pinMode call for the analog output pins.
	pinMode(lvcPins, Output);
	if (niveauSortie == 0)
	then
		digitalWrite(lvcPins, false);

	elseif (niveauSortie == 255)
	then
		digitalWrite(lvcPins, true);
	}
	else
	{
-- Pour conserver de l'énergie, recommandation Atmel cf datasheet.
MCU.PRTIM0_Bit := 0;
case nomPort is
 when D3 =>
   -- Le port D3 de l'Arduino correspond aussi à la sortie OC2B
   sbi(TCCR2A, COM2A1);
   OCR2A := niveauSortie;
 when D5 =>
   -- Le port D5 de l'Arduino correspond aussi à la sortie OC0B
   sbi(TCCR0B, COM0B1);
   OCR0B := niveauSortie;
 when D6 =>
   -- Le port D6 de l'Arduino correspond aussi à la sortie OC0A
   sbi(TCCR0A, COM0A1);
   OCR0A := niveauSortie;
 when D9 =>
   -- Le port D9 de l'Arduino correspond aussi à la sortie OC1A
   sbi(TCCR1A, COM1A1);
   OCR1A := niveauSortie;
    when D10 =>
   -- Le port D10 de l'Arduino correspond aussi à la sortie OC1B
   sbi(TCCR1B, COM1B1);
   OCR1B := niveauSortie;
 when D11 =>
   -- Le port D11 de l'Arduino correspond aussi à la sortie OC2A
   sbi(TCCR2A, COM2A1);
   OCR2A := niveauSortie;
 when others =>
    if (niveauSortie <= 127)
	then
		digitalWrite(lvcPins, false);

	else
	then
		digitalWrite(lvcPins, true);
	}
end case;

		switch(digitalPinToTimer(pin))
		{
			// XXX fix needed for atmega8
			#if defined(TCCR0) && defined(COM00) && !defined(__AVR_ATmega8__)
			case TIMER0A:
				// connect pwm to pin on timer 0
				sbi(TCCR0, COM00);
				OCR0 = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR0A) && defined(COM0A1)
			case TIMER0A:
				// connect pwm to pin on timer 0, channel A
				sbi(TCCR0A, COM0A1);
				OCR0A = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR0A) && defined(COM0B1)
			case TIMER0B:
				// connect pwm to pin on timer 0, channel B
				sbi(TCCR0A, COM0B1);
				OCR0B = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR1A) && defined(COM1A1)
			case TIMER1A:
				// connect pwm to pin on timer 1, channel A
				sbi(TCCR1A, COM1A1);
				OCR1A = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR1A) && defined(COM1B1)
			case TIMER1B:
				// connect pwm to pin on timer 1, channel B
				sbi(TCCR1A, COM1B1);
				OCR1B = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR2) && defined(COM21)
			case TIMER2:
				// connect pwm to pin on timer 2
				sbi(TCCR2, COM21);
				OCR2 = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR2A) && defined(COM2A1)
			case TIMER2A:
				// connect pwm to pin on timer 2, channel A
				sbi(TCCR2A, COM2A1);
				OCR2A = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR2A) && defined(COM2B1)
			case TIMER2B:
				// connect pwm to pin on timer 2, channel B
				sbi(TCCR2A, COM2B1);
				OCR2B = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR3A) && defined(COM3A1)
			case TIMER3A:
				// connect pwm to pin on timer 3, channel A
				sbi(TCCR3A, COM3A1);
				OCR3A = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR3A) && defined(COM3B1)
			case TIMER3B:
				// connect pwm to pin on timer 3, channel B
				sbi(TCCR3A, COM3B1);
				OCR3B = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR3A) && defined(COM3C1)
			case TIMER3C:
				// connect pwm to pin on timer 3, channel C
				sbi(TCCR3A, COM3C1);
				OCR3C = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR4A) && defined(COM4A1)
			case TIMER4A:
				// connect pwm to pin on timer 4, channel A
				sbi(TCCR4A, COM4A1);
				OCR4A = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR4A) && defined(COM4B1)
			case TIMER4B:
				// connect pwm to pin on timer 4, channel B
				sbi(TCCR4A, COM4B1);
				OCR4B = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR4A) && defined(COM4C1)
			case TIMER4C:
				// connect pwm to pin on timer 4, channel C
				sbi(TCCR4A, COM4C1);
				OCR4C = val; // set pwm duty
				break;
			#endif
				
			#if defined(TCCR4A) && defined(COM4D1)
			case TIMER4D:
				// connect pwm to pin on timer 4, channel D
				sbi(TCCR4A, COM4D1);
				OCR4D = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR5A) && defined(COM5A1)
			case TIMER5A:
				// connect pwm to pin on timer 5, channel A
				sbi(TCCR5A, COM5A1);
				OCR5A = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR5A) && defined(COM5B1)
			case TIMER5B:
				// connect pwm to pin on timer 5, channel B
				sbi(TCCR5A, COM5B1);
				OCR5B = val; // set pwm duty
				break;
			#endif

			#if defined(TCCR5A) && defined(COM5C1)
			case TIMER5C:
				// connect pwm to pin on timer 5, channel C
				sbi(TCCR5A, COM5C1);
				OCR5C = val; // set pwm duty
				break;
			#endif

			case NOT_ON_TIMER:
			default:
				if (val < 128) {
					digitalWrite(pin, LOW);
				} else {
					digitalWrite(pin, HIGH);
				}
		}
	}
end if;

end analogWrite;

end LVC.ANALOGWRITE;
