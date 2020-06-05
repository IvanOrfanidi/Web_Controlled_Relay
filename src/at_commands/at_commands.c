#include <string.h>

#include "at_commands.h"
#include "config/config.h"

static const char at[] = "AT";                  //< AT
static const char at_reboot[] = "AT+REBOOT";    //< Soft reset
static const char at_getip[] = "AT+GETIP";      //< Get current IP
static const char at_setip[] = "AT+SETIP=";     //< Set current IP
static const char at_getmac[] = "AT+GETMAC";    //< Get current MAC
static const char at_setmac[] = "AT+SETMAC=";   //< Set current MAC
static const char at_getport[] = "AT+GETPORT";  //< Get current MAC
static const char at_setport[] = "AT+SETPORT="; //< Set current MAC

static const char ok[] = "OK\r\n";       //< Out OK
static const char error[] = "ERROR\r\n"; //< Out ERROR

#define LEN_AT_SETIP sizeof(at_setip) - 1
#define LEN_AT_SETMAC sizeof(at_setmac) - 1
#define LEN_AT_SETPORT sizeof(at_setport) - 1

_Bool g_reset = FALSE;

void ToUpper(char* ptr)
{
	uint8_t i = 0;
	while(ptr[i] != 0) {
		ptr[i] = toupper(ptr[i]);
		++i;
	}
}

_Bool Parse(char* in, char* out)
{
	if(strlen(in) == 0) {
		return FALSE;
	}

	ToUpper(in);
	_Bool err = FALSE;
	if(!strcmp(in, at)) {
		out[0] = 0;
		strcpy(out, ok);
	}
	/* Soft Reset */
	else if(!strcmp(in, at_reboot)) {
		out[0] = 0;
		strcpy(out, ok);
		g_reset = TRUE;
	}
	/* Get IP Address */
	else if(!strcmp(in, at_getip)) {
		const uint8_t len = GetStrIP(out);
		out[len] = 0;
		strcat(out, "\r\n");
	}
	/* Set IP Address */
	else if(!memcmp(out, at_setip, LEN_AT_SETIP)) {
		if(SetStrIP(out + LEN_AT_SETIP)) {
			out[0] = 0;
			strcpy(out, ok);
		} else {
			err = TRUE;
		}
	} /* Get MAC Address */
	else if(!strcmp(in, at_getmac)) {
		const uint8_t len = GetStrMAC(out);
		out[len] = 0;
		strcat(out, "\r\n");
	} /* Set MAC Address */
	else if(!memcmp(out, at_setmac, LEN_AT_SETMAC)) {
		if(SetStrMAC(out + LEN_AT_SETMAC)) {
			out[0] = 0;
			strcpy(out, ok);
		} else {
			err = TRUE;
		}
	}
	/* Get TCP Port */
	else if(!strcmp(in, at_getport)) {
		const uint8_t len = GetStrPort(out);
		out[len] = 0;
		strcat(out, "\r\n");
	} /* Set TCP Port */
	else if(!memcmp(out, at_setport, LEN_AT_SETPORT)) {
		if(SetStrPort(out + LEN_AT_SETPORT)) {
			out[0] = 0;
			strcpy(out, ok);
		} else {
			err = TRUE;
		}
	} else {
		err = TRUE;
	}

	if(err) {
		out[0] = 0;
		strcpy(out, error);
	}

	return TRUE;
}