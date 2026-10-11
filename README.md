# lobon

[![lobon](https://github.com/MetalInMyVeins/lobon/actions/workflows/lobon.yaml/badge.svg)](https://github.com/MetalInMyVeins/lobon/actions/workflows/lobon.yaml)
[![tests](https://github.com/MetalInMyVeins/lobon/actions/workflows/tests.yaml/badge.svg)](https://github.com/MetalInMyVeins/lobon/actions/workflows/tests.yaml)

This is a minimal libc implementation in assembly using linux syscalls. It serves as an educational project with the sole purpose of getting good at assembly. The implementation currently avoids any advanced optimization techniques and the functions are strictly ISO C standard compliant. Non-standard functions purely from POSIX/GNU/BSD are currently not included. `lobon` aims to be C23 conforming. But as the project is in its early stage, this might not be strictly possible for now.

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

# Build

Build the library:

```
make lib
```

Build the library for test files and run the test suite:

```
make check
```

Before any of that, make sure the dependencies are installed. See more in [Design Decisions](#design-decisions).

# Functions Checklist

- [ ] atof
- [ ] atoi
- [ ] atol
- [ ] atoll
- [ ] bsearch
- [ ] calloc
- [ ] free
- [X] isalnum
- [X] isalpha
- [X] isblank
- [X] iscntrl
- [X] isdigit
- [X] isgraph
- [X] islower
- [X] isprint
- [X] ispunct
- [X] isspace
- [X] isupper
- [X] isxdigit
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
- [ ] strcoll
- [X] strcpy
- [ ] strcspn
- [X] strlen
- [ ] strncat
- [X] strncmp [thorough test needed]
- [X] strncpy
- [ ] strpbrk
- [ ] strrchr
- [ ] strspn
- [ ] strstr
- [ ] strtok
- [ ] strtol
- [ ] strtoll
- [ ] strtoul
- [ ] strtoull
- [ ] strxfrm
- [X] tolower
- [X] toupper

# Design Decisions

Any C program using `lobon` disabling standard headers, compiler headers, and system libc would be doing this:

```
   c program
       |
       V
    lobon
       |
       V
linux syscall abi
       |
       V
  linux kernel
```

# LLM Ban

As a personal educational project, it makes absolutely zero sense to use generative AI. Writing assembly requires significant mental gymnastics unlike high level languages. So every single line is hand-written. LLMs are strictly prohibited.

# LICENSE

MIT
