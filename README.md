# syslibc

[![syslibc](https://github.com/MetalInMyVeins/syslibc/actions/workflows/syslibc.yaml/badge.svg)](https://github.com/MetalInMyVeins/syslibc/actions/workflows/syslibc.yaml)
[![tests](https://github.com/MetalInMyVeins/syslibc/actions/workflows/tests.yaml/badge.svg)](https://github.com/MetalInMyVeins/syslibc/actions/workflows/tests.yaml)

This is a minimal libc implementation in assembly using linux syscalls. It serves as an educational project with the sole purpose of getting good at assembly. The implementation currently avoids any advanced optimization techniques and the functions are ISO C standard compliant. Non-standard functions purely from POSIX/GNU/BSD are currently not included.

# Target Architecture + Platform

- x86_64 + Linux

# Dependencies

- `nasm`: assembler
- `ld.lld` or `ld`: linker
- `clang` or `gcc`: compiler
- `clang++` or `g++`: compiler for test files
- `gtest`: test suite

### Tested Versions of Dependencies:

- `nasm`: 3.02
- `clang`: 22.1.8
- `gcc`: 16.2.1
- `gtest`: 1.18.0

# Functions Checklist

- [ ] atof
- [ ] atoi
- [ ] atol
- [ ] atoll
- [ ] bsearch
- [ ] calloc
- [ ] free
- [ ] isalnum
- [ ] isalpha
- [ ] isblank
- [ ] iscntrl
- [ ] isdigit
- [ ] isgraph
- [ ] islower
- [ ] isprint
- [ ] ispunct
- [ ] isspace
- [ ] isupper
- [ ] isxdigit
- [ ] malloc
- [X] memchr
- [X] memcmp
- [X] memcpy
- [X] memmove
- [X] memset
- [ ] printf
- [ ] qsort
- [ ] realloc
- [ ] scanf
- [X] strcat
- [ ] strchr
- [X] strcmp
- [X] strcpy
- [ ] strcspn
- [X] strlen
- [ ] strncmp
- [ ] strncpy
- [ ] strpbrk
- [ ] strrchr
- [ ] strspn
- [ ] strstr
- [ ] strtok
- [ ] strtol
- [ ] strtoll
- [ ] strtoul
- [ ] strtoull
- [X] tolower
- [X] toupper


# LLM Ban

As a personal educational project, it makes absolutely zero sense to use generative AI. Writing assembly requires significant mental gymnastics unlike high level languages. So every single line is hand-written. LLMs are strictly prohibited.

# LICENSE

MIT
