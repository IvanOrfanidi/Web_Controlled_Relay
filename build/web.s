	.file	"web.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"/REL_1\">TURN OFF THE RELAY</a><hr>"
.LC2:
	.string	"/REL_0\">TURN ON THE RELAY</a><hr>"
.LC0:
	.string	"<a href=\"http://"
	.section	.text.PrintWebpage,"ax",@progbits
.global	PrintWebpage
	.type	PrintWebpage, @function
PrintWebpage:
.LFB7:
	.file 1 "../src/web/web.c"
	.loc 1 21 0
	.cfi_startproc
.LVL0:
	push r16
	.cfi_def_cfa_offset 3
	.cfi_offset 16, -2
	push r17
	.cfi_def_cfa_offset 4
	.cfi_offset 17, -3
	push r28
	.cfi_def_cfa_offset 5
	.cfi_offset 28, -4
	push r29
	.cfi_def_cfa_offset 6
	.cfi_offset 29, -5
	in r28,__SP_L__
	in r29,__SP_H__
	.cfi_def_cfa_register 28
	sbiw r28,17
	.cfi_def_cfa_offset 23
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 17 */
/* stack size = 21 */
.L__stack_usage = 21
	movw r16,r24
	.loc 1 22 0
	ldi r20,lo8(__c.2401)
	ldi r21,hi8(__c.2401)
	ldi r22,0
	ldi r23,0
	rcall Fill_tcp_data_p
.LVL1:
	.loc 1 24 0
	ldi r20,lo8(__c.2403)
	ldi r21,hi8(__c.2403)
	movw r22,r24
	movw r24,r16
.LVL2:
	rcall Fill_tcp_data_p
.LVL3:
	movw r22,r24
.LVL4:
	.loc 1 27 0
	ldi r24,lo8(17)
	ldi r30,lo8(.LC0)
	ldi r31,hi8(.LC0)
	movw r26,r28
	adiw r26,1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	.loc 1 29 0
	lds r24,g_status
	tst r24
	breq .L2
	.loc 1 30 0
	cbi 0x5,0
	.loc 1 31 0
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r24,r16
	rcall Fill_tcp_data
.LVL5:
	.loc 1 32 0
	ldi r20,lo8(SRT_IP_ADDR)
	ldi r21,hi8(SRT_IP_ADDR)
	movw r22,r24
	movw r24,r16
.LVL6:
	rcall Fill_tcp_data
.LVL7:
	.loc 1 33 0
	ldi r20,lo8(.LC1)
	ldi r21,hi8(.LC1)
	rjmp .L4
.LVL8:
.L2:
	.loc 1 36 0
	sbi 0x5,0
	.loc 1 37 0
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r24,r16
	rcall Fill_tcp_data
.LVL9:
	.loc 1 38 0
	ldi r20,lo8(SRT_IP_ADDR)
	ldi r21,hi8(SRT_IP_ADDR)
	movw r22,r24
	movw r24,r16
.LVL10:
	rcall Fill_tcp_data
.LVL11:
	.loc 1 39 0
	ldi r20,lo8(.LC2)
	ldi r21,hi8(.LC2)
.L4:
	movw r22,r24
	movw r24,r16
.LVL12:
	rcall Fill_tcp_data
.LVL13:
/* epilogue start */
	.loc 1 43 0
	adiw r28,17
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
.LVL14:
	ret
	.cfi_endproc
.LFE7:
	.size	PrintWebpage, .-PrintWebpage
	.section	.rodata.str1.1
.LC3:
	.string	"GET "
.LC4:
	.string	"/REL_0"
.LC5:
	.string	"/REL_1"
	.section	.text.LanTask,"ax",@progbits
.global	LanTask
	.type	LanTask, @function
LanTask:
.LFB8:
	.loc 1 48 0
	.cfi_startproc
	push r15
	.cfi_def_cfa_offset 3
	.cfi_offset 15, -2
	push r16
	.cfi_def_cfa_offset 4
	.cfi_offset 16, -3
	push r17
	.cfi_def_cfa_offset 5
	.cfi_offset 17, -4
	push r28
	.cfi_def_cfa_offset 6
	.cfi_offset 28, -5
	push r29
	.cfi_def_cfa_offset 7
	.cfi_offset 29, -6
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
.LVL15:
	.loc 1 49 0
	ldi r28,0
	ldi r29,0
.LBB2:
	.loc 1 111 0
	clr r15
	inc r15
