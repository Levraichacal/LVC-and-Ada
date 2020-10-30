	.file	"temperatures.adb"
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
 ;  -gnatec=/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/objects/GNAT-TEMP-000001.TMP
 ;  -gnatec=/opt/avrada/avr/lib/gnat/gnat.adc -gdwarf-2 -gnatwp -gnatwu
 ;  -gnatn -gnatp -gnatVn -gnatef -gnatdY -mmcu=atmega328p
 ;  -gnateDMCU=atmega328p -gnateDUART=usart0 -gnaty3abefhiklM130prn -gnatA
 ;  -gnatem=/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/objects/GNAT-TEMP-000002.TMP
 ;  -gnatez
 ;  /home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/temperatures.adb
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
	.section	.text.temperatures__to_temperature_12bit,"ax",@progbits
.global	temperatures__to_temperature_12bit
	.type	temperatures__to_temperature_12bit, @function
temperatures__to_temperature_12bit:
.LFB2:
	.file 1 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/temperatures.adb"
	.loc 1 41 0
.LVL0:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 45 0
	ret
.LFE2:
	.size	temperatures__to_temperature_12bit, .-temperatures__to_temperature_12bit
	.section	.text.temperatures__to_temperature_9bit,"ax",@progbits
.global	temperatures__to_temperature_9bit
	.type	temperatures__to_temperature_9bit, @function
temperatures__to_temperature_9bit:
.LFB3:
	.loc 1 47 0
.LVL1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 51 0
	ret
.LFE3:
	.size	temperatures__to_temperature_9bit, .-temperatures__to_temperature_9bit
	.section	.text.temperatures__image,"ax",@progbits
.global	temperatures__image
	.type	temperatures__image, @function
temperatures__image:
.LFB4:
	.loc 1 57 0
.LVL2:
	push r14	 ; 
.LCFI0:
	push r15	 ; 
.LCFI1:
	push r16	 ; 
.LCFI2:
	push r17	 ; 
.LCFI3:
	push r28	 ; 
.LCFI4:
	push r29	 ; 
.LCFI5:
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
.LCFI6:
	sbiw r28,10	 ; ,
.LCFI7:
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
/* prologue: function */
/* frame size = 10 */
/* stack size = 16 */
.L__stack_usage = 16
	movw r16,r24	 ;  value, value
	.loc 1 60 0
	mov r14,r17	 ;  is_negative,
	rol r14	 ;  is_negative
	clr r14	 ;  is_negative
	rol r14	 ;  is_negative
.LVL3:
	.loc 1 64 0
	breq .L4	 ; ,
	.loc 1 65 0
	clr r24	 ;  tmp61
	clr r25	 ;  tmp61
	sub r24,r16	 ;  tmp61, value
	sbc r25,r17	 ;  tmp61, value
.LVL4:
	rjmp .L11	 ; 
.L4:
.L11:
	.loc 1 67 0
	lsr r25	 ;  tmp62
	ror r24	 ;  tmp62
	mov r15,r24	 ;  d, tmp62
.LVL5:
	.loc 1 70 0
	std Y+6,__zero_reg__	 ;  MEM[(character[1:5] *)&img],
	std Y+7,__zero_reg__	 ;  MEM[(character[1:5] *)&img + 1B],
	ldd r20,Y+6	 ;  img, img
	ldd r21,Y+7	 ;  img, img
	ldd r22,Y+8	 ;  img, img
	call avr__int_img__u8_img_right	 ; 
.LVL6:
	std Y+8,r24	 ;  img, tmp94
	mov r24,r23	 ;  img$1, tmp93
.LVL7:
	.loc 1 72 0
	tst r14	 ;  is_negative
	breq .L6	 ; ,
	.loc 1 73 0
	ldi r25,lo8(9)	 ; ,
	cp r25,r15	 ; , d
	brsh .L9	 ; ,
	.loc 1 74 0
	ldi r22,lo8(45)	 ;  img$1,
.LVL8:
	rjmp .L6	 ; 
.LVL9:
.L9:
	.loc 1 76 0
	ldi r24,lo8(45)	 ;  img$2,
.LVL10:
.L6:
	.loc 1 83 0
	sbrs r16,0	 ;  value,
	rjmp .L10	 ; 
	.loc 1 84 0
	ldi r16,lo8(53)	 ;  img$5,
