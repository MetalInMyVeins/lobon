ASM := nasm
ASM_FLAGS_DEB := -f elf64 -g -F dwarf
ASM_FLAGS_REL := -f elf64
ifeq ($(origin LINKER),undefined)
	LINKER := $(if $(shell command -v mold 2>/dev/null),mold,$(if $(shell command -v lld 2>/dev/null),lld,bfd))
endif
ARCHIVER := ar
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

# pattern rule for all asm files in src/.
$(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/%.asm.o: $(SRCDIR)/%.asm
	@mkdir -p $(@D)
	$(ASM) $(ASM_FLAGS_DEB) $< -o $@

# pattern match all asm files in SRC_ALL to x86_64.
SRC_DEB_X64_OBJ := $(patsubst $(SRCDIR)/%.asm, $(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/%.asm.o, $(SRC_ALL))

# build libc.so from pattern matched .o files
$(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_SHARED): $(SRC_DEB_X64_OBJ)
	@mkdir -p $(@D)
	$(LINKER) -shared $^ -o $@

# build libc.a from pattern matched .o files
$(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_STATIC): $(SRC_DEB_X64_OBJ)
	@mkdir -p $(@D)
	$(ARCHIVER) rcs $@ $^

# pattern rule for all asm files in crt/x86_64/.
$(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/%.o: $(SRCDIR)/$(CRTX64DIR)/%.asm
	@mkdir -p $(@D)
	$(ASM) $(ASM_FLAGS_DEB) $< -o $@

# pattern match x86_64 crt asm files to .o files.
SRC_PAT_CRT_X64 := $(patsubst $(SRCDIR)/$(CRTX64DIR)/%.asm, $(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/%.o, $(SRC_CRT_X64))

.PHONY: debx64
debx64: $(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_SHARED) $(BUILDDIR)/$(DEBDIR)/$(ARCHX64DIR)/$(LIBDIR)/$(LIBC_STATIC) $(SRC_PAT_CRT_X64)
	@mkdir -p $(@D)

.PHONY: clean
clean:
	@rm -rf .cache/
	@rm -rf $(BUILDDIR)
	@rm -rf compile_commands.json
	@find $(SRCDIR)/ -name "*.o" -delete
