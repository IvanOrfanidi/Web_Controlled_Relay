#ifndef __AT_COMMANDS_H
#define __AT_COMMANDS_H

#include <stdlib.h>
#include <ctype.h>

#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE !FALSE
#endif

_Bool Parse(char* in, char* out);

extern _Bool g_reboot;

#endif /* __AT_COMMANDS_H */
