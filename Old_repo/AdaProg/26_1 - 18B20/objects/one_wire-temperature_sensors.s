	.file	"one_wire-temperature_sensors.adb"
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
 ;  /home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-temperature_sensors.adb
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
	.section	.text.one_wire__temperature_sensors__init_t_conversion,"ax",@progbits
.global	one_wire__temperature_sensors__init_t_conversion
	.type	one_wire__temperature_sensors__init_t_conversion, @function
one_wire__temperature_sensors__init_t_conversion:
.LFB2:
	.file 1 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-temperature_sensors.adb"
	.loc 1 55 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 58 0
	call one_wire__reset	 ; 
.LVL0:
	.loc 1 59 0
	cpi r24,lo8(1)	 ; ,
	brne .L1	 ; ,
	.loc 1 60 0
	lds r24,one_wire__rom__identifier	 ;  one_wire__rom__identifier, one_wire__rom__identifier
.LVL1:
	cpse r24,__zero_reg__	 ;  one_wire__rom__identifier,
	rjmp .L3	 ; 
.LVL2:
.LBB12:
.LBB13:
	.file 2 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire.adb"
	.loc 2 279 0
	ldi r24,lo8(-52)	 ; ,
	call one_wire__touch	 ; 
.LVL3:
	rjmp .L4	 ; 
.LVL4:
.L3:
.LBE13:
.LBE12:
.LBB14:
.LBB15:
	ldi r24,lo8(85)	 ; ,
	call one_wire__touch	 ; 
.LVL5:
.LBE15:
.LBE14:
	.loc 1 64 0
	call one_wire__rom__send_identifier	 ; 
.LVL6:
.L4:
.LBB16:
.LBB17:
	.loc 2 279 0
	ldi r24,lo8(68)	 ; ,
	call one_wire__touch	 ; 
.LVL7:
.LBE17:
.LBE16:
	.loc 1 69 0
	jmp one_wire__set_data_line_high	 ; 
.LVL8:
.L1:
	ret
.LFE2:
	.size	one_wire__temperature_sensors__init_t_conversion, .-one_wire__temperature_sensors__init_t_conversion
	.section	.text.one_wire__temperature_sensors__read_raw_value,"ax",@progbits
.global	one_wire__temperature_sensors__read_raw_value
	.type	one_wire__temperature_sensors__read_raw_value, @function
one_wire__temperature_sensors__read_raw_value:
.LFB3:
	.loc 1 74 0
	push r28	 ; 
.LCFI0:
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.loc 1 81 0
	call one_wire__reset	 ; 
.LVL9:
	.loc 1 82 0
	cpi r24,lo8(1)	 ; ,
	brne .L7	 ; ,
.LVL10:
.LBB18:
.LBB19:
	.loc 2 279 0
	ldi r24,lo8(85)	 ; ,
.LVL11:
	call one_wire__touch	 ; 
.LVL12:
.LBE19:
.LBE18:
	.loc 1 84 0
	call one_wire__rom__send_identifier	 ; 
.LVL13:
.LBB20:
.LBB21:
	.loc 2 279 0
	ldi r24,lo8(-66)	 ; ,
	call one_wire__touch	 ; 
.LVL14:
.LBE21:
.LBE20:
	.loc 1 87 0
	call one_wire__get	 ; 
.LVL15:
	mov r28,r24	 ;  lsb,
.LVL16:
	.loc 1 88 0
	call one_wire__get	 ; 
.LVL17:
	.loc 1 107 0
	mov r19,r24	 ;  msb,
	ldi r18,0	 ;  msb
	add r18,r28	 ;  D.1663, lsb
	adc r19,__zero_reg__	 ;  D.1663
	rjmp .L6	 ; 
.LVL18:
.L7:
	.loc 1 82 0
	ldi r18,lo8(120)	 ;  D.1663,
	ldi r19,lo8(3)	 ;  D.1663,
.LVL19:
.L6:
	.loc 1 108 0
	movw r24,r18	 ; ,
/* epilogue start */
	pop r28	 ; 
	ret
.LFE3:
	.size	one_wire__temperature_sensors__read_raw_value, .-one_wire__temperature_sensors__read_raw_value
.global	one_wire__temperature_sensors__family_code
	.section	.rodata.one_wire__temperature_sensors__family_code,"a",@progbits
	.type	one_wire__temperature_sensors__family_code, @object
	.size	one_wire__temperature_sensors__family_code, 3
one_wire__temperature_sensors__family_code:
	.byte	16
	.byte	40
	.byte	40
