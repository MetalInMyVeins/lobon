#ifndef STRING_H
#define STRING_H

#ifdef __cplusplus
extern "C" {
#endif

#include "stddef.h"

int memcmp(const void* restrict, const void* restrict, size_t);
void* memcpy(void* restrict, const void* restrict, size_t);
void* memmove(void*, const void*, size_t);
void* memset(void*, int, size_t);
int strcmp(const char*, const char*);
size_t strlen(const char*);

#ifdef __cplusplus
}
#endif

#endif // STRING_H
