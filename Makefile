CFLAGS += $(shell pkg-config --cflags jansson)
LDFLAGS += $(shell pkg-config --libs jansson)
TARGETS = memory-leak

all: $(TARGETS)

memory-leak: CFLAGS += -fsanitize=leak
memory-leak: LDFLAGS += -fsanitize=leak

macos: CC=/usr/local/opt/llvm/bin/clang
macos: all

clean:
	$(RM) $(TARGETS)
