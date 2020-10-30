	.file	"lcd.adb"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
 ;  GNU Ada (GCC) version 4.7.0 (avr)
 ; 	compiled by GNU C version 4.7.0, GMP version 5.0.2, MPFR version 3.1.0-p3, MPC version 0.9
 ;  GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ;  options passed:  -I - -Os -fRTS=rts/avr5 -fverbose-asm
 ;  -frename-registers -fdata-sections -ffunction-sections -gnatez -gnatea
 ;  -gnatec=/home/helipse/Dropbox/AdaProg/AdaProg/25_0 - Ecran1602  origins/objects/GNAT-TEMP-000001.TMP
 ;  -gnatec=/opt/avrada/avr/lib/gnat/gnat.adc -gdwarf-2 -gnatwp -gnatwu
 ;  -gnatn -gnatp -gnatVn -gnatef -gnatdY -mmcu=atmega328p
 ;  -gnateDMCU=atmega328p -gnateDUART=usart0 -gnaty3abefhiklM130prn -gnatA
 ;  -gnatem=/home/helipse/Dropbox/AdaProg/AdaProg/25_0 - Ecran1602  origins/objects/GNAT-TEMP-000002.TMP
 ;  -gnatez
 ;  /home/helipse/Dropbox/AdaProg/AdaProg/25_0 - Ecran1602  origins/lcd.adb
 ;  options enabled:  -fauto-inc-dec -fbranch-count-reg -fcaller-saves
 ;  -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
 ;  -fcrossjumping -fcse-follow-jumps -fdata-sections -fdebug-types-section
 ;  -fdefer-pop -fdevirtualize -fearly-inlining
 ;  -feliminate-unused-debug-types -fexpensive-optimizations
 ;  -fforward-propagate -ffunction-cse -ffunction-sections -fgcse -fgcse-lm
 ;  -fgnu-runtime -fguess-branch-probability -fident -fif-conversion
 ;  -fif-conversion2 -findirect-inlining -finline -finline-atomics
 ;  -finline-functions -finline-functions-called-once
 ;  -finline-small-functions -fipa-cp -fipa-profile -fipa-pure-const
 ;  -fipa-reference -fipa-sra -fira-share-save-slots
 ;  -fira-share-spill-slots -fivopts -fkeep-static-consts
 ;  -fleading-underscore -fmath-errno -fmerge-constants
 ;  -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
 ;  -foptimize-register-move -foptimize-sibling-calls -fpartial-inlining
 ;  -fpeephole -fpeephole2 -fprefetch-loop-arrays -freg-struct-return
 ;  -fregmove -frename-registers -freorder-blocks -freorder-functions
 ;  -frerun-cse-after-loop -fsched-critical-path-heuristic
 ;  -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
 ;  -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
 ;  -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fshow-column
 ;  -fshrink-wrap -fsigned-zeros -fsplit-ivs-in-unroller -fsplit-wide-types
 ;  -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
 ;  -fthread-jumps -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
 ;  -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-copy-prop
 ;  -ftree-copyrename -ftree-dce -ftree-dominator-opts -ftree-dse
 ;  -ftree-forwprop -ftree-fre -ftree-loop-if-convert -ftree-loop-im
 ;  -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
 ;  -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc -ftree-scev-cprop
 ;  -ftree-sink -ftree-slp-vectorize -ftree-sra -ftree-switch-conversion
 ;  -ftree-tail-merge -ftree-ter -ftree-vect-loop-version -ftree-vrp
 ;  -funit-at-a-time -fvar-tracking -fvar-tracking-assignments
 ;  -fverbose-asm

	.text
.Ltext0:
	.section	.text.lcd__wait_10ms,"ax",@progbits
.global	lcd__wait_10ms
	.type	lcd__wait_10ms, @function
lcd__wait_10ms:
.LFB2:
	.file 1 "/opt/avrada/avr/lib/gnat/avr_lib/avr-wait.adb"
	.loc 1 56 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r24,lo8(-25214)	 ; ,
	ldi r25,hi8(-25214)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	nop
	ret
.LFE2:
	.size	lcd__wait_10ms, .-lcd__wait_10ms
	.section	.text.lcd__wait_5ms,"ax",@progbits
.global	lcd__wait_5ms
	.type	lcd__wait_5ms, @function
lcd__wait_5ms:
.LFB3:
	.loc 1 56 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r24,lo8(20161)	 ; ,
	ldi r25,hi8(20161)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	ret
.LFE3:
	.size	lcd__wait_5ms, .-lcd__wait_5ms
	.section	.text.lcd__wait_1ms,"ax",@progbits
.global	lcd__wait_1ms
	.type	lcd__wait_1ms, @function
lcd__wait_1ms:
.LFB4:
	.loc 1 56 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r24,lo8(4032)	 ; ,
	ldi r25,hi8(4032)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	ret
.LFE4:
	.size	lcd__wait_1ms, .-lcd__wait_1ms
	.section	.text.lcd__wait_64us,"ax",@progbits
.global	lcd__wait_64us
	.type	lcd__wait_64us, @function
lcd__wait_64us:
.LFB5:
	.loc 1 56 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r24,lo8(257)	 ; ,
	ldi r25,hi8(257)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	rjmp .
	nop
	ret
.LFE5:
	.size	lcd__wait_64us, .-lcd__wait_64us
	.section	.text.lcd__toggle_enable,"ax",@progbits
.global	lcd__toggle_enable
	.type	lcd__toggle_enable, @function
lcd__toggle_enable:
.LFB6:
	.file 2 "/home/helipse/Dropbox/AdaProg/AdaProg/25_0 - Ecran1602  origins/lcd.adb"
	.loc 2 34 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 38 0
	sbi 0x5,0	 ; ,
.LBB16:
	.loc 1 47 0
	ldi r24,lo8(1)	 ;  dummy,
	ldi r25,0	 ;  dummy
/* #APP */
 ;  47 "/opt/avrada/avr/lib/gnat/avr_lib/avr-wait.adb" 1
	1: sbiw r24,1	 ;  dummy
brne 1b
 ;  0 "" 2
/* #NOAPP */
.LBE16:
	.loc 2 40 0
	cbi 0x5,0	 ; ,
	ret
.LFE6:
	.size	lcd__toggle_enable, .-lcd__toggle_enable
	.section	.text.lcd__output,"ax",@progbits
.global	lcd__output
	.type	lcd__output, @function
lcd__output:
.LFB7:
	.loc 2 44 0
.LVL0:
	push r17	 ; 
.LCFI0:
	push r28	 ; 
.LCFI1:
	push r29	 ; 
.LCFI2:
	 ; SP -= 1	 ; 
	push __zero_reg__
.LCFI3:
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
.LCFI4:
/* prologue: function */
/* frame size = 1 */
/* stack size = 4 */
.L__stack_usage = 4
	mov r17,r22	 ;  is_data, is_data
	.loc 2 48 0
	cbi 0x5,5	 ; ,
	.loc 2 49 0
	sbrc r22,0	 ;  is_data
	sbi 0xb,7	 ; ,
	sbrs r22,0	 ;  is_data
	cbi 0xb,7	 ; ,
	.loc 2 54 0
	in r25,0xb	 ;  D.1739, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r25,lo8(-33)	 ;  D.1739,
	sbrs r24,4	 ;  cmd,
	rjmp .L17	 ; 
	ldi r18,lo8(32)	 ;  iftmp.15,
	rjmp .L7	 ; 
