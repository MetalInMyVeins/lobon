CRT_DEB := $(BUILD)/startup/x86_64/crt_deb.o
CRT_REL := $(BUILD)/startup/x86_64/crt.o

$(CRT_DEB): src/startup/x86_64/start.asm
	@mkdir -p $(@D)
	$(ASM) $(AFLAGS_DEB) $< -o $@

$(CRT_REL): src/startup/x86_64/start.asm
	@mkdir -p $(@D)
	$(ASM) $(AFLAGS_REL) $< -o $@
	$(STRIP) --strip-debug $@

.PHONY: startup_deb startup
startup_deb: $(CRT_DEB)
startup: $(CRT_REL)
