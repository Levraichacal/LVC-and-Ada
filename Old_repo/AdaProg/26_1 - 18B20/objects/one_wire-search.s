	.file	"one_wire-search.adb"
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
 ;  /home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-search.adb
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
	.section	.text.one_wire__search__search,"ax",@progbits
	.type	one_wire__search__search, @function
one_wire__search__search:
.LFB2:
	.file 1 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-search.adb"
	.loc 1 38 0
	push r15	 ; 
.LCFI0:
	push r16	 ; 
.LCFI1:
	push r17	 ; 
.LCFI2:
	push r28	 ; 
.LCFI3:
	push r29	 ; 
.LCFI4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
.LVL0:
	.loc 1 49 0
	sts one_wire__search__crc,__zero_reg__	 ;  one_wire__search__crc,
	.loc 1 52 0
	lds r24,one_wire__search__last_device_flag	 ;  one_wire__search__last_device_flag, one_wire__search__last_device_flag
	ldi r28,lo8(1)	 ;  tmp79,
	cpse r24,r28	 ;  one_wire__search__last_device_flag, tmp79
	rjmp .L2	 ; 
.LVL1:
.L16:
	.loc 1 42 0
	ldi r24,0	 ;  search_result
	rjmp .L3	 ; 
.LVL2:
.L2:
	.loc 1 56 0
	call one_wire__reset	 ; 
.LVL3:
	cpse r24,r28	 ; , tmp79
	rjmp .L17	 ; 
.L4:
.LVL4:
.LBB4:
.LBB5:
	.file 2 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire.adb"
	.loc 2 279 0
	ldi r24,lo8(-16)	 ; ,
	call one_wire__touch	 ; 
.LVL5:
	.loc 1 45 0
	ldi r17,lo8(1)	 ;  rom_byte_mask,
	.loc 1 41 0
	ldi r29,lo8(1)	 ;  rom_byte_number,
	.loc 1 40 0
	ldi r16,0	 ;  last_zero
	.loc 1 39 0
	ldi r28,lo8(1)	 ;  id_bit_number,
.LVL6:
.L33:
.LBE5:
.LBE4:
	.loc 1 70 0
	ldi r24,lo8(1)	 ; ,
	call one_wire__read_write_bit	 ; 
.LVL7:
	mov r15,r24	 ;  id_bit,
.LVL8:
	.loc 1 71 0
	ldi r24,lo8(1)	 ; ,
	call one_wire__read_write_bit	 ; 
.LVL9:
	.loc 1 73 0
	ldi r25,lo8(1)	 ; ,
	cpse r15,r25	 ;  id_bit,
	rjmp .L7	 ; 
	.loc 1 73 0 is_stmt 0 discriminator 1
	cpi r24,lo8(1)	 ;  cmp_id_bit,
	brne .L9	 ; ,
	rjmp .L8	 ; 
.L7:
	.loc 1 77 0 is_stmt 1
	cpse r15,r24	 ;  id_bit, cmp_id_bit
	rjmp .L19	 ; 
	.loc 1 82 0
	lds r18,one_wire__search__last_discrepancy	 ;  one_wire__search__last_discrepancy.9, one_wire__search__last_discrepancy
	cp r28,r18	 ;  id_bit_number, one_wire__search__last_discrepancy.9
	brsh .L11	 ; ,
	.loc 1 83 0
	mov r30,r29	 ;  tmp85, rom_byte_number
	ldi r31,0	 ; 
	subi r30,lo8(-(one_wire__rom__identifier-1))	 ;  tmp85,
	sbci r31,hi8(-(one_wire__rom__identifier-1))	 ;  tmp85,
	ld r19,Z	 ;  tmp86, one_wire__rom__identifier
	and r19,r17	 ;  tmp86, rom_byte_mask
	brne .+2	 ; 
	rjmp .L12	 ; 
	rjmp .L9	 ; 
.L11:
	.loc 1 91 0
	cpse r28,r18	 ;  id_bit_number, one_wire__search__last_discrepancy.9
	rjmp .L12	 ; 
	rjmp .L9	 ; 
