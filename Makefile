CC=/usr/local/opt/llvm/bin/clang
CLANG_FORMAT=/usr/local/opt/llvm/bin/clang-format
CFLAGS += $(shell pkg-config --cflags jansson) -Wall -Wextra -pedantic
LDFLAGS += $(shell pkg-config --libs jansson)
TARGETS = memory-leak memory-leak-fixed

all: $(TARGETS)

memory-leak memory-leak-fixed: CFLAGS += -fsanitize=leak -O1
memory-leak memory-leak-fixed: LDFLAGS += -fsanitize=leak -O1

# format the source code according to llvm guidelines.
format:
	$(CLANG_FORMAT) -style=llvm -i $(TARGETS:%=%.c)

clean:
	$(RM) $(TARGETS)
