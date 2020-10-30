	.file	"one_wire-rom.adb"
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
 ;  /home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-rom.adb
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
	.section	.text.one_wire__rom__Tunique_serial_codeBIP,"ax",@progbits
.global	one_wire__rom__Tunique_serial_codeBIP
	.type	one_wire__rom__Tunique_serial_codeBIP, @function
one_wire__rom__Tunique_serial_codeBIP:
.LFB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
.LFE2:
	.size	one_wire__rom__Tunique_serial_codeBIP, .-one_wire__rom__Tunique_serial_codeBIP
	.section	.text.one_wire__rom__send_identifier,"ax",@progbits
.global	one_wire__rom__send_identifier
	.type	one_wire__rom__send_identifier, @function
one_wire__rom__send_identifier:
.LFB3:
	.file 1 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-rom.adb"
	.loc 1 27 0
	.loc 1 27 0
	push r28	 ; 
.LCFI0:
	push r29	 ; 
.LCFI1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
.LVL0:
	ldi r28,lo8(one_wire__rom__identifier)	 ;  ivtmp.25,
	ldi r29,hi8(one_wire__rom__identifier)	 ;  ivtmp.25,
.LVL1:
.L3:
.LBB2:
	.loc 1 31 0 discriminator 1
	ld r24,Y+	 ; , MEM[base: D.1520_17, offset: 0B]
	call one_wire__touch	 ; 
.LVL2:
	.loc 1 30 0 discriminator 1
	ldi r24,hi8(one_wire__rom__identifier+8)	 ; ,
	cpi r28,lo8(one_wire__rom__identifier+8)	 ;  ivtmp.25,
	cpc r29,r24	 ;  ivtmp.25,
	brne .L3	 ; ,
/* epilogue start */
.LBE2:
	.loc 1 33 0
	pop r29	 ; 
	pop r28	 ; 
	ret
.LFE3:
	.size	one_wire__rom__send_identifier, .-one_wire__rom__send_identifier
	.section	.text.one_wire__rom__verify_crc,"ax",@progbits
.global	one_wire__rom__verify_crc
	.type	one_wire__rom__verify_crc, @function
one_wire__rom__verify_crc:
.LFB4:
	.loc 1 37 0
	push r28	 ; 
.LCFI2:
	push r29	 ; 
.LCFI3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
.LVL3:
	ldi r28,lo8(one_wire__rom__identifier)	 ;  ivtmp.43,
	ldi r29,hi8(one_wire__rom__identifier)	 ;  ivtmp.43,
	.loc 1 41 0
	ldi r22,0	 ;  c
.LVL4:
.L6:
.LBB3:
	.loc 1 43 0 discriminator 1
	ld r24,Y+	 ; , MEM[base: D.1539_22, offset: 0B]
	call _ada_crc8	 ; 
.LVL5:
	mov r22,r24	 ;  c,
.LVL6:
	.loc 1 42 0 discriminator 1
	ldi r24,hi8(one_wire__rom__identifier+7)	 ; ,
	cpi r28,lo8(one_wire__rom__identifier+7)	 ;  ivtmp.43,
	cpc r29,r24	 ;  ivtmp.43,
	brne .L6	 ; ,
.LBE3:
	.loc 1 45 0
	ldi r24,lo8(1)	 ;  tmp74,
	lds r25,one_wire__rom__identifier+7	 ;  one_wire__rom__identifier, one_wire__rom__identifier
	cpse r22,r25	 ;  c, one_wire__rom__identifier
	ldi r24,0	 ;  tmp74
.L7:
/* epilogue start */
	.loc 1 46 0
	pop r29	 ; 
	pop r28	 ; 
	ret
.LFE4:
	.size	one_wire__rom__verify_crc, .-one_wire__rom__verify_crc
.global	one_wire__rom__identifier
	.section	.bss.one_wire__rom__identifier,"aw",@nobits
	.type	one_wire__rom__identifier, @object
	.size	one_wire__rom__identifier, 8
one_wire__rom__identifier:
	.zero	8
.global	one_wire__rom_E
	.section	.data.one_wire__rom_E,"aw",@progbits
	.type	one_wire__rom_E, @object
	.size	one_wire__rom_E, 2
