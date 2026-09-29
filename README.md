# syslibc

[![syslibc](https://github.com/MetalInMyVeins/syslibc/actions/workflows/syslibc.yaml/badge.svg)](https://github.com/MetalInMyVeins/syslibc/actions/workflows/syslibc.yaml)
[![tests](https://github.com/MetalInMyVeins/syslibc/actions/workflows/tests.yaml/badge.svg)](https://github.com/MetalInMyVeins/syslibc/actions/workflows/tests.yaml)

Minimal libc implementation in assembly using linux syscalls.

# Target Architecture

- x86_64

# Dependencies

- `nasm`: for assembling the assembly sources
- `ld.lld` or `ld`: for linking assembly object files
- `clang` or `gcc`: for building debug C programs
- `clang++` or `g++`: for buidling test C++ programs
- `gtest`: for the tests

#### Tested versions of the given dependencies:

- `nasm`: 3.02
- `clang`: 22.1.8
- `gcc`: 16.2.1
- `gtest`: 1.18.0

# Functionality

- [ ] atoi
- [ ] free
- [ ] malloc
- [X] memchr
- [X] memcmp
- [X] memcpy
- [X] memmove
- [X] memset
- [ ] printf
- [ ] realloc
- [ ] scanf
- [X] strcat
- [X] strcmp
- [X] strcpy
- [X] strlen
- [ ] strncmp
- [ ] strncpy
- [X] strnlen
- [X] tolower
- [X] toupper

# LLM Ban

This is a personal educational project. It makes absolutely zero sense to use an LLM to generate code in an educational project while the sole purpose was to be proficient in assembly. So every single line is hand-written. LLMs are strictly prohibited.