.global	one_wire__temperature_sensors__sensor_typeN
	.section	.rodata.one_wire__temperature_sensors__sensor_typeN,"a",@progbits
	.type	one_wire__temperature_sensors__sensor_typeN, @object
	.size	one_wire__temperature_sensors__sensor_typeN, 4
one_wire__temperature_sensors__sensor_typeN:
	.byte	1
	.byte	8
	.byte	15
	.byte	23
.global	one_wire__temperature_sensors__sensor_typeS
	.section	.rodata.one_wire__temperature_sensors__sensor_typeS,"a",@progbits
	.type	one_wire__temperature_sensors__sensor_typeS, @object
	.size	one_wire__temperature_sensors__sensor_typeS, 22
one_wire__temperature_sensors__sensor_typeS:
	.ascii	"DS18S20DS18B20DS18B20P"
.global	one_wire__temperature_sensors_E
	.section	.data.one_wire__temperature_sensors_E,"aw",@progbits
	.type	one_wire__temperature_sensors_E, @object
	.size	one_wire__temperature_sensors_E, 2
one_wire__temperature_sensors_E:
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
	.byte	0x4
	.long	.LCFI0-.LFB3
	.byte	0xe
	.uleb128 0x3
	.byte	0x9c
	.uleb128 0x2
	.p2align	2
.LEFDE2:
	.text