.LVL10:
.L18:
	.loc 1 103 0
	sts one_wire__search__last_family_discrepancy,r28	 ;  one_wire__search__last_family_discrepancy, id_bit_number
	rjmp .L13	 ; 
.LVL11:
.L9:
	.loc 1 112 0
	mov r30,r29	 ;  tmp90, rom_byte_number
	ldi r31,0	 ; 
	.loc 1 111 0
	subi r30,lo8(-(one_wire__rom__identifier))	 ;  tmp90,
	sbci r31,hi8(-(one_wire__rom__identifier))	 ;  tmp90,
	.loc 1 112 0
	ld r22,-Z	 ;  tmp94, one_wire__rom__identifier
	or r22,r17	 ;  tmp94, rom_byte_mask
	.loc 1 111 0
	st Z,r22	 ;  one_wire__rom__identifier, tmp94
	ldi r24,lo8(1)	 ;  search_direction,
.LVL12:
	rjmp .L14	 ; 
.LVL13:
.L19:
	.loc 1 77 0
	mov r24,r15	 ;  search_direction, id_bit
.LVL14:
.L10:
	.loc 1 115 0
	mov r30,r29	 ;  tmp98, rom_byte_number
	ldi r31,0	 ; 
	.loc 1 114 0
	subi r30,lo8(-(one_wire__rom__identifier))	 ;  tmp98,
	sbci r31,hi8(-(one_wire__rom__identifier))	 ;  tmp98,
	.loc 1 115 0
	mov r20,r17	 ;  tmp102, rom_byte_mask
	com r20	 ;  tmp102
	ld r21,-Z	 ;  tmp103, one_wire__rom__identifier
	and r21,r20	 ;  tmp103, tmp102
	.loc 1 114 0
	st Z,r21	 ;  one_wire__rom__identifier, tmp103
.L14:
	.loc 1 119 0
	call one_wire__read_write_bit	 ; 
.LVL15:
	.loc 1 123 0
	subi r28,lo8(-(1))	 ;  id_bit_number,
.LVL16:
	.loc 1 124 0
	lsl r17	 ;  rom_byte_mask
.LVL17:
	.loc 1 128 0
	brne .L33	 ; ,
	.loc 1 130 0
	mov r30,r29	 ;  tmp108, rom_byte_number
	ldi r31,0	 ; 
	subi r30,lo8(-(one_wire__rom__identifier-1))	 ;  tmp108,
	sbci r31,hi8(-(one_wire__rom__identifier-1))	 ;  tmp108,
	lds r22,one_wire__search__crc	 ; , one_wire__search__crc
	ld r24,Z	 ; , one_wire__rom__identifier
	call _ada_crc8	 ; 
.LVL18:
	sts one_wire__search__crc,r24	 ;  one_wire__search__crc,
	.loc 1 132 0
	cpi r29,lo8(8)	 ;  rom_byte_number,
	breq .L8	 ; ,
	.loc 1 133 0
	subi r29,lo8(-(1))	 ;  rom_byte_number,
.LVL19:
	.loc 1 134 0
	ldi r17,lo8(1)	 ;  rom_byte_mask,
	rjmp .L33	 ; 
.LVL20:
.L8:
	.loc 1 142 0
	cpi r28,lo8(65)	 ;  id_bit_number,
	brsh .+2	 ; 
	rjmp .L16	 ; 
	.loc 1 145 0
	sts one_wire__search__last_discrepancy,r16	 ;  one_wire__search__last_discrepancy, last_zero
	.loc 1 149 0
	ldi r24,lo8(1)	 ;  tmp109,
	.loc 1 148 0
	cpse r16,__zero_reg__	 ;  last_zero,
	rjmp .L3	 ; 
	.loc 1 149 0
	sts one_wire__search__last_device_flag,r24	 ;  one_wire__search__last_device_flag, tmp109
.LVL21:
.L3:
	.loc 1 158 0
	tst r24	 ;  search_result
	breq .L17	 ; ,
	.loc 1 158 0 is_stmt 0 discriminator 1
	lds r23,one_wire__rom__identifier	 ;  one_wire__rom__identifier, one_wire__rom__identifier
	cpse r23,__zero_reg__	 ;  one_wire__rom__identifier,
	rjmp .L25	 ; 
