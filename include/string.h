#ifndef STRING_H
#define STRING_H

#ifdef __cplusplus
extern "C" {
#endif

#include "stddef.h"

void* memchr(const void* s, int c, size_t n);
int memcmp(const void* restrict s1, const void* restrict s2, size_t n);
void* memcpy(void* restrict dest, const void* restrict src, size_t n);
void* memmove(void* dest, const void* src, size_t n);
void* memset(void* a, int c, size_t n);
char* strcat(char* restrict dst, const char* restrict src);
int strcmp(const char* s1, const char* s2);
char* strcpy(char* restrict dst, const char* restrict src);
size_t strlen(const char* s);

#ifdef __cplusplus
}
#endif

#endif // STRING_H
