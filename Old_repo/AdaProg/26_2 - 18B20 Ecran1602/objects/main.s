	.file	"main.adb"
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
 ;  -gnatec=/home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/GNAT-TEMP-000001.TMP
 ;  -gnatec=/opt/avrada/avr/lib/gnat/gnat.adc -gdwarf-2 -gnatwp -gnatwu
 ;  -gnatn -gnatp -gnatVn -gnatef -gnatdY -mmcu=atmega328p
 ;  -gnateDMCU=atmega328p -gnateDUART=usart0 -gnaty3abefhiklM130prn -gnatA
 ;  -gnatem=/home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/GNAT-TEMP-000002.TMP
 ;  -gnatez
 ;  /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/main.adb
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
	.section	.rodata
.LC7:
	.ascii	"Screen Init"
.LC8:
	.ascii	"Temp: "
.LC9:
	.ascii	"C"
.LC10:
	.ascii	"No onewire"
.LC11:
	.ascii	"sensors found"
.LC12:
	.ascii	"Exit"
.LC0:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	10
.LC1:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	5
.LC2:
 ;  LB0:
	.byte	1
 ;  UB0:
	.byte	5
.LC3:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	0
.LC4:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	9
.LC5:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	12
.LC6:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	3
	.section	.text.startup._ada_main,"ax",@progbits
.global	_ada_main
	.type	_ada_main, @function
_ada_main:
.LFB1:
	.file 1 "/home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/main.adb"
	.loc 1 25 0
	push r2	 ; 
.LCFI0:
	push r3	 ; 
.LCFI1:
	push r4	 ; 
.LCFI2:
	push r5	 ; 
.LCFI3:
	push r6	 ; 
.LCFI4:
	push r7	 ; 
.LCFI5:
	push r8	 ; 
.LCFI6:
	push r9	 ; 
.LCFI7:
	push r10	 ; 
.LCFI8:
	push r11	 ; 
.LCFI9:
	push r12	 ; 
.LCFI10:
	push r13	 ; 
.LCFI11:
	push r14	 ; 
.LCFI12:
	push r15	 ; 
.LCFI13:
	push r16	 ; 
.LCFI14:
	push r17	 ; 
.LCFI15:
	push r28	 ; 
.LCFI16:
	push r29	 ; 
.LCFI17:
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
.LCFI18:
	sbiw r28,13	 ; ,
.LCFI19:
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
/* prologue: function */
/* frame size = 13 */
/* stack size = 31 */
.L__stack_usage = 31
	.loc 1 62 0
	sbi 0xa,5	 ; ,
	.loc 1 63 0
	sbi 0xb,5	 ; ,
	.loc 1 65 0
	ldi r24,0	 ; 
	ldi r25,0	 ; 
	call avr__eeprom__get	 ; 
.LVL0:
	.loc 1 67 0
	ldi r24,lo8(1)	 ; ,
	ldi r25,0	 ; 
	call avr__eeprom__get	 ; 
.LVL1:
	.loc 1 72 0
	call lcd__init	 ; 
.LVL2:
	.loc 1 73 0
	call lcd__clear_screen	 ; 
.LVL3:
	.loc 1 74 0
	ldi r22,lo8(.LC7)	 ;  D.1646,
	ldi r23,hi8(.LC7)	 ;  D.1646,
	ldi r24,lo8(.LC0)	 ;  D.1646,
	ldi r25,hi8(.LC0)	 ;  D.1646,
	call lcd__put__2	 ; 
.LVL4:
	.loc 1 75 0
	call one_wire__init_comm	 ; 
.LVL5:
	.loc 1 77 0
	call one_wire__search__first	 ; 
.LVL6:
	.loc 1 78 0
	tst r24	 ; 
	brne .+2	 ; 
	rjmp .L2	 ; 
	.loc 1 79 0
	ldi r24,lo8(8)	 ;  tmp62,
.LVL7:
	ldi r30,lo8(one_wire__rom__identifier)	 ; ,
	ldi r31,hi8(one_wire__rom__identifier)	 ; ,
	movw r16,r28	 ;  tmp67,
	subi r16,-1	 ;  tmp67,
	sbci r17,-1	 ; ,
	movw r26,r16	 ; , tmp67
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r24	 ;  tmp62
	brne 0b
	.loc 1 94 0
	ldi r22,lo8(-24)	 ; ,
	ldi r23,lo8(3)	 ; ,
	ldi r24,0	 ; 
	ldi r25,0	 ; 
	call ada__calendar__delays__delay_for	 ; 
