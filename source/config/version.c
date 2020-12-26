
#include "version.h"

uint8_t GetStrProjectVersion(char* version)
{
	strcpy(version, PROJECT_VERSION);
	return LENGTH_OF_PROJECT_VERSION - 1;
}