.LVL22:
.L17:
	.loc 1 159 0 is_stmt 1
	sts one_wire__search__last_discrepancy,__zero_reg__	 ;  one_wire__search__last_discrepancy,
	.loc 1 160 0
	sts one_wire__search__last_device_flag,__zero_reg__	 ;  one_wire__search__last_device_flag,
	.loc 1 161 0
	sts one_wire__search__last_family_discrepancy,__zero_reg__	 ;  one_wire__search__last_family_discrepancy,
.LVL23:
	.loc 1 162 0
	ldi r24,0	 ;  search_result
	rjmp .L25	 ; 
.LVL24:
.L12:
	.loc 1 102 0
	cpi r28,lo8(9)	 ;  id_bit_number,
	brsh .+2	 ; 
	rjmp .L18	 ; 
.L13:
	.loc 1 77 0
	mov r16,r28	 ;  last_zero, id_bit_number
	ldi r24,0	 ;  search_direction
.LVL25:
	rjmp .L10	 ; 
.LVL26:
.L25:
/* epilogue start */
	.loc 1 165 0
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	ret
.LFE2:
	.size	one_wire__search__search, .-one_wire__search__search
	.section	.text.one_wire__search__first,"ax",@progbits
.global	one_wire__search__first
	.type	one_wire__search__first, @function
one_wire__search__first:
.LFB3:
	.loc 1 171 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 174 0
	sts one_wire__search__last_discrepancy,__zero_reg__	 ;  one_wire__search__last_discrepancy,
	.loc 1 175 0
	sts one_wire__search__last_device_flag,__zero_reg__	 ;  one_wire__search__last_device_flag,
	.loc 1 176 0
	sts one_wire__search__last_family_discrepancy,__zero_reg__	 ;  one_wire__search__last_family_discrepancy,
	.loc 1 177 0
	jmp one_wire__search__search	 ; 
.LVL27:
.LFE3:
	.size	one_wire__search__first, .-one_wire__search__first
	.section	.text.one_wire__search__next,"ax",@progbits
.global	one_wire__search__next
	.type	one_wire__search__next, @function
one_wire__search__next:
.LFB4:
	.loc 1 184 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 187 0
	jmp one_wire__search__search	 ; 
.LVL28:
.LFE4:
	.size	one_wire__search__next, .-one_wire__search__next
	.section	.text.one_wire__search__target_setup,"ax",@progbits
.global	one_wire__search__target_setup
	.type	one_wire__search__target_setup, @function
one_wire__search__target_setup:
.LFB5:
	.loc 1 193 0
.LVL29:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 196 0
	ldi r30,lo8(one_wire__rom__identifier)	 ;  tmp44,
	ldi r31,hi8(one_wire__rom__identifier)	 ; ,
	ldi r25,lo8(8)	 ;  tmp43,
	movw r26,r30	 ; , tmp44
	0:
	st X+,__zero_reg__	 ; 
	dec r25	 ;  tmp43
	brne 0b
	st Z,r24	 ;  one_wire__rom__identifier, family_code
	.loc 1 197 0
	ldi r24,lo8(64)	 ;  tmp46,
.LVL30:
	sts one_wire__search__last_discrepancy,r24	 ;  one_wire__search__last_discrepancy, tmp46
	.loc 1 198 0
	sts one_wire__search__last_family_discrepancy,__zero_reg__	 ;  one_wire__search__last_family_discrepancy,
	.loc 1 199 0
	sts one_wire__search__last_device_flag,__zero_reg__	 ;  one_wire__search__last_device_flag,
	ret
.LFE5:
	.size	one_wire__search__target_setup, .-one_wire__search__target_setup
	.section	.text.one_wire__search__family_skip_setup,"ax",@progbits
.global	one_wire__search__family_skip_setup
	.type	one_wire__search__family_skip_setup, @function