.LVL8:
.LBB2:
	.loc 1 101 0
	mov r3,r16	 ;  tmp80, tmp67
	mov r2,r17	 ;  tmp81,
.L3:
	.loc 1 97 0 discriminator 1
	sts one_wire__rom__identifier,__zero_reg__	 ;  one_wire__rom__identifier,
	.loc 1 98 0 discriminator 1
	call one_wire__temperature_sensors__init_t_conversion	 ; 
.LVL9:
	.loc 1 100 0 discriminator 1
	ldi r22,lo8(32)	 ; ,
	ldi r23,lo8(3)	 ; ,
	ldi r24,0	 ; 
	ldi r25,0	 ; 
	call ada__calendar__delays__delay_for	 ; 
.LVL10:
	.loc 1 101 0 discriminator 1
	mov r30,r3	 ; , tmp80
	mov r31,r2	 ; , tmp81
	ldi r26,lo8(one_wire__rom__identifier)	 ; ,
	ldi r27,hi8(one_wire__rom__identifier)	 ; ,
	ldi r16,lo8(8)	 ;  tmp64,
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r16	 ;  tmp64
	brne 0b
	.loc 1 102 0 discriminator 1
	call lcd__clear_screen	 ; 
.LVL11:
	.loc 1 104 0 discriminator 1
	call one_wire__temperature_sensors__read_raw_value	 ; 
.LVL12:
	call temperatures__to_temperature_12bit	 ; 
.LVL13:
	movw r8,r24	 ;  temp,
.LVL14:
	.loc 1 106 0 discriminator 1
	ldi r22,lo8(1)	 ; ,
	ldi r24,lo8(1)	 ; ,
	call lcd__gotoxy	 ; 
.LVL15:
	.loc 1 108 0 discriminator 1
	ldi r24,lo8(.LC8)	 ; ,
	mov r4,r24	 ;  D.1652,
	ldi r24,hi8(.LC8)	 ; ,
	mov r5,r24	 ;  D.1652,
	ldi r25,lo8(.LC1)	 ; ,
	mov r6,r25	 ;  D.1652,
	ldi r25,hi8(.LC1)	 ; ,
	mov r7,r25	 ;  D.1652,
	movw r24,r6	 ; , D.1652
	movw r22,r4	 ; , D.1652
	call lcd__put__2	 ; 
.LVL16:
	.loc 1 115 0 discriminator 1
	movw r24,r8	 ; , temp
	call temperatures__image__2	 ; 
.LVL17:
	std Y+9,r18	 ;  D.1655, tmp69
	std Y+10,r19	 ;  D.1655, tmp70
	std Y+11,r20	 ;  D.1655, tmp71
	std Y+12,r21	 ;  D.1655, tmp72
	std Y+13,r22	 ;  D.1655, tmp73
	ldi r18,lo8(9)	 ; ,
	mov r8,r18	 ; ,
	mov r9,__zero_reg__	 ; 
.LVL18:
	add r8,r28	 ; ,
	adc r9,r29	 ; ,
	ldi r19,lo8(.LC2)	 ; ,
	mov r10,r19	 ;  D.1654,
	ldi r19,hi8(.LC2)	 ; ,
	mov r11,r19	 ;  D.1654,
	movw r24,r10	 ; , D.1654
	movw r22,r8	 ; , D.1654
	call lcd__put__2	 ; 
.LVL19:
	.loc 1 116 0 discriminator 1
	ldi r20,lo8(.LC9)	 ; ,
	mov r12,r20	 ;  D.1657,
	ldi r20,hi8(.LC9)	 ; ,
	mov r13,r20	 ;  D.1657,
	ldi r21,lo8(.LC3)	 ; ,
	mov r14,r21	 ;  D.1657,
	ldi r21,hi8(.LC3)	 ; ,
	mov r15,r21	 ;  D.1657,
	movw r24,r14	 ; , D.1657
	movw r22,r12	 ; , D.1657
	call lcd__put__2	 ; 
