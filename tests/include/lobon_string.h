#ifndef LOBON_STRING_H
#define LOBON_STRING_H

#ifdef __cplusplus
extern "C" {
#endif

#include "lobon_stddef.h"

void* lobon_memchr(const void* s, int c, size_t n);
int lobon_memcmp(const void* s1, const void* s2, size_t n);
void* lobon_memcpy(void* dest, const void* src, size_t n);
void* lobon_memmove(void* dest, const void* src, size_t n);
void* lobon_memset(void* a, int c, size_t n);
char* lobon_strcat(char* dst, const char* src);
int lobon_strcmp(const char* s1, const char* s2);
char* lobon_strcpy(char* dst, const char* src);
size_t lobon_strlen(const char* s);
int lobon_strncmp(const char* s1, const char* s2, size_t n);
char* lobon_strncpy(const char* dst, const char* src, size_t dsize);

#ifdef __cplusplus
}
#endif

#endif // LOBON_STRING_H
