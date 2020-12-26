#ifndef __VERSION_H
#define __VERSION_H

// Standard Input/Output functions.
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdint.h>

#include <project_version.h>

#define LENGTH_OF_PROJECT_VERSION sizeof(PROJECT_VERSION)

uint8_t GetStrProjectVersion(char* port);

#endif /* __VERSION_H */