.L17:
	ldi r18,0	 ;  iftmp.15
.L7:
	.loc 2 54 0 is_stmt 0 discriminator 3
	or r25,r18	 ;  D.1745, iftmp.15
	out 0xb,r25	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.1745
	.loc 2 55 0 is_stmt 1 discriminator 3
	in r19,0xb	 ;  D.1747, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r19,lo8(-17)	 ;  D.1747,
	sbrs r24,5	 ;  cmd,
	rjmp .L18	 ; 
	.loc 2 55 0 is_stmt 0
	ldi r20,lo8(16)	 ;  iftmp.16,
	rjmp .L8	 ; 
.L18:
	ldi r20,0	 ;  iftmp.16
.L8:
	.loc 2 55 0 discriminator 3
	or r19,r20	 ;  D.1753, iftmp.16
	out 0xb,r19	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.1753
	.loc 2 56 0 is_stmt 1 discriminator 3
	in r21,0xb	 ;  D.1755, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r21,lo8(-9)	 ;  D.1755,
	sbrs r24,6	 ;  cmd,
	rjmp .L19	 ; 
	.loc 2 56 0 is_stmt 0
	ldi r22,lo8(8)	 ;  iftmp.17,
.LVL1:
	rjmp .L9	 ; 
.L19:
	ldi r22,0	 ;  iftmp.17
.L9:
	.loc 2 56 0 discriminator 3
	or r21,r22	 ;  D.1761, iftmp.17
	out 0xb,r21	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.1761
	.loc 2 57 0 is_stmt 1 discriminator 3
	in r23,0xb	 ;  D.1763, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r23,lo8(-5)	 ;  D.1763,
	mov r26,r24	 ;  D.1769, cmd
	rol r26	 ;  D.1769
	clr r26	 ;  D.1769
	rol r26	 ;  D.1769
	lsl r26	 ;  D.1769
	lsl r26	 ;  D.1769
	or r26,r23	 ;  D.1769, D.1763
	out 0xb,r26	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.1769
	.loc 2 59 0 discriminator 3
	std Y+1,r24	 ; ,
	call lcd__toggle_enable	 ; 
.LVL2:
	.loc 2 62 0 discriminator 3
	in r27,0xb	 ;  D.1771, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r27,lo8(-33)	 ;  D.1771,
	ldd r24,Y+1	 ; ,
	sbrs r24,0	 ;  cmd,
	rjmp .L21	 ; 
	.loc 2 62 0 is_stmt 0
	ldi r30,lo8(32)	 ;  iftmp.20,
	rjmp .L11	 ; 
.L21:
	ldi r30,0	 ;  iftmp.20
.L11:
	.loc 2 62 0 discriminator 3
	or r27,r30	 ;  D.1777, iftmp.20
	out 0xb,r27	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.1777
	.loc 2 63 0 is_stmt 1 discriminator 3
	in r31,0xb	 ;  D.1779, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r31,lo8(-17)	 ;  D.1779,
	sbrs r24,1	 ;  cmd,
	rjmp .L22	 ; 
	.loc 2 63 0 is_stmt 0
	ldi r25,lo8(16)	 ;  iftmp.21,
	rjmp .L12	 ; 
.L22:
	ldi r25,0	 ;  iftmp.21
.L12:
	.loc 2 63 0 discriminator 3
	or r31,r25	 ;  D.1785, iftmp.21
	out 0xb,r31	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.1785
	.loc 2 64 0 is_stmt 1 discriminator 3
	in r19,0xb	 ;  D.1787, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r19,lo8(-9)	 ;  D.1787,
	sbrs r24,2	 ;  cmd,
	rjmp .L23	 ; 
	.loc 2 64 0 is_stmt 0
	ldi r18,lo8(8)	 ;  iftmp.22,
	rjmp .L13	 ; 
.L23:
	ldi r18,0	 ;  iftmp.22
.L13:
	.loc 2 64 0 discriminator 3
	or r19,r18	 ;  D.1793, iftmp.22
	out 0xb,r19	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.1793
	.loc 2 65 0 is_stmt 1 discriminator 3
	in r20,0xb	 ;  D.1795, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r20,lo8(-5)	 ;  D.1795,
	sbrs r24,3	 ;  cmd,
	rjmp .L24	 ; 
	.loc 2 65 0 is_stmt 0
	ldi r21,lo8(4)	 ;  iftmp.23,
	rjmp .L14	 ; 
.L24:
	ldi r21,0	 ;  iftmp.23
.L14:
	.loc 2 65 0 discriminator 3
	or r20,r21	 ;  D.1801, iftmp.23
	out 0xb,r20	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.1801
	.loc 2 67 0 is_stmt 1 discriminator 3
	call lcd__toggle_enable	 ; 
.LVL3:
	.loc 2 72 0 discriminator 3
	tst r17	 ;  is_data
	breq .L15	 ; ,
.LBB17:
.LBB18:
	.loc 1 64 0
	ldi r24,lo8(4032)	 ; ,
	ldi r25,hi8(4032)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	rjmp .L6	 ; 
.L15:
.LBE18:
.LBE17:
.LBB19:
.LBB20:
	ldi r30,lo8(-25214)	 ; ,
	ldi r31,hi8(-25214)	 ; ,
	1: sbiw r30,1	 ; 
	brne 1b
	nop
.L6:
/* epilogue start */
.LBE20:
.LBE19:
	.loc 2 77 0
	 ; SP += 1	 ; 
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
.LVL4:
	ret
.LFE7:
	.size	lcd__output, .-lcd__output
	.section	.text.lcd__put,"ax",@progbits
.global	lcd__put
	.type	lcd__put, @function
lcd__put:
.LFB9:
	.loc 2 131 0
.LVL5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 133 0
	ldi r22,lo8(1)	 ; ,
	jmp lcd__output	 ; 
.LVL6:
.LFE9:
	.size	lcd__put, .-lcd__put
	.section	.text.lcd__put__2,"ax",@progbits
.global	lcd__put__2
	.type	lcd__put__2, @function
lcd__put__2:
.LFB10:
	.loc 2 138 0
.LVL7:
	push r10	 ; 
.LCFI5:
	push r11	 ; 
.LCFI6:
	push r12	 ; 
.LCFI7:
	push r13	 ; 
.LCFI8:
	push r14	 ; 
.LCFI9:
	push r15	 ; 
.LCFI10:
	push r16	 ; 
.LCFI11:
	push r17	 ; 
.LCFI12:
	push r28	 ; 
.LCFI13:
	push r29	 ; 
