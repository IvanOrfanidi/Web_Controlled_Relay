//Functions Device.
#include <avr/io.h>
#include <avr/eeprom.h>
#include <avr/pgmspace.h>

#include "config.h"

_Bool SetStrIP(const char* ip)
{
	const uint8_t len = strlen(ip);
	if(len > (LENGTH_OF_IP_ADDRESS - 1) ||
	   len < (MIN_LENGTH_OF_IP_ADDRESS - 1)) {
		return FALSE;
	}

	uint8_t i;
	for(i = 0; i < len; ++i) {
		eeprom_write_byte((uint8_t*)(i + IP_ADDRESS_IN_EEPROM_MEMORY), ip[i]);
	}
	eeprom_write_byte((uint8_t*)(i + IP_ADDRESS_IN_EEPROM_MEMORY), 0);
	return TRUE;
}

uint8_t GetStrIP(char* ip)
{
	uint8_t i;
	for(i = 0; i < (LENGTH_OF_IP_ADDRESS - 1); ++i) {
		ip[i] = eeprom_read_byte((uint8_t*)(i + IP_ADDRESS_IN_EEPROM_MEMORY));

		if(ip[i] == 0) {
			break;
		}
	}
	return i;
}

_Bool SetStrMAC(const char* mac)
{
	const uint8_t len = strlen(mac);
	if(len > (LENGTH_OF_MAC_ADDRESS - 1) ||
	   len < (MIN_LENGTH_OF_MAC_ADDRESS - 1)) {
		return FALSE;
	}

	uint8_t i;
	for(i = 0; i < len; ++i) {
		eeprom_write_byte((uint8_t*)(i + MAC_ADDRESS_IN_EEPROM_MEMORY), mac[i]);
	}
	eeprom_write_byte((uint8_t*)(i + MAC_ADDRESS_IN_EEPROM_MEMORY), 0);
	return TRUE;
}

uint8_t GetStrMAC(char* mac)
{
	uint8_t i;
	for(i = 0; i < (LENGTH_OF_MAC_ADDRESS - 1); ++i) {
		mac[i] = eeprom_read_byte((uint8_t*)(i + MAC_ADDRESS_IN_EEPROM_MEMORY));

		if(mac[i] == 0) {
			break;
		}
	}
	return i;
}

_Bool SetStrPort(const char* port)
{
	const uint8_t len = strlen(port);
	if(len > (LENGTH_OF_TCP_PORT - 1) || len < (MIN_LENGTH_OF_TCP_PORT - 1)) {
		return FALSE;
	}

	if(atoi(port) > MAX_VALUE_TCP_PORT) {
		return FALSE;
	}

	uint8_t i;
	for(i = 0; i < len; ++i) {
		eeprom_write_byte((uint8_t*)(i + TCP_PORT_IN_EEPROM_MEMORY), port[i]);
	}
	eeprom_write_byte((uint8_t*)(i + TCP_PORT_IN_EEPROM_MEMORY), 0);
	return TRUE;
}

uint8_t GetStrPort(char* port)
{
	uint8_t i;
	for(i = 0; i < (LENGTH_OF_TCP_PORT - 1); ++i) {
		port[i] = eeprom_read_byte((uint8_t*)(i + TCP_PORT_IN_EEPROM_MEMORY));
		if(port[i] == 0) {
			break;
		}
	}
	return i;
}

_Bool SetStrStatusBuzzer(const char* buz)
{
	const uint8_t len = strlen(buz);
	if(len > (LENGTH_OF_STATUS_BUZZER - 1) ||
	   len < (MIN_LENGTH_OF_STATUS_BUZZER - 1)) {
		return FALSE;
	}

	if(atoi(buz) > MAX_VALUE_STATE_BUZZER) {
		return FALSE;
	}

	uint8_t i;
	for(i = 0; i < len; ++i) {
		eeprom_write_byte((uint8_t*)(i + STATUS_BUZZER_IN_EEPROM_MEMORY),
		                  buz[i]);
	}
	eeprom_write_byte((uint8_t*)(i + STATUS_BUZZER_IN_EEPROM_MEMORY), 0);
	return TRUE;
}

uint8_t GetStrStatusBuzzer(char* buz)
{
	uint8_t i;
	for(i = 0; i < (LENGTH_OF_STATUS_BUZZER - 1); ++i) {
		buz[i] =
		    eeprom_read_byte((uint8_t*)(i + STATUS_BUZZER_IN_EEPROM_MEMORY));
		if(buz[i] == 0) {
			break;
		}
	}
	return i;
}

void GetIP(uint8_t* ip)
{
	char strIP[LENGTH_OF_IP_ADDRESS];
	const uint8_t len = GetStrIP(strIP);
	strIP[len] = 0;

	uint8_t position = 0;
	uint8_t n = 0;
	char temp[4];
	for(uint8_t i = 0; i < LENGTH_OF_IP_ADDRESS; ++i) {
		if(strIP[i] == '.' || strIP[i] == 0) {
			temp[n] = 0;
			ip[position] = atoi(temp);
			position++;
			if(position > SIZE_IP_ADDRESS) {
				return;
			}
			n = 0;
		} else {
			temp[n] = strIP[i];
			if(n < sizeof(temp)) {
				++n;
			}
		}
	}
}

// Function to convert hexadecimal to decimal
int HexToDec(char hexVal[])
{
	int len = strlen(hexVal);
	int base = 1;
	int dec_val = 0;
	for(int i = len - 1; i >= 0; i--) {
		if(hexVal[i] >= '0' && hexVal[i] <= '9') {
			dec_val += (hexVal[i] - 48) * base;
			base = base * 16;
		} else if(hexVal[i] >= 'A' && hexVal[i] <= 'F') {
			dec_val += (hexVal[i] - 55) * base;
			base = base * 16;
		}
	}
	return dec_val;
}

void GetMAC(uint8_t* mac)
{
	char strMAC[LENGTH_OF_MAC_ADDRESS];
	const uint8_t len = GetStrMAC(strMAC);
	strMAC[len] = 0;

	uint8_t position = 0;
	uint8_t n = 0;
	char temp[3];
	for(uint8_t i = 0; i < LENGTH_OF_MAC_ADDRESS; ++i) {
		if(strMAC[i] == ':' || strMAC[i] == 0) {
			temp[n] = 0;
			mac[position] = HexToDec(temp);
			++position;
			if(position > SIZE_MAC_ADDRESS) {
				return;
			}
			n = 0;
		} else {
			temp[n] = strMAC[i];
			if(n < sizeof(temp)) {
				++n;
			}
		}
	}
}

uint16_t GetPort()
{
	char strPort[LENGTH_OF_TCP_PORT];
	const uint8_t len = GetStrPort(strPort);
	strPort[len] = 0;
	return atoi(strPort);
}

_Bool GetStatusBuzzer()
{
	char strStatusBuzzer[LENGTH_OF_STATUS_BUZZER];
	GetStrStatusBuzzer(strStatusBuzzer);
	return strStatusBuzzer[0] - 0x30;
}

_Bool CheckConfig()
{
	return (eeprom_read_byte((uint8_t*)(CONFIG_VALID_IN_EEPROM_MEMORY)) !=
	        0xFF);
}

void SetValidConfig(_Bool val)
{
	if(val) {
		eeprom_write_byte((uint8_t*)(CONFIG_VALID_IN_EEPROM_MEMORY), 0);
	} else {
		eeprom_write_byte((uint8_t*)(CONFIG_VALID_IN_EEPROM_MEMORY), 0xFF);
	}
}