.LVL11:
	rjmp .L7	 ; 
.LVL12:
.L10:
	.loc 1 86 0
	ldi r16,lo8(48)	 ;  img$5,
.LVL13:
.L7:
	.loc 1 89 0
	std Y+6,r22	 ;  MEM[(character[1:5] *)&img], img$1
	std Y+7,r24	 ;  MEM[(character[1:5] *)&img + 1B], img$2
	ldi r17,lo8(46)	 ;  tmp66,
	std Y+9,r17	 ;  MEM[(character[1:5] *)&img + 3B], tmp66
	std Y+10,r16	 ;  MEM[(character[1:5] *)&img + 4B], img$5
	ldi r18,lo8(5)	 ;  tmp67,
	movw r30,r28	 ; ,
	adiw r30,6	 ; ,
	movw r26,r28	 ; ,
	adiw r26,1	 ; ,
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r18	 ;  tmp67
	brne 0b
	ldd r18,Y+1	 ;  tmp68,
	ldd r19,Y+2	 ;  tmp69,
	ldd r20,Y+3	 ;  tmp70,
	ldd r21,Y+4	 ;  tmp71,
	ldd r22,Y+5	 ;  tmp72,
.LVL14:
	.loc 1 90 0
	ldi r23,0	 ; 
	ldi r24,0	 ; 
.LVL15:
	ldi r25,0	 ; 
/* epilogue start */
	adiw r28,10	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
.LVL16:
	pop r15	 ; 
.LVL17:
	pop r14	 ; 
.LVL18:
	ret
.LFE4:
	.size	temperatures__image, .-temperatures__image
	.section	.text.temperatures__image__2,"ax",@progbits
.global	temperatures__image__2
	.type	temperatures__image__2, @function
temperatures__image__2:
.LFB5:
	.loc 1 94 0
.LVL19:
	push r14	 ; 
.LCFI8:
	push r15	 ; 
.LCFI9:
	push r16	 ; 
.LCFI10:
	push r17	 ; 
.LCFI11:
	push r28	 ; 
.LCFI12:
	push r29	 ; 
.LCFI13:
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
.LCFI14:
	sbiw r28,10	 ; ,
.LCFI15:
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
/* prologue: function */
/* frame size = 10 */
/* stack size = 16 */
.L__stack_usage = 16
	movw r16,r24	 ;  value, value
	.loc 1 97 0
	mov r14,r17	 ;  is_negative,
	rol r14	 ;  is_negative
	clr r14	 ;  is_negative
	rol r14	 ;  is_negative
.LVL20:
	.loc 1 101 0
	breq .L13	 ; ,
	.loc 1 102 0
	clr r24	 ;  tmp73
	clr r25	 ;  tmp73
	sub r24,r16	 ;  tmp73, value
	sbc r25,r17	 ;  tmp73, value
.LVL21:
	rjmp .L20	 ; 
.L13:
.L20:
	.loc 1 104 0
	ldi r19,4	 ; ,
	1:
	lsr r25	 ;  tmp74
	ror r24	 ;  tmp74
	dec r19	 ; 
	brne 1b
	mov r15,r24	 ;  d, tmp74
.LVL22:
	.loc 1 107 0
	std Y+6,__zero_reg__	 ;  MEM[(character[1:5] *)&img],
	std Y+7,__zero_reg__	 ;  MEM[(character[1:5] *)&img + 1B],
	ldd r20,Y+6	 ;  img, img
	ldd r21,Y+7	 ;  img, img
	ldd r22,Y+8	 ;  img, img
	call avr__int_img__u8_img_right	 ; 
.LVL23:
	std Y+8,r24	 ;  img, tmp114
	mov r24,r23	 ;  img$1, tmp113
.LVL24:
	.loc 1 109 0
	tst r14	 ;  is_negative
	breq .L15	 ; ,
	.loc 1 110 0
	ldi r25,lo8(9)	 ; ,
	cp r25,r15	 ; , d
	brlo .L16	 ; ,
	.loc 1 113 0
	ldi r24,lo8(45)	 ;  img$2,
	rjmp .L17	 ; 
.L16:
	.loc 1 111 0
	ldi r22,lo8(45)	 ;  img$1,