.LCFI14:
/* prologue: function */
/* frame size = 0 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r28,r24	 ;  s$P_BOUNDS, s
.LVL8:
	.loc 2 140 0
	ld r12,Y	 ;  D.1675, s$P_BOUNDS_48->LB0
	ldd r18,Y+1	 ;  s$P_BOUNDS_48->UB0, s$P_BOUNDS_48->UB0
	cp r18,r12	 ;  s$P_BOUNDS_48->UB0, D.1675
	brlo .L26	 ; ,
.LBB21:
	.loc 2 140 0 is_stmt 0 discriminator 1
	mov r13,__zero_reg__	 ;  D.1677
	ldi r16,0	 ;  ivtmp.78
	ldi r17,0	 ;  ivtmp.78
	.loc 2 141 0 is_stmt 1 discriminator 1
	movw r10,r22	 ;  s, s
.LVL9:
.L28:
	.loc 2 138 0 discriminator 2
	movw r14,r16	 ;  D.1906, ivtmp.78
	add r14,r12	 ;  D.1906, D.1677
	adc r15,r13	 ;  D.1906, D.1677
.LVL10:
	.loc 2 141 0 discriminator 2
	movw r30,r14	 ;  tmp63, D.1906
	clr r31	 ; 
	sub r30,r12	 ;  tmp63, D.1677
	sbc r31,r13	 ;  tmp63, D.1677
	add r30,r10	 ;  tmp63, s
	adc r31,r11	 ;  tmp63, s
	ld r24,Z	 ; , *D.1697_66
.LVL11:
	call lcd__put	 ; 
.LVL12:
	subi r16,-1	 ;  ivtmp.78,
	sbci r17,-1	 ;  ivtmp.78,
	.loc 2 140 0 discriminator 2
	ldd r24,Y+1	 ;  s$P_BOUNDS_48->UB0, s$P_BOUNDS_48->UB0
	ldi r25,0	 ;  s$P_BOUNDS_48->UB0
	cp r14,r24	 ;  D.1906, s$P_BOUNDS_48->UB0
	cpc r15,r25	 ;  D.1906, s$P_BOUNDS_48->UB0
	brne .L28	 ; ,
.LVL13:
.L26:
/* epilogue start */
.LBE21:
	.loc 2 143 0
	pop r29	 ; 
	pop r28	 ; 
.LVL14:
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	ret
.LFE10:
	.size	lcd__put__2, .-lcd__put__2
	.section	.text.lcd__command,"ax",@progbits
.global	lcd__command
	.type	lcd__command, @function
lcd__command:
.LFB11:
	.loc 2 147 0
.LVL15:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 149 0
	ldi r22,0	 ; 
	jmp lcd__output	 ; 
.LVL16:
.LFE11:
	.size	lcd__command, .-lcd__command
	.section	.text.lcd__clear_screen,"ax",@progbits
.global	lcd__clear_screen
	.type	lcd__clear_screen, @function
lcd__clear_screen:
.LFB12:
	.loc 2 153 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 155 0
	ldi r24,lo8(1)	 ; ,
	jmp lcd__command	 ; 
.LVL17:
.LFE12:
	.size	lcd__clear_screen, .-lcd__clear_screen
	.section	.text.lcd__init,"ax",@progbits
.global	lcd__init
	.type	lcd__init, @function
lcd__init:
.LFB8:
	.loc 2 81 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 85 0
	sbi 0x4,0	 ; ,
	.loc 2 86 0
	sbi 0x4,5	 ; ,
	.loc 2 87 0
	sbi 0xa,7	 ; ,
	.loc 2 89 0
	sbi 0xa,5	 ; ,
	.loc 2 90 0
	sbi 0xa,4	 ; ,
	.loc 2 91 0
	sbi 0xa,3	 ; ,
	.loc 2 92 0
	sbi 0xa,2	 ; ,
.LBB22:
.LBB23:
	.loc 1 64 0
	ldi r24,lo8(-25214)	 ; ,
	ldi r25,hi8(-25214)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	nop
.LBE23:
.LBE22:
.LBB24:
.LBB25:
	ldi r24,lo8(-25214)	 ; ,
	ldi r25,hi8(-25214)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	nop
.LBE25:
.LBE24:
	.loc 2 99 0
	sbi 0xb,5	 ; ,
	.loc 2 100 0
	sbi 0xb,4	 ; ,
	.loc 2 101 0
	call lcd__toggle_enable	 ; 
.LVL18:
.LBB26:
.LBB27:
	.loc 1 64 0
	ldi r24,lo8(20161)	 ; ,
	ldi r25,hi8(20161)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
.LBE27:
.LBE26:
	.loc 2 105 0
	call lcd__toggle_enable	 ; 
.LVL19:
.LBB28:
.LBB29:
	.loc 1 64 0
	ldi r24,lo8(257)	 ; ,
	ldi r25,hi8(257)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	rjmp .
	nop
.LBE29:
.LBE28:
	.loc 2 108 0
	call lcd__toggle_enable	 ; 
.LVL20:
.LBB30:
.LBB31:
	.loc 1 64 0
	ldi r24,lo8(257)	 ; ,
	ldi r25,hi8(257)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	rjmp .
	nop
.LBE31:
.LBE30:
	.loc 2 112 0
	cbi 0xb,5	 ; ,
	.loc 2 118 0
	ldi r24,lo8(40)	 ; ,
	call lcd__command	 ; 
.LVL21:
	.loc 2 124 0
	ldi r24,lo8(12)	 ; ,
	call lcd__command	 ; 
.LVL22:
	.loc 2 125 0
	call lcd__clear_screen	 ; 
.LVL23:
	.loc 2 126 0
	ldi r24,lo8(6)	 ; ,
	jmp lcd__command	 ; 
.LVL24:
.LFE8:
	.size	lcd__init, .-lcd__init
	.section	.text.lcd__home,"ax",@progbits
.global	lcd__home
	.type	lcd__home, @function
lcd__home:
.LFB13:
	.loc 2 160 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 162 0
	ldi r24,lo8(2)	 ; ,
	jmp lcd__command	 ; 
.LVL25:
.LFE13:
	.size	lcd__home, .-lcd__home
	.section	.text.lcd__gotoxy,"ax",@progbits
.global	lcd__gotoxy
	.type	lcd__gotoxy, @function
lcd__gotoxy:
.LFB14:
	.loc 2 170 0
.LVL26:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 173 0
	cpi r22,lo8(1)	 ;  y,
	brne .L36	 ; ,
	.loc 2 174 0
	subi r24,lo8(-(127))	 ; ,
.LVL27:
	rjmp .L37	 ; 
.LVL28:
.L36:
	.loc 2 175 0
	subi r24,lo8(-(-65))	 ; ,
.LVL29:
.L37:
	jmp lcd__command	 ; 
.LVL30:
.LFE14:
	.size	lcd__gotoxy, .-lcd__gotoxy
	.section	.text.lcd___elabb,"ax",@progbits
.global	lcd___elabb
	.type	lcd___elabb, @function
lcd___elabb:
.LFB0:
	.loc 2 10 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
.LFE0:
	.size	lcd___elabb, .-lcd___elabb
.global	lcd__wait_64usGP651__micro_secondsX
	.section	.rodata.lcd__wait_64usGP651__micro_secondsX,"a",@progbits
	.type	lcd__wait_64usGP651__micro_secondsX, @object
	.size	lcd__wait_64usGP651__micro_secondsX, 8