one_wire__search__family_skip_setup:
.LFB6:
	.loc 1 205 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 208 0
	lds r24,one_wire__search__last_family_discrepancy	 ;  one_wire__search__last_family_discrepancy.12, one_wire__search__last_family_discrepancy
	sts one_wire__search__last_discrepancy,r24	 ;  one_wire__search__last_discrepancy, one_wire__search__last_family_discrepancy.12
	.loc 1 209 0
	sts one_wire__search__last_family_discrepancy,__zero_reg__	 ;  one_wire__search__last_family_discrepancy,
	.loc 1 211 0
	cpse r24,__zero_reg__	 ;  one_wire__search__last_family_discrepancy.12,
	rjmp .L37	 ; 
	.loc 1 212 0
	ldi r18,lo8(1)	 ;  tmp43,
	sts one_wire__search__last_device_flag,r18	 ;  one_wire__search__last_device_flag, tmp43
.L37:
	ret
.LFE6:
	.size	one_wire__search__family_skip_setup, .-one_wire__search__family_skip_setup
	.section	.text.one_wire__search__verify,"ax",@progbits
.global	one_wire__search__verify
	.type	one_wire__search__verify, @function
one_wire__search__verify:
.LFB7:
	.loc 1 223 0
	push r17	 ; 
.LCFI5:
	push r28	 ; 
.LCFI6:
	push r29	 ; 
.LCFI7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	.loc 1 229 0
	ldi r24,lo8(8)	 ;  tmp49,
	ldi r30,lo8(one_wire__rom__identifier)	 ; ,
	ldi r31,hi8(one_wire__rom__identifier)	 ; ,
	ldi r26,lo8(one_wire__search__rom_backup)	 ; ,
	ldi r27,hi8(one_wire__search__rom_backup)	 ; ,
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r24	 ;  tmp49
	brne 0b
	.loc 1 230 0
	lds r17,one_wire__search__last_discrepancy	 ;  ld_backup, one_wire__search__last_discrepancy
.LVL31:
	.loc 1 231 0
	lds r29,one_wire__search__last_device_flag	 ;  ldf_backup, one_wire__search__last_device_flag
.LVL32:
	.loc 1 232 0
	lds r28,one_wire__search__last_family_discrepancy	 ;  lfd_backup, one_wire__search__last_family_discrepancy
.LVL33:
	.loc 1 234 0
	ldi r18,lo8(64)	 ;  tmp50,
	sts one_wire__search__last_discrepancy,r18	 ;  one_wire__search__last_discrepancy, tmp50
	.loc 1 235 0
	sts one_wire__search__last_device_flag,__zero_reg__	 ;  one_wire__search__last_device_flag,
	.loc 1 236 0
	call one_wire__search__search	 ; 
.LVL34:
	tst r24	 ; 
	breq .L42	 ; ,
	.loc 1 238 0
	ldi r20,lo8(8)	 ; ,
	ldi r21,0	 ; 
	ldi r22,lo8(one_wire__search__rom_backup)	 ; ,
	ldi r23,hi8(one_wire__search__rom_backup)	 ; ,
	ldi r24,lo8(one_wire__rom__identifier)	 ; ,
	ldi r25,hi8(one_wire__rom__identifier)	 ; ,
	call memcmp	 ; 
.LVL35:
	movw r20,r24	 ; ,
	ldi r24,lo8(1)	 ;  rslt,
	cp r20,__zero_reg__	 ;  D.1514
	cpc r21,__zero_reg__	 ;  D.1514
	breq .L40	 ; ,
.L42:
	.loc 1 240 0
	ldi r24,0	 ;  rslt
.L40:
.LVL36:
	.loc 1 243 0
	ldi r25,lo8(8)	 ;  tmp53,
	ldi r30,lo8(one_wire__search__rom_backup)	 ; ,
	ldi r31,hi8(one_wire__search__rom_backup)	 ; ,
	ldi r26,lo8(one_wire__rom__identifier)	 ; ,
	ldi r27,hi8(one_wire__rom__identifier)	 ; ,
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r25	 ;  tmp53
	brne 0b
	.loc 1 244 0
	sts one_wire__search__last_discrepancy,r17	 ;  one_wire__search__last_discrepancy, ld_backup
	.loc 1 245 0
	sts one_wire__search__last_device_flag,r29	 ;  one_wire__search__last_device_flag, ldf_backup
	.loc 1 246 0
	sts one_wire__search__last_family_discrepancy,r28	 ;  one_wire__search__last_family_discrepancy, lfd_backup
