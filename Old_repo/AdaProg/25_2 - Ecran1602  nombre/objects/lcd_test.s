	.file	"lcd_test.adb"
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
 ;  /home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/lcd_test.adb
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
.LC1:
	.ascii	"Hello, AVR-Ada!"
.LC0:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	14
	.section	.text._ada_lcd_test,"ax",@progbits
.global	_ada_lcd_test
	.type	_ada_lcd_test, @function
_ada_lcd_test:
.LFB1:
	.file 1 "/home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/lcd_test.adb"
	.loc 1 8 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 12 0
	call lcd__init	 ; 
.LVL0:
	.loc 1 13 0
	call lcd__clear_screen	 ; 
.LVL1:
	.loc 1 14 0
	ldi r22,lo8(.LC1)	 ;  D.1473,
	ldi r23,hi8(.LC1)	 ;  D.1473,
	ldi r24,lo8(.LC0)	 ;  D.1473,
	ldi r25,hi8(.LC0)	 ;  D.1473,
	call lcd__put__2	 ; 
.LVL2:
	.loc 1 20 0
	ldi r22,lo8(2)	 ; ,
	ldi r24,lo8(1)	 ; ,
	call lcd__gotoxy	 ; 
.LVL3:
	.loc 1 21 0
	ldi r22,0	 ; 
	ldi r23,0	 ; 
	ldi r24,0	 ; 
	ldi r25,lo8(-128)	 ; ,
	call lcd__put__8	 ; 
.LVL4:
.L2:
	rjmp .L2	 ; 
.LFE1:
	.size	_ada_lcd_test, .-_ada_lcd_test
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
	.p2align	2
.LEFDE0:
	.text
.Letext0:
	.file 2 "/opt/avrada/avr/lib/gnat/avr_lib/avr-strings.ads"
	.file 3 "/home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/lcd.ads"
	.file 4 "/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adainclude/interfac.ads"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1c0
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF15
	.byte	0xd
	.long	.LASF16
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF17
	.byte	0x2
	.byte	0x4
	.byte	0x35
	.byte	0x1
	.long	0x56
	.uleb128 0x4
	.string	"LB0"
	.byte	0x2
	.byte	0x21
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.string	"UB0"
	.byte	0x2
	.byte	0x21
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.long	.LASF18
	.byte	0x2
	.byte	0x21
	.long	0x61
	.uleb128 0x6
	.long	.LASF18
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
	.long	.LASF19
	.byte	0x4
	.byte	0x2
	.byte	0x21
	.long	0xab
	.uleb128 0x9
	.long	.LASF3
	.byte	0x2
	.byte	0x21
	.long	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF4
	.byte	0x2
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
	.byte	0x1
	.byte	0x10
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
	.uleb128 0xd
	.long	0x80000000
	.long	0x7fffffff
	.long	.LASF20
	.long	0xee
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.long	.LASF9
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.byte	0x8
	.long	.LASF22
	.long	.LFB1
	.long	.LFE1
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x164
	.uleb128 0xf
	.long	.LVL0
	.long	0x164
	.uleb128 0xf
	.long	.LVL1
	.long	0x16d
	.uleb128 0xf
	.long	.LVL2
	.long	0x176
	.uleb128 0x10
	.long	.LVL3
	.long	0x189
	.long	0x146
	.uleb128 0x11
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.uleb128 0x11
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x32
	.byte	0
	.uleb128 0x12
	.long	.LVL4
	.long	0x1ab
	.uleb128 0x11
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
	.byte	0x4
	.byte	0x40
	.byte	0x4b
	.byte	0x24
	.byte	0x1f
	.byte	0
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF10
	.byte	0x3
	.byte	0x25
	.byte	0x1
	.uleb128 0x13
	.byte	0x1
	.long	.LASF11
	.byte	0x3
	.byte	0x35
	.byte	0x1
	.uleb128 0x14
	.byte	0x1
	.long	.LASF12
	.byte	0x3
	.byte	0x29
	.byte	0x1
	.long	0x189
	.uleb128 0x15
	.long	0x82
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF13
	.byte	0x3
	.byte	0x3b
	.byte	0x1
	.long	0x1a1
	.uleb128 0x15
	.long	0x1a1
	.uleb128 0x15
	.long	0x1a6
	.byte	0
	.uleb128 0x16
	.long	0xb7
	.uleb128 0x16
	.long	0xca
	.uleb128 0x14
	.byte	0x1
	.long	.LASF14
	.byte	0x3
	.byte	0x2f
	.byte	0x1
	.long	0x1be
	.uleb128 0x15
	.long	0x1be
	.byte	0
	.uleb128 0x16
	.long	0xdd
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
	.uleb128 0x6
	.uleb128 0x2f
	.uleb128 0x6
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
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
.LASF0:
	.string	"interfaces__unsigned_8"
.LASF19:
	.string	"avr__strings__avr_string___XUP"
.LASF4:
	.string	"P_BOUNDS"
.LASF5:
	.string	"lcd__char_position___XDLU_1__16"
.LASF20:
	.string	"interfaces__integer_32"
.LASF3:
	.string	"P_ARRAY"
.LASF21:
	.string	"lcd_test"
.LASF16:
	.string	"/home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/lcd_test.adb"
.LASF14:
	.string	"lcd__put__8"
.LASF7:
	.string	"lcd__Tchar_positionB"
.LASF6:
	.string	"lcd__line_position___XDLU_1__2"
.LASF10:
	.string	"lcd__init"
.LASF9:
	.string	"interfaces__Tinteger_32B"
.LASF18:
	.string	"avr__strings__avr_string___XUA"
.LASF17:
	.string	"avr__strings__avr_string___XUB"
.LASF11:
	.string	"lcd__clear_screen"
.LASF15:
	.string	"GNU Ada 4.7.0"
.LASF12:
	.string	"lcd__put__2"
.LASF22:
	.string	"_ada_lcd_test"
.LASF8:
	.string	"lcd__Tline_positionB"
.LASF1:
	.string	"sizetype"
.LASF2:
	.string	"character"
.LASF13:
	.string	"lcd__gotoxy"
	.ident	"GCC: (GNU) 4.7.0"
.global __do_copy_data