.LVL20:
	.loc 1 119 0 discriminator 1
	ldi r22,lo8(-48)	 ; ,
	ldi r23,lo8(7)	 ; ,
	ldi r24,0	 ; 
	ldi r25,0	 ; 
	call ada__calendar__delays__delay_for	 ; 
.LVL21:
	rjmp .L3	 ; 
.LVL22:
.L2:
.LBE2:
	.loc 1 123 0
	call lcd__clear_screen	 ; 
.LVL23:
	.loc 1 124 0
	ldi r22,lo8(1)	 ; ,
	ldi r24,lo8(1)	 ; ,
	call lcd__gotoxy	 ; 
.LVL24:
	.loc 1 125 0
	ldi r22,lo8(.LC10)	 ;  D.1660,
	ldi r23,hi8(.LC10)	 ;  D.1660,
	ldi r24,lo8(.LC4)	 ;  D.1660,
	ldi r25,hi8(.LC4)	 ;  D.1660,
	call lcd__put__2	 ; 
.LVL25:
	.loc 1 126 0
	ldi r22,lo8(2)	 ; ,
	ldi r24,lo8(1)	 ; ,
	call lcd__gotoxy	 ; 
.LVL26:
	.loc 1 127 0
	ldi r22,lo8(.LC11)	 ;  D.1662,
	ldi r23,hi8(.LC11)	 ;  D.1662,
	ldi r24,lo8(.LC5)	 ;  D.1662,
	ldi r25,hi8(.LC5)	 ;  D.1662,
	call lcd__put__2	 ; 
.LVL27:
	.loc 1 130 0
	call lcd__clear_screen	 ; 
.LVL28:
	.loc 1 131 0
	ldi r22,lo8(1)	 ; ,
	ldi r24,lo8(1)	 ; ,
	call lcd__gotoxy	 ; 
.LVL29:
	.loc 1 132 0
	ldi r22,lo8(.LC12)	 ;  D.1664,
	ldi r23,hi8(.LC12)	 ;  D.1664,
	ldi r24,lo8(.LC6)	 ;  D.1664,
	ldi r25,hi8(.LC6)	 ;  D.1664,
	call lcd__put__2	 ; 
.LVL30:
/* epilogue start */
	.loc 1 139 0
	adiw r28,13	 ; ,
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
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	pop r5	 ; 
	pop r4	 ; 
	pop r3	 ; 
	pop r2	 ; 
	ret
.LFE1:
	.size	_ada_main, .-_ada_main
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
	.long	.LFB1
	.long	.LFE1-.LFB1
	.byte	0x4
	.long	.LCFI0-.LFB1
	.byte	0xe
	.uleb128 0x3
	.byte	0x82
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x5
	.byte	0x84
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x6
	.byte	0x85
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x7
	.byte	0x86
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x7
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x9
	.byte	0x88
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0xa
	.byte	0x89
	.uleb128 0x9
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0xb
	.byte	0x8a
	.uleb128 0xa
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0xc
	.byte	0x8b
	.uleb128 0xb
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0xd
	.byte	0x8c
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0xe
	.byte	0x8d
	.uleb128 0xd
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0xf
	.byte	0x8e
	.uleb128 0xe
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x10
	.byte	0x8f
	.uleb128 0xf
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x11
	.byte	0x90
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x12
	.byte	0x91
	.uleb128 0x11
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x13
	.byte	0x9c
	.uleb128 0x12
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x14
	.byte	0x9d
	.uleb128 0x13
	.byte	0x4
	.long	.LCFI18-.LCFI17
	.byte	0xd
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x21
	.p2align	2
.LEFDE0:
	.text