one_wire__rom_E:
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
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x4
	.byte	0x9d
	.uleb128 0x3
	.p2align	2
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB4
	.long	.LFE4-.LFB4
	.byte	0x4
	.long	.LCFI2-.LFB4
	.byte	0xe
	.uleb128 0x3
	.byte	0x9c
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x4
	.byte	0x9d
	.uleb128 0x3
	.p2align	2
.LEFDE4:
	.text
.Letext0:
	.file 2 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire.ads"
	.file 3 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/crc8.ads"
	.file 4 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-rom.ads"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x15d
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF8
	.byte	0xd
	.long	.LASF9
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
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.byte	0x1b
	.long	.LFB3
	.long	.LFE3
	.long	.LLST0
	.byte	0x1
	.long	0x96
	.uleb128 0x7
	.string	"d"
	.byte	0x1
	.byte	0x1c
	.long	0x25
	.uleb128 0x8
	.long	.LBB2
	.long	.LBE2
	.uleb128 0x9
	.string	"i"
	.byte	0x1
	.byte	0x1e
	.long	0x25
	.long	.LLST1
	.uleb128 0xa
	.long	.LVL2
	.long	0x128
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.byte	0x25
	.long	0xe1
	.long	.LFB4
	.long	.LFE4
	.long	.LLST2
	.byte	0x1
	.long	0xe1
	.uleb128 0x9
	.string	"c"
	.byte	0x1
	.byte	0x27
	.long	0x25
	.long	.LLST3
	.uleb128 0x8
	.long	.LBB3
	.long	.LBE3
	.uleb128 0x9
	.string	"i"
	.byte	0x1
	.byte	0x2a
	.long	0x25
	.long	.LLST4
	.uleb128 0xa
	.long	.LVL5
	.long	0x144
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF2
	.uleb128 0xc
	.long	.LASF13
	.byte	0x4
	.byte	0x27
	.long	0x33
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__rom__identifier
	.uleb128 0xd
	.long	.LASF3
	.long	0x107
	.byte	0x1
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.byte	0
	.long	.LASF14
	.long	0x114
	.byte	0x1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF4
	.uleb128 0xd
	.long	.LASF5
	.long	0x107
	.byte	0x1
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.uleb128 0xf
	.byte	0x1
	.long	.LASF6
	.byte	0x2
	.byte	0x58
	.long	0x25
	.byte	0x1
	.long	0x13f
	.uleb128 0x10
	.long	0x13f
	.byte	0
	.uleb128 0x11
	.long	0x25
	.uleb128 0x12
	.byte	0x1
	.long	.LASF7
	.byte	0x3
	.byte	0x16
	.long	.LASF15
	.long	0x25
	.byte	0x1
	.uleb128 0x10
	.long	0x13f
	.uleb128 0x10
	.long	0x13f
	.byte	0
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.long	.LFB3
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
	.long	.LFE3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LVL0
	.long	.LVL1
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LFB4
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI3
	.long	.LFE4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LVL3
	.long	.LVL4
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL4
	.long	.LVL5-1
	.word	0x1
	.byte	0x66
	.long	.LVL6
	.long	.LFE4
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST4:
	.long	.LVL3
	.long	.LVL4
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
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
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF0:
	.string	"interfaces__unsigned_8"
.LASF3:
	.string	"one_wire__rom__family_code___XR_one_wire__rom__identifier___XEXS1"
.LASF12:
	.string	"one_wire__rom__verify_crc"
.LASF4:
	.string	"integer"
.LASF9:
	.string	"/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-rom.adb"
.LASF15:
	.string	"_ada_crc8"
.LASF14:
	.string	"_renaming_type___XDLU_1__0"
.LASF2:
	.string	"boolean"
.LASF7:
	.string	"crc8"
.LASF11:
	.string	"one_wire__rom__send_identifier"
.LASF6:
	.string	"one_wire__touch"
.LASF13:
	.string	"one_wire__rom__identifier"
.LASF8:
	.string	"GNU Ada 4.7.0"
.LASF10:
	.string	"one_wire__rom__unique_serial_code"
.LASF1:
	.string	"sizetype"
.LASF5:
	.string	"one_wire__rom__crc___XR_one_wire__rom__identifier___XEXS8"
	.ident	"GCC: (GNU) 4.7.0"
.global __do_copy_data
.global __do_clear_bss
