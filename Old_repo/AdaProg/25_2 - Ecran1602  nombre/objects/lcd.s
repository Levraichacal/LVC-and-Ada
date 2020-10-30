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
 ;  -gnatec=/home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/objects/GNAT-TEMP-000001.TMP
 ;  -gnatec=/opt/avrada/avr/lib/gnat/gnat.adc -gdwarf-2 -gnatwp -gnatwu
 ;  -gnatn -gnatp -gnatVn -gnatef -gnatdY -mmcu=atmega328p
 ;  -gnateDMCU=atmega328p -gnateDUART=usart0 -gnaty3abefhiklM130prn -gnatA
 ;  -gnatem=/home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/objects/GNAT-TEMP-000002.TMP
 ;  -gnatez
 ;  /home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/lcd.adb
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
	.file 2 "/home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/lcd.adb"
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
	in r25,0xb	 ;  D.2181, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r25,lo8(-33)	 ;  D.2181,
	sbrs r24,4	 ;  cmd,
	rjmp .L17	 ; 
	ldi r18,lo8(32)	 ;  iftmp.64,
	rjmp .L7	 ; 
.L17:
	ldi r18,0	 ;  iftmp.64
.L7:
	.loc 2 54 0 is_stmt 0 discriminator 3
	or r25,r18	 ;  D.2187, iftmp.64
	out 0xb,r25	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.2187
	.loc 2 55 0 is_stmt 1 discriminator 3
	in r19,0xb	 ;  D.2189, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r19,lo8(-17)	 ;  D.2189,
	sbrs r24,5	 ;  cmd,
	rjmp .L18	 ; 
	.loc 2 55 0 is_stmt 0
	ldi r20,lo8(16)	 ;  iftmp.65,
	rjmp .L8	 ; 
.L18:
	ldi r20,0	 ;  iftmp.65
.L8:
	.loc 2 55 0 discriminator 3
	or r19,r20	 ;  D.2195, iftmp.65
	out 0xb,r19	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.2195
	.loc 2 56 0 is_stmt 1 discriminator 3
	in r21,0xb	 ;  D.2197, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r21,lo8(-9)	 ;  D.2197,
	sbrs r24,6	 ;  cmd,
	rjmp .L19	 ; 
	.loc 2 56 0 is_stmt 0
	ldi r22,lo8(8)	 ;  iftmp.66,
.LVL1:
	rjmp .L9	 ; 
.L19:
	ldi r22,0	 ;  iftmp.66
.L9:
	.loc 2 56 0 discriminator 3
	or r21,r22	 ;  D.2203, iftmp.66
	out 0xb,r21	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.2203
	.loc 2 57 0 is_stmt 1 discriminator 3
	in r23,0xb	 ;  D.2205, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r23,lo8(-5)	 ;  D.2205,
	mov r26,r24	 ;  D.2211, cmd
	rol r26	 ;  D.2211
	clr r26	 ;  D.2211
	rol r26	 ;  D.2211
	lsl r26	 ;  D.2211
	lsl r26	 ;  D.2211
	or r26,r23	 ;  D.2211, D.2205
	out 0xb,r26	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.2211
	.loc 2 59 0 discriminator 3
	std Y+1,r24	 ; ,
	call lcd__toggle_enable	 ; 
.LVL2:
	.loc 2 62 0 discriminator 3
	in r27,0xb	 ;  D.2213, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r27,lo8(-33)	 ;  D.2213,
	ldd r24,Y+1	 ; ,
	sbrs r24,0	 ;  cmd,
	rjmp .L21	 ; 
	.loc 2 62 0 is_stmt 0
	ldi r30,lo8(32)	 ;  iftmp.69,
	rjmp .L11	 ; 
.L21:
	ldi r30,0	 ;  iftmp.69
.L11:
	.loc 2 62 0 discriminator 3
	or r27,r30	 ;  D.2219, iftmp.69
	out 0xb,r27	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.2219
	.loc 2 63 0 is_stmt 1 discriminator 3
	in r31,0xb	 ;  D.2221, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r31,lo8(-17)	 ;  D.2221,
	sbrs r24,1	 ;  cmd,
	rjmp .L22	 ; 
	.loc 2 63 0 is_stmt 0
	ldi r25,lo8(16)	 ;  iftmp.70,
	rjmp .L12	 ; 
.L22:
	ldi r25,0	 ;  iftmp.70
.L12:
	.loc 2 63 0 discriminator 3
	or r31,r25	 ;  D.2227, iftmp.70
	out 0xb,r31	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.2227
	.loc 2 64 0 is_stmt 1 discriminator 3
	in r19,0xb	 ;  D.2229, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r19,lo8(-9)	 ;  D.2229,
	sbrs r24,2	 ;  cmd,
	rjmp .L23	 ; 
	.loc 2 64 0 is_stmt 0
	ldi r18,lo8(8)	 ;  iftmp.71,
	rjmp .L13	 ; 
.L23:
	ldi r18,0	 ;  iftmp.71
.L13:
	.loc 2 64 0 discriminator 3
	or r19,r18	 ;  D.2235, iftmp.71
	out 0xb,r19	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.2235
	.loc 2 65 0 is_stmt 1 discriminator 3
	in r20,0xb	 ;  D.2237, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT
	andi r20,lo8(-5)	 ;  D.2237,
	sbrs r24,3	 ;  cmd,
	rjmp .L24	 ; 
	.loc 2 65 0 is_stmt 0
	ldi r21,lo8(4)	 ;  iftmp.72,
	rjmp .L14	 ; 
.L24:
	ldi r21,0	 ;  iftmp.72
.L14:
	.loc 2 65 0 discriminator 3
	or r20,r21	 ;  D.2243, iftmp.72
	out 0xb,r20	 ;  MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})43].OBJECT, D.2243
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
	ld r12,Y	 ;  D.2117, s$P_BOUNDS_48->LB0
	ldd r18,Y+1	 ;  s$P_BOUNDS_48->UB0, s$P_BOUNDS_48->UB0
	cp r18,r12	 ;  s$P_BOUNDS_48->UB0, D.2117
	brlo .L26	 ; ,
.LBB21:
	.loc 2 140 0 is_stmt 0 discriminator 1
	mov r13,__zero_reg__	 ;  D.2119
	ldi r16,0	 ;  ivtmp.133
	ldi r17,0	 ;  ivtmp.133
	.loc 2 141 0 is_stmt 1 discriminator 1
	movw r10,r22	 ;  s, s
.LVL9:
.L28:
	.loc 2 138 0 discriminator 2
	movw r14,r16	 ;  D.2363, ivtmp.133
	add r14,r12	 ;  D.2363, D.2119
	adc r15,r13	 ;  D.2363, D.2119
.LVL10:
	.loc 2 141 0 discriminator 2
	movw r30,r14	 ;  tmp63, D.2363
	clr r31	 ; 
	sub r30,r12	 ;  tmp63, D.2119
	sbc r31,r13	 ;  tmp63, D.2119
	add r30,r10	 ;  tmp63, s
	adc r31,r11	 ;  tmp63, s
	ld r24,Z	 ; , *D.2139_66
.LVL11:
	call lcd__put	 ; 
.LVL12:
	subi r16,-1	 ;  ivtmp.133,
	sbci r17,-1	 ;  ivtmp.133,
	.loc 2 140 0 discriminator 2
	ldd r24,Y+1	 ;  s$P_BOUNDS_48->UB0, s$P_BOUNDS_48->UB0
	ldi r25,0	 ;  s$P_BOUNDS_48->UB0
	cp r14,r24	 ;  D.2363, s$P_BOUNDS_48->UB0
	cpc r15,r25	 ;  D.2363, s$P_BOUNDS_48->UB0
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
	.section	.text.lcd__put__3,"ax",@progbits
.global	lcd__put__3
	.type	lcd__put__3, @function
lcd__put__3:
.LFB11:
	.loc 2 146 0
.LVL15:
	push r13	 ; 
.LCFI15:
	push r14	 ; 
.LCFI16:
	push r15	 ; 
.LCFI17:
	push r16	 ; 
.LCFI18:
	push r17	 ; 
.LCFI19:
	push r28	 ; 
.LCFI20:
	push r29	 ; 
.LCFI21:
	 ; SP -= 3	 ; 
	rcall .
	push __zero_reg__
.LCFI22:
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
.LCFI23:
/* prologue: function */
/* frame size = 3 */
/* stack size = 10 */
.L__stack_usage = 10
	mov r13,r22	 ;  base, base
	.loc 2 179 0
	in r16,__SP_L__	 ;  tmp110
	in r17,__SP_H__	 ;  tmp110
	.loc 2 147 0
	ldi r25,lo8(32)	 ;  tmp76,
	std Y+3,r25	 ;  buf, tmp76
.LVL16:
	.loc 2 148 0
	mov r14,r24	 ;  n, s
	.loc 2 151 0
	mov r15,__zero_reg__	 ;  i
	rjmp .L32	 ; 
.LVL17:
.L35:
	.loc 2 146 0
	mov r14,r24	 ;  n, tmp77
.LVL18:
.L32:
	.loc 2 152 0
	tst r14	 ;  n
	breq .L33	 ; ,
.LVL19:
	.loc 2 154 0
	mov r24,r14	 ; , n
	mov r22,r13	 ; , base
	call __udivmodqi4
.LVL20:
	.loc 2 155 0
	mov r21,r14	 ;  a, n
	mul r24,r13	 ;  tmp77, base
	sub r21,r0	 ;  a
	clr __zero_reg__
.LVL21:
	.loc 2 156 0
	inc r15	 ;  i
.LVL22:
	mov r18,r15	 ;  i, i
	ldi r19,0	 ;  i
	.loc 2 158 0
	ldi r30,lo8(3)	 ;  tmp82,
	ldi r31,0	 ; 
	add r30,r28	 ;  tmp82,
	adc r31,r29	 ;  tmp82,
	add r30,r18	 ;  tmp82, i
	adc r31,r19	 ;  tmp82, i
	.loc 2 157 0
	cpi r21,lo8(10)	 ;  a,
	brsh .L34	 ; ,
	.loc 2 158 0
	subi r21,lo8(-(48))	 ;  tmp83,
.LVL23:
	rjmp .L40	 ; 
.LVL24:
.L34:
	.loc 2 160 0
	subi r21,lo8(-(55))	 ;  tmp87,
.LVL25:
.L40:
	st Z,r21	 ;  buf, tmp87
	rjmp .L35	 ; 
.LVL26:
.L33:
	.loc 2 164 0
	cpse r15,__zero_reg__	 ;  i,
	rjmp .L36	 ; 
.LVL27:
	.loc 2 166 0
	ldi r23,lo8(48)	 ;  tmp88,
	std Y+4,r23	 ;  buf, tmp88
	.loc 2 165 0
	clr r15	 ;  i
	inc r15	 ;  i
	rjmp .L37	 ; 
.LVL28:
.L36:
	in r13,__SP_L__	 ;  saved_stack.56,
.LVL29:
	in r14,__SP_H__	 ;  saved_stack.56,
.LVL30:
.LBB22:
	.loc 2 170 0
	mov r22,r15	 ;  iftmp.48, i
.LVL31:
	ldi r23,0	 ;  iftmp.48
	in r24,__SP_L__	 ; 
	in r25,__SP_H__	 ; 
.LVL32:
	sub r24,r22	 ; , iftmp.48
	sbc r25,r23	 ; , iftmp.48
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ; 
	in r18,__SP_L__	 ;  tmp90
	in r19,__SP_H__	 ;  tmp90
	subi r18,-1	 ;  tmp90,
	sbci r19,-1	 ; ,