.Letext0:
	.file 3 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-temperature_sensors.ads"
	.file 4 "/opt/avrada/avr/lib/gnat/avr_lib/avr.ads"
	.file 5 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-rom.ads"
	.file 6 "/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/avr-atmega328p.ads"
	.file 7 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire.ads"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x3cd
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF24
	.byte	0xd
	.long	.LASF25
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.byte	0x1
	.byte	0x5
	.long	.LASF7
	.byte	0x1
	.uleb128 0x4
	.long	.LASF26
	.byte	0x1
	.byte	0x3
	.byte	0x26
	.long	0x5a
	.uleb128 0x5
	.long	.LASF2
	.sleb128 0
	.uleb128 0x5
	.long	.LASF3
	.sleb128 1
	.uleb128 0x5
	.long	.LASF4
	.sleb128 2
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF5
	.uleb128 0x6
	.long	.LASF10
	.byte	0x1
	.byte	0x3
	.byte	0x2a
	.byte	0x1
	.long	0x7d
	.uleb128 0x7
	.long	.LASF26
	.byte	0x3
	.byte	0x2a
	.long	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x8
	.long	.LASF27
	.long	0x5a
	.long	0x61
	.byte	0x1
	.long	0x97
	.uleb128 0x9
	.long	0x2c
	.byte	0
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0xa
	.long	.LASF28
	.byte	0x5
	.byte	0x22
	.long	0xa9
	.uleb128 0xb
	.long	.LASF28
	.long	0x5a
	.long	0xbe
	.uleb128 0x9
	.long	0x2c
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.byte	0
	.byte	0xff
	.long	.LASF29
	.long	0xc9
	.uleb128 0x3
	.byte	0x1
	.byte	0x7
	.long	.LASF8
	.byte	0x1
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF9
	.uleb128 0x6
	.long	.LASF11
	.byte	0x1
	.byte	0x4
	.byte	0x35
	.byte	0x1
	.long	0x103
	.uleb128 0xd
	.long	.LASF30
	.byte	0x4
	.byte	0x35
	.long	0xf6
	.byte	0x1
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xe
	.byte	0
	.byte	0xff
	.long	.LASF31
	.long	0xd1
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x7
	.long	.LASF12
	.byte	0x1
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF13
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF14
	.uleb128 0xf
	.byte	0x1
	.long	.LASF32
	.byte	0x2
	.word	0x114
	.byte	0x3
	.long	0x13f
	.uleb128 0x10
	.long	.LASF33
	.byte	0x7
	.byte	0x4e
	.long	0x13f
	.uleb128 0x11
	.long	.LASF34
	.byte	0x2
	.word	0x115
	.long	0x5a
	.byte	0
	.uleb128 0x12
	.long	0xbe
	.uleb128 0x13
	.byte	0x1
	.long	.LASF35
	.byte	0x1
	.byte	0x37
	.long	.LFB2
	.long	.LFE2
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x23d
	.uleb128 0x14
	.long	.LASF15
	.byte	0x1
	.byte	0x38
	.long	0x10b
	.long	.LLST0
	.uleb128 0x15
	.long	0x119
	.long	.LBB12
	.long	.LBE12
	.byte	0x1
	.byte	0x3d
	.long	0x1a8
	.uleb128 0x16
	.long	0x127
	.long	.LLST1
	.uleb128 0x17
	.long	.LBB13
	.long	.LBE13
	.uleb128 0x18
	.long	0x132
	.uleb128 0x19
	.long	.LVL3
	.long	0x387
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x9
	.byte	0xcc
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x119
	.long	.LBB14
	.long	.LBE14
	.byte	0x1
	.byte	0x3f
	.long	0x1e4
	.uleb128 0x16
	.long	0x127
	.long	.LLST2
	.uleb128 0x17
	.long	.LBB15
	.long	.LBE15
	.uleb128 0x18
	.long	0x132
	.uleb128 0x19
	.long	.LVL5
	.long	0x387
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x55
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x119
	.long	.LBB16
	.long	.LBE16
	.byte	0x1
	.byte	0x42
	.long	0x220
	.uleb128 0x16
	.long	0x127
	.long	.LLST3
	.uleb128 0x17
	.long	.LBB17
	.long	.LBE17
	.uleb128 0x18
	.long	0x132
	.uleb128 0x19
	.long	.LVL7
	.long	0x387
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x44
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LVL0
	.long	0x3a3
	.uleb128 0x1b
	.long	.LVL6
	.long	0x3b0
	.uleb128 0x1c
	.long	.LVL8
	.byte	0x1
	.long	0x3b9
	.byte	0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF36
	.byte	0x1
	.byte	0x4a
	.long	0x97
	.long	.LFB3
	.long	.LFE3
	.long	.LLST4
	.byte	0x1
	.long	0x324
	.uleb128 0x1e
	.string	"msb"
	.byte	0x1
	.byte	0x4c
	.long	0x5a
	.long	.LLST5
	.uleb128 0x1e
	.string	"lsb"
	.byte	0x1
	.byte	0x4d
	.long	0x5a
	.long	.LLST6
	.uleb128 0x14
	.long	.LASF15
	.byte	0x1
	.byte	0x4e
	.long	0x10b
	.long	.LLST7
	.uleb128 0x15
	.long	0x119
	.long	.LBB18
	.long	.LBE18
	.byte	0x1
	.byte	0x53
	.long	0x2c3
	.uleb128 0x16
	.long	0x127
	.long	.LLST8
	.uleb128 0x17
	.long	.LBB19
	.long	.LBE19
	.uleb128 0x18
	.long	0x132
	.uleb128 0x19
	.long	.LVL12
	.long	0x387
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x55
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x119
	.long	.LBB20
	.long	.LBE20
	.byte	0x1
	.byte	0x55
	.long	0x2ff
	.uleb128 0x16
	.long	0x127
	.long	.LLST9
	.uleb128 0x17
	.long	.LBB21
	.long	.LBE21
	.uleb128 0x18
	.long	0x132
	.uleb128 0x19
	.long	.LVL14
	.long	0x387
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x9
	.byte	0xbe
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LVL9
	.long	0x3a3
	.uleb128 0x1b
	.long	.LVL13
	.long	0x3b0
	.uleb128 0x1b
	.long	.LVL15
	.long	0x3c2
	.uleb128 0x1b
	.long	.LVL17
	.long	0x3c2
	.byte	0
	.uleb128 0x1f
	.long	.LASF16
	.byte	0x3
	.byte	0x2a
	.long	0x336
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__temperature_sensors__family_code
	.uleb128 0x20
	.long	0x7d
	.byte	0x1
	.uleb128 0x21
	.long	.LASF37
	.byte	0x1
	.byte	0x31
	.long	0x348
	.byte	0
	.uleb128 0x12
	.long	0x10b
	.uleb128 0x22
	.long	.LASF17
	.byte	0x5
	.byte	0x27
	.long	0x9e
	.byte	0x1
	.byte	0x1
	.uleb128 0x23
	.long	.LASF18
	.byte	0x6
	.word	0x9b2
	.long	0x368
	.byte	0x1
	.byte	0x24
	.uleb128 0x12
	.long	0x36d
	.uleb128 0x24
	.byte	0x2
	.long	0x373
	.uleb128 0x25
	.long	0xd8
	.byte	0x1
	.uleb128 0x23
	.long	.LASF19
	.byte	0x6
	.word	0x991
	.long	0x368
	.byte	0x1
	.byte	0x25
	.uleb128 0x26
	.byte	0x1
	.long	.LASF38
	.byte	0x7
	.byte	0x58
	.long	0x5a
	.byte	0x1
	.long	0x39e
	.uleb128 0x27
	.long	0x39e
	.byte	0
	.uleb128 0x12
	.long	0x5a
	.uleb128 0x28
	.byte	0x1
	.long	.LASF22
	.byte	0x7
	.byte	0x44
	.long	0x10b
	.byte	0x1
	.uleb128 0x29
	.byte	0x1
	.long	.LASF20
	.byte	0x5
	.byte	0x33
	.byte	0x1
	.uleb128 0x29
	.byte	0x1
	.long	.LASF21
	.byte	0x2
	.byte	0x56
	.byte	0x1
	.uleb128 0x2a
	.byte	0x1
	.long	.LASF23
	.byte	0x2
	.word	0x11b
	.long	0x5a
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0
	.long	.LVL1
	.word	0x1
	.byte	0x68
	.long	.LVL8
	.long	.LFE2
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST1:
	.long	.LVL2
	.long	.LVL4
	.word	0x3
	.byte	0x9
	.byte	0xcc
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LVL4
	.long	.LVL6
	.word	0x3
	.byte	0x8
	.byte	0x55
	.byte	0x9f
	.long	0
	.long	0
