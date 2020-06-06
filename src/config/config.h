#ifndef __CONFIG_H
#define __CONFIG_H

// Standard Input/Output functions.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE !FALSE
#endif

/* IP ADDRESS */
#define LENGTH_OF_IP_ADDRESS sizeof("255.255.255.255")
#define MIN_LENGTH_OF_IP_ADDRESS sizeof("1.1.1.1")
#define SIZE_IP_ADDRESS 4

/* MAC ADDRESS */
#define LENGTH_OF_MAC_ADDRESS sizeof("FF:FF:FF:FF:FF:FF")
#define MIN_LENGTH_OF_MAC_ADDRESS LENGTH_OF_MAC_ADDRESS
#define SIZE_MAC_ADDRESS 6

/* TCP PORT (max range 1-254) */
#define LENGTH_OF_TCP_PORT sizeof("65535")
#define MIN_LENGTH_OF_TCP_PORT sizeof("1")
#define MAX_VALUE_TCP_PORT 65535U

/* STATUS BUZZER */
#define LENGTH_OF_STATUS_BUZZER sizeof("1")
#define MIN_LENGTH_OF_STATUS_BUZZER LENGTH_OF_STATUS_BUZZER
#define MAX_VALUE_STATE_BUZZER 1U

#define IP_ADDRESS_IN_EEPROM_MEMORY 0U

#define MAC_ADDRESS_IN_EEPROM_MEMORY \
	IP_ADDRESS_IN_EEPROM_MEMORY + LENGTH_OF_IP_ADDRESS

#define TCP_PORT_IN_EEPROM_MEMORY \
	MAC_ADDRESS_IN_EEPROM_MEMORY + LENGTH_OF_MAC_ADDRESS

#define STATUS_BUZZER_IN_EEPROM_MEMORY \
	TCP_PORT_IN_EEPROM_MEMORY + LENGTH_OF_TCP_PORT

_Bool SetStrIP(const char* ip);
uint8_t GetStrIP(char* ip);
_Bool SetStrMAC(const char* mac);
uint8_t GetStrMAC(char* mac);
_Bool SetStrPort(const char* port);
uint8_t GetStrPort(char* port);
_Bool SetStrStatusBuzzer(const char* buz);
uint8_t GetStrStatusBuzzer(char* buz);

void GetIP(uint8_t* ip);
void GetMAC(uint8_t* mac);
uint16_t GetPort();
_Bool GetStatusBuzzer();

#endif /* __CONFIG_H */