.LVL33:
	ldi r24,0	 ;  j
.L38:
.LVL34:
.LBB23:
	.loc 2 172 0 discriminator 2
	mov r21,r24	 ;  j, j
	subi r21,lo8(-(1))	 ;  j,
.LVL35:
	.loc 2 173 0 discriminator 2
	movw r30,r18	 ;  tmp93, tmp90
	add r30,r21	 ;  tmp93, j
	adc r31,__zero_reg__	 ;  tmp93
	sbiw r30,1	 ;  tmp94,
	.loc 2 146 0 discriminator 2
	mov r20,r15	 ; , i
	sub r20,r24	 ; , j
	.loc 2 173 0 discriminator 2
	ldi r26,lo8(3)	 ;  tmp98,
	ldi r27,0	 ; 
	add r26,r28	 ;  tmp98,
	adc r27,r29	 ;  tmp98,
	add r26,r20	 ;  tmp98, tmp95
	adc r27,__zero_reg__	 ;  tmp98
	ld r27,X	 ;  tmp99, buf
	st Z,r27	 ;  *temp.49_39, tmp99
	.loc 2 172 0 discriminator 2
	mov r24,r21	 ;  j, j
	cpse r21,r15	 ;  j, i
	rjmp .L38	 ; 
.LBE23:
	.loc 2 175 0
	movw r30,r28	 ;  tmp101,
	adiw r30,4	 ;  tmp101,
	movw r20,r22	 ; ,
	movw r22,r18	 ; ,
	movw r24,r30	 ; ,
	call memcpy	 ; 
.LVL36:
	mov r24,r13	 ;  tmp130, saved_stack.56
	mov r25,r14	 ; , saved_stack.56
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ;  tmp130
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ;  tmp130
.LVL37:
.L37:
.LBE22:
	.loc 2 178 0
	movw r22,r28	 ; ,
	subi r22,-4	 ; ,
	sbci r23,-1	 ; ,
	ldi r31,lo8(1)	 ;  tmp109,
	std Y+1,r31	 ;  D.2113.LB0, tmp109
	std Y+2,r15	 ;  D.2113.UB0, i
	movw r24,r28	 ; ,
	adiw r24,1	 ; ,
	call lcd__put__2	 ; 
.LVL38:
	.loc 2 179 0
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r17	 ;  tmp110
	out __SREG__,__tmp_reg__
	out __SP_L__,r16	 ;  tmp110
/* epilogue start */
	 ; SP += 3	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
.LVL39:
	pop r14	 ; 
	pop r13	 ; 
	ret
.LFE11:
	.size	lcd__put__3, .-lcd__put__3
	.section	.text.lcd__put__4,"ax",@progbits
.global	lcd__put__4
	.type	lcd__put__4, @function
lcd__put__4:
.LFB12:
	.loc 2 182 0
.LVL40:
	push r13	 ; 
.LCFI24:
	push r14	 ; 
.LCFI25:
	push r15	 ; 
.LCFI26:
	push r16	 ; 
.LCFI27:
	push r17	 ; 
.LCFI28:
	push r28	 ; 
.LCFI29:
	push r29	 ; 
.LCFI30:
	 ; SP -= 3	 ; 
	rcall .
	push __zero_reg__
.LCFI31:
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
.LCFI32:
/* prologue: function */
/* frame size = 3 */
/* stack size = 10 */
.L__stack_usage = 10
	.loc 2 215 0
	in r16,__SP_L__	 ;  tmp111
	in r17,__SP_H__	 ;  tmp111
	.loc 2 183 0
	ldi r18,lo8(32)	 ;  tmp77,
	std Y+3,r18	 ;  buf, tmp77
.LVL41:
	.loc 2 184 0
	movw r18,r24	 ; ,
	.loc 2 187 0
	mov r15,__zero_reg__	 ;  i
	.loc 2 190 0
	mov r30,r22	 ;  D.1938, base
	ldi r31,0	 ;  D.1938
	rjmp .L42	 ; 
.LVL42:
.L45:
	.loc 2 182 0
	movw r18,r22	 ;  n, tmp78
.LVL43:
.L42:
	.loc 2 188 0
	cp r18,__zero_reg__	 ;  n
	cpc r19,__zero_reg__	 ;  n
	breq .L43	 ; ,
.LVL44:
	.loc 2 190 0
	movw r24,r18	 ; , n
	movw r22,r30	 ; , D.1938
	call __udivmodhi4
.LVL45:
	.loc 2 191 0
	mul r22,r30	 ;  tmp78, D.1938
	movw r20,r0	 ;  tmp80
	mul r22,r31	 ;  tmp78, D.1938
	add r21,r0	 ;  tmp80
	mul r23,r30	 ;  tmp78, D.1938
	add r21,r0	 ;  tmp80
	clr r1
	sub r18,r20	 ;  a, tmp80
	sbc r19,r21	 ;  a, tmp80
.LVL46:
	.loc 2 192 0
	inc r15	 ;  i
.LVL47:
	mov r24,r15	 ;  i, i
	ldi r25,0	 ;  i
	.loc 2 194 0
	ldi r26,lo8(3)	 ;  tmp83,
	ldi r27,0	 ; 
	add r26,r28	 ;  tmp83,
	adc r27,r29	 ;  tmp83,
	add r26,r24	 ;  tmp83, i
	adc r27,r25	 ;  tmp83, i
	.loc 2 193 0
	cpi r18,10	 ;  a,
	cpc r19,__zero_reg__	 ;  a
	brsh .L44	 ; ,
	.loc 2 194 0
	subi r18,lo8(-(48))	 ;  tmp84,
.LVL48:
	rjmp .L50	 ; 
.LVL49:
.L44:
	.loc 2 196 0
	subi r18,lo8(-(55))	 ;  tmp88,
.LVL50:
.L50:
	st X,r18	 ;  buf, tmp88
	rjmp .L45	 ; 
.LVL51:
.L43:
	.loc 2 200 0
	cpse r15,__zero_reg__	 ;  i,
	rjmp .L46	 ; 
.LVL52:
	.loc 2 202 0
	ldi r23,lo8(48)	 ;  tmp89,
	std Y+4,r23	 ;  buf, tmp89
	.loc 2 201 0
	clr r15	 ;  i
	inc r15	 ;  i
	rjmp .L47	 ; 
.LVL53:
.L46:
	in r13,__SP_L__	 ;  saved_stack.40,
	in r14,__SP_H__	 ;  saved_stack.40,
.LVL54:
.LBB24:
	.loc 2 206 0
	mov r22,r15	 ;  iftmp.32, i
	ldi r23,0	 ;  iftmp.32
	in r24,__SP_L__	 ; 
	in r25,__SP_H__	 ; 
	sub r24,r22	 ; , iftmp.32
	sbc r25,r23	 ; , iftmp.32
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ; 
	in r18,__SP_L__	 ;  tmp91
	in r19,__SP_H__	 ;  tmp91
.LVL55:
	subi r18,-1	 ;  tmp91,
	sbci r19,-1	 ; ,
.LVL56:
	ldi r24,0	 ;  j
.LVL57:
.L48:
.LBB25:
	.loc 2 208 0 discriminator 2
	mov r25,r24	 ;  j, j
	subi r25,lo8(-(1))	 ;  j,
.LVL58:
	.loc 2 209 0 discriminator 2
	movw r30,r18	 ;  tmp94, tmp91
	add r30,r25	 ;  tmp94, j
	adc r31,__zero_reg__	 ;  tmp94
	sbiw r30,1	 ;  tmp95,
	.loc 2 182 0 discriminator 2
	mov r20,r15	 ; , i
	sub r20,r24	 ; , j
	.loc 2 209 0 discriminator 2
	ldi r26,lo8(3)	 ;  tmp99,
	ldi r27,0	 ; 
	add r26,r28	 ;  tmp99,
	adc r27,r29	 ;  tmp99,
	add r26,r20	 ;  tmp99, tmp96
	adc r27,__zero_reg__	 ;  tmp99
	ld r27,X	 ;  tmp100, buf
	st Z,r27	 ;  *temp.33_43, tmp100
	.loc 2 208 0 discriminator 2
	mov r24,r25	 ;  j, j
	cpse r25,r15	 ;  j, i
	rjmp .L48	 ; 
.LBE25:
	.loc 2 211 0
	movw r30,r28	 ;  tmp102,
	adiw r30,4	 ;  tmp102,
	movw r20,r22	 ; ,
	movw r22,r18	 ; ,
	movw r24,r30	 ; ,
	call memcpy	 ; 
.LVL59:
	mov r24,r13	 ;  tmp134, saved_stack.40
	mov r25,r14	 ; , saved_stack.40
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ;  tmp134
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ;  tmp134
.LVL60:
.L47:
.LBE24:
	.loc 2 214 0
	movw r22,r28	 ; ,
	subi r22,-4	 ; ,
	sbci r23,-1	 ; ,
	ldi r31,lo8(1)	 ;  tmp110,
	std Y+1,r31	 ;  D.2024.LB0, tmp110
	std Y+2,r15	 ;  D.2024.UB0, i
	movw r24,r28	 ; ,
	adiw r24,1	 ; ,
	call lcd__put__2	 ; 
.LVL61:
	.loc 2 215 0
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r17	 ;  tmp111
	out __SREG__,__tmp_reg__
	out __SP_L__,r16	 ;  tmp111
/* epilogue start */
	 ; SP += 3	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
.LVL62:
	pop r14	 ; 
	pop r13	 ; 
	ret
.LFE12:
	.size	lcd__put__4, .-lcd__put__4
	.section	.text.lcd__put__5,"ax",@progbits
.global	lcd__put__5
	.type	lcd__put__5, @function
lcd__put__5:
.LFB13:
	.loc 2 218 0
.LVL63:
	push r2	 ; 
.LCFI33:
	push r3	 ; 
.LCFI34:
	push r4	 ; 
.LCFI35:
	push r5	 ; 
.LCFI36:
	push r7	 ; 
.LCFI37:
	push r8	 ; 
.LCFI38:
	push r9	 ; 
.LCFI39:
	push r10	 ; 
.LCFI40:
	push r11	 ; 
.LCFI41:
	push r12	 ; 
.LCFI42:
	push r13	 ; 
.LCFI43:
	push r14	 ; 
.LCFI44:
	push r15	 ; 
.LCFI45:
	push r16	 ; 
.LCFI46:
	push r17	 ; 
.LCFI47:
	push r28	 ; 
.LCFI48:
	push r29	 ; 
.LCFI49:
	 ; SP -= 5	 ; 
	rcall .
	rcall .
	push __zero_reg__
.LCFI50:
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
.LCFI51:
/* prologue: function */
/* frame size = 5 */
/* stack size = 22 */
.L__stack_usage = 22
	.loc 2 251 0
	in r2,__SP_L__	 ; 
	in r3,__SP_H__	 ; 
	std Y+5,r3	 ;  %sfp,
	std Y+4,r2	 ;  %sfp,
	.loc 2 219 0
	ldi r18,lo8(32)	 ;  tmp77,
	std Y+3,r18	 ;  buf, tmp77
.LVL64:
	.loc 2 220 0
	movw r12,r22	 ; ,
	movw r14,r24	 ; ,
	.loc 2 223 0
	ldi r17,0	 ;  i
	.loc 2 226 0
	mov r8,r20	 ;  D.1847, base
	mov r9,__zero_reg__	 ;  D.1847
	mov r10,__zero_reg__	 ;  D.1847
	mov r11,__zero_reg__	 ;  D.1847
	rjmp .L52	 ; 