.LVL25:
.L17:
	.loc 1 121 0
	neg r16	 ;  d
.LVL26:
.L15:
	.loc 1 123 0
	andi r16,lo8(15)	 ;  d,
.LVL27:
	.loc 1 128 0
	std Y+6,r22	 ;  MEM[(character[1:5] *)&img], img$1
	std Y+7,r24	 ;  MEM[(character[1:5] *)&img + 1B], img$2
	ldi r17,lo8(46)	 ;  tmp77,
	std Y+9,r17	 ;  MEM[(character[1:5] *)&img + 3B], tmp77
	.loc 1 126 0
	lsl r16	 ;  tmp79
.LVL28:
	mov r18,r16	 ;  tmp84, tmp79
	lsl r18	 ;  tmp84
	lsl r18	 ;  tmp84
	add r18,r16	 ;  tmp84, tmp79
	subi r18,lo8(-(8))	 ;  tmp84,
	swap r18	 ;  tmp84
	andi r18,lo8(15)	 ;  tmp84,
	subi r18,lo8(-(48))	 ;  tmp84,
	.loc 1 128 0
	std Y+10,r18	 ;  MEM[(character[1:5] *)&img + 4B], tmp84
	ldi r16,lo8(5)	 ;  tmp85,
	movw r30,r28	 ; ,
	adiw r30,6	 ; ,
	movw r26,r28	 ; ,
	adiw r26,1	 ; ,
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r16	 ;  tmp85
	brne 0b
	ldd r18,Y+1	 ;  tmp86,
	ldd r19,Y+2	 ;  tmp87,
	ldd r20,Y+3	 ;  tmp88,
	ldd r21,Y+4	 ;  tmp89,
	ldd r22,Y+5	 ;  tmp90,
.LVL29:
	.loc 1 129 0
	ldi r23,0	 ; 
	ldi r24,0	 ; 
.LVL30:
	ldi r25,0	 ; 
/* epilogue start */
	adiw r28,10	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
.LVL31:
	ret
.LFE5:
	.size	temperatures__image__2, .-temperatures__image__2
	.section	.text.temperatures__image_full,"ax",@progbits
.global	temperatures__image_full
	.type	temperatures__image_full, @function
temperatures__image_full:
.LFB6:
	.loc 1 133 0
.LVL32:
	push r16	 ; 
.LCFI16:
	push r17	 ; 
.LCFI17:
	push r28	 ; 
.LCFI18:
	push r29	 ; 
.LCFI19:
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
.LCFI20:
	sbiw r28,16	 ; ,
.LCFI21:
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
/* prologue: function */
/* frame size = 16 */
/* stack size = 20 */
.L__stack_usage = 20
	movw r16,r24	 ; ,
	.loc 1 141 0
	call temperatures__image__2	 ; 
.LVL33:
	std Y+9,r18	 ;  img, tmp130
	std Y+10,r19	 ;  img, tmp131
	std Y+11,r20	 ;  img, tmp132
	std Y+12,r21	 ;  img, tmp133
	std Y+13,r22	 ;  img, tmp134
	.loc 1 143 0
	movw r18,r16	 ; ,
	sbrs r17,7	 ;  value,
	rjmp .L22	 ; 
	neg r19	 ;  value
	neg r18	 ;  value
	sbc r19,__zero_reg__	 ;  value
.L22:
	andi r18,lo8(15)	 ;  d,
.LVL34:
	movw r30,r28	 ;  ivtmp.56,
	adiw r30,13	 ;  ivtmp.56,
	.loc 1 133 0
	movw r24,r28	 ;  D.1656,
	adiw r24,17	 ;  D.1656,
	.loc 1 145 0
	ldi r17,0	 ;  di
.LVL35:
.L23:
.LBB2:
	.loc 1 147 0 discriminator 1
	ldi r20,lo8(16)	 ; ,
	mul r17,r20	 ;  di,
	sub r18,r0	 ;  d
	clr __zero_reg__
.LVL36:
	mov r19,r18	 ;  tmp105, d
	lsl r19	 ;  tmp105
	mov r18,r19	 ;  d, tmp105
	lsl r18	 ;  d
	lsl r18	 ;  d
	add r18,r19	 ;  d, tmp105
.LVL37:
	.loc 1 148 0 discriminator 1
	mov r17,r18	 ;  di, d