lcd__wait_64usGP651__micro_secondsX:
	.byte	64
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	lcd__wait_64usGP651__crystal_hertzX
	.section	.rodata.lcd__wait_64usGP651__crystal_hertzX,"a",@progbits
	.type	lcd__wait_64usGP651__crystal_hertzX, @object
	.size	lcd__wait_64usGP651__crystal_hertzX, 8
lcd__wait_64usGP651__crystal_hertzX:
	.byte	0
	.byte	36
	.byte	-12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	lcd__wait_1msGP522__micro_secondsX
	.section	.rodata.lcd__wait_1msGP522__micro_secondsX,"a",@progbits
	.type	lcd__wait_1msGP522__micro_secondsX, @object
	.size	lcd__wait_1msGP522__micro_secondsX, 8
lcd__wait_1msGP522__micro_secondsX:
	.byte	-24
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	lcd__wait_1msGP522__crystal_hertzX
	.section	.rodata.lcd__wait_1msGP522__crystal_hertzX,"a",@progbits
	.type	lcd__wait_1msGP522__crystal_hertzX, @object
	.size	lcd__wait_1msGP522__crystal_hertzX, 8
lcd__wait_1msGP522__crystal_hertzX:
	.byte	0
	.byte	36
	.byte	-12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	lcd__wait_5msGP393__micro_secondsX
	.section	.rodata.lcd__wait_5msGP393__micro_secondsX,"a",@progbits
	.type	lcd__wait_5msGP393__micro_secondsX, @object
	.size	lcd__wait_5msGP393__micro_secondsX, 8
lcd__wait_5msGP393__micro_secondsX:
	.byte	-120
	.byte	19
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	lcd__wait_5msGP393__crystal_hertzX
	.section	.rodata.lcd__wait_5msGP393__crystal_hertzX,"a",@progbits
	.type	lcd__wait_5msGP393__crystal_hertzX, @object
	.size	lcd__wait_5msGP393__crystal_hertzX, 8
lcd__wait_5msGP393__crystal_hertzX:
	.byte	0
	.byte	36
	.byte	-12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	lcd__wait_10msGP262__micro_secondsX
	.section	.rodata.lcd__wait_10msGP262__micro_secondsX,"a",@progbits
	.type	lcd__wait_10msGP262__micro_secondsX, @object
	.size	lcd__wait_10msGP262__micro_secondsX, 8
lcd__wait_10msGP262__micro_secondsX:
	.byte	16
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	lcd__wait_10msGP262__crystal_hertzX
	.section	.rodata.lcd__wait_10msGP262__crystal_hertzX,"a",@progbits
	.type	lcd__wait_10msGP262__crystal_hertzX, @object
	.size	lcd__wait_10msGP262__crystal_hertzX, 8
lcd__wait_10msGP262__crystal_hertzX:
	.byte	0
	.byte	36
	.byte	-12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	lcd__commands__move_display_right
	.section	.rodata.lcd__commands__move_display_right,"a",@progbits
	.type	lcd__commands__move_display_right, @object
	.size	lcd__commands__move_display_right, 1
lcd__commands__move_display_right:
	.byte	28
.global	lcd__commands__move_display_left
	.section	.rodata.lcd__commands__move_display_left,"a",@progbits
	.type	lcd__commands__move_display_left, @object
	.size	lcd__commands__move_display_left, 1
lcd__commands__move_display_left:
	.byte	24
.global	lcd__commands__move_cursor_right
	.section	.rodata.lcd__commands__move_cursor_right,"a",@progbits
	.type	lcd__commands__move_cursor_right, @object
	.size	lcd__commands__move_cursor_right, 1
lcd__commands__move_cursor_right:
	.byte	20
.global	lcd__commands__move_cursor_left
	.section	.rodata.lcd__commands__move_cursor_left,"a",@progbits
	.type	lcd__commands__move_cursor_left, @object
	.size	lcd__commands__move_cursor_left, 1
lcd__commands__move_cursor_left:
	.byte	16
.global	lcd__commands__entry_shift_dec
	.section	.rodata.lcd__commands__entry_shift_dec,"a",@progbits
	.type	lcd__commands__entry_shift_dec, @object
	.size	lcd__commands__entry_shift_dec, 1
lcd__commands__entry_shift_dec:
	.byte	5
.global	lcd__commands__entry_shift_inc
	.section	.rodata.lcd__commands__entry_shift_inc,"a",@progbits
	.type	lcd__commands__entry_shift_inc, @object
	.size	lcd__commands__entry_shift_inc, 1
lcd__commands__entry_shift_inc:
	.byte	7
.global	lcd__commands__entry_dec
	.section	.rodata.lcd__commands__entry_dec,"a",@progbits
	.type	lcd__commands__entry_dec, @object
	.size	lcd__commands__entry_dec, 1
lcd__commands__entry_dec:
	.byte	4
.global	lcd__commands__entry_inc
	.section	.rodata.lcd__commands__entry_inc,"a",@progbits
	.type	lcd__commands__entry_inc, @object
	.size	lcd__commands__entry_inc, 1
lcd__commands__entry_inc:
	.byte	6
.global	lcd__commands__display_on_cursor_blink
	.section	.rodata.lcd__commands__display_on_cursor_blink,"a",@progbits
	.type	lcd__commands__display_on_cursor_blink, @object
	.size	lcd__commands__display_on_cursor_blink, 1
lcd__commands__display_on_cursor_blink:
	.byte	15
.global	lcd__commands__display_on_cursor
	.section	.rodata.lcd__commands__display_on_cursor,"a",@progbits
	.type	lcd__commands__display_on_cursor, @object
	.size	lcd__commands__display_on_cursor, 1
lcd__commands__display_on_cursor:
	.byte	14
.global	lcd__commands__display_on_blink
	.section	.rodata.lcd__commands__display_on_blink,"a",@progbits
	.type	lcd__commands__display_on_blink, @object
	.size	lcd__commands__display_on_blink, 1
lcd__commands__display_on_blink:
	.byte	13
.global	lcd__commands__display_on
	.section	.rodata.lcd__commands__display_on,"a",@progbits
	.type	lcd__commands__display_on, @object
	.size	lcd__commands__display_on, 1
lcd__commands__display_on:
	.byte	12
.global	lcd__commands__display_off
	.section	.rodata.lcd__commands__display_off,"a",@progbits
	.type	lcd__commands__display_off, @object
	.size	lcd__commands__display_off, 1
lcd__commands__display_off:
	.byte	8
.global	lcd__commands__mode_8bit_2line
	.section	.rodata.lcd__commands__mode_8bit_2line,"a",@progbits
	.type	lcd__commands__mode_8bit_2line, @object
	.size	lcd__commands__mode_8bit_2line, 1
lcd__commands__mode_8bit_2line:
	.byte	56
.global	lcd__commands__mode_8bit_1line
	.section	.rodata.lcd__commands__mode_8bit_1line,"a",@progbits
	.type	lcd__commands__mode_8bit_1line, @object
	.size	lcd__commands__mode_8bit_1line, 1
lcd__commands__mode_8bit_1line:
	.byte	48