/* epilogue start */
	.loc 1 249 0
	pop r29	 ; 
.LVL37:
	pop r28	 ; 
.LVL38:
	pop r17	 ; 
.LVL39:
	ret
.LFE7:
	.size	one_wire__search__verify, .-one_wire__search__verify
.global	one_wire__search_E
	.section	.data.one_wire__search_E,"aw",@progbits
	.type	one_wire__search_E, @object
	.size	one_wire__search_E, 2
one_wire__search_E:
	.zero	2
	.section	.data.one_wire__search__last_discrepancy,"aw",@progbits
	.type	one_wire__search__last_discrepancy, @object
	.size	one_wire__search__last_discrepancy, 1
one_wire__search__last_discrepancy:
	.zero	1
	.section	.data.one_wire__search__last_device_flag,"aw",@progbits
	.type	one_wire__search__last_device_flag, @object
	.size	one_wire__search__last_device_flag, 1
one_wire__search__last_device_flag:
	.zero	1
	.section	.data.one_wire__search__last_family_discrepancy,"aw",@progbits
	.type	one_wire__search__last_family_discrepancy, @object
	.size	one_wire__search__last_family_discrepancy, 1
one_wire__search__last_family_discrepancy:
	.zero	1
	.section	.data.one_wire__search__crc,"aw",@progbits
	.type	one_wire__search__crc, @object
	.size	one_wire__search__crc, 1
one_wire__search__crc:
	.zero	1
	.section	.bss.one_wire__search__rom_backup,"aw",@nobits
	.type	one_wire__search__rom_backup, @object
	.size	one_wire__search__rom_backup, 8
one_wire__search__rom_backup:
	.zero	8
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
	.byte	0x4
	.long	.LCFI0-.LFB2
	.byte	0xe
	.uleb128 0x3
	.byte	0x8f
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x4
	.byte	0x90
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x5
	.byte	0x91
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x6
	.byte	0x9c
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x7
	.byte	0x9d
	.uleb128 0x6
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
	.long	.LCFI5-.LFB7
	.byte	0xe
	.uleb128 0x3
	.byte	0x91
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x4
	.byte	0x9c
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x5
	.byte	0x9d
	.uleb128 0x4
	.p2align	2
.LEFDE10:
	.text
