
#include "version.h"

uint8_t GetStrProjectVersion(char* port)
{
	strcpy(port, PROJECT_VERSION);
	return LENGTH_OF_PROJECT_VERSION - 1;
}