.LVL38:
	swap r17	 ;  di
	andi r17,lo8(15)	 ;  di,
.LVL39:
	.loc 1 149 0 discriminator 1
	mov r21,r17	 ;  tmp108, di
	subi r21,lo8(-(48))	 ;  tmp108,
	st Z+,r21	 ;  MEM[base: D.1654_38, offset: 0B], tmp108
	.loc 1 146 0 discriminator 1
	cp r30,r24	 ;  ivtmp.56, D.1656
	cpc r31,r25	 ;  ivtmp.56, D.1656
	brne .L23	 ; ,
.LBE2:
	.loc 1 152 0
	ldi r18,lo8(8)	 ;  tmp109,
.LVL40:
	movw r30,r28	 ; ,
	adiw r30,9	 ; ,
	movw r26,r28	 ; ,
	adiw r26,1	 ; ,
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r18	 ;  tmp109
	brne 0b
	ldd r18,Y+1	 ;  tmp110,
	ldd r19,Y+2	 ;  tmp111,
.LVL41:
	ldd r20,Y+3	 ;  tmp112,
	ldd r21,Y+4	 ;  tmp113,
	ldd r22,Y+5	 ;  tmp114,
	ldd r23,Y+6	 ;  tmp115,
	.loc 1 153 0
	ldd r24,Y+7	 ; ,
	ldd r25,Y+8	 ; ,
/* epilogue start */
	adiw r28,16	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
.LVL42:
	pop r16	 ; 
.LVL43:
	ret
.LFE6:
	.size	temperatures__image_full, .-temperatures__image_full
.global	temperatures_E
	.section	.data.temperatures_E,"aw",@progbits
	.type	temperatures_E, @object
	.size	temperatures_E, 2
temperatures_E:
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
	.byte	0x4
	.long	.LCFI0-.LFB4
	.byte	0xe
	.uleb128 0x3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x4
	.byte	0x8f
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x5
	.byte	0x90
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x6
	.byte	0x91
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x7
	.byte	0x9c
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x8
	.byte	0x9d
	.uleb128 0x7
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xd
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x12
	.p2align	2
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB5
	.long	.LFE5-.LFB5
	.byte	0x4
	.long	.LCFI8-.LFB5
	.byte	0xe
	.uleb128 0x3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x4
	.byte	0x8f
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x5
	.byte	0x90
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x6
	.byte	0x91
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x7
	.byte	0x9c
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x8
	.byte	0x9d
	.uleb128 0x7
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xd
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x12
	.p2align	2
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB6
	.long	.LFE6-.LFB6
	.byte	0x4
	.long	.LCFI16-.LFB6
	.byte	0xe
	.uleb128 0x3
	.byte	0x90
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x4
	.byte	0x91
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x5
	.byte	0x9c
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x6
	.byte	0x9d
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0xd
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x16
	.p2align	2
.LEFDE8:
	.text
