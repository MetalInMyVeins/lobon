# syslibc

[![syslibc](https://github.com/MetalInMyVeins/syslibc/actions/workflows/syslibc.yaml/badge.svg)](https://github.com/MetalInMyVeins/syslibc/actions/workflows/syslibc.yaml)
[![tests](https://github.com/MetalInMyVeins/syslibc/actions/workflows/tests.yaml/badge.svg)](https://github.com/MetalInMyVeins/syslibc/actions/workflows/tests.yaml)

Minimal libc implementation in assembly using linux syscalls.

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

# Supported Functions

- [ ] atof
- [ ] atoi
- [ ] atol
- [ ] atoll
- [ ] bsearch
- [ ] calloc
- [ ] free
- [ ] malloc
- [X] memchr
- [X] memcmp
- [X] memcpy
- [X] memmove
- [X] memset
- [ ] printf
- [ ] qsort
- [ ] realloc
- [ ] reallocarray
- [ ] scanf
- [X] strcat
- [ ] strchr
- [X] strcmp
- [X] strcpy
- [ ] strcspn
- [X] strlen
- [ ] strncmp
- [ ] strncpy
- [X] strnlen
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

This is a personal educational project. It makes absolutely zero sense to use generative AI in an educational project while the sole purpose is to be proficient in assembly, which needs significant mental gymnastics. So every single line is hand-written. LLMs are strictly prohibited.