.LVL65:
.L55:
	.loc 2 218 0
	movw r12,r30	 ; ,
.LVL66:
	mov r14,r16	 ;  n, tmp136
	mov r15,r7	 ;  n, tmp137
.LVL67:
.L52:
	.loc 2 224 0
	cp r12,__zero_reg__	 ;  n
	cpc r13,__zero_reg__	 ;  n
	cpc r14,__zero_reg__	 ;  n
	cpc r15,__zero_reg__	 ;  n
	breq .L53	 ; ,
.LVL68:
	.loc 2 226 0
	movw r24,r14	 ; , n
	movw r22,r12	 ; , n
	movw r20,r10	 ; , D.1847
	movw r18,r8	 ; , D.1847
	call __udivmodsi4
	movw r30,r18	 ; ,
	mov r16,r20	 ;  tmp136,
	mov r7,r21	 ;  tmp137,
.LVL69:
	.loc 2 227 0
	movw r24,r10	 ; , D.1847
	movw r22,r8	 ; , D.1847
	call __mulsi3
	sub r12,r22	 ; , tmp80
	sbc r13,r23	 ; , tmp80
	sbc r14,r24	 ; , tmp80
	sbc r15,r25	 ; , tmp80
.LVL70:
	movw r22,r14	 ;  a,
	movw r20,r12	 ;  a,
.LVL71:
	.loc 2 228 0
	subi r17,lo8(-(1))	 ;  i,
.LVL72:
	mov r24,r17	 ;  i, i
	ldi r25,0	 ;  i
	.loc 2 230 0
	ldi r26,lo8(3)	 ;  tmp83,
	ldi r27,0	 ; 
	add r26,r28	 ;  tmp83,
	adc r27,r29	 ;  tmp83,
	add r26,r24	 ;  tmp83, i
	adc r27,r25	 ;  tmp83, i
	mov r18,r12	 ;  tmp84, tmp20
.LVL73:
	.loc 2 229 0
	cpi r20,10	 ;  a,
	cpc r21,__zero_reg__	 ;  a
	cpc r22,__zero_reg__	 ;  a
	cpc r23,__zero_reg__	 ;  a
	brsh .L54	 ; ,
	.loc 2 230 0
	subi r18,lo8(-(48))	 ;  tmp84,
	rjmp .L60	 ; 
.L54:
	.loc 2 232 0
	subi r18,lo8(-(55))	 ;  tmp88,
.L60:
	st X,r18	 ;  buf, tmp88
	rjmp .L55	 ; 
.LVL74:
.L53:
	.loc 2 236 0
	cpse r17,__zero_reg__	 ;  i,
	rjmp .L56	 ; 
.LVL75:
	.loc 2 238 0
	ldi r17,lo8(48)	 ;  tmp89,
	std Y+4,r17	 ;  buf, tmp89
	.loc 2 237 0
	ldi r17,lo8(1)	 ;  i,
	rjmp .L57	 ; 
.LVL76:
.L56:
	in r15,__SP_L__	 ;  saved_stack.24,
	in r16,__SP_H__	 ;  saved_stack.24,
.LVL77:
.LBB26:
	.loc 2 242 0
	mov r22,r17	 ;  iftmp.16, i
	ldi r23,0	 ;  iftmp.16
	in r4,__SP_L__	 ; 
	in r5,__SP_H__	 ; 
	sub r4,r22	 ; , iftmp.16
	sbc r5,r23	 ; , iftmp.16
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r5	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r4	 ; 
	in r18,__SP_L__	 ;  tmp91
	in r19,__SP_H__	 ;  tmp91
	subi r18,-1	 ;  tmp91,
	sbci r19,-1	 ; ,
.LVL78:
	mov r7,__zero_reg__	 ;  j
.L58:
.LVL79:
.LBB27:
	.loc 2 244 0 discriminator 2
	mov r25,r7	 ;  j, j
	subi r25,lo8(-(1))	 ;  j,
.LVL80:
	.loc 2 245 0 discriminator 2
	movw r30,r18	 ;  tmp94, tmp91
	add r30,r25	 ;  tmp94, j
	adc r31,__zero_reg__	 ;  tmp94
	sbiw r30,1	 ;  tmp95,
	.loc 2 218 0 discriminator 2
	mov r5,r17	 ; , i
	sub r5,r7	 ; , j
	.loc 2 245 0 discriminator 2
	ldi r26,lo8(3)	 ;  tmp99,
	ldi r27,0	 ; 
	add r26,r28	 ;  tmp99,
	adc r27,r29	 ;  tmp99,
	add r26,r5	 ;  tmp99, tmp96
	adc r27,__zero_reg__	 ;  tmp99
	ld r3,X	 ;  tmp100, buf
	st Z,r3	 ;  *temp.17_43, tmp100
	.loc 2 244 0 discriminator 2
	mov r7,r25	 ;  j, j
	cpse r25,r17	 ;  j, i
	rjmp .L58	 ; 
.LBE27:
	.loc 2 247 0
	movw r30,r28	 ;  tmp102,
	adiw r30,4	 ;  tmp102,
	movw r20,r22	 ; ,
	movw r22,r18	 ; ,
	movw r24,r30	 ; ,
	call memcpy	 ; 
.LVL81:
	mov r24,r15	 ;  tmp140, saved_stack.24
	mov r25,r16	 ; , saved_stack.24
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ;  tmp140
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ;  tmp140
.LVL82:
.L57:
.LBE26:
	.loc 2 250 0
	movw r22,r28	 ; ,
	subi r22,-4	 ; ,
	sbci r23,-1	 ; ,
	ldi r20,lo8(1)	 ;  tmp110,
	std Y+1,r20	 ;  D.1933.LB0, tmp110
	std Y+2,r17	 ;  D.1933.UB0, i
	movw r24,r28	 ; ,
	adiw r24,1	 ; ,
	call lcd__put__2	 ; 
.LVL83:
	.loc 2 251 0
	ldd r10,Y+4	 ; , %sfp
	ldd r11,Y+5	 ; , %sfp
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r11	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r10	 ; 
/* epilogue start */
	 ; SP += 5	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
.LVL84:
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
.LVL85:
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
.LVL86:
	pop r7	 ; 
	pop r5	 ; 
	pop r4	 ; 
	pop r3	 ; 
	pop r2	 ; 
	ret
.LFE13:
	.size	lcd__put__5, .-lcd__put__5
	.section	.rodata
.LC1:
	.ascii	"-"
.LC0:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	0
	.section	.text.lcd__put__6,"ax",@progbits
.global	lcd__put__6
	.type	lcd__put__6, @function
lcd__put__6:
.LFB14:
	.loc 2 254 0
.LVL87:
	push r28	 ; 
.LCFI52:
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24	 ;  s, s
	.loc 2 257 0
	sbrs r24,7	 ;  s,
	rjmp .L62	 ; 
.LVL88:
	.loc 2 259 0
	ldi r22,lo8(.LC1)	 ;  D.1842,
	ldi r23,hi8(.LC1)	 ;  D.1842,
	ldi r24,lo8(.LC0)	 ;  D.1842,
	ldi r25,hi8(.LC0)	 ;  D.1842,
.LVL89:
	call lcd__put__2	 ; 
.LVL90:
	.loc 2 260 0
	ldi r22,lo8(10)	 ; ,
	mov r24,r28	 ; , s
	neg r24	 ; 
.LVL91:
	rjmp .L63	 ; 
.LVL92:
.L62:
	.loc 2 263 0
	ldi r22,lo8(10)	 ; ,
.LVL93:
.L63:
/* epilogue start */
	.loc 2 265 0
	pop r28	 ; 
.LVL94:
	.loc 2 263 0
	jmp lcd__put__3	 ; 
.LVL95:
.LFE14:
	.size	lcd__put__6, .-lcd__put__6
	.section	.text.lcd__put__7,"ax",@progbits
.global	lcd__put__7
	.type	lcd__put__7, @function
lcd__put__7:
.LFB15:
	.loc 2 268 0
.LVL96:
	push r28	 ; 
.LCFI53:
	push r29	 ; 
.LCFI54:
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24	 ;  s, s
	.loc 2 271 0
	sbrs r25,7	 ;  s,
	rjmp .L65	 ; 
.LVL97:
	.loc 2 273 0
	ldi r22,lo8(.LC1)	 ;  D.1836,
	ldi r23,hi8(.LC1)	 ;  D.1836,
	ldi r24,lo8(.LC0)	 ;  D.1836,
	ldi r25,hi8(.LC0)	 ;  D.1836,
.LVL98:
	call lcd__put__2	 ; 
.LVL99:
	.loc 2 274 0
	ldi r22,lo8(10)	 ; ,
	clr r24	 ; 
	clr r25	 ; 
	sub r24,r28	 ; , s
	sbc r25,r29	 ; , s
.LVL100:
	rjmp .L66	 ; 
.LVL101:
.L65:
	.loc 2 277 0
	ldi r22,lo8(10)	 ; ,
.LVL102:
.L66:
/* epilogue start */
	.loc 2 279 0
	pop r29	 ; 
	pop r28	 ; 
.LVL103:
	.loc 2 277 0
	jmp lcd__put__4	 ; 
.LVL104:
.LFE15:
	.size	lcd__put__7, .-lcd__put__7
	.section	.text.lcd__put__8,"ax",@progbits
.global	lcd__put__8
	.type	lcd__put__8, @function
lcd__put__8:
.LFB16:
	.loc 2 283 0
.LVL105:
	push r12	 ; 
.LCFI55:
	push r13	 ; 
.LCFI56:
	push r14	 ; 
.LCFI57:
	push r15	 ; 
.LCFI58:
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r12,r22	 ;  s, s
	movw r14,r24	 ;  s, s
	.loc 2 286 0
	sbrs r25,7	 ;  s,
	rjmp .L68	 ; 
.LVL106:
	.loc 2 288 0
	ldi r22,lo8(.LC1)	 ;  D.1829,
	ldi r23,hi8(.LC1)	 ;  D.1829,
.LVL107:
	ldi r24,lo8(.LC0)	 ;  D.1829,
	ldi r25,hi8(.LC0)	 ;  D.1829,
	call lcd__put__2	 ; 
.LVL108:
	.loc 2 287 0
	clr r22	 ;  tmp47
	clr r23	 ;  tmp47
	movw r24,r22	 ;  tmp47
	sub r22,r12	 ;  tmp47, s
	sbc r23,r13	 ;  tmp47, s
	sbc r24,r14	 ;  tmp47, s
	sbc r25,r15	 ;  tmp47, s
.LVL109:
	.loc 2 289 0
	ldi r20,lo8(10)	 ; ,
	rjmp .L69	 ; 
.LVL110:
.L68:
	.loc 2 292 0
	ldi r20,lo8(10)	 ; ,
.LVL111:
.L69:
/* epilogue start */
	.loc 2 294 0
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
.LVL112:
	.loc 2 292 0
	jmp lcd__put__5	 ; 
.LVL113:
.LFE16:
	.size	lcd__put__8, .-lcd__put__8
	.section	.text.lcd__command,"ax",@progbits
.global	lcd__command
	.type	lcd__command, @function
lcd__command:
.LFB17:
	.loc 2 297 0
.LVL114:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 299 0
	ldi r22,0	 ; 
	jmp lcd__output	 ; 
.LVL115:
.LFE17:
	.size	lcd__command, .-lcd__command
	.section	.text.lcd__clear_screen,"ax",@progbits
.global	lcd__clear_screen
	.type	lcd__clear_screen, @function
lcd__clear_screen:
.LFB18:
	.loc 2 303 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 305 0
	ldi r24,lo8(1)	 ; ,
	jmp lcd__command	 ; 