.global	lcd__commands__mode_4bit_2line
	.section	.rodata.lcd__commands__mode_4bit_2line,"a",@progbits
	.type	lcd__commands__mode_4bit_2line, @object
	.size	lcd__commands__mode_4bit_2line, 1
lcd__commands__mode_4bit_2line:
	.byte	40
.global	lcd__commands__mode_4bit_1line
	.section	.rodata.lcd__commands__mode_4bit_1line,"a",@progbits
	.type	lcd__commands__mode_4bit_1line, @object
	.size	lcd__commands__mode_4bit_1line, 1
lcd__commands__mode_4bit_1line:
	.byte	32
.global	lcd__commands__home
	.section	.rodata.lcd__commands__home,"a",@progbits
	.type	lcd__commands__home, @object
	.size	lcd__commands__home, 1
lcd__commands__home:
	.byte	2
.global	lcd__commands__clear
	.section	.rodata.lcd__commands__clear,"a",@progbits
	.type	lcd__commands__clear, @object
	.size	lcd__commands__clear, 1
lcd__commands__clear:
	.byte	1
.global	lcd_E
	.section	.data.lcd_E,"aw",@progbits
	.type	lcd_E, @object
	.size	lcd_E, 2
lcd_E:
	.zero	2
	.section	.debug_frame,"",@progbits
.Lframe0:
	.long	.LECIE0-.LSCIE0
.LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -1
	.byte	0x24
	.byte	0xc
	.uleb128 0x20
	.uleb128 0x2
	.byte	0xa4
	.uleb128 0x1
	.p2align	2
.LECIE0:
.LSFDE0:
	.long	.LEFDE0-.LASFDE0
.LASFDE0:
	.long	.Lframe0
	.long	.LFB2
	.long	.LFE2-.LFB2
	.p2align	2
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB3
	.long	.LFE3-.LFB3
	.p2align	2
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB4
	.long	.LFE4-.LFB4
	.p2align	2
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB5
	.long	.LFE5-.LFB5
	.p2align	2
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB6
	.long	.LFE6-.LFB6
	.p2align	2
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB7
	.long	.LFE7-.LFB7
	.byte	0x4
	.long	.LCFI0-.LFB7
	.byte	0xe
	.uleb128 0x3
	.byte	0x91
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x4
	.byte	0x9c
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x5
	.byte	0x9d
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xd
	.uleb128 0x1c
	.p2align	2
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB9
	.long	.LFE9-.LFB9
	.p2align	2
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB10
	.long	.LFE10-.LFB10
	.byte	0x4
	.long	.LCFI5-.LFB10
	.byte	0xe
	.uleb128 0x3
	.byte	0x8a
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x4
	.byte	0x8b
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x5
	.byte	0x8c
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x6
	.byte	0x8d
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x7
	.byte	0x8e
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x8
	.byte	0x8f
	.uleb128 0x7
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x9
	.byte	0x90
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0xa
	.byte	0x91
	.uleb128 0x9
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0xb
	.byte	0x9c
	.uleb128 0xa
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0xc
	.byte	0x9d
	.uleb128 0xb
	.p2align	2
.LEFDE14:
.LSFDE16:
	.long	.LEFDE16-.LASFDE16
.LASFDE16:
	.long	.Lframe0
	.long	.LFB11
	.long	.LFE11-.LFB11
	.p2align	2
.LEFDE16:
.LSFDE18:
	.long	.LEFDE18-.LASFDE18
.LASFDE18:
	.long	.Lframe0
	.long	.LFB12
	.long	.LFE12-.LFB12
	.p2align	2
.LEFDE18:
.LSFDE20:
	.long	.LEFDE20-.LASFDE20
.LASFDE20:
	.long	.Lframe0
	.long	.LFB8
	.long	.LFE8-.LFB8
	.p2align	2
.LEFDE20:
.LSFDE22:
	.long	.LEFDE22-.LASFDE22
.LASFDE22:
	.long	.Lframe0
	.long	.LFB13
	.long	.LFE13-.LFB13
	.p2align	2
.LEFDE22:
.LSFDE24:
	.long	.LEFDE24-.LASFDE24
.LASFDE24:
	.long	.Lframe0
	.long	.LFB14
	.long	.LFE14-.LFB14
	.p2align	2
.LEFDE24:
.LSFDE26:
	.long	.LEFDE26-.LASFDE26
.LASFDE26:
	.long	.Lframe0
	.long	.LFB0
	.long	.LFE0-.LFB0
	.p2align	2
.LEFDE26:
	.text