.Letext0:
	.file 2 "/opt/avrada/avr/lib/gnat/avr_lib/avr-strings.ads"
	.file 3 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/temperatures.ads"
	.file 4 "/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adainclude/interfac.ads"
	.file 5 "/opt/avrada/avr/lib/gnat/avr_lib/avr-int_img.ads"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x36d
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF20
	.byte	0xd
	.long	.LASF21
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.word	0xff92
	.byte	0xfa
	.long	.LASF22
	.long	0x31
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF0
	.byte	0x1
	.uleb128 0x4
	.word	0xfc90
	.word	0x7d0
	.long	.LASF23
	.long	0x46
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.byte	0x1
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.byte	0x1
	.byte	0x7
	.long	.LASF3
	.uleb128 0x6
	.long	.LASF24
	.byte	0x2
	.byte	0x4
	.byte	0x35
	.byte	0x1
	.long	0x86
	.uleb128 0x7
	.string	"LB0"
	.byte	0x2
	.byte	0x21
	.long	0x55
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.string	"UB0"
	.byte	0x2
	.byte	0x21
	.long	0x55
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0
	.uleb128 0x8
	.long	.LASF8
	.byte	0x2
	.byte	0x21
	.long	0x91
	.uleb128 0x9
	.long	.LASF8
	.long	0xab
	.long	0xa4
	.uleb128 0xa
	.long	0xa4
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0xb
	.long	.LASF25
	.byte	0x4
	.byte	0x2
	.byte	0x21
	.long	0xdb
	.uleb128 0xc
	.long	.LASF6
	.byte	0x2
	.byte	0x21
	.long	0xdb
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xc
	.long	.LASF7
	.byte	0x2
	.byte	0x21
	.long	0xe1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0xd
	.byte	0x2
	.long	0x86
	.uleb128 0xd
	.byte	0x2
	.long	0x5c
	.uleb128 0x8
	.long	.LASF9
	.byte	0x2
	.byte	0x2b
	.long	0xf2
	.uleb128 0xe
	.long	.LASF9
	.long	0xab
	.long	0xb2
	.long	0x10b
	.uleb128 0xf
	.long	0xa4
	.byte	0x1
	.byte	0x5
	.byte	0
	.uleb128 0x8
	.long	.LASF10
	.byte	0x2
	.byte	0x2e
	.long	0x116
	.uleb128 0xe
	.long	.LASF10
	.long	0xab
	.long	0xb2
	.long	0x12f
	.uleb128 0xf
	.long	0xa4
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0x10
	.byte	0
	.byte	0xff
	.long	.LASF26
	.long	0x55
	.uleb128 0x8
	.long	.LASF11
	.byte	0x2
	.byte	0x29
	.long	0x145
	.uleb128 0xe
	.long	.LASF11
	.long	0xab
	.long	0xb2
	.long	0x15e
	.uleb128 0xf
	.long	0xa4
	.byte	0x1
	.byte	0x3
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.byte	0x29
	.long	0x39
	.long	.LFB2
	.long	.LFE2
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x18e
	.uleb128 0x12
	.string	"raw"
	.byte	0x3
	.byte	0x30
	.long	0x18e
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0
	.uleb128 0x13
	.long	0x4e
	.uleb128 0x11
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0x2f
	.long	0x25
	.long	.LFB3
	.long	.LFE3
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x1c3
	.uleb128 0x12
	.string	"raw"
	.byte	0x3
	.byte	0x2f
	.long	0x18e
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x39
	.long	0xe7
	.long	.LFB4
	.long	.LFE4
	.long	.LLST0
	.byte	0x1
	.long	0x23b
	.uleb128 0x15
	.long	.LASF15
	.byte	0x3
	.byte	0x38
	.long	0x23b
	.long	.LLST1
	.uleb128 0x16
	.string	"img"
	.byte	0x1
	.byte	0x3b
	.long	0xe7
	.long	.LLST2
	.uleb128 0x17
	.long	.LASF16
	.byte	0x1
	.byte	0x3c
	.long	0x240
	.long	.LLST3
	.uleb128 0x16
	.string	"d"
	.byte	0x1
	.byte	0x3d
	.long	0x12f
	.long	.LLST4
	.uleb128 0x18
	.long	.LVL6
	.long	0x34f
	.uleb128 0x19
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x19
	.byte	0x9
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x4
	.byte	0x91
	.sleb128 -12
	.byte	0x94
	.byte	0x3
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x25
	.uleb128 0x13
	.long	0x245
	.uleb128 0x5
	.byte	0x1
	.byte	0x2
	.long	.LASF17
	.uleb128 0x14
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.byte	0x5e
	.long	0xe7
	.long	.LFB5
	.long	.LFE5
	.long	.LLST5
	.byte	0x1
	.long	0x2c4
	.uleb128 0x15
	.long	.LASF15
	.byte	0x3
	.byte	0x3b
	.long	0x2c4
	.long	.LLST6
	.uleb128 0x16
	.string	"img"
	.byte	0x1
	.byte	0x60
	.long	0xe7
	.long	.LLST7
	.uleb128 0x17
	.long	.LASF16
	.byte	0x1
	.byte	0x61
	.long	0x240
	.long	.LLST8
	.uleb128 0x16
	.string	"d"
	.byte	0x1
	.byte	0x62
	.long	0x12f
	.long	.LLST9
	.uleb128 0x18
	.long	.LVL23
	.long	0x34f
	.uleb128 0x19
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x19
	.byte	0x9
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x4
	.byte	0x91
	.sleb128 -12
	.byte	0x94
	.byte	0x3
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x39
	.uleb128 0x14
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.byte	0x85
	.long	0x10b
	.long	.LFB6
	.long	.LFE6
	.long	.LLST10
	.byte	0x1
	.long	0x34f
	.uleb128 0x15
	.long	.LASF15
	.byte	0x3
	.byte	0x3e
	.long	0x2c4
	.long	.LLST11
	.uleb128 0x1a
	.string	"img"
	.byte	0x1
	.byte	0x87
	.long	0x10b
	.byte	0x2
	.byte	0x8c
	.sleb128 9
	.uleb128 0x16
	.string	"d"
	.byte	0x1
	.byte	0x88
	.long	0x12f
	.long	.LLST12
	.uleb128 0x16
	.string	"di"
	.byte	0x1
	.byte	0x89
	.long	0x12f
	.long	.LLST13
	.uleb128 0x1b
	.long	.LBB2
	.long	.LBE2
	.long	0x339
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x92
	.long	0x55
	.long	.LLST14
	.byte	0
	.uleb128 0x18
	.long	.LVL33
	.long	0x24c
	.uleb128 0x19
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF27
	.byte	0x5
	.byte	0x2b
	.long	0x13a
	.byte	0x1
	.long	0x36b
	.uleb128 0x1d
	.long	0x36b
	.uleb128 0x1d
	.long	0x13a
	.byte	0
	.uleb128 0x13
	.long	0x55
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.uleb128 0x2f
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2302
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x49
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
	.uleb128 0x12
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
	.uleb128 0xa
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB4
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
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI6
	.long	.LCFI7
	.word	0x2
	.byte	0x8c
	.sleb128 8
	.long	.LCFI7
	.long	.LFE4
	.word	0x2
	.byte	0x8c
	.sleb128 18
	.long	0
	.long	0