.LVL116:
.LFE18:
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
.LBB28:
.LBB29:
	.loc 1 64 0
	ldi r24,lo8(-25214)	 ; ,
	ldi r25,hi8(-25214)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	nop
.LBE29:
.LBE28:
.LBB30:
.LBB31:
	ldi r24,lo8(-25214)	 ; ,
	ldi r25,hi8(-25214)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	nop
.LBE31:
.LBE30:
	.loc 2 99 0
	sbi 0xb,5	 ; ,
	.loc 2 100 0
	sbi 0xb,4	 ; ,
	.loc 2 101 0
	call lcd__toggle_enable	 ; 
.LVL117:
.LBB32:
.LBB33:
	.loc 1 64 0
	ldi r24,lo8(20161)	 ; ,
	ldi r25,hi8(20161)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
.LBE33:
.LBE32:
	.loc 2 105 0
	call lcd__toggle_enable	 ; 
.LVL118:
.LBB34:
.LBB35:
	.loc 1 64 0
	ldi r24,lo8(257)	 ; ,
	ldi r25,hi8(257)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	rjmp .
	nop
.LBE35:
.LBE34:
	.loc 2 108 0
	call lcd__toggle_enable	 ; 
.LVL119:
.LBB36:
.LBB37:
	.loc 1 64 0
	ldi r24,lo8(257)	 ; ,
	ldi r25,hi8(257)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	rjmp .
	nop
.LBE37:
.LBE36:
	.loc 2 112 0
	cbi 0xb,5	 ; ,
	.loc 2 118 0
	ldi r24,lo8(40)	 ; ,
	call lcd__command	 ; 
.LVL120:
	.loc 2 124 0
	ldi r24,lo8(12)	 ; ,
	call lcd__command	 ; 
.LVL121:
	.loc 2 125 0
	call lcd__clear_screen	 ; 
.LVL122:
	.loc 2 126 0
	ldi r24,lo8(6)	 ; ,
	jmp lcd__command	 ; 
.LVL123:
.LFE8:
	.size	lcd__init, .-lcd__init
	.section	.text.lcd__home,"ax",@progbits
.global	lcd__home
	.type	lcd__home, @function
lcd__home:
.LFB19:
	.loc 2 310 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 312 0
	ldi r24,lo8(2)	 ; ,
	jmp lcd__command	 ; 
.LVL124:
.LFE19:
	.size	lcd__home, .-lcd__home
	.section	.text.lcd__gotoxy,"ax",@progbits
.global	lcd__gotoxy
	.type	lcd__gotoxy, @function
lcd__gotoxy:
.LFB20:
	.loc 2 320 0
.LVL125:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 323 0
	cpi r22,lo8(1)	 ;  y,
	brne .L75	 ; ,
	.loc 2 324 0
	subi r24,lo8(-(127))	 ; ,
.LVL126:
	rjmp .L76	 ; 
.LVL127:
.L75:
	.loc 2 325 0
	subi r24,lo8(-(-65))	 ; ,
.LVL128:
.L76:
	jmp lcd__command	 ; 
.LVL129:
.LFE20:
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
	.byte	0x4
	.long	.LCFI15-.LFB11
	.byte	0xe
	.uleb128 0x3
	.byte	0x8d
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x5
	.byte	0x8f
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x6
	.byte	0x90
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x7
	.byte	0x91
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x8
	.byte	0x9c
	.uleb128 0x7
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x9
	.byte	0x9d
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI23-.LCFI22
	.byte	0xd
	.uleb128 0x1c
	.p2align	2
.LEFDE16:
.LSFDE18:
	.long	.LEFDE18-.LASFDE18
.LASFDE18:
	.long	.Lframe0
	.long	.LFB12
	.long	.LFE12-.LFB12
	.byte	0x4
	.long	.LCFI24-.LFB12
	.byte	0xe
	.uleb128 0x3
	.byte	0x8d
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x5
	.byte	0x8f
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x6
	.byte	0x90
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x7
	.byte	0x91
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0x8
	.byte	0x9c
	.uleb128 0x7
	.byte	0x4
	.long	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x9
	.byte	0x9d
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI32-.LCFI31
	.byte	0xd
	.uleb128 0x1c
	.p2align	2
.LEFDE18:
.LSFDE20:
	.long	.LEFDE20-.LASFDE20
.LASFDE20:
	.long	.Lframe0
	.long	.LFB13
	.long	.LFE13-.LFB13
	.byte	0x4
	.long	.LCFI33-.LFB13
	.byte	0xe
	.uleb128 0x3
	.byte	0x82
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI35-.LCFI34
	.byte	0xe
	.uleb128 0x5
	.byte	0x84
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x6
	.byte	0x85
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x7
	.byte	0x87
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0x8
	.byte	0x88
	.uleb128 0x7
	.byte	0x4
	.long	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x9
	.byte	0x89
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0xa
	.byte	0x8a
	.uleb128 0x9
	.byte	0x4
	.long	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0xb
	.byte	0x8b
	.uleb128 0xa
	.byte	0x4
	.long	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0xc
	.byte	0x8c
	.uleb128 0xb
	.byte	0x4
	.long	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0xd
	.byte	0x8d
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI44-.LCFI43
	.byte	0xe
	.uleb128 0xe
	.byte	0x8e
	.uleb128 0xd
	.byte	0x4
	.long	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0xf
	.byte	0x8f
	.uleb128 0xe
	.byte	0x4
	.long	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x10
	.byte	0x90
	.uleb128 0xf
	.byte	0x4
	.long	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0x11
	.byte	0x91
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0x12
	.byte	0x9c
	.uleb128 0x11
	.byte	0x4
	.long	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0x13
	.byte	0x9d
	.uleb128 0x12
	.byte	0x4
	.long	.LCFI50-.LCFI49
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI51-.LCFI50
	.byte	0xd
	.uleb128 0x1c
	.p2align	2
.LEFDE20:
.LSFDE22:
	.long	.LEFDE22-.LASFDE22
.LASFDE22:
	.long	.Lframe0
	.long	.LFB14
	.long	.LFE14-.LFB14
	.byte	0x4
	.long	.LCFI52-.LFB14
	.byte	0xe
	.uleb128 0x3
	.byte	0x9c
	.uleb128 0x2
	.p2align	2
.LEFDE22:
.LSFDE24:
	.long	.LEFDE24-.LASFDE24
.LASFDE24:
	.long	.Lframe0
	.long	.LFB15
	.long	.LFE15-.LFB15
	.byte	0x4
	.long	.LCFI53-.LFB15
	.byte	0xe
	.uleb128 0x3
	.byte	0x9c
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0x4
	.byte	0x9d
	.uleb128 0x3
	.p2align	2
.LEFDE24:
.LSFDE26:
	.long	.LEFDE26-.LASFDE26
.LASFDE26:
	.long	.Lframe0
	.long	.LFB16
	.long	.LFE16-.LFB16
	.byte	0x4
	.long	.LCFI55-.LFB16
	.byte	0xe
	.uleb128 0x3
	.byte	0x8c
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0x4
	.byte	0x8d
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0x5
	.byte	0x8e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0x6
	.byte	0x8f
	.uleb128 0x5
	.p2align	2
.LEFDE26:
.LSFDE28:
	.long	.LEFDE28-.LASFDE28
.LASFDE28:
	.long	.Lframe0
	.long	.LFB17
	.long	.LFE17-.LFB17
	.p2align	2
.LEFDE28:
.LSFDE30:
	.long	.LEFDE30-.LASFDE30
.LASFDE30:
	.long	.Lframe0
	.long	.LFB18
	.long	.LFE18-.LFB18
	.p2align	2
.LEFDE30:
.LSFDE32:
	.long	.LEFDE32-.LASFDE32
.LASFDE32:
	.long	.Lframe0
	.long	.LFB8
	.long	.LFE8-.LFB8
	.p2align	2
.LEFDE32:
.LSFDE34:
	.long	.LEFDE34-.LASFDE34
.LASFDE34:
	.long	.Lframe0
	.long	.LFB19
	.long	.LFE19-.LFB19
	.p2align	2
.LEFDE34:
.LSFDE36:
	.long	.LEFDE36-.LASFDE36
.LASFDE36:
	.long	.Lframe0
	.long	.LFB20
	.long	.LFE20-.LFB20
	.p2align	2
.LEFDE36:
.LSFDE38:
	.long	.LEFDE38-.LASFDE38
.LASFDE38:
	.long	.Lframe0
	.long	.LFB0
	.long	.LFE0-.LFB0
	.p2align	2
.LEFDE38:
	.text
