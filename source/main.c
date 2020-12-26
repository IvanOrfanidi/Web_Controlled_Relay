//Functions Device
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/wdt.h>
#include <avr/cpufunc.h>

// Standard Input/Output functions
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

void ReadConfig();
void InitWatchdog(uint8_t timeout);
void InitGpio();
void InitInterrupt();
void ResetConfig();
void Reboot();

uint8_t g_ip[SIZE_IP_ADDRESS];
uint8_t g_mac[SIZE_MAC_ADDRESS];

char g_cmdBuff[RX_BUFFER_SIZE0];

int main()
{
	// HW init
	InitGpio();

	disable_interrupt();
	InitWatchdog(WDTO_4S);

	InitInterrupt();
	wdt_reset();

	if(!CheckConfig()) {
		ResetConfig();
	}

	// Read config from EEPROM
	ReadConfig();
	wdt_reset();

	// Initialize enc28j60
	Enc28j60Init(g_mac);
	wdt_reset();

	InitPhy();
	wdt_reset();

	// Init the ethernet/ip layer
	Init_ip_arp_udp_tcp(g_mac, g_ip, g_port);
	wdt_reset();

	usart0_init();

	uint8_t index = 0;
	enable_interrupt();
	for(;;) {
		wdt_reset();

		if(0 != g_timeout_is_enabled_buzzer) {
			ENABLE_BUZ;
			--g_timeout_is_enabled_buzzer;
			if(0 == g_timeout_is_enabled_buzzer) {
				DISABLE_BUZ;
			}
		}

		if(usart0_rx_len()) {
			const char symbol = usart0_read();
			if(symbol == '\b') { // Backspace
				if(index > 0) {
					--index;
				}
			} else if(symbol == '\r' || symbol == '\n') {
				g_cmdBuff[index] = 0;
				if(Parse(g_cmdBuff, g_cmdBuff)) {
					usart0_clear_tx_buffer();
					const uint8_t len = strlen(g_cmdBuff);
					for(uint8_t i = 0; i < len; ++i) {
						usart0_write(g_cmdBuff[i]);
					}

					// If is reset command
					if(g_reboot) {
						Reboot();
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
	}
}

void ReadConfig()
{
	GetIP(g_ip);
	GetMAC(g_mac);
	GetStrIP(g_strIP);
	g_port = GetPort();
	GetStrPort(g_strPort);
	g_buzzer = GetStatusBuzzer();
}

void ResetConfig()
{
	ENABLE_BUZ;
	SetStrIP(DEF_IP_ADDRESS);
	SetStrMAC(DEF_MAC_ADDRESS);
	SetStrPort(DEF_TCP_PORT);
	SetStrStatusBuzzer(DEF_STATE_BUZZER);
	SetValidConfig(TRUE);
	_delay_ms(200);

	Reboot();
}

void Reboot()
{
	InitWatchdog(WDTO_1S);
	for(;;) {
		_NOP();
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

	if(!(PIN_JUMPER & JUMPER)) { // Get state jumper
		PORT_OUT = 0xFF & ~RELAY;
		g_status = TRUE;
	} else {
		PORT_OUT = 0xFF;
		g_status = FALSE;
	}

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
	EIMSK |= (1 << INT0); // Enable interrupt on INT 0
}

/* Interrupt Ext. Int0 */
ISR(INT0_vect)
{
	LanTask();
}