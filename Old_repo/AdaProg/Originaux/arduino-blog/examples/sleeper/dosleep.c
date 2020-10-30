#include <avr/sleep.h>
#include <avr/interrupt.h>

void dosleep(void) {
#if 1
	set_sleep_mode(SLEEP_MODE_PWR_SAVE);
#else
	set_sleep_mode(SLEEP_MODE_PWR_DOWN);
#endif
	cli();
	sleep_enable();
	sleep_bod_disable();
	sei();
	sleep_cpu();
	sleep_disable();
	sei();
}