.Letext0:
	.file 3 "/opt/avrada/avr/lib/gnat/avr_lib/avr-strings.ads"
	.file 4 "/opt/avrada/avr/lib/gnat/avr_lib/avr.ads"
	.file 5 "/home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/lcd.ads"
	.file 6 "/opt/avrada/avr/lib/gnat/avr_lib/avr-wait.ads"
	.file 7 "/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/avr-atmega328p.ads"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xed4
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF106
	.byte	0xd
	.long	.LASF107
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF18
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
	.long	.LASF108
	.byte	0x3
	.byte	0x21
	.long	0x61
	.uleb128 0x6
	.long	.LASF108
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
	.long	.LASF109
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
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0xb
	.byte	0x80
	.byte	0x7f
	.long	.LASF10
	.long	0xd0
	.uleb128 0xc
	.byte	0x1
	.byte	0x5
	.long	.LASF7
	.byte	0x1
	.uleb128 0xd
	.word	0x8000
	.word	0x7fff
	.long	.LASF110
	.long	0xe5
	.uleb128 0xc
	.byte	0x2
	.byte	0x5
	.long	.LASF8
	.byte	0x1
	.uleb128 0xe
	.long	0x80000000
	.long	0x7fffffff
	.long	.LASF111
	.long	0xfe
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.long	.LASF9
	.byte	0x1
	.uleb128 0xb
	.byte	0
	.byte	0xff
	.long	.LASF11
	.long	0x111
	.uleb128 0xc
	.byte	0x1
	.byte	0x7
	.long	.LASF12
	.byte	0x1
	.uleb128 0xb
	.byte	0x1
	.byte	0x2
	.long	.LASF13
	.long	0x124
	.uleb128 0xc
	.byte	0x1
	.byte	0x7
	.long	.LASF14
	.byte	0x1
	.uleb128 0xb
	.byte	0x1
	.byte	0x10
	.long	.LASF15
	.long	0x137
	.uleb128 0xc
	.byte	0x1
	.byte	0x7
	.long	.LASF16
	.byte	0x1
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF17
	.uleb128 0x3
	.long	.LASF19
	.byte	0x1
	.byte	0x4
	.byte	0x35
	.byte	0x1
	.long	0x171
	.uleb128 0xf
	.long	.LASF112
	.byte	0x4
	.byte	0x35
	.long	0x164
	.byte	0x1
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x10
	.byte	0
	.byte	0xff
	.long	.LASF43
	.long	0x13f
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.byte	0x7
	.long	.LASF20
	.byte	0x1
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF21
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF22
	.uleb128 0x11
	.byte	0x1
	.long	.LASF26
	.byte	0x1
	.byte	0x3
	.long	0x1ad
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x13
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.word	0x3f01
	.byte	0
	.uleb128 0x14
	.long	0x1b3
	.byte	0x1
	.uleb128 0xc
	.byte	0x8
	.byte	0x5
	.long	.LASF25
	.byte	0x1
	.uleb128 0x15
	.long	0xbe
	.uleb128 0x11
	.byte	0x1
	.long	.LASF27
	.byte	0x1
	.byte	0x3
	.long	0x1e8
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x16
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.long	0x2760a
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF28
	.byte	0x1
	.byte	0x3
	.long	0x210
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x16
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.long	0x13b05
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF29
	.byte	0x1
	.byte	0x3
	.long	0x236
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x13
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.word	0x408
	.byte	0
	.uleb128 0x17
	.long	0x1c0
	.long	.LFB2
	.long	.LFE2
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x268
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x16
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.long	0x2760a
	.byte	0
	.uleb128 0x17
	.long	0x1e8
	.long	.LFB3
	.long	.LFE3
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x29a
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x16
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.long	0x13b05
	.byte	0
	.uleb128 0x17
	.long	0x187
	.long	.LFB4
	.long	.LFE4
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x2ca
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x13
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.word	0x3f01
	.byte	0
	.uleb128 0x17
	.long	0x210
	.long	.LFB5
	.long	.LFE5
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x2fa
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x13
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.word	0x408
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF30
	.byte	0x2
	.byte	0x22
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x31d
	.uleb128 0x19
	.long	.LBB16
	.long	.LBE16
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF31
	.byte	0x2
	.byte	0x2c
	.long	.LFB7
	.long	.LFE7
	.long	.LLST0
	.byte	0x1
	.long	0x3d7
	.uleb128 0x1b
	.string	"cmd"
	.byte	0x2
	.byte	0x2c
	.long	0x3d7
	.long	.LLST1
	.uleb128 0x1c
	.long	.LASF32
	.byte	0x2
	.byte	0x2c
	.long	0x3dc
	.long	.LLST2
	.uleb128 0x1d
	.long	0x187
	.long	.LBB17
	.long	.LBE17
	.byte	0x2
	.byte	0x49
	.long	0x38b
	.uleb128 0x1e
	.long	.LBB18
	.long	.LBE18
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x13
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.word	0x3f01
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	0x1c0
	.long	.LBB19
	.long	.LBE19
	.byte	0x2
	.byte	0x4b
	.long	0x3c4
	.uleb128 0x1e
	.long	.LBB20
	.long	.LBE20
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x16
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.long	0x2760a
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LVL2
	.long	0x2fa
	.uleb128 0x1f
	.long	.LVL3
	.long	0x2fa
	.byte	0
	.uleb128 0x15
	.long	0x25
	.uleb128 0x15
	.long	0x179
	.uleb128 0x18
	.byte	0x1
	.long	.LASF33
	.byte	0x2
	.byte	0x83
	.long	.LFB9
	.long	.LFE9
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x41f
	.uleb128 0x1b
	.string	"c"
	.byte	0x5
	.byte	0x28
	.long	0x41f
	.long	.LLST3
	.uleb128 0x20
	.long	.LVL6
	.byte	0x1
	.long	0x31d
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x21
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x7b
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF34
	.byte	0x2
	.byte	0x8a
	.long	.LFB10
	.long	.LFE10
	.long	.LLST4
	.byte	0x1
	.long	0x481
	.uleb128 0x1b
	.string	"s"
	.byte	0x5
	.byte	0x29
	.long	0x481
	.long	.LLST5
	.uleb128 0x22
	.long	.LASF35
	.byte	0x2
	.byte	0x8c
	.long	0x3d7
	.uleb128 0x22
	.long	.LASF36
	.byte	0x2
	.byte	0x8c
	.long	0x3d7
	.uleb128 0x1e
	.long	.LBB21
	.long	.LBE21
	.uleb128 0x23
	.string	"c"
	.byte	0x2
	.byte	0x8c
	.long	0x25
	.long	.LLST6
	.uleb128 0x1f
	.long	.LVL12
	.long	0x3e1
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x82
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF37
	.byte	0x2
	.byte	0x92
	.long	.LFB11
	.long	.LFE11
	.long	.LLST7
	.byte	0x1
	.long	0x57e
	.uleb128 0x1b
	.string	"s"
	.byte	0x5
	.byte	0x2a
	.long	0x3d7
	.long	.LLST8
	.uleb128 0x1c
	.long	.LASF38
	.byte	0x5
	.byte	0x2a
	.long	0x3d7
	.long	.LLST9
	.uleb128 0x24
	.string	"buf"
	.byte	0x2
	.byte	0x93
	.long	0x57e
	.byte	0x2
	.byte	0x8c
	.sleb128 3
	.uleb128 0x23
	.string	"n"
	.byte	0x2
	.byte	0x94
	.long	0x25
	.long	.LLST10
	.uleb128 0x23
	.string	"m"
	.byte	0x2
	.byte	0x94
	.long	0x25
	.long	.LLST11
	.uleb128 0x23
	.string	"a"
	.byte	0x2
	.byte	0x94
	.long	0x25
	.long	.LLST12
	.uleb128 0x23
	.string	"i"
	.byte	0x2
	.byte	0x95
	.long	0x25
	.long	.LLST13
	.uleb128 0x25
	.long	.LBB22
	.long	.LBE22
	.long	0x574
	.uleb128 0x26
	.long	.LASF39
	.byte	0x2
	.byte	0xaa
	.long	0x3d7
	.long	.LLST14
	.uleb128 0x26
	.long	.LASF40
	.byte	0x2
	.byte	0xaa
	.long	0x5c4
	.long	.LLST15
	.uleb128 0x26
	.long	.LASF41
	.byte	0x2
	.byte	0xac
	.long	0x3d7
	.long	.LLST16
	.uleb128 0x25
	.long	.LBB23
	.long	.LBE23
	.long	0x552
	.uleb128 0x23
	.string	"j"
	.byte	0x2
	.byte	0xac
	.long	0x25
	.long	.LLST17
	.byte	0
	.uleb128 0x27
	.long	.LVL36
	.long	0xeae
	.uleb128 0x21
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x21
	.byte	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 1
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LVL38
	.long	0x424
	.byte	0
	.uleb128 0x28
	.long	.LASF44
	.long	0x7b
	.long	0x598
	.byte	0x1
	.long	0x598
	.uleb128 0x29
	.long	0x74
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2a
	.long	.LASF46
	.byte	0x1
	.byte	0x2
	.byte	0x93
	.long	0x82
	.byte	0x1
	.long	0x5c4
	.uleb128 0x9
	.long	.LASF42
	.byte	0x2
	.byte	0x93
	.long	0x5b7
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x10
	.byte	0
	.byte	0
	.long	.LASF42
	.long	0x25
	.byte	0x1
	.byte	0
	.uleb128 0x28
	.long	.LASF45
	.long	0x7b
	.long	0x5dd
	.byte	0x1
	.long	0x5dd
	.uleb128 0x2b
	.long	0x74
	.byte	0x1
	.byte	0
	.uleb128 0x2a
	.long	.LASF47
	.byte	0x1
	.byte	0x2
	.byte	0xaa
	.long	0x82
	.byte	0x1
	.long	0x608
	.uleb128 0x9
	.long	.LASF48
	.byte	0x2
	.byte	0xaa
	.long	0x5fc
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF48
	.long	0x25
	.byte	0x1
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF49
	.byte	0x2
	.byte	0xb6
	.long	.LFB12
	.long	.LFE12
	.long	.LLST18
	.byte	0x1
	.long	0x700
	.uleb128 0x1b
	.string	"s"
	.byte	0x5
	.byte	0x2b
	.long	0x700
	.long	.LLST19
	.uleb128 0x1c
	.long	.LASF38
	.byte	0x5
	.byte	0x2b
	.long	0x3d7
	.long	.LLST20
	.uleb128 0x24
	.string	"buf"
	.byte	0x2
	.byte	0xb7
	.long	0x705
	.byte	0x2
	.byte	0x8c
	.sleb128 3
	.uleb128 0x23
	.string	"n"
	.byte	0x2
	.byte	0xb8
	.long	0xb7
	.long	.LLST21
	.uleb128 0x23
	.string	"m"
	.byte	0x2
	.byte	0xb8
	.long	0xb7
	.long	.LLST22
	.uleb128 0x23
	.string	"a"
	.byte	0x2
	.byte	0xb8
	.long	0xb7
	.long	.LLST23
	.uleb128 0x23
	.string	"i"
	.byte	0x2
	.byte	0xb9
	.long	0x25
	.long	.LLST24
	.uleb128 0x25
	.long	.LBB24
	.long	.LBE24
	.long	0x6f6
	.uleb128 0x26
	.long	.LASF50
	.byte	0x2
	.byte	0xce
	.long	0x3d7
	.long	.LLST25
	.uleb128 0x26
	.long	.LASF40
	.byte	0x2
	.byte	0xce
	.long	0x74b
	.long	.LLST26
	.uleb128 0x26
	.long	.LASF51
	.byte	0x2
	.byte	0xd0
	.long	0x3d7
	.long	.LLST27
	.uleb128 0x25
	.long	.LBB25
	.long	.LBE25
	.long	0x6d4
	.uleb128 0x23
	.string	"j"
	.byte	0x2
	.byte	0xd0
	.long	0x25
	.long	.LLST28
	.byte	0
	.uleb128 0x27
	.long	.LVL59
	.long	0xeae
	.uleb128 0x21
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x21
	.byte	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 1
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LVL61
	.long	0x424
	.byte	0
	.uleb128 0x15
	.long	0xb7
	.uleb128 0x28
	.long	.LASF52
	.long	0x7b
	.long	0x71f
	.byte	0x1
	.long	0x71f
	.uleb128 0x29
	.long	0x74
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2a
	.long	.LASF53
	.byte	0x1
	.byte	0x2
	.byte	0xb7
	.long	0x82
	.byte	0x1
	.long	0x74b
	.uleb128 0x9
	.long	.LASF54
	.byte	0x2
	.byte	0xb7
	.long	0x73e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x10
	.byte	0
	.byte	0
	.long	.LASF54
	.long	0x25
	.byte	0x1
	.byte	0
	.uleb128 0x28
	.long	.LASF55
	.long	0x7b
	.long	0x764
	.byte	0x1
	.long	0x764
	.uleb128 0x2b
	.long	0x74
	.byte	0x1
	.byte	0
	.uleb128 0x2a
	.long	.LASF56
	.byte	0x1
	.byte	0x2
	.byte	0xce
	.long	0x82
	.byte	0x1
	.long	0x78f
	.uleb128 0x9
	.long	.LASF57
	.byte	0x2
	.byte	0xce
	.long	0x783
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF57
	.long	0x25
	.byte	0x1
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF58
	.byte	0x2
	.byte	0xda
	.long	.LFB13
	.long	.LFE13
	.long	.LLST29
	.byte	0x1
	.long	0x886
	.uleb128 0x1b
	.string	"s"
	.byte	0x5
	.byte	0x2c
	.long	0x1bb
	.long	.LLST30
	.uleb128 0x1c
	.long	.LASF38
	.byte	0x5
	.byte	0x2c
	.long	0x3d7
	.long	.LLST31
	.uleb128 0x24
	.string	"buf"
	.byte	0x2
	.byte	0xdb
	.long	0x886
	.byte	0x2
	.byte	0x8c
	.sleb128 3
	.uleb128 0x23
	.string	"n"
	.byte	0x2
	.byte	0xdc
	.long	0xbe
	.long	.LLST32
	.uleb128 0x23
	.string	"m"
	.byte	0x2
	.byte	0xdc
	.long	0xbe
	.long	.LLST33
	.uleb128 0x23
	.string	"a"
	.byte	0x2
	.byte	0xdc
	.long	0xbe
	.long	.LLST34
	.uleb128 0x23
	.string	"i"
	.byte	0x2
	.byte	0xdd
	.long	0x25
	.long	.LLST35
	.uleb128 0x25
	.long	.LBB26
	.long	.LBE26
	.long	0x87c
	.uleb128 0x26
	.long	.LASF59
	.byte	0x2
	.byte	0xf2
	.long	0x3d7
	.long	.LLST36
	.uleb128 0x26
	.long	.LASF40
	.byte	0x2
	.byte	0xf2
	.long	0x8cc
	.long	.LLST37
	.uleb128 0x26
	.long	.LASF60
	.byte	0x2
	.byte	0xf4
	.long	0x3d7
	.long	.LLST38
	.uleb128 0x25
	.long	.LBB27
	.long	.LBE27
	.long	0x85b
	.uleb128 0x23
	.string	"j"
	.byte	0x2
	.byte	0xf4
	.long	0x25
	.long	.LLST39
	.byte	0
	.uleb128 0x27
	.long	.LVL81
	.long	0xeae
	.uleb128 0x21
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x21
	.byte	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x74
	.sleb128 1
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LVL83
	.long	0x424
	.byte	0
	.uleb128 0x28
	.long	.LASF61
	.long	0x7b
	.long	0x8a0
	.byte	0x1
	.long	0x8a0
	.uleb128 0x29
	.long	0x74
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2a
	.long	.LASF62
	.byte	0x1
	.byte	0x2
	.byte	0xdb
	.long	0x82
	.byte	0x1
	.long	0x8cc
	.uleb128 0x9
	.long	.LASF63
	.byte	0x2
	.byte	0xdb
	.long	0x8bf
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x10
	.byte	0
	.byte	0
	.long	.LASF63
	.long	0x25
	.byte	0x1
	.byte	0
	.uleb128 0x28
	.long	.LASF64
	.long	0x7b
	.long	0x8e5
	.byte	0x1
	.long	0x8e5
	.uleb128 0x2b
	.long	0x74
	.byte	0x1
	.byte	0
	.uleb128 0x2a
	.long	.LASF65
	.byte	0x1
	.byte	0x2
	.byte	0xf2
	.long	0x82
	.byte	0x1
	.long	0x910
	.uleb128 0x9
	.long	.LASF66
	.byte	0x2
	.byte	0xf2
	.long	0x904
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF66
	.long	0x25
	.byte	0x1
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF67
	.byte	0x2
	.byte	0xfe
	.long	.LFB14
	.long	.LFE14
	.long	.LLST40
	.byte	0x1
	.long	0x957
	.uleb128 0x1b
	.string	"s"
	.byte	0x5
	.byte	0x2d
	.long	0x957
	.long	.LLST41
	.uleb128 0x23
	.string	"n"
	.byte	0x2
	.byte	0xff
	.long	0x25
	.long	.LLST42
	.uleb128 0x1f
	.long	.LVL90
	.long	0x424
	.uleb128 0x2d
	.long	.LVL95
	.byte	0x1
	.long	0x486
	.byte	0
	.uleb128 0x15
	.long	0xc5
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF68
	.byte	0x2
	.word	0x10c
	.long	.LFB15
	.long	.LFE15
	.long	.LLST43
	.byte	0x1
	.long	0x9a5
	.uleb128 0x1b
	.string	"s"
	.byte	0x5
	.byte	0x2e
	.long	0x9a5
	.long	.LLST44
	.uleb128 0x2f
	.string	"n"
	.byte	0x2
	.word	0x10d
	.long	0xb7
	.long	.LLST45
	.uleb128 0x1f
	.long	.LVL99
	.long	0x424
	.uleb128 0x2d
	.long	.LVL104
	.byte	0x1
	.long	0x608
	.byte	0
	.uleb128 0x15
	.long	0xd8
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF69
	.byte	0x2
	.word	0x11b
	.long	.LFB16
	.long	.LFE16
	.long	.LLST46
	.byte	0x1
	.long	0x9f3
	.uleb128 0x1b
	.string	"s"
	.byte	0x5
	.byte	0x2f
	.long	0x9f3
	.long	.LLST47
	.uleb128 0x2f
	.string	"n"
	.byte	0x2
	.word	0x11c
	.long	0xbe
	.long	.LLST48
	.uleb128 0x1f
	.long	.LVL108
	.long	0x424
	.uleb128 0x2d
	.long	.LVL113
	.byte	0x1
	.long	0x78f
	.byte	0
	.uleb128 0x15
	.long	0xed
	.uleb128 0x30
	.byte	0x1
	.long	.LASF70
	.byte	0x2
	.word	0x129
	.long	.LFB17
	.long	.LFE17
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xa39
	.uleb128 0x1b
	.string	"cmd"
	.byte	0x5
	.byte	0x32
	.long	0xa39
	.long	.LLST49
	.uleb128 0x20
	.long	.LVL115
	.byte	0x1
	.long	0x31d
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x21
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x106
	.uleb128 0x30
	.byte	0x1
	.long	.LASF71
	.byte	0x2
	.word	0x12f
	.long	.LFB18
	.long	.LFE18
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xa69
	.uleb128 0x20
	.long	.LVL116
	.byte	0x1
	.long	0x9f8
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF72
	.byte	0x2
	.byte	0x51
	.long	.LFB8
	.long	.LFE8
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xbf7
	.uleb128 0x1d
	.long	0x1c0
	.long	.LBB28
	.long	.LBE28
	.byte	0x2
	.byte	0x5f
	.long	0xabb
	.uleb128 0x1e
	.long	.LBB29
	.long	.LBE29
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x16
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.long	0x2760a
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	0x1c0
	.long	.LBB30
	.long	.LBE30
	.byte	0x2
	.byte	0x60
	.long	0xaf4
	.uleb128 0x1e
	.long	.LBB31
	.long	.LBE31
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x16
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.long	0x2760a
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	0x1e8
	.long	.LBB32
	.long	.LBE32
	.byte	0x2
	.byte	0x67
	.long	0xb2d
	.uleb128 0x1e
	.long	.LBB33
	.long	.LBE33
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x16
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.long	0x13b05
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	0x210
	.long	.LBB34
	.long	.LBE34
	.byte	0x2
	.byte	0x6a
	.long	0xb64
	.uleb128 0x1e
	.long	.LBB35
	.long	.LBE35
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x13
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.word	0x408
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	0x210
	.long	.LBB36
	.long	.LBE36
	.byte	0x2
	.byte	0x6d
	.long	0xb9b
	.uleb128 0x1e
	.long	.LBB37
	.long	.LBE37
	.uleb128 0x12
	.long	.LASF23
	.byte	0x1
	.byte	0x3a
	.long	0x1ad
	.byte	0x3e
	.uleb128 0x13
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x1bb
	.word	0x408
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LVL117
	.long	0x2fa
	.uleb128 0x1f
	.long	.LVL118
	.long	0x2fa
	.uleb128 0x1f
	.long	.LVL119
	.long	0x2fa
	.uleb128 0x31
	.long	.LVL120
	.long	0x9f8
	.long	0xbca
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x28
	.byte	0
	.uleb128 0x31
	.long	.LVL121
	.long	0x9f8
	.long	0xbdd
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3c
	.byte	0
	.uleb128 0x1f
	.long	.LVL122
	.long	0xa3e
	.uleb128 0x20
	.long	.LVL123
	.byte	0x1
	.long	0x9f8
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x36
	.byte	0
	.byte	0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF73
	.byte	0x2
	.word	0x136
	.long	.LFB19
	.long	.LFE19
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xc22
	.uleb128 0x20
	.long	.LVL124
	.byte	0x1
	.long	0x9f8
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF74
	.byte	0x2
	.word	0x140
	.long	.LFB20
	.long	.LFE20
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xc61
	.uleb128 0x1b
	.string	"x"
	.byte	0x5
	.byte	0x3b
	.long	0xc61
	.long	.LLST50
	.uleb128 0x1b
	.string	"y"
	.byte	0x5
	.byte	0x3b
	.long	0xc66
	.long	.LLST51
	.uleb128 0x2d
	.long	.LVL129
	.byte	0x1
	.long	0x9f8
	.byte	0
	.uleb128 0x15
	.long	0x12c
	.uleb128 0x15
	.long	0x119
	.uleb128 0x32
	.byte	0x1
	.long	.LASF113
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x33
	.long	.LASF75
	.byte	0x5
	.byte	0x43
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__clear
	.uleb128 0x33
	.long	.LASF76
	.byte	0x5
	.byte	0x44
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__home
	.uleb128 0x33
	.long	.LASF77
	.byte	0x5
	.byte	0x47
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__mode_4bit_1line
	.uleb128 0x33
	.long	.LASF78
	.byte	0x5
	.byte	0x48
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__mode_4bit_2line
	.uleb128 0x33
	.long	.LASF79
	.byte	0x5
	.byte	0x49
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__mode_8bit_1line
	.uleb128 0x33
	.long	.LASF80
	.byte	0x5
	.byte	0x4a
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__mode_8bit_2line
	.uleb128 0x33
	.long	.LASF81
	.byte	0x5
	.byte	0x4d
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__display_off
	.uleb128 0x33
	.long	.LASF82
	.byte	0x5
	.byte	0x4e
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__display_on
	.uleb128 0x33
	.long	.LASF83
	.byte	0x5
	.byte	0x4f
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__display_on_blink
	.uleb128 0x33
	.long	.LASF84
	.byte	0x5
	.byte	0x50
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__display_on_cursor
	.uleb128 0x33
	.long	.LASF85
	.byte	0x5
	.byte	0x51
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__display_on_cursor_blink
	.uleb128 0x33
	.long	.LASF86
	.byte	0x5
	.byte	0x54
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__entry_inc
	.uleb128 0x33
	.long	.LASF87
	.byte	0x5
	.byte	0x55
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__entry_dec
	.uleb128 0x33
	.long	.LASF88
	.byte	0x5
	.byte	0x56
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__entry_shift_inc
	.uleb128 0x33
	.long	.LASF89
	.byte	0x5
	.byte	0x57
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__entry_shift_dec
	.uleb128 0x33
	.long	.LASF90
	.byte	0x5
	.byte	0x5a
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__move_cursor_left
	.uleb128 0x33
	.long	.LASF91
	.byte	0x5
	.byte	0x5b
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__move_cursor_right
	.uleb128 0x33
	.long	.LASF92
	.byte	0x5
	.byte	0x5c
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__move_display_left
	.uleb128 0x33
	.long	.LASF93
	.byte	0x5
	.byte	0x5d
	.long	0xa39
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__commands__move_display_right
	.uleb128 0x33
	.long	.LASF94
	.byte	0x6
	.byte	0x29
	.long	0x1ad
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_10msGP262__crystal_hertzX
	.uleb128 0x33
	.long	.LASF95
	.byte	0x6
	.byte	0x2a
	.long	0x1ad
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_10msGP262__micro_secondsX
	.uleb128 0x33
	.long	.LASF96
	.byte	0x6
	.byte	0x29
	.long	0x1ad
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_5msGP393__crystal_hertzX
	.uleb128 0x33
	.long	.LASF97
	.byte	0x6
	.byte	0x2a
	.long	0x1ad
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_5msGP393__micro_secondsX
	.uleb128 0x33
	.long	.LASF98
	.byte	0x6
	.byte	0x29
	.long	0x1ad
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_1msGP522__crystal_hertzX
	.uleb128 0x33
	.long	.LASF99
	.byte	0x6
	.byte	0x2a
	.long	0x1ad
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_1msGP522__micro_secondsX
	.uleb128 0x33
	.long	.LASF100
	.byte	0x6
	.byte	0x29
	.long	0x1ad
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_64usGP651__crystal_hertzX
	.uleb128 0x33
	.long	.LASF101
	.byte	0x6
	.byte	0x2a
	.long	0x1ad
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lcd__wait_64usGP651__micro_secondsX
	.uleb128 0x34
	.long	.LASF102
	.byte	0x7
	.word	0x991
	.long	0xe73
	.byte	0x1
	.byte	0x25
	.uleb128 0x15
	.long	0xe78
	.uleb128 0x35
	.byte	0x2
	.long	0xe7e
	.uleb128 0x36
	.long	0x146
	.byte	0x1
	.uleb128 0x34
	.long	.LASF103
	.byte	0x7
	.word	0x8d4
	.long	0xe73
	.byte	0x1
	.byte	0x2b
	.uleb128 0x34
	.long	.LASF104
	.byte	0x7
	.word	0x9b2
	.long	0xe73
	.byte	0x1
	.byte	0x24
	.uleb128 0x34
	.long	.LASF105
	.byte	0x7
	.word	0x8f5
	.long	0xe73
	.byte	0x1
	.byte	0x2a
	.uleb128 0x37
	.byte	0x1
	.long	.LASF114
	.long	0xece
	.byte	0x1
	.byte	0x1
	.long	0xece
	.uleb128 0x38
	.long	0xece
	.uleb128 0x38
	.long	0xed0
	.uleb128 0x38
	.long	0x74
	.byte	0
	.uleb128 0x39
	.byte	0x2
	.uleb128 0xa
	.byte	0x2
	.long	0xed6
	.uleb128 0x3a
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.uleb128 0x2f
	.uleb128 0x5
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0x6
	.uleb128 0x2f
	.uleb128 0x6
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2302
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x22
	.uleb128 0xb
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2302
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x22
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x2f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
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
	.uleb128 0x35
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x26
	.byte	0
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
	.long	.LFB11
	.long	.LCFI15
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI15
	.long	.LCFI16
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI16
	.long	.LCFI17
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI17
	.long	.LCFI18
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI18
	.long	.LCFI19
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI19
	.long	.LCFI20
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI20
	.long	.LCFI21
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI21
	.long	.LCFI22
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI22
	.long	.LCFI23
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 12
	.long	.LCFI23
	.long	.LFE11
	.word	0x2
	.byte	0x8c
	.sleb128 12
	.long	0
	.long	0
