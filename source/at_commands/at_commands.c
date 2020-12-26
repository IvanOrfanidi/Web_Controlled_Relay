#include <string.h>

#include "at_commands.h"
#include "config/config.h"
#include "config/version.h"

static const char at[] = "AT";                  //< AT
static const char at_reboot[] = "AT+REBOOT";    //< Soft reset
static const char at_getver[] = "AT+GETVER";    //< Get project version
static const char at_getip[] = "AT+GETIP";      //< Get current IP
static const char at_setip[] = "AT+SETIP=";     //< Set current IP
static const char at_getmac[] = "AT+GETMAC";    //< Get current MAC
static const char at_setmac[] = "AT+SETMAC=";   //< Set current MAC
static const char at_getport[] = "AT+GETPORT";  //< Get current MAC
static const char at_setport[] = "AT+SETPORT="; //< Set current MAC
static const char at_getbuz[] = "AT+GETBUZ";    //< Get state buzzer
static const char at_setbuz[] = "AT+SETBUZ=";   //< Set state buzzer

static const char ok[] = "OK\r\n";       //< Out OK
static const char error[] = "ERROR\r\n"; //< Out ERROR

#define LEN_AT_SETIP sizeof(at_setip) - 1
#define LEN_AT_SETMAC sizeof(at_setmac) - 1
#define LEN_AT_SETPORT sizeof(at_setport) - 1
#define LEN_AT_SETBUZ sizeof(at_setbuz) - 1

_Bool g_reboot = FALSE;

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
	/* AT */
	if(!strcmp(in, at)) {
		out[0] = 0;
		strcpy(out, ok);
	}
	/* Soft Reset */
	else if(!strcmp(in, at_reboot)) {
		out[0] = 0;
		strcpy(out, ok);
		g_reboot = TRUE;
	}
	/* Get Project Version */
	else if(!strcmp(in, at_getver)) {
		out[0] = 0;
		GetStrProjectVersion(out);
		strcat(out, "\r\n");
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
	}
	/* Get State Buzzer */
	else if(!strcmp(in, at_getbuz)) {
		const uint8_t len = GetStrStatusBuzzer(out);
		out[len] = 0;
		strcat(out, "\r\n");
	} /* Set State Buzzer */
	else if(!memcmp(out, at_setbuz, LEN_AT_SETBUZ)) {
		if(SetStrStatusBuzzer(out + LEN_AT_SETBUZ)) {
			out[0] = 0;
			strcpy(out, ok);
		} else {
			err = TRUE;
		}
	}
	/* Unknown AT command */
	else {
		err = TRUE;
	}

	if(err) {
		out[0] = 0;
		strcpy(out, error);
	}

	return TRUE;
}