.Letext0:
	.file 2 "/opt/avrada/avr/lib/gnat/avr_lib/avr.ads"
	.file 3 "/opt/avrada/avr/lib/gnat/avr_lib/avr-strings.ads"
	.file 4 "/home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/one_wire-rom.ads"
	.file 5 "/opt/avrada/avr/lib/gnat/avr_lib/avr-wait.ads"
	.file 6 "/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/avr-atmega328p.ads"
	.file 7 "/home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/one_wire-temperature_sensors.ads"
	.file 8 "/home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/lcd.ads"
	.file 9 "/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adainclude/a-caldel.ads"
	.file 10 "/home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/temperatures.ads"
	.file 11 "/opt/avrada/avr/lib/gnat/avr_lib/avr-eeprom.ads"
	.file 12 "/home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/one_wire.ads"
	.file 13 "/home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/one_wire-search.ads"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x582
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF47
	.byte	0xd
	.long	.LASF48
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF10
	.byte	0x4
	.byte	0x22
	.long	0x3e
	.uleb128 0x4
	.long	.LASF10
	.long	0x25
	.long	0x53
	.uleb128 0x5
	.long	0x2c
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.word	0xfc90
	.word	0x7d0
	.long	.LASF49
	.long	0x60
	.uleb128 0x7
	.byte	0x2
	.byte	0x5
	.long	.LASF4
	.byte	0x1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF3
	.uleb128 0x8
	.long	.LASF8
	.byte	0x1
	.byte	0x2
	.byte	0x35
	.byte	0x1
	.long	0xa1
	.uleb128 0x9
	.long	.LASF50
	.byte	0x2
	.byte	0x35
	.long	0x94
	.byte	0x1
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xa
	.byte	0
	.byte	0xff
	.long	.LASF51
	.long	0x6f
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.byte	0x7
	.long	.LASF5
	.byte	0x1
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0xb
	.byte	0
	.word	0x3ff
	.long	.LASF52
	.long	0xb0
	.uleb128 0x8
	.long	.LASF9
	.byte	0x2
	.byte	0x3
	.byte	0x21
	.byte	0x1
	.long	0xed
	.uleb128 0xc
	.string	"LB0"
	.byte	0x3
	.byte	0x21
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xc
	.string	"UB0"
	.byte	0x3
	.byte	0x21
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0
	.uleb128 0x3
	.long	.LASF11
	.byte	0x3
	.byte	0x21
	.long	0xf8
	.uleb128 0x4
	.long	.LASF11
	.long	0x10b
	.long	0x10b
	.uleb128 0xd
	.long	0x2c
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF12
	.uleb128 0xe
	.long	.LASF53
	.byte	0x4
	.byte	0x3
	.byte	0x21
	.long	0x13b
	.uleb128 0xf
	.long	.LASF13
	.byte	0x3
	.byte	0x21
	.long	0x13b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xf
	.long	.LASF14
	.byte	0x3
	.byte	0x21
	.long	0x141
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0x10
	.byte	0x2
	.long	0xed
	.uleb128 0x10
	.byte	0x2
	.long	0xc3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF15
	.uleb128 0x11
	.byte	0x1
	.byte	0x10
	.long	.LASF17
	.long	0x159
	.uleb128 0x7
	.byte	0x1
	.byte	0x7
	.long	.LASF16
	.byte	0x1
	.uleb128 0x11
	.byte	0x1
	.byte	0x2
	.long	.LASF18
	.long	0x16c
	.uleb128 0x7
	.byte	0x1
	.byte	0x7
	.long	.LASF19
	.byte	0x1
	.uleb128 0x3
	.long	.LASF20
	.byte	0x3
	.byte	0x2b
	.long	0x17f
	.uleb128 0x12
	.long	.LASF20
	.long	0x10b
	.long	0x112
	.long	0x198
	.uleb128 0x5
	.long	0x2c
	.byte	0x1
	.byte	0x5
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x19
	.long	.LASF55
	.long	.LFB1
	.long	.LFE1
	.long	.LLST0
	.byte	0x1
	.long	0x44b
	.uleb128 0x14
	.long	.LASF21
	.byte	0x5
	.byte	0x29
	.long	0x44b
	.long	0xf42400
	.uleb128 0x15
	.long	.LASF22
	.byte	0x5
	.byte	0x2a
	.long	0x44b
	.word	0x3e8
	.uleb128 0x16
	.long	.LASF56
	.byte	0x1
	.byte	0x1
	.uleb128 0x17
	.long	.LASF23
	.byte	0x1
	.byte	0x20
	.long	0x459
	.byte	0x1
	.long	0x1ee
	.uleb128 0x18
	.long	0x461
	.byte	0
	.uleb128 0x17
	.long	.LASF24
	.byte	0x1
	.byte	0x2c
	.long	0x459
	.byte	0x1
	.long	0x204
	.uleb128 0x18
	.long	0x466
	.byte	0
	.uleb128 0x19
	.long	.LASF25
	.byte	0x1
	.byte	0x32
	.long	0xa9
	.long	.LLST1
	.uleb128 0x1a
	.long	.LASF26
	.byte	0x1
	.byte	0x33
	.long	0x33
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0x1b
	.string	"crc"
	.byte	0x1
	.byte	0x34
	.long	0x25
	.uleb128 0x19
	.long	.LASF27
	.byte	0x1
	.byte	0x35
	.long	0x53
	.long	.LLST2
	.uleb128 0x1c
	.long	.LASF28
	.byte	0x1
	.byte	0x36
	.long	0xa9
	.uleb128 0x1c
	.long	.LASF29
	.byte	0x1
	.byte	0x38
	.long	0x25
	.uleb128 0x1c
	.long	.LASF30
	.byte	0x1
	.byte	0x39
	.long	0x10b
	.uleb128 0x1d
	.long	.LBB2
	.long	.LBE2
	.long	0x358
	.uleb128 0x1e
	.long	.LVL9
	.long	0x4a5
	.uleb128 0x1f
	.long	.LVL10
	.long	0x4ae
	.long	0x292
	.uleb128 0x20
	.byte	0xc
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
	.byte	0x3
	.byte	0xa
	.word	0x320
	.byte	0
	.uleb128 0x1e
	.long	.LVL11
	.long	0x4c7
	.uleb128 0x1e
	.long	.LVL12
	.long	0x4d0
	.uleb128 0x1e
	.long	.LVL13
	.long	0x4dd
	.uleb128 0x1f
	.long	.LVL15
	.long	0x4f9
	.long	0x2c5
	.uleb128 0x20
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.uleb128 0x20
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1f
	.long	.LVL16
	.long	0x51b
	.long	0x2e4
	.uleb128 0x20
	.byte	0xc
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
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.long	.LVL17
	.long	0x52e
	.long	0x2fd
	.uleb128 0x20
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.long	.LVL19
	.long	0x51b
	.long	0x31c
	.uleb128 0x20
	.byte	0xc
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
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.long	.LVL20
	.long	0x51b
	.long	0x33b
	.uleb128 0x20
	.byte	0xc
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
	.byte	0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x21
	.long	.LVL21
	.long	0x4ae
	.uleb128 0x20
	.byte	0xc
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
	.byte	0x3
	.byte	0xa
	.word	0x7d0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LVL0
	.long	0x54a
	.long	0x370
	.uleb128 0x20
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1f
	.long	.LVL1
	.long	0x54a
	.long	0x388
	.uleb128 0x20
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1e
	.long	.LVL2
	.long	0x566
	.uleb128 0x1e
	.long	.LVL3
	.long	0x4c7
	.uleb128 0x1e
	.long	.LVL4
	.long	0x51b
	.uleb128 0x1e
	.long	.LVL5
	.long	0x56f
	.uleb128 0x1e
	.long	.LVL6
	.long	0x578
	.uleb128 0x1f
	.long	.LVL8
	.long	0x4ae
	.long	0x3d5
	.uleb128 0x20
	.byte	0xc
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
	.byte	0x3
	.byte	0xa
	.word	0x3e8
	.byte	0
	.uleb128 0x1e
	.long	.LVL23
	.long	0x4c7
	.uleb128 0x1f
	.long	.LVL24
	.long	0x4f9
	.long	0x3f6
	.uleb128 0x20
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.uleb128 0x20
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1e
	.long	.LVL25
	.long	0x51b
	.uleb128 0x1f
	.long	.LVL26
	.long	0x4f9
	.long	0x417
	.uleb128 0x20
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.uleb128 0x20
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x32
	.byte	0
	.uleb128 0x1e
	.long	.LVL27
	.long	0x51b
	.uleb128 0x1e
	.long	.LVL28
	.long	0x4c7
	.uleb128 0x1f
	.long	.LVL29
	.long	0x4f9
	.long	0x441
	.uleb128 0x20
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.uleb128 0x20
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1e
	.long	.LVL30
	.long	0x51b
	.byte	0
	.uleb128 0x22
	.long	0x451
	.byte	0x1
	.uleb128 0x7
	.byte	0x8
	.byte	0x5
	.long	.LASF31
	.byte	0x1
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.long	.LASF32
	.byte	0x1
	.uleb128 0x23
	.long	0x10b
	.uleb128 0x23
	.long	0x25
	.uleb128 0x24
	.long	.LASF33
	.byte	0x6
	.word	0x8f5
	.long	0x479
	.byte	0x1
	.byte	0x2a
	.uleb128 0x23
	.long	0x47e
	.uleb128 0x25
	.byte	0x2
	.long	0x484
	.uleb128 0x26
	.long	0x76
	.byte	0x1
	.uleb128 0x24
	.long	.LASF34
	.byte	0x6
	.word	0x8d4
	.long	0x479
	.byte	0x1
	.byte	0x2b
	.uleb128 0x27
	.long	.LASF57
	.byte	0x4
	.byte	0x27
	.long	0x33
	.byte	0x1
	.byte	0x1
	.uleb128 0x28
	.byte	0x1
	.long	.LASF35
	.byte	0x7
	.byte	0x35
	.byte	0x1
	.uleb128 0x29
	.byte	0x1
	.long	.LASF37
	.byte	0x9
	.byte	0x36
	.byte	0x1
	.long	0x4c1
	.uleb128 0x18
	.long	0x4c1
	.byte	0
	.uleb128 0x22
	.long	0x459
	.byte	0x1
	.uleb128 0x28
	.byte	0x1
	.long	.LASF36
	.byte	0x8
	.byte	0x35
	.byte	0x1
	.uleb128 0x2a
	.byte	0x1
	.long	.LASF45
	.byte	0x7
	.byte	0x39
	.long	0x147
	.byte	0x1
	.uleb128 0x2b
	.byte	0x1
	.long	.LASF40
	.byte	0xa
	.byte	0x30
	.long	0x53
	.byte	0x1
	.long	0x4f4
	.uleb128 0x18
	.long	0x4f4
	.byte	0
	.uleb128 0x23
	.long	0x147
	.uleb128 0x29
	.byte	0x1
	.long	.LASF38
	.byte	0x8
	.byte	0x3b
	.byte	0x1
	.long	0x511
	.uleb128 0x18
	.long	0x511
	.uleb128 0x18
	.long	0x516
	.byte	0
	.uleb128 0x23
	.long	0x14e
	.uleb128 0x23
	.long	0x161
	.uleb128 0x29
	.byte	0x1
	.long	.LASF39
	.byte	0x8
	.byte	0x29
	.byte	0x1
	.long	0x52e
	.uleb128 0x18
	.long	0x112
	.byte	0
	.uleb128 0x2b
	.byte	0x1
	.long	.LASF41
	.byte	0xa
	.byte	0x3b
	.long	0x174
	.byte	0x1
	.long	0x545
	.uleb128 0x18
	.long	0x545
	.byte	0
	.uleb128 0x23
	.long	0x53
	.uleb128 0x2b
	.byte	0x1
	.long	.LASF42
	.byte	0xb
	.byte	0x20
	.long	0x25
	.byte	0x1
	.long	0x561
	.uleb128 0x18
	.long	0x561
	.byte	0
	.uleb128 0x23
	.long	0xb7
	.uleb128 0x28
	.byte	0x1
	.long	.LASF43
	.byte	0x8
	.byte	0x25
	.byte	0x1
	.uleb128 0x28
	.byte	0x1
	.long	.LASF44
	.byte	0xc
	.byte	0x37
	.byte	0x1
	.uleb128 0x2a
	.byte	0x1
	.long	.LASF46
	.byte	0xd
	.byte	0x19
	.long	0xa9
	.byte	0x1
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x34
	.uleb128 0xc
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0xb
	.uleb128 0x2f
	.uleb128 0x5
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x2007
	.uleb128 0xe
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
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB1
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
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 10
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 11
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 12
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 13
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 14
	.long	.LCFI12
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 15
	.long	.LCFI13
	.long	.LCFI14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 16
	.long	.LCFI14
	.long	.LCFI15
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 17
	.long	.LCFI15
	.long	.LCFI16
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 18
	.long	.LCFI16
	.long	.LCFI17
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 19
	.long	.LCFI17
	.long	.LCFI18
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 20
	.long	.LCFI18
	.long	.LCFI19
	.word	0x2
	.byte	0x8c
	.sleb128 20
	.long	.LCFI19
	.long	.LFE1
	.word	0x2
	.byte	0x8c
	.sleb128 33
	.long	0
	.long	0