.LLST8:
	.long	.LVL15
	.long	.LVL17
	.word	0x1
	.byte	0x68
	.long	.LVL17
	.long	.LFE11
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL15
	.long	.LVL17
	.word	0x1
	.byte	0x66
	.long	.LVL17
	.long	.LVL29
	.word	0x1
	.byte	0x5d
	.long	.LVL29
	.long	.LVL31
	.word	0x1
	.byte	0x66
	.long	.LVL31
	.long	.LFE11
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
.LLST10:
	.long	.LVL16
	.long	.LVL18
	.word	0x1
	.byte	0x68
	.long	.LVL18
	.long	.LVL20
	.word	0x1
	.byte	0x5e
	.long	.LVL20
	.long	.LVL26
	.word	0x1
	.byte	0x68
	.long	.LVL26
	.long	.LVL30
	.word	0x1
	.byte	0x5e
	.long	.LVL30
	.long	.LVL32
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST11:
	.long	.LVL16
	.long	.LVL17
	.word	0x1
	.byte	0x68
	.long	.LVL17
	.long	.LVL18
	.word	0x1
	.byte	0x5e
	.long	.LVL19
	.long	.LVL26
	.word	0x1
	.byte	0x5e
	.long	0
	.long	0
.LLST12:
	.long	.LVL16
	.long	.LVL17
	.word	0x1
	.byte	0x68
	.long	.LVL17
	.long	.LVL18
	.word	0x9
	.byte	0x7e
	.sleb128 0
	.byte	0x88
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.long	.LVL21
	.long	.LVL23
	.word	0x1
	.byte	0x65
	.long	.LVL23
	.long	.LVL24
	.word	0x3
	.byte	0x85
	.sleb128 -48
	.byte	0x9f
	.long	.LVL24
	.long	.LVL25
	.word	0x1
	.byte	0x65
	.long	.LVL25
	.long	.LVL26
	.word	0x9
	.byte	0x7e
	.sleb128 0
	.byte	0x88
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.long	0
	.long	0