.Letext0:
	.file 3 "/opt/avrada/avr/lib/gnat/avr_lib/avr-strings.ads"
	.file 4 "/opt/avrada/avr/lib/gnat/avr_lib/avr.ads"
	.file 5 "/home/helipse/Dropbox/AdaProg/AdaProg/25_0 - Ecran1602  origins/lcd.ads"
	.file 6 "/opt/avrada/avr/lib/gnat/avr_lib/avr-wait.ads"
	.file 7 "/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/avr-atmega328p.ads"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x8f4
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF69
	.byte	0xd
	.long	.LASF70
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF13
	.byte	0x2
	.byte	0x3
	.byte	0x21
	.byte	0x1
	.long	0x56
	.uleb128 0x4
	.string	"LB0"
	.byte	0x3
	.byte	0x21
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.string	"UB0"
	.byte	0x3
	.byte	0x21
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.long	.LASF71
	.byte	0x3
	.byte	0x21
	.long	0x61
	.uleb128 0x6
	.long	.LASF71
	.long	0x7b
	.long	0x74
	.uleb128 0x7
	.long	0x74
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x8
	.long	.LASF72
	.byte	0x4
	.byte	0x3
	.byte	0x21
	.long	0xab
	.uleb128 0x9
	.long	.LASF3
	.byte	0x3
	.byte	0x21
	.long	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF4
	.byte	0x3
	.byte	0x21
	.long	0xb1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0xa
	.byte	0x2
	.long	0x56
	.uleb128 0xa
	.byte	0x2
	.long	0x2c
	.uleb128 0xb
	.byte	0
	.byte	0xff
	.long	.LASF5
	.long	0xc2
	.uleb128 0xc
	.byte	0x1
	.byte	0x7
	.long	.LASF7
	.byte	0x1
	.uleb128 0xb
	.byte	0x1
	.byte	0x2
	.long	.LASF6
	.long	0xd5
	.uleb128 0xc
	.byte	0x1
	.byte	0x7
	.long	.LASF8
	.byte	0x1
	.uleb128 0xb
	.byte	0x1
	.byte	0x10
	.long	.LASF9
	.long	0xe8
	.uleb128 0xc
	.byte	0x1
	.byte	0x7
	.long	.LASF10
	.byte	0x1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF11
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF12
	.uleb128 0x3
	.long	.LASF14
	.byte	0x1
	.byte	0x4
	.byte	0x35
	.byte	0x1
	.long	0x129
	.uleb128 0xd
	.long	.LASF73
	.byte	0x4
	.byte	0x35
	.long	0x11c
	.byte	0x1
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xe
	.byte	0
	.byte	0xff
	.long	.LASF74
	.long	0xf7
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.byte	0x7
	.long	.LASF15
	.byte	0x1
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF16
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF17
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF18
	.uleb128 0xf
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0x3
	.long	0x16c
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x11
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.word	0x3f01
	.byte	0
	.uleb128 0x12
	.long	0x172
	.byte	0x1
	.uleb128 0xc
	.byte	0x8
	.byte	0x5
	.long	.LASF21
	.byte	0x1
	.uleb128 0x13
	.long	0xf0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.byte	0x3
	.long	0x1a7
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x14
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.long	0x2760a
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF24
	.byte	0x1
	.byte	0x3
	.long	0x1cf
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x14
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.long	0x13b05
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF25
	.byte	0x1
	.byte	0x3
	.long	0x1f5
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x11
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.word	0x408
	.byte	0
	.uleb128 0x15
	.long	0x17f
	.long	.LFB2
	.long	.LFE2
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x227
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x14
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.long	0x2760a
	.byte	0
	.uleb128 0x15
	.long	0x1a7
	.long	.LFB3
	.long	.LFE3
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x259
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x14
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.long	0x13b05
	.byte	0
	.uleb128 0x15
	.long	0x146
	.long	.LFB4
	.long	.LFE4
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x289
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x11
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.word	0x3f01
	.byte	0
	.uleb128 0x15
	.long	0x1cf
	.long	.LFB5
	.long	.LFE5
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x2b9
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x11
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.word	0x408
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF26
	.byte	0x2
	.byte	0x22
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x2dc
	.uleb128 0x17
	.long	.LBB16
	.long	.LBE16
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF27
	.byte	0x2
	.byte	0x2c
	.long	.LFB7
	.long	.LFE7
	.long	.LLST0
	.byte	0x1
	.long	0x396
	.uleb128 0x19
	.string	"cmd"
	.byte	0x2
	.byte	0x2c
	.long	0x396
	.long	.LLST1
	.uleb128 0x1a
	.long	.LASF28
	.byte	0x2
	.byte	0x2c
	.long	0x39b
	.long	.LLST2
	.uleb128 0x1b
	.long	0x146
	.long	.LBB17
	.long	.LBE17
	.byte	0x2
	.byte	0x49
	.long	0x34a
	.uleb128 0x1c
	.long	.LBB18
	.long	.LBE18
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x11
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.word	0x3f01
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	0x17f
	.long	.LBB19
	.long	.LBE19
	.byte	0x2
	.byte	0x4b
	.long	0x383
	.uleb128 0x1c
	.long	.LBB20
	.long	.LBE20
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x14
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.long	0x2760a
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	.LVL2
	.long	0x2b9
	.uleb128 0x1d
	.long	.LVL3
	.long	0x2b9
	.byte	0
	.uleb128 0x13
	.long	0x25
	.uleb128 0x13
	.long	0x131
	.uleb128 0x16
	.byte	0x1
	.long	.LASF29
	.byte	0x2
	.byte	0x83
	.long	.LFB9
	.long	.LFE9
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x3de
	.uleb128 0x19
	.string	"c"
	.byte	0x5
	.byte	0x28
	.long	0x3de
	.long	.LLST3
	.uleb128 0x1e
	.long	.LVL6
	.byte	0x1
	.long	0x2dc
	.uleb128 0x1f
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x1f
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x7b
	.uleb128 0x18
	.byte	0x1
	.long	.LASF30
	.byte	0x2
	.byte	0x8a
	.long	.LFB10
	.long	.LFE10
	.long	.LLST4
	.byte	0x1
	.long	0x440
	.uleb128 0x19
	.string	"s"
	.byte	0x5
	.byte	0x29
	.long	0x440
	.long	.LLST5
	.uleb128 0x20
	.long	.LASF31
	.byte	0x2
	.byte	0x8c
	.long	0x396
	.uleb128 0x20
	.long	.LASF32
	.byte	0x2
	.byte	0x8c
	.long	0x396
	.uleb128 0x1c
	.long	.LBB21
	.long	.LBE21
	.uleb128 0x21
	.string	"c"
	.byte	0x2
	.byte	0x8c
	.long	0x25
	.long	.LLST6
	.uleb128 0x1d
	.long	.LVL12
	.long	0x3a0
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x82
	.uleb128 0x16
	.byte	0x1
	.long	.LASF33
	.byte	0x2
	.byte	0x93
	.long	.LFB11
	.long	.LFE11
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x485
	.uleb128 0x19
	.string	"cmd"
	.byte	0x5
	.byte	0x2c
	.long	0x485
	.long	.LLST7
	.uleb128 0x1e
	.long	.LVL16
	.byte	0x1
	.long	0x2dc
	.uleb128 0x1f
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x1f
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0xb7
	.uleb128 0x16
	.byte	0x1
	.long	.LASF34
	.byte	0x2
	.byte	0x99
	.long	.LFB12
	.long	.LFE12
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x4b4
	.uleb128 0x1e
	.long	.LVL17
	.byte	0x1
	.long	0x445
	.uleb128 0x1f
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF35
	.byte	0x2
	.byte	0x51
	.long	.LFB8
	.long	.LFE8
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x642
	.uleb128 0x1b
	.long	0x17f
	.long	.LBB22
	.long	.LBE22
	.byte	0x2
	.byte	0x5f
	.long	0x506
	.uleb128 0x1c
	.long	.LBB23
	.long	.LBE23
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x14
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.long	0x2760a
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	0x17f
	.long	.LBB24
	.long	.LBE24
	.byte	0x2
	.byte	0x60
	.long	0x53f
	.uleb128 0x1c
	.long	.LBB25
	.long	.LBE25
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x14
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.long	0x2760a
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	0x1a7
	.long	.LBB26
	.long	.LBE26
	.byte	0x2
	.byte	0x67
	.long	0x578
	.uleb128 0x1c
	.long	.LBB27
	.long	.LBE27
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x14
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.long	0x13b05
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	0x1cf
	.long	.LBB28
	.long	.LBE28
	.byte	0x2
	.byte	0x6a
	.long	0x5af
	.uleb128 0x1c
	.long	.LBB29
	.long	.LBE29
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x11
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.word	0x408
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	0x1cf
	.long	.LBB30
	.long	.LBE30
	.byte	0x2
	.byte	0x6d
	.long	0x5e6
	.uleb128 0x1c
	.long	.LBB31
	.long	.LBE31
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x3a
	.long	0x16c
	.byte	0x3e
	.uleb128 0x11
	.long	.LASF20
	.byte	0x1
	.byte	0x3d
	.long	0x17a
	.word	0x408
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	.LVL18
	.long	0x2b9
	.uleb128 0x1d
	.long	.LVL19
	.long	0x2b9
	.uleb128 0x1d
	.long	.LVL20
	.long	0x2b9
	.uleb128 0x22
	.long	.LVL21
	.long	0x445
	.long	0x615
	.uleb128 0x1f
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x28
	.byte	0
	.uleb128 0x22
	.long	.LVL22
	.long	0x445
	.long	0x628
	.uleb128 0x1f
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3c
	.byte	0
	.uleb128 0x1d
	.long	.LVL23
	.long	0x48a
	.uleb128 0x1e
	.long	.LVL24
	.byte	0x1
	.long	0x445
	.uleb128 0x1f
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x36
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF36
	.byte	0x2
	.byte	0xa0
	.long	.LFB13
	.long	.LFE13
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x66c
	.uleb128 0x1e
	.long	.LVL25
	.byte	0x1
	.long	0x445
	.uleb128 0x1f
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF37
	.byte	0x2
	.byte	0xaa
	.long	.LFB14
	.long	.LFE14
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x6aa
	.uleb128 0x19
	.string	"x"
	.byte	0x5
	.byte	0x35
	.long	0x6aa
	.long	.LLST8
	.uleb128 0x19
	.string	"y"
	.byte	0x5
	.byte	0x35
	.long	0x6af
	.long	.LLST9
	.uleb128 0x23
	.long	.LVL30
	.byte	0x1
	.long	0x445
	.byte	0
	.uleb128 0x13
	.long	0xdd
	.uleb128 0x13
	.long	0xca
	.uleb128 0x24
	.byte	0x1
	.long	.LASF75
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x25
	.long	.LASF38
	.byte	0x5
	.byte	0x3d
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__clear
	.uleb128 0x25
	.long	.LASF39
	.byte	0x5
	.byte	0x3e
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__home
	.uleb128 0x25
	.long	.LASF40
	.byte	0x5
	.byte	0x41
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__mode_4bit_1line
	.uleb128 0x25
	.long	.LASF41
	.byte	0x5
	.byte	0x42
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__mode_4bit_2line
	.uleb128 0x25
	.long	.LASF42
	.byte	0x5
	.byte	0x43
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__mode_8bit_1line
	.uleb128 0x25
	.long	.LASF43
	.byte	0x5
	.byte	0x44
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__mode_8bit_2line
	.uleb128 0x25
	.long	.LASF44
	.byte	0x5
	.byte	0x47
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__display_off
	.uleb128 0x25
	.long	.LASF45
	.byte	0x5
	.byte	0x48
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__display_on
	.uleb128 0x25
	.long	.LASF46
	.byte	0x5
	.byte	0x49
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__display_on_blink
	.uleb128 0x25
	.long	.LASF47
	.byte	0x5
	.byte	0x4a
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__display_on_cursor
	.uleb128 0x25
	.long	.LASF48
	.byte	0x5
	.byte	0x4b
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__display_on_cursor_blink
	.uleb128 0x25
	.long	.LASF49
	.byte	0x5
	.byte	0x4e
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__entry_inc
	.uleb128 0x25
	.long	.LASF50
	.byte	0x5
	.byte	0x4f
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__entry_dec
	.uleb128 0x25
	.long	.LASF51
	.byte	0x5
	.byte	0x50
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__entry_shift_inc
	.uleb128 0x25
	.long	.LASF52
	.byte	0x5
	.byte	0x51
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__entry_shift_dec
	.uleb128 0x25
	.long	.LASF53
	.byte	0x5
	.byte	0x54
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__move_cursor_left
	.uleb128 0x25
	.long	.LASF54
	.byte	0x5
	.byte	0x55
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__move_cursor_right
	.uleb128 0x25
	.long	.LASF55
	.byte	0x5
	.byte	0x56
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__move_display_left
	.uleb128 0x25
	.long	.LASF56
	.byte	0x5
	.byte	0x57
	.long	0x485
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__move_display_right
	.uleb128 0x25
	.long	.LASF57
	.byte	0x6
	.byte	0x29
	.long	0x16c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_10msGP262__crystal_hertzX
	.uleb128 0x25
	.long	.LASF58
	.byte	0x6
	.byte	0x2a
	.long	0x16c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_10msGP262__micro_secondsX
	.uleb128 0x25
	.long	.LASF59
	.byte	0x6
	.byte	0x29
	.long	0x16c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_5msGP393__crystal_hertzX
	.uleb128 0x25
	.long	.LASF60
	.byte	0x6
	.byte	0x2a
	.long	0x16c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_5msGP393__micro_secondsX
	.uleb128 0x25
	.long	.LASF61
	.byte	0x6
	.byte	0x29
	.long	0x16c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_1msGP522__crystal_hertzX
	.uleb128 0x25
	.long	.LASF62
	.byte	0x6
	.byte	0x2a
	.long	0x16c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_1msGP522__micro_secondsX
	.uleb128 0x25
	.long	.LASF63
	.byte	0x6
	.byte	0x29
	.long	0x16c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_64usGP651__crystal_hertzX
	.uleb128 0x25
	.long	.LASF64
	.byte	0x6
	.byte	0x2a
	.long	0x16c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_64usGP651__micro_secondsX
	.uleb128 0x26
	.long	.LASF65
	.byte	0x7
	.word	0x991
	.long	0x8bc
	.byte	0x1
	.byte	0x25
	.uleb128 0x13
	.long	0x8c1
	.uleb128 0x27
	.byte	0x2
	.long	0x8c7
	.uleb128 0x28
	.long	0xfe
	.byte	0x1
	.uleb128 0x26
	.long	.LASF66
	.byte	0x7
	.word	0x8d4
	.long	0x8bc
	.byte	0x1
	.byte	0x2b
	.uleb128 0x26
	.long	.LASF67
	.byte	0x7
	.word	0x9b2
	.long	0x8bc
	.byte	0x1
	.byte	0x24
	.uleb128 0x26
	.long	.LASF68
	.byte	0x7
	.word	0x8f5
	.long	0x8bc
	.byte	0x1
	.byte	0x2a
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0xb
	.uleb128 0x2f
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0xb
	.uleb128 0x2f
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x27
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x27
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x27
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x27
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB7
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI3
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI4
	.long	.LFE7
	.word	0x2
	.byte	0x8c
	.sleb128 6
	.long	0
	.long	0
