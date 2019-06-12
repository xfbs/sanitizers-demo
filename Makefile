CC=/usr/local/opt/llvm/bin/clang
CLANG_FORMAT=/usr/local/opt/llvm/bin/clang-format
CFLAGS += $(shell pkg-config --cflags jansson) -Wall -Wextra -pedantic
LDFLAGS += $(shell pkg-config --libs jansson)
LEAK_SANITIZER = memory-leak memory-leak-fixed
ADDRESS_SANITIZER = oob-stack oob-stack-fixed oob-heap oob-heap-fixed
TARGETS += $(LEAK_SANITIZER)
TARGETS += $(ADDRESS_SANITIZER)

all: $(TARGETS)

$(LEAK_SANITIZER): CFLAGS += -fsanitize=leak -O1
$(LEAK_SANITIZER): LDFLAGS += -fsanitize=leak -O1

$(ADDRESS_SANITIZER): CFLAGS += -fsanitize=address -O1
$(ADDRESS_SANITIZER): LDFLAGS += -fsanitize=address -O1

# format the source code according to llvm guidelines.
format:
	$(CLANG_FORMAT) -style=llvm -i $(TARGETS:%=%.c)

clean:
	$(RM) $(TARGETS)