.LLST1:
	.long	.LVL2
	.long	.LVL4
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL4
	.long	.LVL11
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL11
	.long	.LVL12
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL12
	.long	.LVL13
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL13
	.long	.LFE4
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LVL7
	.long	.LVL8
	.word	0x8
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x3
	.long	.LVL8
	.long	.LVL9
	.word	0x7
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x3
	.long	.LVL9
	.long	.LVL10
	.word	0x8
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x3
	.long	.LVL10
	.long	.LVL13
	.word	0xf
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.byte	0x8
	.byte	0x2e
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.long	.LVL13
	.long	.LVL14
	.word	0x10
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.byte	0x8
	.byte	0x2e
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.long	.LVL14
	.long	.LVL15
	.word	0x11
	.byte	0x91
	.sleb128 -12
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.byte	0x8
	.byte	0x2e
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.long	.LVL15
	.long	.LVL16
	.word	0x12
	.byte	0x91
	.sleb128 -12
	.byte	0x93
	.uleb128 0x1
	.byte	0x91
	.sleb128 -11
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.byte	0x8
	.byte	0x2e
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.long	.LVL16
	.long	.LFE4
	.word	0x13
	.byte	0x91
	.sleb128 -12
	.byte	0x93
	.uleb128 0x1
	.byte	0x91
	.sleb128 -11
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.byte	0x8
	.byte	0x2e
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x91
	.sleb128 -8
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST3:
	.long	.LVL3
	.long	.LVL18
	.word	0x1
	.byte	0x5e
	.long	0
	.long	0
.LLST4:
	.long	.LVL5
	.long	.LVL17
	.word	0x1
	.byte	0x5f
	.long	0
	.long	0
.LLST5:
	.long	.LFB5
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI12
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI13
	.long	.LCFI14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI14
	.long	.LCFI15
	.word	0x2
	.byte	0x8c
	.sleb128 8
	.long	.LCFI15
	.long	.LFE5
	.word	0x2
	.byte	0x8c
	.sleb128 18
	.long	0
	.long	0