.LLST1:
	.long	.LVL0
	.long	.LVL2-1
	.word	0x1
	.byte	0x68
	.long	.LVL2-1
	.long	.LFE7
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LVL0
	.long	.LVL1
	.word	0x1
	.byte	0x66
	.long	.LVL1
	.long	.LVL4
	.word	0x1
	.byte	0x61
	.long	.LVL4
	.long	.LFE7
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
.LLST3:
	.long	.LVL5
	.long	.LVL6-1
	.word	0x1
	.byte	0x68
	.long	.LVL6-1
	.long	.LFE9
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST4:
	.long	.LFB10
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI12
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 10
	.long	.LCFI13
	.long	.LCFI14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 11
	.long	.LCFI14
	.long	.LFE10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 12
	.long	0
	.long	0
.LLST5:
	.long	.LVL7
	.long	.LVL8
	.word	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL8
	.long	.LVL9
	.word	0x8
	.byte	0x93
	.uleb128 0x2
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL9
	.long	.LVL11
	.word	0x8
	.byte	0x93
	.uleb128 0x2
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL13
	.long	.LVL14
	.word	0x8
	.byte	0x93
	.uleb128 0x2
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST6:
	.long	.LVL10
	.long	.LVL13
	.word	0x1
	.byte	0x5e
	.long	0
	.long	0