.LVL16:
.L7:
.LBE2:
	.loc 1 53 0
	ldi r22,lo8(g_webBuffer)
	ldi r23,hi8(g_webBuffer)
	ldi r24,0
	ldi r25,lo8(2)
	rcall Enc28j60PacketReceive
.LVL17:
	movw r16,r24
.LVL18:
	.loc 1 55 0
	sbiw r24,0
	brne .+2
	rjmp .L6
	.loc 1 58 0
	movw r22,r24
	ldi r24,lo8(g_webBuffer)
	ldi r25,hi8(g_webBuffer)
	rcall Eth_type_is_arp_and_my_ip
.LVL19:
	tst r24
	breq .L9
	.loc 1 59 0
	ldi r24,lo8(g_webBuffer)
	ldi r25,hi8(g_webBuffer)
	rcall Make_arp_answer_from_request
.LVL20:
	.loc 1 60 0
	rjmp .L7
.L9:
	.loc 1 63 0
	movw r22,r16
	ldi r24,lo8(g_webBuffer)
	ldi r25,hi8(g_webBuffer)
	rcall Eth_type_is_ip_and_my_ip
.LVL21:
	tst r24
	breq .L7
	.loc 1 67 0
	lds r24,g_webBuffer+23
	cpi r24,lo8(1)
	brne .L11
	.loc 1 67 0 is_stmt 0
	lds r24,g_webBuffer+34
	cpi r24,lo8(8)
	brne .L7
	.loc 1 69 0 is_stmt 1
	movw r22,r16
	ldi r24,lo8(g_webBuffer)
	ldi r25,hi8(g_webBuffer)
	rcall Make_echo_reply_from_request
.LVL22:
	.loc 1 70 0
	rjmp .L7
.L11:
	.loc 1 74 0
	cpi r24,lo8(6)
	brne .L7
	.loc 1 74 0 is_stmt 0
	lds r24,g_webBuffer+36
	cpse r24,__zero_reg__
	rjmp .L7
	.loc 1 75 0 is_stmt 1
	lds r24,g_webBuffer+37
	cpi r24,lo8(80)
	brne .L7
	.loc 1 77 0
	lds r24,g_webBuffer+47
	sbrs r24,1
	rjmp .L13
	.loc 1 79 0
	ldi r24,lo8(g_webBuffer)
	ldi r25,hi8(g_webBuffer)
	rcall Make_tcp_synack_from_syn
.LVL23:
	.loc 1 80 0
	rjmp .L7
.L13:
	.loc 1 82 0
	sbrs r24,4
	rjmp .L14
	.loc 1 83 0
	ldi r24,lo8(g_webBuffer)
	ldi r25,hi8(g_webBuffer)
	rcall Init_len_info
.LVL24:
	.loc 1 84 0
	rcall Get_tcp_data_pointer
.LVL25:
	movw r28,r24
.LVL26:
	.loc 1 85 0
	or r24,r25
	brne .L14
	.loc 1 87 0
	lds r24,g_webBuffer+47
.LVL27:
	sbrs r24,0
	rjmp .L7
	.loc 1 88 0
	ldi r24,lo8(g_webBuffer)
	ldi r25,hi8(g_webBuffer)
	rcall Make_tcp_ack_from_any
.LVL28:
	rjmp .L7
.L14:
.LVL29:
	.loc 1 94 0
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r28
	subi r22,lo8(-(g_webBuffer))
	sbci r23,hi8(-(g_webBuffer))
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	rcall strncmp
.LVL30:
	or r24,r25
	breq .L15
	.loc 1 97 0
	ldi r20,lo8(__c.2412)
	ldi r21,hi8(__c.2412)
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(g_webBuffer)
	ldi r25,hi8(g_webBuffer)
	rcall Fill_tcp_data_p
.LVL31:
	rjmp .L30
.L15:
.LBB3:
	.loc 1 107 0
	movw r16,r28
.LVL32:
	subi r16,lo8(-(g_webBuffer+4))
	sbci r17,hi8(-(g_webBuffer+4))
.LVL33:
	.loc 1 108 0
	ldi r20,lo8(6)
	ldi r21,0
	movw r22,r16
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
	rcall strncmp
.LVL34:
	or r24,r25
	brne .L31
	.loc 1 109 0
	sts g_status,__zero_reg__
.L17:
	.loc 1 114 0
	ldi r24,lo8(g_webBuffer)
	ldi r25,hi8(g_webBuffer)
	rcall PrintWebpage