.Letext0:
	.file 3 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire.ads"
	.file 4 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/crc8.ads"
	.file 5 "<built-in>"
	.file 6 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-rom.ads"
	.file 7 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-search.ads"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x3ca
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF34
	.byte	0xd
	.long	.LASF35
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.long	0x25
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.long	.LASF36
	.byte	0x6
	.byte	0x22
	.long	0x49
	.uleb128 0x5
	.long	.LASF36
	.long	0x25
	.long	0x5e
	.uleb128 0x6
	.long	0x37
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.byte	0
	.byte	0xff
	.long	.LASF3
	.long	0x69
	.uleb128 0x7
	.byte	0x1
	.byte	0x7
	.long	.LASF37
	.byte	0x1
	.uleb128 0x8
	.byte	0x1
	.long	.LASF38
	.byte	0x2
	.word	0x114
	.byte	0x3
	.long	0x97
	.uleb128 0x9
	.long	.LASF39
	.byte	0x3
	.byte	0x4e
	.long	0x97
	.uleb128 0xa
	.long	.LASF12
	.byte	0x2
	.word	0x115
	.long	0x25
	.byte	0
	.uleb128 0xb
	.long	0x5e
	.uleb128 0xc
	.long	.LASF40
	.byte	0x1
	.byte	0x26
	.long	0x1b9
	.long	.LFB2
	.long	.LFE2
	.long	.LLST0
	.byte	0x1
	.long	0x1b9
	.uleb128 0xd
	.long	.LASF4
	.byte	0x1
	.byte	0x27
	.long	0x25
	.long	.LLST1
	.uleb128 0xd
	.long	.LASF5
	.byte	0x1
	.byte	0x28
	.long	0x25
	.long	.LLST2
	.uleb128 0xd
	.long	.LASF6
	.byte	0x1
	.byte	0x29
	.long	0x2c
	.long	.LLST3
	.uleb128 0xd
	.long	.LASF7
	.byte	0x1
	.byte	0x2a
	.long	0x1b9
	.long	.LLST4
	.uleb128 0xd
	.long	.LASF8
	.byte	0x1
	.byte	0x2b
	.long	0x25
	.long	.LLST5
	.uleb128 0xd
	.long	.LASF9
	.byte	0x1
	.byte	0x2c
	.long	0x25
	.long	.LLST6
	.uleb128 0xd
	.long	.LASF10
	.byte	0x1
	.byte	0x2d
	.long	0x25
	.long	.LLST7
	.uleb128 0xd
	.long	.LASF11
	.byte	0x1
	.byte	0x2e
	.long	0x25
	.long	.LLST8
	.uleb128 0xe
	.long	.LASF12
	.byte	0x1
	.byte	0x2f
	.long	0x25
	.uleb128 0xf
	.long	0x71
	.long	.LBB4
	.long	.LBE4
	.byte	0x1
	.byte	0x41
	.long	0x177
	.uleb128 0x10
	.long	0x7f
	.long	.LLST9
	.uleb128 0x11
	.long	.LBB5
	.long	.LBE5
	.uleb128 0x12
	.long	0x8a
	.uleb128 0x13
	.long	.LVL5
	.long	0x338
	.uleb128 0x14
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x9
	.byte	0xf0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	.LVL3
	.long	0x34f
	.uleb128 0x16
	.long	.LVL7
	.long	0x35c
	.long	0x193
	.uleb128 0x14
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x16
	.long	.LVL9
	.long	0x35c
	.long	0x1a6
	.uleb128 0x14
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x15
	.long	.LVL15
	.long	0x35c
	.uleb128 0x15
	.long	.LVL18
	.long	0x373
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF13
	.uleb128 0x17
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0xab
	.long	0x1b9
	.long	.LFB3
	.long	.LFE3
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x1e8
	.uleb128 0x18
	.long	.LVL27
	.byte	0x1
	.long	0x9c
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0xb8
	.long	0x1b9
	.long	.LFB4
	.long	.LFE4
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x210
	.uleb128 0x18
	.long	.LVL28
	.byte	0x1
	.long	0x9c
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF41
	.byte	0x1
	.byte	0xc1
	.long	.LFB5
	.long	.LFE5
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x239
	.uleb128 0x1a
	.long	.LASF42
	.byte	0x7
	.byte	0x23
	.long	0x239
	.long	.LLST10
	.byte	0
	.uleb128 0xb
	.long	0x25
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF43
	.byte	0x1
	.byte	0xcd
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0xdf
	.long	0x1b9
	.long	.LFB7
	.long	.LFE7
	.long	.LLST11
	.byte	0x1
	.long	0x2d6
	.uleb128 0xd
	.long	.LASF17
	.byte	0x1
	.byte	0xe0
	.long	0x25
	.long	.LLST12
	.uleb128 0xd
	.long	.LASF18
	.byte	0x1
	.byte	0xe0
	.long	0x25
	.long	.LLST13
	.uleb128 0x1d
	.long	.LASF19
	.byte	0x1
	.byte	0xe1
	.long	0x1b9
	.byte	0x1
	.byte	0x68
	.uleb128 0xd
	.long	.LASF20
	.byte	0x1
	.byte	0xe1
	.long	0x1b9
	.long	.LLST14
	.uleb128 0x15
	.long	.LVL34
	.long	0x9c
	.uleb128 0x13
	.long	.LVL35
	.long	0x393
	.uleb128 0x14
	.byte	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__search__rom_backup
	.uleb128 0x14
	.byte	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.byte	0x1
	.byte	0x38
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	.LASF21
	.byte	0x1
	.byte	0x1c
	.long	0x25
	.byte	0x5
	.byte	0x3
	.long	one_wire__search__last_discrepancy
	.uleb128 0x1d
	.long	.LASF22
	.byte	0x1
	.byte	0x1d
	.long	0x25
	.byte	0x5
	.byte	0x3
	.long	one_wire__search__last_family_discrepancy
	.uleb128 0x1d
	.long	.LASF23
	.byte	0x1
	.byte	0x1e
	.long	0x1b9
	.byte	0x5
	.byte	0x3
	.long	one_wire__search__last_device_flag
	.uleb128 0x1d
	.long	.LASF24
	.byte	0x1
	.byte	0x1f
	.long	0x25
	.byte	0x5
	.byte	0x3
	.long	one_wire__search__crc
	.uleb128 0x1d
	.long	.LASF25
	.byte	0x1
	.byte	0xdd
	.long	0x3e
	.byte	0x5
	.byte	0x3
	.long	one_wire__search__rom_backup
	.uleb128 0x1e
	.long	.LASF44
	.byte	0x6
	.byte	0x27
	.long	0x3e
	.byte	0x1
	.byte	0x1
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF26
	.byte	0x3
	.byte	0x58
	.long	0x25
	.byte	0x1
	.long	0x34f
	.uleb128 0x20
	.long	0x239
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF45
	.byte	0x3
	.byte	0x44
	.long	0x1b9
	.byte	0x1
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF27
	.byte	0x3
	.byte	0x5c
	.long	0x25
	.byte	0x1
	.long	0x373
	.uleb128 0x20
	.long	0x239
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x16
	.long	.LASF30
	.long	0x25
	.byte	0x1
	.long	0x393
	.uleb128 0x20
	.long	0x239
	.uleb128 0x20
	.long	0x239
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF29
	.byte	0x5
	.byte	0
	.long	.LASF31
	.long	0x3b8
	.byte	0x1
	.long	0x3b8
	.uleb128 0x20
	.long	0x3bf
	.uleb128 0x20
	.long	0x3bf
	.uleb128 0x20
	.long	0x3c6
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF32
	.uleb128 0x23
	.byte	0x2
	.long	0x3c5
	.uleb128 0x24
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF33
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB2
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
	.long	.LFE2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	0
	.long	0