.LLST13:
	.long	.LVL16
	.long	.LVL17
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL17
	.long	.LVL27
	.word	0x1
	.byte	0x5f
	.long	.LVL27
	.long	.LVL28
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL28
	.long	.LVL39
	.word	0x1
	.byte	0x5f
	.long	0
	.long	0
.LLST14:
	.long	.LVL30
	.long	.LVL37
	.word	0x1
	.byte	0x5f
	.long	0
	.long	0
.LLST15:
	.long	.LVL33
	.long	.LVL36-1
	.word	0x2
	.byte	0x82
	.sleb128 0
	.long	.LVL36-1
	.long	.LVL37
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 1
	.long	0
	.long	0
.LLST16:
	.long	.LVL33
	.long	.LVL37
	.word	0x1
	.byte	0x5f
	.long	0
	.long	0
.LLST17:
	.long	.LVL34
	.long	.LVL35
	.word	0x1
	.byte	0x68
	.long	.LVL35
	.long	.LVL36-1
	.word	0x1
	.byte	0x65
	.long	0
	.long	0
.LLST18:
	.long	.LFB12
	.long	.LCFI24
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI24
	.long	.LCFI25
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI25
	.long	.LCFI26
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI26
	.long	.LCFI27
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI27
	.long	.LCFI28
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI28
	.long	.LCFI29
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI29
	.long	.LCFI30
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI30
	.long	.LCFI31
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI31
	.long	.LCFI32
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 12
	.long	.LCFI32
	.long	.LFE12
	.word	0x2
	.byte	0x8c
	.sleb128 12
	.long	0
	.long	0
.LLST19:
	.long	.LVL40
	.long	.LVL42
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL42
	.long	.LFE12
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST20:
	.long	.LVL40
	.long	.LVL42
	.word	0x1
	.byte	0x66
	.long	.LVL42
	.long	.LVL57
	.word	0x1
	.byte	0x6e
	.long	.LVL57
	.long	.LFE12
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
.LLST21:
	.long	.LVL41
	.long	.LVL42
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL42
	.long	.LVL43
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL43
	.long	.LVL45
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL45
	.long	.LVL51
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL51
	.long	.LVL55
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST22:
	.long	.LVL41
	.long	.LVL42
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL44
	.long	.LVL46
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST23:
	.long	.LVL41
	.long	.LVL42
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL46
	.long	.LVL48
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL49
	.long	.LVL50
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST24:
	.long	.LVL41
	.long	.LVL42
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL42
	.long	.LVL52
	.word	0x1
	.byte	0x5f
	.long	.LVL52
	.long	.LVL53
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL53
	.long	.LVL62
	.word	0x1
	.byte	0x5f
	.long	0
	.long	0
.LLST25:
	.long	.LVL54
	.long	.LVL60
	.word	0x1
	.byte	0x5f
	.long	0
	.long	0
.LLST26:
	.long	.LVL56
	.long	.LVL59-1
	.word	0x2
	.byte	0x82
	.sleb128 0
	.long	.LVL59-1
	.long	.LVL60
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 1
	.long	0
	.long	0
.LLST27:
	.long	.LVL56
	.long	.LVL60
	.word	0x1
	.byte	0x5f
	.long	0
	.long	0
.LLST28:
	.long	.LVL57
	.long	.LVL58
	.word	0x1
	.byte	0x68
	.long	.LVL58
	.long	.LVL59-1
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST29:
	.long	.LFB13
	.long	.LCFI33
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI33
	.long	.LCFI34
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI34
	.long	.LCFI35
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI35
	.long	.LCFI36
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI36
	.long	.LCFI37
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI37
	.long	.LCFI38
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI38
	.long	.LCFI39
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI39
	.long	.LCFI40
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI40
	.long	.LCFI41
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 10
	.long	.LCFI41
	.long	.LCFI42
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 11
	.long	.LCFI42
	.long	.LCFI43
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 12
	.long	.LCFI43
	.long	.LCFI44
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 13
	.long	.LCFI44
	.long	.LCFI45
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 14
	.long	.LCFI45
	.long	.LCFI46
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 15
	.long	.LCFI46
	.long	.LCFI47
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 16
	.long	.LCFI47
	.long	.LCFI48
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 17
	.long	.LCFI48
	.long	.LCFI49
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 18
	.long	.LCFI49
	.long	.LCFI50
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 19
	.long	.LCFI50
	.long	.LCFI51
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 24
	.long	.LCFI51
	.long	.LFE13
	.word	0x2
	.byte	0x8c
	.sleb128 24
	.long	0
	.long	0
.LLST30:
	.long	.LVL63
	.long	.LVL65
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
	.long	.LVL65
	.long	.LFE13
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
.LLST31:
	.long	.LVL63
	.long	.LVL65
	.word	0x1
	.byte	0x64
	.long	.LVL65
	.long	.LVL86
	.word	0x1
	.byte	0x58
	.long	.LVL86
	.long	.LFE13
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x64
	.byte	0x9f
	.long	0
	.long	0
.LLST32:
	.long	.LVL64
	.long	.LVL65
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
	.long	.LVL67
	.long	.LVL69
	.word	0xc
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL69
	.long	.LVL73
	.word	0xc
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x57
	.byte	0x93
	.uleb128 0x1
	.long	.LVL74
	.long	.LVL85
	.word	0xc
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST33:
	.long	.LVL64
	.long	.LVL65
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
	.long	.LVL68
	.long	.LVL70
	.word	0xc
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST34:
	.long	.LVL64
	.long	.LVL65
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
	.long	.LVL65
	.long	.LVL66
	.word	0xc
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL66
	.long	.LVL67
	.word	0xc
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL71
	.long	.LVL74
	.word	0xc
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST35:
	.long	.LVL64
	.long	.LVL65
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL65
	.long	.LVL75
	.word	0x1
	.byte	0x61
	.long	.LVL75
	.long	.LVL76
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL76
	.long	.LVL84
	.word	0x1
	.byte	0x61
	.long	0
	.long	0
.LLST36:
	.long	.LVL77
	.long	.LVL82
	.word	0x1
	.byte	0x61
	.long	0
	.long	0
.LLST37:
	.long	.LVL78
	.long	.LVL81-1
	.word	0x2
	.byte	0x82
	.sleb128 0
	.long	.LVL81-1
	.long	.LVL82
	.word	0x2
	.byte	0x74
	.sleb128 1
	.long	0
	.long	0
.LLST38:
	.long	.LVL78
	.long	.LVL82
	.word	0x1
	.byte	0x61
	.long	0
	.long	0
.LLST39:
	.long	.LVL79
	.long	.LVL80
	.word	0x1
	.byte	0x57
	.long	.LVL80
	.long	.LVL81-1
	.word	0x1
	.byte	0x69
	.long	.LVL81-1
	.long	.LVL82
	.word	0x1
	.byte	0x57
	.long	0
	.long	0