.LVL35:
.L30:
	movw r16,r24
.LVL36:
.LBE3:
	.loc 1 118 0
	ldi r24,lo8(g_webBuffer)
	ldi r25,hi8(g_webBuffer)
	rcall Make_tcp_ack_from_any
.LVL37:
	.loc 1 119 0
	movw r22,r16
	ldi r24,lo8(g_webBuffer)
	ldi r25,hi8(g_webBuffer)
	rcall Make_tcp_ack_with_data
.LVL38:
	rjmp .L7
.LVL39:
.L31:
.LBB4:
	.loc 1 110 0
	ldi r20,lo8(6)
	ldi r21,0
	movw r22,r16
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	rcall strncmp
.LVL40:
	or r24,r25
	brne .L17
	.loc 1 111 0
	sts g_status,r15
	rjmp .L17
.LVL41:
.L6:
/* epilogue start */
.LBE4:
	.loc 1 131 0
	pop r29
	pop r28
.LVL42:
	pop r17
	pop r16
.LVL43:
	pop r15
	ret
	.cfi_endproc
.LFE8:
	.size	LanTask, .-LanTask
	.section	.progmem.data,"a",@progbits
	.type	__c.2412, @object
	.size	__c.2412, 60
__c.2412:
	.string	"HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n<h1>200 OK</h1>"
	.type	__c.2403, @object
	.size	__c.2403, 37
__c.2403:
	.string	"<center><h1>Web Controlled Relay<hr>"
	.type	__c.2401, @object
	.size	__c.2401, 45
__c.2401:
	.string	"HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
	.data
	.type	g_status, @object
	.size	g_status, 1
g_status:
	.byte	1
	.local	g_webBuffer
	.comm	g_webBuffer,513,1
	.section	.rodata
	.type	SRT_IP_ADDR, @object
	.size	SRT_IP_ADDR, 15
SRT_IP_ADDR:
	.string	"192.168.109.14"
	.text