.LLST1:
	.long	.LVL0
	.long	.LVL1
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL2
	.long	.LVL6
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL6
	.long	.LVL21
	.word	0x1
	.byte	0x6c
	.long	.LVL24
	.long	.LVL26
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST2:
	.long	.LVL0
	.long	.LVL1
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL2
	.long	.LVL6
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL6
	.long	.LVL10
	.word	0x1
	.byte	0x60
	.long	.LVL10
	.long	.LVL11
	.word	0x1
	.byte	0x6c
	.long	.LVL11
	.long	.LVL21
	.word	0x1
	.byte	0x60
	.long	.LVL24
	.long	.LVL26
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST3:
	.long	.LVL0
	.long	.LVL1
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL2
	.long	.LVL6
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL6
	.long	.LVL21
	.word	0x1
	.byte	0x6d
	.long	.LVL24
	.long	.LVL26
	.word	0x1
	.byte	0x6d
	.long	0
	.long	0
.LLST4:
	.long	.LVL0
	.long	.LVL21
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL21
	.long	.LVL22
	.word	0x1
	.byte	0x68
	.long	.LVL23
	.long	.LVL26
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST5:
	.long	.LVL8
	.long	.LVL21
	.word	0x1
	.byte	0x5f
	.long	.LVL24
	.long	.LVL26
	.word	0x1
	.byte	0x5f
	.long	0
	.long	0
.LLST6:
	.long	.LVL9
	.long	.LVL12
	.word	0x1
	.byte	0x68
	.long	.LVL13
	.long	.LVL14
	.word	0x1
	.byte	0x68
	.long	.LVL24
	.long	.LVL25
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST7:
	.long	.LVL0
	.long	.LVL1
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL2
	.long	.LVL6
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL6
	.long	.LVL19
	.word	0x1
	.byte	0x61
	.long	.LVL19
	.long	.LVL20
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL20
	.long	.LVL21
	.word	0x1
	.byte	0x61
	.long	.LVL24
	.long	.LVL26
	.word	0x1
	.byte	0x61
	.long	0
	.long	0
