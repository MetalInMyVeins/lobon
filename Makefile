ASM := nasm
ASM_FLAGS_DEB := -f elf64 -g -F dwarf
ASM_FLAGS_REL := -f elf64
ifeq ($(origin LINKER),undefined)
	LINKER := $(if $(shell command -v mold 2>/dev/null),mold,$(if $(shell command -v lld 2>/dev/null),lld,bfd))
endif
ARCHIVER := ar
STRIP := strip

LIBCDIR := lobon
BUILDDIR := build
DEBDIR := deb
RELDIR := rel

ARCHX64DIR := x86_64
ARCHARM64DIR := aarch64

INCLUDEDIR := include
LIBDIR := lib

LIBC_SHARED := libc.so
LIBC_STATIC := libc.a

SRCDIR := src
SRC_ALL := $(wildcard \
	   $(SRCDIR)/ctype/*.asm \
	   $(SRCDIR)/string/*.asm \
	   )

##################
# x86_64 portion #
##################

CRTX64DIR := crt/$(ARCHX64DIR)
SRC_CRT_X64 := $(wildcard $(SRCDIR)/$(CRTX64DIR)/*.asm)

# Debug
#
# pattern rule for all asm files in src/.
$(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/%.asm.o: $(SRCDIR)/%.asm
	@mkdir -p $(@D)
	$(ASM) $(ASM_FLAGS_DEB) $< -o $@

# pattern match all asm files in SRC_ALL to x86_64.
SRC_DEB_X64_OBJ := $(patsubst $(SRCDIR)/%.asm, $(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/%.asm.o, $(SRC_ALL))

# build libc.so from pattern matched .o files
$(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_SHARED): $(SRC_DEB_X64_OBJ)
	@mkdir -p $(@D)
	ld.$(LINKER) -shared $^ -o $@

# build libc.a from pattern matched .o files
$(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_STATIC): $(SRC_DEB_X64_OBJ)
	@mkdir -p $(@D)
	$(ARCHIVER) rcs $@ $^

# pattern rule for all asm files in crt/x86_64/.
$(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/%.o: $(SRCDIR)/$(CRTX64DIR)/%.asm
	@mkdir -p $(@D)
	$(ASM) $(ASM_FLAGS_DEB) $< -o $@

# pattern match x86_64 crt asm files to .o files.
SRC_CRT_X64_OBJ_DEB := $(patsubst $(SRCDIR)/$(CRTX64DIR)/%.asm, $(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/%.o, $(SRC_CRT_X64))

.PHONY: debx64
debx64: $(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_SHARED) $(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_STATIC) $(SRC_CRT_X64_OBJ_DEB)
	@mkdir -p $(@D)

# Release

# pattern rule for all asm files in src/.
$(BUILDDIR)/$(RELDIR)/$(ARCHX64DIR)/%.asm.o: $(SRCDIR)/%.asm
	@mkdir -p $(@D)
	$(ASM) $(ASM_FLAGS_REL) $< -o $@

# pattern match all asm files in SRC_ALL to x86_64.
SRC_REL_X64_OBJ := $(patsubst $(SRCDIR)/%.asm, $(BUILDDIR)/$(RELDIR)/$(ARCHX64DIR)/%.asm.o, $(SRC_ALL))

# build libc.so from pattern matched .o files
$(BUILDDIR)/$(RELDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_SHARED): $(SRC_REL_X64_OBJ)
	@mkdir -p $(@D)
	ld.$(LINKER) -shared $^ -o $@
	$(STRIP) --strip-unneeded $@

# build libc.a from pattern matched .o files
$(BUILDDIR)/$(RELDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_STATIC): $(SRC_REL_X64_OBJ)
	@mkdir -p $(@D)
	$(ARCHIVER) rcs $@ $^

# pattern rule for all asm files in crt/x86_64/.
$(BUILDDIR)/$(RELDIR)/$(ARCHX64DIR)/$(LIBDIR)/%.o: $(SRCDIR)/$(CRTX64DIR)/%.asm
	@mkdir -p $(@D)
	$(ASM) $(ASM_FLAGS_REL) $< -o $@

# pattern match x86_64 crt asm files to .o files.
SRC_CRT_X64_OBJ_REL := $(patsubst $(SRCDIR)/$(CRTX64DIR)/%.asm, $(BUILDDIR)/$(RELDIR)/$(ARCHX64DIR)/$(LIBDIR)/%.o, $(SRC_CRT_X64))

.PHONY: relx64
relx64: $(BUILDDIR)/$(RELDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_SHARED) $(BUILDDIR)/$(RELDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_STATIC) $(SRC_CRT_X64_OBJ_REL)
	@mkdir -p $(@D)

#################
# tests portion #
#################
.PHONY: sohomot
sohomot:
	$(MAKE) -C vendor/sohomot/ rel

SOHOMOT_INCLUDEDIR := vendor/sohomot/include
SOHOMOT_LIBDIR := vendor/sohomot/build/rel/lib
SOHOMOT_LIBRARY := sohomot_main

SYMBOL_MAP_FILE := tests/symbol_map.txt
OBJCOPY := objcopy
TESTSDIR := tests

LIBC_TEST_SHARED := libc_test.so
LIBC_TEST_STATIC := libc_test.a

$(BUILDDIR)/$(TESTSDIR)/%.asm.o: $(SRCDIR)/%.asm
	@mkdir -p $(@D)
	$(ASM) $(ASM_FLAGS_DEB) $< -o $@.tmp
	$(OBJCOPY) --redefine-syms=$(SYMBOL_MAP_FILE) $@.tmp $@
	@rm $@.tmp

SRC_TESTS_X64_OBJ := $(patsubst $(SRCDIR)/%.asm, $(BUILDDIR)/$(TESTSDIR)/%.asm.o, $(SRC_ALL))

$(BUILDDIR)/$(TESTSDIR)/$(LIBDIR)/$(LIBC_TEST_SHARED): $(SRC_TESTS_X64_OBJ)
	@mkdir -p $(@D)
	ld.$(LINKER) -shared $^ -o $@

$(BUILDDIR)/$(TESTSDIR)/$(LIBDIR)/$(LIBC_TEST_STATIC): $(SRC_TESTS_X64_OBJ)
	@mkdir -p $(@D)
	$(ARCHIVER) rcs $@ $^

TESTS_LIBCDIR := $(BUILDDIR)/$(TESTSDIR)/$(LIBDIR)
TESTS_LIBC := c_test
TESTS_SRCDIR := $(TESTSDIR)/$(SRCDIR)
TESTS_INCLUDEDIR := $(TESTSDIR)/$(INCLUDEDIR)
TESTS_INCLUDE_FLAGS := -iquote $(INCLUDEDIR) -iquote $(TESTS_INCLUDEDIR) -isystem $(SOHOMOT_INCLUDEDIR)
TESTS_BINARY := test_all
TESTS_SRC_ALL := $(wildcard $(TESTS_SRCDIR)/*.c)

ifeq ($(origin CC),default)
	CC := $(if $(shell command -v clang 2>/dev/null),clang,gcc)
endif

CFLAGS_COMMON := \
	-std=c23 \
	-Wall -Wextra -Wpedantic -pedantic-errors -Werror \
	-Wshadow -Wconversion -Wsign-conversion \
	-Wcast-align -Wcast-qual \
	-Wnull-dereference \
	-Wmissing-prototypes -Wmissing-declarations \
	-Wstrict-prototypes \
	-Wold-style-definition \
	-Wdouble-promotion \
	-Wformat=2 \
	-Wundef -Wvla \
	-Wpointer-arith -Wwrite-strings -Wswitch-enum \
	-Winit-self

CFLAGS_DEBUG := \
	-g3 \
	-fno-omit-frame-pointer \
	-fno-optimize-sibling-calls

CFLAGS_LTO := -flto=auto
LDFLAGS_COMMON := -fuse-ld=$(LINKER)

$(BUILDDIR)/$(TESTSDIR)/$(TESTS_BINARY): $(TESTS_SRC_ALL)
	$(CC) $(CFLAGS_COMMON) $(CFLAGS_DEBUG) $(CFLAGS_LTO) $(LDFLAGS_COMMON) \
		$^ -o $@ $(TESTS_INCLUDE_FLAGS) \
		-L$(SOHOMOT_LIBDIR) -l$(SOHOMOT_LIBRARY) -Wl,-rpath=$(SOHOMOT_LIBDIR) \
		-L$(TESTS_LIBCDIR) -l$(TESTS_LIBC) -Wl,-rpath=$(TESTS_LIBCDIR)

.PHONY: testx64
testx64: $(BUILDDIR)/$(TESTSDIR)/$(LIBDIR)/$(LIBC_TEST_SHARED) $(BUILDDIR)/$(TESTSDIR)/$(LIBDIR)/$(LIBC_TEST_STATIC) $(BUILDDIR)/$(TESTSDIR)/$(TESTS_BINARY)

.PHONY: clean
clean:
	@rm -rf .cache/
	@rm -rf $(BUILDDIR)
	@rm -rf compile_commands.json
	@find $(SRCDIR)/ -name "*.o" -delete