.LLST1:
	.long	.LVL6
	.long	.LVL7
	.word	0x1
	.byte	0x68
	.long	.LVL22
	.long	.LVL23-1
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST2:
	.long	.LVL14
	.long	.LVL18
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB1
	.long	.LFE1-.LFB1
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB1
	.long	.LFE1
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF11:
	.string	"avr__strings__avr_string___XUA"
.LASF9:
	.string	"avr__strings__avr_string___XUB"
.LASF13:
	.string	"P_ARRAY"
.LASF5:
	.string	"avr__Tbit_numberB"
.LASF42:
	.string	"avr__eeprom__get"
.LASF12:
	.string	"character"
.LASF40:
	.string	"temperatures__to_temperature_12bit"
.LASF53:
	.string	"avr__strings__avr_string___XUP"
.LASF10:
	.string	"one_wire__rom__unique_serial_code"
.LASF52:
	.string	"avr__eeprom__eeprom_address___XDLU_0__1023"
.LASF29:
	.string	"byte"
.LASF18:
	.string	"lcd__line_position___XDLU_1__2"
.LASF19:
	.string	"lcd__Tline_positionB"
.LASF7:
	.string	"system__address"
.LASF27:
	.string	"temp"
.LASF41:
	.string	"temperatures__image__2"