.LLST3:
	.long	.LVL6
	.long	.LVL8
	.word	0x3
	.byte	0x8
	.byte	0x44
	.byte	0x9f
	.long	0
	.long	0
.LLST4:
	.long	.LFB3
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LFE3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST5:
	.long	.LVL17
	.long	.LVL18
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST6:
	.long	.LVL16
	.long	.LVL17-1
	.word	0x1
	.byte	0x68
	.long	.LVL17-1
	.long	.LVL18
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST7:
	.long	.LVL9
	.long	.LVL11
	.word	0x1
	.byte	0x68
	.long	.LVL18
	.long	.LVL19
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST8:
	.long	.LVL10
	.long	.LVL18
	.word	0x3
	.byte	0x8
	.byte	0x55
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL13
	.long	.LVL18
	.word	0x3
	.byte	0x9
	.byte	0xbe
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
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
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB2
	.long	.LFE2
	.long	.LFB3
	.long	.LFE3
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"one_wire__temperature_sensors__ds18s20"
.LASF12:
	.string	"avr__Tbit_numberB"
.LASF32:
	.string	"one_wire__send_command"
.LASF4:
	.string	"one_wire__temperature_sensors__ds18b20p"
.LASF22:
	.string	"one_wire__reset"
.LASF3:
	.string	"one_wire__temperature_sensors__ds18b20"
.LASF28:
	.string	"one_wire__rom__unique_serial_code"
.LASF19:
	.string	"avr__atmega328p__portb_bits"
.LASF14:
	.string	"system__address"
.LASF38:
	.string	"one_wire__touch"
.LASF20:
	.string	"one_wire__rom__send_identifier"
.LASF18:
	.string	"avr__atmega328p__ddrb_bits"
.LASF31:
	.string	"avr__bits_in_byte___XP1"
.LASF6:
	.string	"interfaces__unsigned_16"
.LASF34:
	.string	"dummy"
.LASF7:
	.string	"integer_8"
.LASF35:
	.string	"one_wire__temperature_sensors__init_t_conversion"
.LASF17:
	.string	"one_wire__rom__identifier"
.LASF16:
	.string	"one_wire__temperature_sensors__family_code"
.LASF9:
	.string	"system__unsigned_types__short_short_unsigned"
.LASF5:
	.string	"interfaces__unsigned_8"
.LASF33:
	.string	"command"
.LASF27:
	.string	"one_wire__temperature_sensors__Tfamily_codeT"
.LASF11:
	.string	"avr__bits_in_byte___XP1___JM"
.LASF29:
	.string	"one_wire__command_code"
.LASF1:
	.string	"sizetype"
.LASF37:
	.string	"one_wire__temperature_sensors__check_read"
.LASF15:
	.string	"found"
.LASF8:
	.string	"one_wire__Tcommand_codeB"
.LASF23:
	.string	"one_wire__get"
.LASF36:
	.string	"one_wire__temperature_sensors__read_raw_value"
.LASF24:
	.string	"GNU Ada 4.7.0"
.LASF25:
	.string	"/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-temperature_sensors.adb"
.LASF0:
	.string	"integer"
.LASF30:
	.string	"OBJECT"
.LASF26:
	.string	"one_wire__temperature_sensors__sensor_type"
.LASF10:
	.string	"one_wire__temperature_sensors__Tfamily_codeT___XA"
.LASF21:
	.string	"one_wire__set_data_line_high"
.LASF13:
	.string	"boolean"
	.ident	"GCC: (GNU) 4.7.0"
.global __do_copy_data
