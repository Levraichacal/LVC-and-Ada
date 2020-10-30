#include <avr/wdt.h>

void
a() {
  wdt_enable(WDTO_15MS);
}
 /* Ada: */
 /* 48c:   88 e1           ldi     r24, 0x18       ; 24 */
 /* 48e:   80 93 60 00     sts     0x0060, r24 */
 /* 492:   08 e0           ldi     r16, 0x08       ; 8 */
 /* 494:   00 93 60 00     sts     0x0060, r16 */

  /* C: */
  /*  0:   28 e0           ldi     r18, 0x08       ; 8 */
  /*  2:   88 e1           ldi     r24, 0x18       ; 24 */
  /*  4:   90 e0           ldi     r25, 0x00       ; 0 */
  /*  a:   a8 95           wdr */
  /*  c:   80 93 60 00     sts     0x0060, r24 */
  /* 12:   20 93 60 00     sts     0x0060, r18 */

void
b() {
  wdt_disable();
}

/* C: */
/*   18:   88 e1           ldi     r24, 0x18       ; 24 */
/*   1c:   f8 94           cli */
/*   1e:   80 93 60 00     sts     0x0060, r24 */
/*   22:   10 92 60 00     sts     0x0060, r1 */