.LASF44:
	.string	"one_wire__init_comm"
.LASF51:
	.string	"avr__bits_in_byte___XP1"
.LASF15:
	.string	"interfaces__unsigned_16"
.LASF39:
	.string	"lcd__put__2"
.LASF49:
	.string	"temperatures__temperature_12bit___XF_1_16"
.LASF4:
	.string	"temperatures__Ttemperature_12bitB___XF_1_16"
.LASF35:
	.string	"one_wire__temperature_sensors__init_t_conversion"
.LASF2:
	.string	"interfaces__unsigned_32"
.LASF20:
	.string	"avr__strings__astr5"
.LASF46:
	.string	"one_wire__search__first"
.LASF21:
	.string	"wait_1msGP481__crystal_hertz"
.LASF3:
	.string	"system__unsigned_types__short_short_unsigned"
.LASF36:
	.string	"lcd__clear_screen"
.LASF54:
	.string	"main"
.LASF32:
	.string	"duration___XF_1_1000"
.LASF0:
	.string	"interfaces__unsigned_8"
.LASF14:
	.string	"P_BOUNDS"
.LASF34:
	.string	"avr__atmega328p__portd_bits"
.LASF24:
	.string	"main__get_delay__2"
.LASF56:
	.string	"main__wait_1ms"
