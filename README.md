# lobon

[![lobon](https://github.com/MetalInMyVeins/lobon/actions/workflows/lobon.yaml/badge.svg)](https://github.com/MetalInMyVeins/lobon/actions/workflows/lobon.yaml)
[![tests](https://github.com/MetalInMyVeins/lobon/actions/workflows/tests.yaml/badge.svg)](https://github.com/MetalInMyVeins/lobon/actions/workflows/tests.yaml)

This is a **very minimal** libc implementation in assembly using linux syscalls. It serves as an educational project with the sole purpose of getting good at assembly. The implementation currently avoids any advanced optimization techniques.

# Target Architecture + Platform

- x86_64 + Linux

# Build

Debug build:

```
make debx64
```

Release build:

```
make relx64
```

Build the library for test files and run the test suite:

```
make testx64
```

Before any of that, make sure the dependencies are installed.

# Dependencies

- `nasm`: assembler
- `mold` or `lld` or `bfd`: linker
- `clang` or `gcc`: compiler
- ![`sohomot`](https://github.com/MetalInMyVeins/sohomot): test suite

### Tested Versions of Dependencies:

- `nasm`: 3.02
- `clang`: 22.1.8
- `gcc`: 16.2.1

# Features Checklist

### List 1

- [ ] _exit
- [X] _start
- [ ] abort
- [ ] brk
- [ ] close
- [ ] exit
- [ ] open
- [ ] read
- [ ] write

### List 2

- [ ] calloc
- [ ] fflush
- [ ] fprintf
- [ ] fputs
- [ ] free
- [ ] fwrite
- [ ] malloc
- [ ] printf
- [ ] putchar
- [ ] puts
- [ ] realloc
- [ ] snprintf
- [ ] stderr
- [ ] stdin
- [ ] stdout
- [ ] vsnprintf

### List 3

- [X] memchr
- [X] memcmp
- [X] memcpy
- [X] memmove
- [X] memset
- [X] strcat
- [X] strchr
- [X] strcmp
- [X] strcpy
- [X] strlen
- [X] strncat
- [X] strncmp [thorough test needed]
- [X] strncpy
- [X] strrchr

### List 4

- [ ] strcspn
- [ ] strdup
- [ ] strpbrk
- [ ] strspn
- [ ] strstr
- [ ] strtok
- [ ] strtol
- [ ] strtoll
- [ ] strtoul
- [ ] strtoull

### List 5

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
- [X] tolower
- [X] toupper

### List 6

- [ ] assert
- [ ] errno
- [ ] fclose
- [ ] fgetc
- [ ] fgets
- [ ] fopen
- [ ] fread
- [ ] getchar
- [ ] perror
- [ ] strerror

### List 7

- [ ] abs
- [ ] bsearch
- [ ] getenv
- [ ] qsort
- [ ] rand
- [ ] srand
- [ ] time

# LLM Ban

This repo is entirely human-written.

LLMs are strictly banned from contributing.

# LICENSE

MIT
