#include <stdint.h>
#include <avr/wdt.h>

/* uint8_t mcusr_mirror __attribute__ ((section (".noinit"))); */

void disable_watchdog(void)         \
  __attribute__((naked))                        \
  __attribute__((section(".init3")));
void disable_watchdog(void)
{
  /* mcusr_mirror = MCUSR; */
  MCUSR = 0;
  wdt_disable();
}
