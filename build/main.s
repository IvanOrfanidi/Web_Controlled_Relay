	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.InitWatchdog,"ax",@progbits
.global	InitWatchdog
	.type	InitWatchdog, @function
InitWatchdog:
.LFB16:
	.file 1 "../src/main.c"
	.loc 1 44 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 45 0
/* #APP */
 ;  45 "../src/main.c" 1
	cli
 ;  0 "" 2
	.loc 1 46 0
 ;  46 "../src/main.c" 1
	wdr
 ;  0 "" 2
.LVL0:
/* #NOAPP */
.LBB6:
.LBB7:
	.file 2 "/usr/lib/avr/include/avr/wdt.h"
	.loc 2 473 0
	ldi r25,lo8(41)
	ldi r24,lo8(24)
/* #APP */
 ;  473 "/usr/lib/avr/include/avr/wdt.h" 1
	in __tmp_reg__,__SREG__
	cli
	wdr
	sts 96, r24
	out __SREG__,__tmp_reg__
	sts 96, r25
 	
 ;  0 "" 2
.LVL1:
/* #NOAPP */
	ret
.LBE7:
.LBE6:
	.cfi_endproc
.LFE16:
	.size	InitWatchdog, .-InitWatchdog
	.section	.text.InitGpio,"ax",@progbits
.global	InitGpio
	.type	InitGpio, @function
InitGpio:
.LFB17:
	.loc 1 51 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 52 0
	ldi r24,lo8(1)
	out 0x4,r24
	.loc 1 53 0
	out 0x5,__zero_reg__
	.loc 1 55 0
	ldi r24,lo8(16)
	out 0x7,r24
	.loc 1 56 0
	out 0x8,r24
	.loc 1 58 0
	ldi r24,lo8(64)
	out 0xa,r24
	.loc 1 59 0
	ldi r24,lo8(-1)
	out 0xb,r24
	.loc 1 60 0
	cbi 0xb,6
	ret
	.cfi_endproc
.LFE17:
	.size	InitGpio, .-InitGpio
	.section	.text.InitInterrupt,"ax",@progbits
.global	InitInterrupt
	.type	InitInterrupt, @function
InitInterrupt:
.LFB18:
	.loc 1 64 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 65 0
	ldi r30,lo8(105)
	ldi r31,0
	ld r24,Z
	andi r24,lo8(-2)
	st Z,r24
	.loc 1 67 0
	ld r24,Z
	ori r24,lo8(2)
	st Z,r24
	.loc 1 68 0
	sbi 0x1d,0
	ret
	.cfi_endproc
.LFE18:
	.size	InitInterrupt, .-InitInterrupt
	.section	.text.startup.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB15:
	.loc 1 18 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 20 0
	rcall InitWatchdog
.LVL2:
	.loc 1 21 0
	rcall InitGpio
.LVL3:
	.loc 1 22 0
	rcall InitInterrupt
.LVL4:
	.loc 1 24 0
/* #APP */
 ;  24 "../src/main.c" 1
	wdr
 ;  0 "" 2
	.loc 1 27 0
/* #NOAPP */
	ldi r24,lo8(MAC_ADDR)
	ldi r25,hi8(MAC_ADDR)
	rcall Enc28j60Init
.LVL5:
	.loc 1 28 0
/* #APP */
 ;  28 "../src/main.c" 1
	wdr
 ;  0 "" 2
	.loc 1 30 0
/* #NOAPP */
	rcall InitPhy
.LVL6:
	.loc 1 31 0
/* #APP */
 ;  31 "../src/main.c" 1
	wdr
 ;  0 "" 2
	.loc 1 34 0
/* #NOAPP */
	ldi r20,lo8(80)
	ldi r21,0
	ldi r22,lo8(IP_ADDR)
	ldi r23,hi8(IP_ADDR)
	ldi r24,lo8(MAC_ADDR)
	ldi r25,hi8(MAC_ADDR)
	rcall Init_ip_arp_udp_tcp
.LVL7:
	.loc 1 35 0
/* #APP */
 ;  35 "../src/main.c" 1
	wdr
 ;  0 "" 2
/* #NOAPP */
.LBB8:
.LBB9:
	.file 3 "../src/main.h"
	.loc 3 24 0
/* #APP */
 ;  24 "../src/main.h" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.L5:
.LBE9:
.LBE8:
	.loc 1 39 0
/* #APP */
 ;  39 "../src/main.c" 1
	wdr
 ;  0 "" 2
/* #NOAPP */
	rjmp .L5
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.section	.text.__vector_1,"ax",@progbits
.global	__vector_1
	.type	__vector_1, @function
__vector_1:
.LFB19:
	.loc 1 73 0
	.cfi_startproc
	push r1
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
	.cfi_def_cfa_offset 5
	.cfi_offset 18, -4
	push r19
	.cfi_def_cfa_offset 6
	.cfi_offset 19, -5
	push r20
	.cfi_def_cfa_offset 7
	.cfi_offset 20, -6
	push r21
	.cfi_def_cfa_offset 8
	.cfi_offset 21, -7
	push r22
	.cfi_def_cfa_offset 9
	.cfi_offset 22, -8
	push r23
	.cfi_def_cfa_offset 10
	.cfi_offset 23, -9
	push r24
	.cfi_def_cfa_offset 11
	.cfi_offset 24, -10
	push r25
	.cfi_def_cfa_offset 12
	.cfi_offset 25, -11
	push r26
	.cfi_def_cfa_offset 13
	.cfi_offset 26, -12
	push r27
	.cfi_def_cfa_offset 14
	.cfi_offset 27, -13
	push r30
	.cfi_def_cfa_offset 15
	.cfi_offset 30, -14
	push r31
	.cfi_def_cfa_offset 16
	.cfi_offset 31, -15
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 15 */
.L__stack_usage = 15
	.loc 1 74 0
	rcall LanTask