.Letext0:
	.file 2 "/usr/lib/avr/include/stdint.h"
	.file 3 "../src/main.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1f0
	.word	0x3
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF20
	.byte	0xc
	.long	.LASF21
	.long	.LASF22
	.long	.Ldebug_ranges0+0x20
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x2
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
	.byte	0x2
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
	.uleb128 0x5
	.byte	0x2
	.long	0x79
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF9
	.uleb128 0x6
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.byte	0x14
	.byte	0x1
	.long	0x45
	.long	.LFB7
	.long	.LFE7
	.byte	0x1
	.byte	0x9c
	.long	0xc8
	.uleb128 0x7
	.string	"buf"
	.byte	0x1
	.byte	0x14
	.long	0xc8
	.long	.LLST0
	.uleb128 0x8
	.long	.LASF10
	.byte	0x1
	.byte	0x16
	.long	0x45
	.long	.LLST1
	.uleb128 0x9
	.long	.LASF11
	.byte	0x1
	.byte	0x1b
	.long	0xea
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.long	0x2c
	.uleb128 0xa
	.long	0xe5
	.long	0xde
	.uleb128 0xb
	.long	0xde
	.byte	0x10
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF12
	.uleb128 0xc
	.long	0x79
	.uleb128 0xc
	.long	0xce
	.uleb128 0xd
	.byte	0x1
	.long	.LASF24
	.byte	0x1
	.byte	0x2f
	.long	.LFB8
	.long	.LFE8
	.byte	0x1
	.byte	0x9c
	.long	0x142
	.uleb128 0x8
	.long	.LASF10
	.byte	0x1
	.byte	0x31
	.long	0x45
	.long	.LLST2
	.uleb128 0x8
	.long	.LASF13
	.byte	0x1
	.byte	0x31
	.long	0x45
	.long	.LLST3
	.uleb128 0xe
	.long	.LASF25
	.byte	0x1
	.byte	0x32
	.long	0x142
	.uleb128 0xf
	.long	.Ldebug_ranges0+0
	.uleb128 0x10
	.string	"p"
	.byte	0x1
	.byte	0x6b
	.long	0x73
	.long	.LLST4
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF14
	.uleb128 0xa
	.long	0x159
	.long	0x159
	.uleb128 0xb
	.long	0xde
	.byte	0x5
	.byte	0
	.uleb128 0xc
	.long	0x2c
	.uleb128 0x11
	.long	.LASF15
	.byte	0x3
	.byte	0x11
	.long	0x170
	.byte	0x6
	.byte	0
	.byte	0x21
	.byte	0x68
	.byte	0x33
	.byte	0xd6
	.byte	0x30
	.uleb128 0xc
	.long	0x149
	.uleb128 0xa
	.long	0x159
	.long	0x185
	.uleb128 0xb
	.long	0xde
	.byte	0x3
	.byte	0
	.uleb128 0x11
	.long	.LASF16
	.byte	0x3
	.byte	0x12
	.long	0x195
	.byte	0x4
	.byte	0xc0
	.byte	0xa8
	.byte	0x6d
	.byte	0xe
	.uleb128 0xc
	.long	0x175
	.uleb128 0xa
	.long	0xe5
	.long	0x1aa
	.uleb128 0xb
	.long	0xde
	.byte	0xe
	.byte	0
	.uleb128 0x9
	.long	.LASF17
	.byte	0x3
	.byte	0x13
	.long	0x1bb
	.byte	0x5
	.byte	0x3
	.long	SRT_IP_ADDR
	.uleb128 0xc
	.long	0x19a
	.uleb128 0xa
	.long	0x2c
	.long	0x1d1
	.uleb128 0x12
	.long	0xde
	.word	0x200
	.byte	0
	.uleb128 0x9
	.long	.LASF18
	.byte	0x1
	.byte	0x11
	.long	0x1c0
	.byte	0x5
	.byte	0x3
	.long	g_webBuffer
	.uleb128 0x9
	.long	.LASF19
	.byte	0x1
	.byte	0x12
	.long	0x142
	.byte	0x5
	.byte	0x3
	.long	g_status
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x27
	.uleb128 0xc
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0
	.long	.LVL1-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL1-1
	.long	.LVL14
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST1:
	.long	.LVL1
	.long	.LVL2
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL2
	.long	.LVL3-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL4
	.long	.LVL5-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL5
	.long	.LVL6
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL6
	.long	.LVL7-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL7
	.long	.LVL8
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL8
	.long	.LVL9-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL9
	.long	.LVL10
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL10
	.long	.LVL11-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL11
	.long	.LVL12
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL12
	.long	.LVL13-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL13
	.long	.LFE7
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST2:
	.long	.LVL18
	.long	.LVL32
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL36
	.long	.LVL39
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL41
	.long	.LVL43
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL43
	.long	.LFE8
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST3:
	.long	.LVL16
	.long	.LVL26
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL26
	.long	.LVL27
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL27
	.long	.LVL42
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST4:
	.long	.LVL33
	.long	.LVL35
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL39
	.long	.LVL41
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
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
	.long	.LFB7
	.long	.LFE7-.LFB7
	.long	.LFB8
	.long	.LFE8-.LFB8
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB2
	.long	.LBE2
	.long	.LBB3
	.long	.LBE3
	.long	.LBB4
	.long	.LBE4
	.long	0
	.long	0
	.long	.LFB7
	.long	.LFE7
	.long	.LFB8
	.long	.LFE8
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"MAC_ADDR"
.LASF10:
	.string	"plen"
.LASF13:
	.string	"dat_p"
.LASF20:
	.string	"GNU C99 5.4.0 -mn-flash=1 -mno-skip-bug -mmcu=avr4 -g -gdwarf-3 -gstrict-dwarf -Os -pedantic-errors -std=gnu99 -fpack-struct -fshort-enums -funsigned-char -funsigned-bitfields -ffunction-sections"
.LASF14:
	.string	"_Bool"
.LASF11:
	.string	"http_start"
.LASF1:
	.string	"unsigned char"
.LASF6:
	.string	"long unsigned int"
.LASF22:
	.string	"/home/orfanidi/AVR/Web_Controlled_Relay/build"
.LASF24:
	.string	"LanTask"
.LASF19:
	.string	"g_status"
.LASF4:
	.string	"unsigned int"
.LASF25:
	.string	"send"
.LASF18:
	.string	"g_webBuffer"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF12:
	.string	"sizetype"
.LASF7:
	.string	"long long int"
.LASF17:
	.string	"SRT_IP_ADDR"
.LASF23:
	.string	"PrintWebpage"
.LASF9:
	.string	"char"
.LASF21:
	.string	"../src/web/web.c"
.LASF3:
	.string	"uint16_t"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF16:
	.string	"IP_ADDR"
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