.LLST8:
	.long	.LVL10
	.long	.LVL11
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL24
	.long	.LVL26
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL4
	.long	.LVL21
	.word	0x3
	.byte	0x9
	.byte	0xf0
	.byte	0x9f
	.long	.LVL24
	.long	.LVL26
	.word	0x3
	.byte	0x9
	.byte	0xf0
	.byte	0x9f
	.long	0
	.long	0
.LLST10:
	.long	.LVL29
	.long	.LVL30
	.word	0x1
	.byte	0x68
	.long	.LVL30
	.long	.LFE5
	.word	0x2
	.byte	0x8e
	.sleb128 0
	.long	0
	.long	0
.LLST11:
	.long	.LFB7
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
	.long	.LFE7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	0
	.long	0
.LLST12:
	.long	.LVL31
	.long	.LVL39
	.word	0x1
	.byte	0x61
	.long	.LVL39
	.long	.LFE7
	.word	0x5
	.byte	0x3
	.long	one_wire__search__last_discrepancy
	.long	0
	.long	0
.LLST13:
	.long	.LVL33
	.long	.LVL38
	.word	0x1
	.byte	0x6c
	.long	.LVL38
	.long	.LFE7
	.word	0x5
	.byte	0x3
	.long	one_wire__search__last_family_discrepancy
	.long	0
	.long	0
.LLST14:
	.long	.LVL32
	.long	.LVL37
	.word	0x1
	.byte	0x6d
	.long	.LVL37
	.long	.LFE7
	.word	0x5
	.byte	0x3
	.long	one_wire__search__last_device_flag
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x44
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
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF44:
	.string	"one_wire__rom__identifier"
.LASF2:
	.string	"one_wire__rom__serial_code_index___XDLU_1__8"
.LASF38:
	.string	"one_wire__send_command"
.LASF30:
	.string	"_ada_crc8"
.LASF45:
	.string	"one_wire__reset"
.LASF5:
	.string	"last_zero"
.LASF25:
	.string	"one_wire__search__rom_backup"
.LASF8:
	.string	"id_bit"
.LASF7:
	.string	"search_result"
.LASF36:
	.string	"one_wire__rom__unique_serial_code"
.LASF9:
	.string	"cmp_id_bit"
.LASF29:
	.string	"__builtin_memcmp"
.LASF11:
	.string	"search_direction"
.LASF26:
	.string	"one_wire__touch"
.LASF6:
	.string	"rom_byte_number"
.LASF19:
	.string	"rslt"
.LASF27:
	.string	"one_wire__read_write_bit"
.LASF12:
	.string	"dummy"
.LASF40:
	.string	"one_wire__search__search"
.LASF41:
	.string	"one_wire__search__target_setup"
.LASF31:
	.string	"memcmp"
.LASF17:
	.string	"ld_backup"
.LASF22:
	.string	"one_wire__search__last_family_discrepancy"
.LASF15:
	.string	"one_wire__search__next"
.LASF0:
	.string	"interfaces__unsigned_8"
.LASF16:
	.string	"one_wire__search__verify"
.LASF18:
	.string	"lfd_backup"
.LASF43:
	.string	"one_wire__search__family_skip_setup"
.LASF20:
	.string	"ldf_backup"
.LASF42:
	.string	"family_code"
.LASF28:
	.string	"crc8"
.LASF3:
	.string	"one_wire__command_code"
.LASF1:
	.string	"sizetype"
.LASF24:
	.string	"one_wire__search__crc"
.LASF14:
	.string	"one_wire__search__first"
.LASF37:
	.string	"one_wire__Tcommand_codeB"
.LASF23:
	.string	"one_wire__search__last_device_flag"
.LASF34:
	.string	"GNU Ada 4.7.0"
.LASF33:
	.string	"__unknown__"
.LASF32:
	.string	"integer"
.LASF39:
	.string	"command"
.LASF35:
	.string	"/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-search.adb"
.LASF13:
	.string	"boolean"
.LASF4:
	.string	"id_bit_number"
.LASF10:
	.string	"rom_byte_mask"
.LASF21:
	.string	"one_wire__search__last_discrepancy"
	.ident	"GCC: (GNU) 4.7.0"
.global __do_copy_data
.global __do_clear_bss
