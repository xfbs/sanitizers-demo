CFLAGS += $(shell pkg-config --cflags jansson) -Wall -Wextra -pedantic
LDFLAGS += $(shell pkg-config --libs jansson)
TARGETS = memory-leak memory-leak-fixed

all: $(TARGETS)

memory-leak memory-leak-fixed: CFLAGS += -fsanitize=leak
memory-leak memory-leak-fixed: LDFLAGS += -fsanitize=leak

macos: CC=/usr/local/opt/llvm/bin/clang
macos: all

clean:
	$(RM) $(TARGETS)
