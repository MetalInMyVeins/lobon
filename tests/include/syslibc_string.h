#ifndef SYSLIBC_STRING_H
#define SYSLIBC_STRING_H

#ifdef __cplusplus
extern "C" {
#endif

#include "syslibc_stddef.h"

void* syslibc_memchr(const void* s, int c, size_t n);
int syslibc_memcmp(const void* s1, const void* s2, size_t n);
void* syslibc_memcpy(void* dest, const void* src, size_t n);
void* syslibc_memmove(void* dest, const void* src, size_t n);
void* syslibc_memset(void* a, int c, size_t n);
char* syslibc_strcat(char* dst, const char* src);
int syslibc_strcmp(const char* s1, const char* s2);
char* syslibc_strcpy(char* dst, const char* src);
size_t syslibc_strlen(const char* s);

#ifdef __cplusplus
}
#endif

#endif // SYSLIBC_STRING_H
