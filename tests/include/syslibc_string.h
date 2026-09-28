#ifndef SYSLIBC_STRING_H
#define SYSLIBC_STRING_H

#ifdef __cplusplus
extern "C" {
#endif

#include "syslibc_stddef.h"

int syslibc_memcmp(const void*, const void*, size_t);
void* syslibc_memcpy(void*, const void*, size_t);
void* syslibc_memmove(void*, const void*, size_t);
void* syslibc_memset(void*, int, size_t);
int syslibc_strcmp(const char*, const char*);
size_t syslibc_strlen(const char*);

#ifdef __cplusplus
}
#endif

#endif // SYSLIBC_STRING_H
