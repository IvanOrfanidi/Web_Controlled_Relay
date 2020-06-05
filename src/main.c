//Functions Device
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/wdt.h>
#include <avr/cpufunc.h>

// Standard Input/Output functions
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#include "main.h"
#include "config/config.h"
#include "net/enc28j60.h"
#include "net/ip_arp_udp_tcp.h"
#include "web/web.h"
#include "usart/usart.h"
#include "at_commands/at_commands.h"

char g_cmdBuff[RX_BUFFER_SIZE0];

int main()
{
	// HW init
	InitGpio();
	if(GetStateJumper()) {
		TURN_ON_RELAY;
		g_status = TRUE;
	}

	disable_interrupt();
	InitWatchdog(WDTO_4S);

	InitInterrupt();
	wdt_reset();

	// Read config from EEPROM
	uint8_t ip[SIZE_IP_ADDRESS];
	GetIP(ip);
	GetStrIP(g_strIP);
	uint8_t mac[SIZE_MAC_ADDRESS];
	GetMAC(mac);
	g_port = GetPort();
	GetStrPort(g_strPort);
	wdt_reset();

	// Initialize enc28j60
	Enc28j60Init(mac);
	wdt_reset();

	InitPhy();
	wdt_reset();

	// Init the ethernet/ip layer
	Init_ip_arp_udp_tcp(mac, ip, g_port);
	wdt_reset();

	usart0_init();

	uint8_t index = 0;
	enable_interrupt();
	for(;;) {
		wdt_reset();

		if(usart0_rx_len()) {
			const char symbol = usart0_read();
			if(symbol == 0x08) {
				if(index > 0) {
					--index;
				}
			} else if(symbol == 0x0D || symbol == 0x0A) {
				g_cmdBuff[index] = 0;
				if(Parse(g_cmdBuff, g_cmdBuff)) {
					usart0_clear_tx_buffer();
					const uint8_t len = strlen(g_cmdBuff);
					for(uint8_t i = 0; i < len; ++i) {
						usart0_write(g_cmdBuff[i]);
					}
				}
				index = 0;
			} else {
				g_cmdBuff[index] = symbol;
				if(index < sizeof(g_cmdBuff)) {
					++index;
				}
			}
		}

		// If is reset command
		if(g_reset) {
			InitWatchdog(WDTO_1S);
			for(;;) {
				_NOP();
			}
		}
	}
}

void InitWatchdog(uint8_t timeout)
{
	wdt_reset();
	wdt_disable();
	wdt_enable(timeout);
}

void InitGpio()
{
	DDRD = BUZ;
	PORT_BUZ = 0xFF;
	PORT_BUZ &= ~BUZ;

	DDRB = RELAY;
	PORT_OUT = 0xFF;

	DDRC = CS_SPI_ENC28J60;
	PORTC = CS_SPI_ENC28J60;

	DDRD = BUZ;
	PORT_BUZ = 0xFF;
	PORT_BUZ &= ~BUZ;
}

void InitInterrupt()
{
	EICRA &= 0xFE; // INT 0 sense on falling edge

	EICRA |= 0x02;
	EIMSK |= (1 << INT0); // enable interrupt on INT 0
}

/* Interrupt Ext. Int0 */
ISR(INT0_vect)
{
	LanTask();
}