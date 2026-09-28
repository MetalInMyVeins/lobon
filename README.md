# syslibc

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
- [X] memcmp
- [X] memcpy
- [X] memmove
- [X] memset
- [ ] printf
- [ ] realloc
- [ ] scanf
- [ ] strcasecmp
- [X] strcmp
- [X] strcpy
- [X] strlen
- [ ] strncasecmp
- [ ] strncmp
- [ ] strncpy
- [ ] toupper

# LLM Ban

LLMs are completely banned from the project.