.LVL8:
/* epilogue start */
	.loc 1 75 0
	pop r31
	pop r30
	pop r27
	pop r26
	pop r25
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE19:
	.size	__vector_1, .-__vector_1
	.section	.rodata
	.type	IP_ADDR, @object
	.size	IP_ADDR, 4
IP_ADDR:
	.byte	-64
	.byte	-88
	.byte	109
	.byte	14
	.type	MAC_ADDR, @object
	.size	MAC_ADDR, 6
MAC_ADDR:
	.byte	0
	.byte	33
	.byte	104
	.byte	51
	.byte	-42
	.byte	48
	.text
.Letext0:
	.file 4 "/usr/lib/avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1a5
	.word	0x3
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF15
	.byte	0xc
	.long	.LASF16
	.long	.LASF17
	.long	.Ldebug_ranges0+0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x4
	.byte	0x7e
	.long	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x4
	.byte	0x80
	.long	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF18
	.byte	0x2
	.word	0x1c4
	.byte	0x1
	.byte	0x3
	.long	0x95
	.uleb128 0x6
	.long	.LASF19
	.byte	0x2
	.word	0x1c4
	.long	0x95
	.byte	0
	.uleb128 0x7
	.long	0x2c
	.uleb128 0x8
	.byte	0x1
	.long	.LASF20
	.byte	0x3
	.byte	0x16
	.byte	0x3
	.uleb128 0x9
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.byte	0x2b
	.long	.LFB16
	.long	.LFE16
	.byte	0x1
	.byte	0x9c
	.long	0xcf
	.uleb128 0xa
	.long	0x7a
	.long	.LBB6
	.long	.LBE6
	.byte	0x1
	.byte	0x2f
	.uleb128 0xb
	.long	0x88
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.long	.LASF10
	.byte	0x1
	.byte	0x32
	.long	.LFB17
	.long	.LFE17
	.byte	0x1
	.byte	0x9c
	.uleb128 0xc
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.byte	0x3f
	.long	.LFB18
	.long	.LFE18
	.byte	0x1
	.byte	0x9c
	.uleb128 0xd
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0x11
	.long	0x3e
	.long	.LFB15
	.long	.LFE15
	.byte	0x1
	.byte	0x9c
	.long	0x11d
	.uleb128 0xe
	.long	0x9a
	.long	.LBB8
	.long	.LBE8
	.byte	0x1
	.byte	0x25
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.byte	0x48
	.byte	0x1
	.long	.LFB19
	.long	.LFE19
	.byte	0x1
	.byte	0x9c
	.uleb128 0x10
	.long	0x95
	.long	0x140
	.uleb128 0x11
	.long	0x140
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF12
	.uleb128 0x12
	.long	.LASF13
	.byte	0x3
	.byte	0x11
	.long	0x158
	.byte	0x5
	.byte	0x3
	.long	MAC_ADDR
	.uleb128 0x7
	.long	0x130
	.uleb128 0x10
	.long	0x95
	.long	0x16d
	.uleb128 0x11
	.long	0x140
	.byte	0x3
	.byte	0
	.uleb128 0x12
	.long	.LASF14
	.byte	0x3
	.byte	0x12
	.long	0x17e
	.byte	0x5
	.byte	0x3
	.long	IP_ADDR
	.uleb128 0x7
	.long	0x15d
	.uleb128 0x10
	.long	0x193
	.long	0x193
	.uleb128 0x11
	.long	0x140
	.byte	0xe
	.byte	0
	.uleb128 0x7
	.long	0x73
	.uleb128 0x13
	.long	.LASF24
	.byte	0x3
	.byte	0x13
	.long	0x1a3
	.uleb128 0x7
	.long	0x183
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
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
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
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
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
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1d
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB16
	.long	.LFE16-.LFB16
	.long	.LFB17
	.long	.LFE17-.LFB17
	.long	.LFB18
	.long	.LFE18-.LFB18
	.long	.LFB15
	.long	.LFE15-.LFB15
	.long	.LFB19
	.long	.LFE19-.LFB19
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB16
	.long	.LFE16
	.long	.LFB17
	.long	.LFE17
	.long	.LFB18
	.long	.LFE18
	.long	.LFB15
	.long	.LFE15
	.long	.LFB19
	.long	.LFE19
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"long long int"
.LASF10:
	.string	"InitGpio"
.LASF21:
	.string	"InitWatchdog"
.LASF15:
	.string	"GNU C99 5.4.0 -mn-flash=1 -mno-skip-bug -mmcu=avr4 -g -gdwarf-3 -gstrict-dwarf -Os -pedantic-errors -std=gnu99 -fpack-struct -fshort-enums -funsigned-char -funsigned-bitfields -ffunction-sections"
.LASF19:
	.string	"value"
.LASF1:
	.string	"unsigned char"
.LASF6:
	.string	"long unsigned int"
.LASF17:
	.string	"/home/orfanidi/AVR/Web_Controlled_Relay/build"
.LASF11:
	.string	"InitInterrupt"
.LASF22:
	.string	"main"
.LASF4:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF20:
	.string	"enable_interrupt"
.LASF12:
	.string	"sizetype"
.LASF16:
	.string	"../src/main.c"
.LASF24:
	.string	"SRT_IP_ADDR"
.LASF9:
	.string	"char"
.LASF23:
	.string	"__vector_1"
.LASF3:
	.string	"uint16_t"
.LASF13:
	.string	"MAC_ADDR"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF18:
	.string	"wdt_enable"
.LASF14:
	.string	"IP_ADDR"
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
