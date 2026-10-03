LIB_OBJS_TEST := $(patsubst src/%.asm,$(BUILD)/lib_test/%.o,$(LIB_SRCS))

SYMBOL_MAP := mk/test_symbol_map.txt

$(BUILD)/lib_test/%.o: src/%.asm
	@mkdir -p $(@D)
	$(ASM) $(AFLAGS_DEB) -MD $(@:.o=.d) -MP $< -o $@.tmp
	$(OBJCOPY) --redefine-syms=$(SYMBOL_MAP) $@.tmp $@
	@rm -f $@.tmp

-include $(LIB_OBJS_TEST:.o=.d)

LIB_A_TEST := $(BUILD)/lib/liblobon_test.a

$(LIB_A_TEST): $(LIB_OBJS_TEST)
	@mkdir -p $(@D)
	rm -f $@
	$(AR) rcs $@ $^

TEST_SRCS  := $(shell find tests -name 'test_*.cxx')
TEST_NAMES := $(basename $(notdir $(TEST_SRCS)))

TEST_OBJS := $(patsubst tests/%.cxx,$(BUILD)/tests/obj/%.o,$(TEST_SRCS))

$(BUILD)/tests/obj/%.o: tests/%.cxx
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -MMD -MP -c $< -o $@

-include $(TEST_OBJS:.o=.d)

BUILD_TESTS := $(addprefix $(BUILD)/tests/,$(TEST_NAMES))

define TEST_template
$(BUILD)/tests/$(2): $(BUILD)/tests/obj/$(patsubst tests/%.cxx,%.o,$(1)) $(LIB_A_TEST)
	@mkdir -p $$(@D)
	$$(CXX) $$(CXXFLAGS) $$^ $$(GTEST_LIBS) -o $$@
endef
$(foreach src,$(TEST_SRCS),$(eval $(call TEST_template,$(src),$(basename $(notdir $(src))))))

.PHONY: $(TEST_NAMES) tests
$(TEST_NAMES): %: $(BUILD)/tests/%
tests: $(BUILD_TESTS)

TEST_ALL_BIN := $(BUILD)/tests/test_all

$(TEST_ALL_BIN): $(TEST_OBJS) $(LIB_A_TEST)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(TEST_OBJS) $(LIB_A_TEST) $(GTEST_LIBS) -o $@

.PHONY: test_all check
test_all: $(TEST_ALL_BIN)

check: $(TEST_ALL_BIN)
	$(TEST_ALL_BIN)