.LASF8:
	.string	"avr__bits_in_byte___XP1___JM"
.LASF57:
	.string	"one_wire__rom__identifier"
.LASF43:
	.string	"lcd__init"
.LASF28:
	.string	"enter_menu"
.LASF38:
	.string	"lcd__gotoxy"
.LASF30:
	.string	"device_id"
.LASF1:
	.string	"sizetype"
.LASF25:
	.string	"found"
.LASF48:
	.string	"/home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/main.adb"
.LASF22:
	.string	"wait_1msGP481__micro_seconds"
.LASF26:
	.string	"serial"
.LASF31:
	.string	"long_long_integer"
.LASF45:
	.string	"one_wire__temperature_sensors__read_raw_value"
.LASF47:
	.string	"GNU Ada 4.7.0"
.LASF37:
	.string	"ada__calendar__delays__delay_for"
.LASF50:
	.string	"OBJECT"
.LASF17:
	.string	"lcd__char_position___XDLU_1__16"
.LASF23:
	.string	"main__get_delay"
.LASF55:
	.string	"_ada_main"
.LASF6:
	.string	"boolean"
.LASF16:
	.string	"lcd__Tchar_positionB"
.LASF33:
	.string	"avr__atmega328p__ddrd_bits"
	.ident	"GCC: (GNU) 4.7.0"
.global __do_copy_data