.LLST6:
	.long	.LVL19
	.long	.LVL21
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL21
	.long	.LVL26
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL26
	.long	.LFE5
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST7:
	.long	.LVL24
	.long	.LVL25
	.word	0x8
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x3
	.long	.LVL25
	.long	.LVL26
	.word	0xf
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.byte	0x8
	.byte	0x2e
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.long	.LVL26
	.long	.LVL27
	.word	0xf
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.byte	0x8
	.byte	0x2e
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.long	.LVL27
	.long	.LVL28
	.word	0x1a
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.byte	0x8
	.byte	0x2e
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x80
	.sleb128 0
	.byte	0x3a
	.byte	0x1e
	.byte	0x23
	.uleb128 0x8
	.byte	0x34
	.byte	0x25
	.byte	0x23
	.uleb128 0x30
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL28
	.long	.LVL29
	.word	0xf
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.byte	0x8
	.byte	0x2e
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.long	.LVL29
	.long	.LVL30
	.word	0x10
	.byte	0x91
	.sleb128 -12
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.byte	0x8
	.byte	0x2e
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.long	.LVL30
	.long	.LFE5
	.word	0x11
	.byte	0x91
	.sleb128 -12
	.byte	0x93
	.uleb128 0x1
	.byte	0x91
	.sleb128 -11
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.byte	0x8
	.byte	0x2e
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST8:
	.long	.LVL20
	.long	.LVL31
	.word	0x1
	.byte	0x5e
	.long	0
	.long	0
.LLST9:
	.long	.LVL22
	.long	.LVL27
	.word	0x1
	.byte	0x5f
	.long	.LVL27
	.long	.LVL28
	.word	0x1
	.byte	0x60
	.long	0
	.long	0
.LLST10:
	.long	.LFB6
	.long	.LCFI16
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI16
	.long	.LCFI17
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI17
	.long	.LCFI18
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI18
	.long	.LCFI19
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI19
	.long	.LCFI20
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI20
	.long	.LCFI21
	.word	0x2
	.byte	0x8c
	.sleb128 6
	.long	.LCFI21
	.long	.LFE6
	.word	0x2
	.byte	0x8c
	.sleb128 22
	.long	0
	.long	0
.LLST11:
	.long	.LVL32
	.long	.LVL33-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL33-1
	.long	.LVL43
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL43
	.long	.LFE6
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST12:
	.long	.LVL34
	.long	.LVL36
	.word	0x1
	.byte	0x62
	.long	.LVL37
	.long	.LVL40
	.word	0x1
	.byte	0x62
	.long	.LVL40
	.long	.LVL41
	.word	0x8
	.byte	0x83
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x83
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	0
	.long	0
.LLST13:
	.long	.LVL34
	.long	.LVL35
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL35
	.long	.LVL38
	.word	0x1
	.byte	0x61
	.long	.LVL39
	.long	.LVL42
	.word	0x1
	.byte	0x61
	.long	0
	.long	0
.LLST14:
	.long	.LVL34
	.long	.LVL35
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
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
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"avr__strings__avr_string___XUA"
.LASF24:
	.string	"avr__strings__avr_string___XUB"
.LASF22:
	.string	"temperatures__temperature_9bit___XF_1_2"
.LASF5:
	.string	"character"
.LASF15:
	.string	"value"
.LASF25:
	.string	"avr__strings__avr_string___XUP"
.LASF12:
	.string	"temperatures__to_temperature_12bit"
.LASF13:
	.string	"temperatures__to_temperature_9bit"
.LASF2:
	.string	"interfaces__unsigned_16"
.LASF23:
	.string	"temperatures__temperature_12bit___XF_1_16"
.LASF1:
	.string	"temperatures__Ttemperature_12bitB___XF_1_16"
.LASF11:
	.string	"avr__strings__astr3"
.LASF9:
	.string	"avr__strings__astr5"
.LASF10:
	.string	"avr__strings__astr8"
.LASF19:
	.string	"temperatures__image_full"
.LASF3:
	.string	"interfaces__unsigned_8"
.LASF7:
	.string	"P_BOUNDS"
.LASF27:
	.string	"avr__int_img__u8_img_right"
.LASF21:
	.string	"/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/temperatures.adb"
.LASF14:
	.string	"temperatures__image"
.LASF17:
	.string	"boolean"
.LASF18:
	.string	"temperatures__image__2"
.LASF0:
	.string	"temperatures__Ttemperature_9bitB___XF_1_2"
.LASF4:
	.string	"sizetype"
.LASF20:
	.string	"GNU Ada 4.7.0"
.LASF6:
	.string	"P_ARRAY"
.LASF16:
	.string	"is_negative"
.LASF26:
	.string	"avr__nat8"
	.ident	"GCC: (GNU) 4.7.0"
.global __do_copy_data