.LLST7:
	.long	.LVL15
	.long	.LVL16-1
	.word	0x1
	.byte	0x68
	.long	.LVL16-1
	.long	.LFE11
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST8:
	.long	.LVL26
	.long	.LVL27
	.word	0x1
	.byte	0x68
	.long	.LVL27
	.long	.LVL28
	.word	0x4
	.byte	0x88
	.sleb128 -127
	.byte	0x9f
	.long	.LVL28
	.long	.LVL29
	.word	0x1
	.byte	0x68
	.long	.LVL29
	.long	.LFE14
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL26
	.long	.LVL30-1
	.word	0x1
	.byte	0x66
	.long	.LVL30-1
	.long	.LFE14
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x84
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB2
	.long	.LFE2-.LFB2
	.long	.LFB3
	.long	.LFE3-.LFB3
	.long	.LFB4
	.long	.LFE4-.LFB4
	.long	.LFB5
	.long	.LFE5-.LFB5
	.long	.LFB6
	.long	.LFE6-.LFB6
	.long	.LFB7
	.long	.LFE7-.LFB7
	.long	.LFB9
	.long	.LFE9-.LFB9
	.long	.LFB10
	.long	.LFE10-.LFB10
	.long	.LFB11
	.long	.LFE11-.LFB11
	.long	.LFB12
	.long	.LFE12-.LFB12
	.long	.LFB8
	.long	.LFE8-.LFB8
	.long	.LFB13
	.long	.LFE13-.LFB13
	.long	.LFB14
	.long	.LFE14-.LFB14
	.long	.LFB0
	.long	.LFE0-.LFB0
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB2
	.long	.LFE2
	.long	.LFB3
	.long	.LFE3
	.long	.LFB4
	.long	.LFE4
	.long	.LFB5
	.long	.LFE5
	.long	.LFB6
	.long	.LFE6
	.long	.LFB7
	.long	.LFE7
	.long	.LFB9
	.long	.LFE9
	.long	.LFB10
	.long	.LFE10
	.long	.LFB11
	.long	.LFE11
	.long	.LFB12
	.long	.LFE12
	.long	.LFB8
	.long	.LFE8
	.long	.LFB13
	.long	.LFE13
	.long	.LFB14
	.long	.LFE14
	.long	.LFB0
	.long	.LFE0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF71:
	.string	"avr__strings__avr_string___XUA"
.LASF13:
	.string	"avr__strings__avr_string___XUB"
.LASF48:
	.string	"lcd__commands__display_on_cursor_blink"
.LASF15:
	.string	"avr__Tbit_numberB"
.LASF5:
	.string	"lcd__command_type"
.LASF2:
	.string	"character"
.LASF72:
	.string	"avr__strings__avr_string___XUP"
.LASF23:
	.string	"lcd__wait_10ms"
.LASF75:
	.string	"lcd___elabb"
.LASF27:
	.string	"lcd__output"
.LASF24:
	.string	"lcd__wait_5ms"
.LASF52:
	.string	"lcd__commands__entry_shift_dec"
.LASF64:
	.string	"lcd__wait_64usGP651__micro_secondsX"
.LASF49:
	.string	"lcd__commands__entry_inc"
.LASF6:
	.string	"lcd__line_position___XDLU_1__2"
.LASF43:
	.string	"lcd__commands__mode_8bit_2line"
.LASF8:
	.string	"lcd__Tline_positionB"
.LASF45:
	.string	"lcd__commands__display_on"
.LASF17:
	.string	"system__address"
.LASF41:
	.string	"lcd__commands__mode_4bit_2line"
.LASF68:
	.string	"avr__atmega328p__ddrd_bits"
.LASF29:
	.string	"lcd__put"
.LASF60:
	.string	"lcd__wait_5msGP393__micro_secondsX"
.LASF63:
	.string	"lcd__wait_64usGP651__crystal_hertzX"
.LASF74:
	.string	"avr__bits_in_byte___XP1"
.LASF18:
	.string	"interfaces__unsigned_16"
.LASF30:
	.string	"lcd__put__2"
.LASF40:
	.string	"lcd__commands__mode_4bit_1line"
.LASF11:
	.string	"interfaces__unsigned_32"
.LASF47:
	.string	"lcd__commands__display_on_cursor"
.LASF42:
	.string	"lcd__commands__mode_8bit_1line"
.LASF7:
	.string	"lcd__Tcommand_typeB"
.LASF44:
	.string	"lcd__commands__display_off"
.LASF33:
	.string	"lcd__command"
.LASF12:
	.string	"system__unsigned_types__short_short_unsigned"
.LASF62:
	.string	"lcd__wait_1msGP522__micro_secondsX"
.LASF50:
	.string	"lcd__commands__entry_dec"
.LASF34:
	.string	"lcd__clear_screen"
.LASF0:
	.string	"interfaces__unsigned_8"
.LASF4:
	.string	"P_BOUNDS"
.LASF56:
	.string	"lcd__commands__move_display_right"
.LASF38:
	.string	"lcd__commands__clear"
.LASF31:
	.string	"lcd__put__2__L_1__T30b___L"
.LASF39:
	.string	"lcd__commands__home"
.LASF16:
	.string	"boolean"
.LASF14:
	.string	"avr__bits_in_byte___XP1___JM"
.LASF58:
	.string	"lcd__wait_10msGP262__micro_secondsX"
.LASF36:
	.string	"lcd__home"
.LASF22:
	.string	"lcd__wait_1ms"
.LASF51:
	.string	"lcd__commands__entry_shift_inc"
.LASF37:
	.string	"lcd__gotoxy"
.LASF35:
	.string	"lcd__init"
.LASF1:
	.string	"sizetype"
.LASF53:
	.string	"lcd__commands__move_cursor_left"
.LASF28:
	.string	"is_data"
.LASF25:
	.string	"lcd__wait_64us"
.LASF66:
	.string	"avr__atmega328p__portd_bits"
.LASF61:
	.string	"lcd__wait_1msGP522__crystal_hertzX"
.LASF54:
	.string	"lcd__commands__move_cursor_right"
.LASF21:
	.string	"long_long_integer"
.LASF59:
	.string	"lcd__wait_5msGP393__crystal_hertzX"
.LASF69:
	.string	"GNU Ada 4.7.0"
.LASF55:
	.string	"lcd__commands__move_display_left"
.LASF70:
	.string	"/home/helipse/Dropbox/AdaProg/AdaProg/25_0 - Ecran1602  origins/lcd.adb"
.LASF65:
	.string	"avr__atmega328p__portb_bits"
.LASF73:
	.string	"OBJECT"
.LASF46:
	.string	"lcd__commands__display_on_blink"
.LASF9:
	.string	"lcd__char_position___XDLU_1__16"
.LASF20:
	.string	"cycles_to_wait"
.LASF57:
	.string	"lcd__wait_10msGP262__crystal_hertzX"
.LASF32:
	.string	"lcd__put__2__L_1__T30b___U"
.LASF26:
	.string	"lcd__toggle_enable"
.LASF3:
	.string	"P_ARRAY"
.LASF67:
	.string	"avr__atmega328p__ddrb_bits"
.LASF10:
	.string	"lcd__Tchar_positionB"
.LASF19:
	.string	"cycle_length"
	.ident	"GCC: (GNU) 4.7.0"
.global __do_copy_data
