LIB_SRCS := $(shell find src -name '*.asm' -not -path 'src/startup/*')

LIB_OBJS_DEB := $(patsubst src/%.asm,$(BUILD)/lib_deb/%.o,$(LIB_SRCS))
LIB_OBJS_REL := $(patsubst src/%.asm,$(BUILD)/lib_rel/%.o,$(LIB_SRCS))

$(BUILD)/lib_deb/%.o: src/%.asm
	@mkdir -p $(@D)
	$(ASM) $(AFLAGS_DEB) -MD $(@:.o=.d) -MP $< -o $@

$(BUILD)/lib_rel/%.o: src/%.asm
	@mkdir -p $(@D)
	$(ASM) $(AFLAGS_REL) -MD $(@:.o=.d) -MP $< -o $@
	$(STRIP) --strip-debug $@

LIB_A_DEB  := $(BUILD)/lib/liblobon_deb.a
LIB_SO_DEB := $(BUILD)/lib/liblobon_deb.so
LIB_A_REL  := $(BUILD)/lib/liblobon.a
LIB_SO_REL := $(BUILD)/lib/liblobon.so

$(LIB_A_DEB): $(LIB_OBJS_DEB)
	@mkdir -p $(@D)
	rm -f $@
	$(AR) rcs $@ $^

$(LIB_A_REL): $(LIB_OBJS_REL)
	@mkdir -p $(@D)
	rm -f $@
	$(AR) rcs $@ $^

$(LIB_SO_DEB): $(LIB_OBJS_DEB)
	@mkdir -p $(@D)
	$(LD) -shared -z noexecstack $^ -o $@

$(LIB_SO_REL): $(LIB_OBJS_REL)
	@mkdir -p $(@D)
	$(LD) -shared -z relro -z now -z noexecstack $^ -o $@

.PHONY: lib_deb lib_rel lib
lib_deb: $(LIB_A_DEB) $(LIB_SO_DEB)
lib_rel: $(LIB_A_REL) $(LIB_SO_REL)
lib: lib_deb lib_rel

-include $(LIB_OBJS_DEB:.o=.d) $(LIB_OBJS_REL:.o=.d)
