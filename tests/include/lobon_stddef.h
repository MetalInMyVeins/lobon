#ifndef LOBON_STDDEF_H
#define LOBON_STDDEF_H

#if !defined(__x86_64__) || !defined(__linux__)
#error "lobon: Supported platform: x86_64 Linux (SYSV)"
#endif

static_assert(sizeof(unsigned long) == 8, "lobon: LP64 target required");

typedef unsigned long size_t;

#endif // LOBON_STDDEF_H