.LLST40:
	.long	.LFB14
	.long	.LCFI52
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI52
	.long	.LFE14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST41:
	.long	.LVL87
	.long	.LVL89
	.word	0x1
	.byte	0x68
	.long	.LVL89
	.long	.LVL92
	.word	0x1
	.byte	0x6c
	.long	.LVL92
	.long	.LVL93
	.word	0x1
	.byte	0x68
	.long	.LVL93
	.long	.LVL94
	.word	0x1
	.byte	0x6c
	.long	.LVL94
	.long	.LFE14
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST42:
	.long	.LVL88
	.long	.LVL89
	.word	0x4
	.byte	0x88
	.sleb128 0
	.byte	0x1f
	.byte	0x9f
	.long	.LVL89
	.long	.LVL91
	.word	0x4
	.byte	0x8c
	.sleb128 0
	.byte	0x1f
	.byte	0x9f
	.long	.LVL91
	.long	.LVL95-1
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST43:
	.long	.LFB15
	.long	.LCFI53
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI53
	.long	.LCFI54
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI54
	.long	.LFE15
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST44:
	.long	.LVL96
	.long	.LVL98
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL98
	.long	.LVL101
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL101
	.long	.LVL102
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL102
	.long	.LVL103
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL103
	.long	.LFE15
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST45:
	.long	.LVL97
	.long	.LVL98
	.word	0x4
	.byte	0x88
	.sleb128 0
	.byte	0x1f
	.byte	0x9f
	.long	.LVL98
	.long	.LVL100
	.word	0x4
	.byte	0x8c
	.sleb128 0
	.byte	0x1f
	.byte	0x9f
	.long	.LVL100
	.long	.LVL104-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST46:
	.long	.LFB16
	.long	.LCFI55
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI55
	.long	.LCFI56
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI56
	.long	.LCFI57
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI57
	.long	.LCFI58
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI58
	.long	.LFE16
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	0
	.long	0
.LLST47:
	.long	.LVL105
	.long	.LVL107
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
	.long	.LVL107
	.long	.LVL112
	.word	0xc
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL112
	.long	.LFE16
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
.LLST48:
	.long	.LVL106
	.long	.LVL107
	.word	0x4
	.byte	0x86
	.sleb128 0
	.byte	0x1f
	.byte	0x9f
	.long	.LVL107
	.long	.LVL109
	.word	0x4
	.byte	0x7c
	.sleb128 0
	.byte	0x1f
	.byte	0x9f
	.long	.LVL109
	.long	.LVL110
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
	.long	.LVL110
	.long	.LVL111
	.word	0xc
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL111
	.long	.LVL113-1
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
	.long	0
	.long	0
.LLST49:
	.long	.LVL114
	.long	.LVL115-1
	.word	0x1
	.byte	0x68
	.long	.LVL115-1
	.long	.LFE17
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST50:
	.long	.LVL125
	.long	.LVL126
	.word	0x1
	.byte	0x68
	.long	.LVL126
	.long	.LVL127
	.word	0x4
	.byte	0x88
	.sleb128 -127
	.byte	0x9f
	.long	.LVL127
	.long	.LVL128
	.word	0x1
	.byte	0x68
	.long	.LVL128
	.long	.LFE20
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST51:
	.long	.LVL125
	.long	.LVL129-1
	.word	0x1
	.byte	0x66
	.long	.LVL129-1
	.long	.LFE20
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0xb4
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
	.long	.LFB13
	.long	.LFE13-.LFB13
	.long	.LFB14
	.long	.LFE14-.LFB14
	.long	.LFB15
	.long	.LFE15-.LFB15
	.long	.LFB16
	.long	.LFE16-.LFB16
	.long	.LFB17
	.long	.LFE17-.LFB17
	.long	.LFB18
	.long	.LFE18-.LFB18
	.long	.LFB8
	.long	.LFE8-.LFB8
	.long	.LFB19
	.long	.LFE19-.LFB19
	.long	.LFB20
	.long	.LFE20-.LFB20
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
	.long	.LFB13
	.long	.LFE13
	.long	.LFB14
	.long	.LFE14
	.long	.LFB15
	.long	.LFE15
	.long	.LFB16
	.long	.LFE16
	.long	.LFB17
	.long	.LFE17
	.long	.LFB18
	.long	.LFE18
	.long	.LFB8
	.long	.LFE8
	.long	.LFB19
	.long	.LFE19
	.long	.LFB20
	.long	.LFE20
	.long	.LFB0
	.long	.LFE0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF62:
	.string	"lcd__put__TbufS__5___XA"
.LASF20:
	.string	"avr__Tbit_numberB"
.LASF50:
	.string	"lcd__put__B_6__TTtempSP1__4___U"
.LASF10:
	.string	"interfaces__integer_8"
.LASF76:
	.string	"lcd__commands__home"
.LASF3:
	.string	"P_ARRAY"
.LASF48:
	.string	"lcd__put__B_3__TTtempSP1__3___XDL_1"
.LASF5:
	.string	"interfaces__unsigned_16"
.LASF90:
	.string	"lcd__commands__move_cursor_left"
.LASF16:
	.string	"lcd__Tchar_positionB"
.LASF101:
	.string	"lcd__wait_64usGP651__micro_secondsX"
.LASF98:
	.string	"lcd__wait_1msGP522__crystal_hertzX"
.LASF40:
	.string	"temp"
.LASF70:
	.string	"lcd__command"
.LASF1:
	.string	"sizetype"
.LASF85:
	.string	"lcd__commands__display_on_cursor_blink"
.LASF105:
	.string	"avr__atmega328p__ddrd_bits"
.LASF34:
	.string	"lcd__put__2"
.LASF37:
	.string	"lcd__put__3"
.LASF110:
	.string	"interfaces__integer_16"
.LASF58:
	.string	"lcd__put__5"
.LASF0:
	.string	"interfaces__unsigned_8"
.LASF11:
	.string	"lcd__command_type"
.LASF69:
	.string	"lcd__put__8"
.LASF113:
	.string	"lcd___elabb"
.LASF114:
	.string	"memcpy"
.LASF43:
	.string	"avr__bits_in_byte___XP1"
.LASF107:
	.string	"/home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/lcd.adb"
.LASF74:
	.string	"lcd__gotoxy"
.LASF9:
	.string	"interfaces__Tinteger_32B"
.LASF88:
	.string	"lcd__commands__entry_shift_inc"
.LASF22:
	.string	"system__address"
.LASF13:
	.string	"lcd__line_position___XDLU_1__2"
.LASF57:
	.string	"lcd__put__B_6__TTtempSP1__4___XDL_1"
.LASF30:
	.string	"lcd__toggle_enable"
.LASF71:
	.string	"lcd__clear_screen"
.LASF93:
	.string	"lcd__commands__move_display_right"
.LASF49:
	.string	"lcd__put__4"
.LASF67:
	.string	"lcd__put__6"
.LASF68:
	.string	"lcd__put__7"
.LASF31:
	.string	"lcd__output"
.LASF7:
	.string	"interfaces__Tinteger_8B"
.LASF15:
	.string	"lcd__char_position___XDLU_1__16"
.LASF24:
	.string	"cycles_to_wait"
.LASF54:
	.string	"lcd__put__TTbufSP1__4___XDLU_0__0"
.LASF91:
	.string	"lcd__commands__move_cursor_right"
.LASF77:
	.string	"lcd__commands__mode_4bit_1line"
.LASF39:
	.string	"lcd__put__B_3__TTtempSP1__3___U"
.LASF66:
	.string	"lcd__put__B_9__TTtempSP1__5___XDL_1"
.LASF73:
	.string	"lcd__home"
.LASF26:
	.string	"lcd__wait_1ms"
.LASF46:
	.string	"lcd__put__TbufS__3___XA"
.LASF72:
	.string	"lcd__init"
.LASF35:
	.string	"lcd__put__2__L_1__T30b___L"
.LASF2:
	.string	"character"
.LASF47:
	.string	"lcd__put__B_3__TtempS__3___XA"
.LASF4:
	.string	"P_BOUNDS"
.LASF19:
	.string	"avr__bits_in_byte___XP1___JM"
.LASF17:
	.string	"system__unsigned_types__short_short_unsigned"
.LASF52:
	.string	"lcd__put__TbufS__4"
.LASF61:
	.string	"lcd__put__TbufS__5"
.LASF64:
	.string	"lcd__put__B_9__TtempS__5"
.LASF33:
	.string	"lcd__put"
.LASF80:
	.string	"lcd__commands__mode_8bit_2line"
.LASF53:
	.string	"lcd__put__TbufS__4___XA"
.LASF8:
	.string	"interfaces__Tinteger_16B"
.LASF83:
	.string	"lcd__commands__display_on_blink"
.LASF23:
	.string	"cycle_length"
.LASF104:
	.string	"avr__atmega328p__ddrb_bits"
.LASF36:
	.string	"lcd__put__2__L_1__T30b___U"
.LASF79:
	.string	"lcd__commands__mode_8bit_1line"
.LASF32:
	.string	"is_data"
.LASF92:
	.string	"lcd__commands__move_display_left"
.LASF56:
	.string	"lcd__put__B_6__TtempS__4___XA"
.LASF6:
	.string	"interfaces__unsigned_32"
.LASF42:
	.string	"lcd__put__TTbufSP1__3___XDLU_0__0"
.LASF44:
	.string	"lcd__put__TbufS__3"
.LASF81:
	.string	"lcd__commands__display_off"
.LASF63:
	.string	"lcd__put__TTbufSP1__5___XDLU_0__0"
.LASF25:
	.string	"long_long_integer"
.LASF99:
	.string	"lcd__wait_1msGP522__micro_secondsX"
.LASF86:
	.string	"lcd__commands__entry_inc"
.LASF51:
	.string	"lcd__put__4__B_6__L_7__T47b___U"
.LASF100:
	.string	"lcd__wait_64usGP651__crystal_hertzX"
.LASF111:
	.string	"interfaces__integer_32"
.LASF60:
	.string	"lcd__put__5__B_9__L_10__T60b___U"
.LASF65:
	.string	"lcd__put__B_9__TtempS__5___XA"
.LASF94:
	.string	"lcd__wait_10msGP262__crystal_hertzX"
.LASF102:
	.string	"avr__atmega328p__portb_bits"
.LASF41:
	.string	"lcd__put__3__B_3__L_4__T34b___U"
.LASF82:
	.string	"lcd__commands__display_on"
.LASF14:
	.string	"lcd__Tline_positionB"
.LASF59:
	.string	"lcd__put__B_9__TTtempSP1__5___U"
.LASF28:
	.string	"lcd__wait_5ms"
.LASF45:
	.string	"lcd__put__B_3__TtempS__3"
.LASF108:
	.string	"avr__strings__avr_string___XUA"
.LASF18:
	.string	"avr__strings__avr_string___XUB"
.LASF106:
	.string	"GNU Ada 4.7.0"
.LASF96:
	.string	"lcd__wait_5msGP393__crystal_hertzX"
.LASF87:
	.string	"lcd__commands__entry_dec"
.LASF89:
	.string	"lcd__commands__entry_shift_dec"
.LASF112:
	.string	"OBJECT"
.LASF109:
	.string	"avr__strings__avr_string___XUP"
.LASF97:
	.string	"lcd__wait_5msGP393__micro_secondsX"
.LASF12:
	.string	"lcd__Tcommand_typeB"
.LASF55:
	.string	"lcd__put__B_6__TtempS__4"
.LASF78:
	.string	"lcd__commands__mode_4bit_2line"
.LASF103:
	.string	"avr__atmega328p__portd_bits"
.LASF75:
	.string	"lcd__commands__clear"
.LASF38:
	.string	"base"
.LASF84:
	.string	"lcd__commands__display_on_cursor"
.LASF29:
	.string	"lcd__wait_64us"
.LASF95:
	.string	"lcd__wait_10msGP262__micro_secondsX"
.LASF21:
	.string	"boolean"
.LASF27:
	.string	"lcd__wait_10ms"
	.ident	"GCC: (GNU) 4.7.0"
.global __do_copy_data
