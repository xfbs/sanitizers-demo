UNAME = $(shell uname)

ifeq ($(UNAME), Linux)
CC = clang
CLANG_FORMAT = clang-format
endif
ifeq ($(UNAME), Darwin)
# we don' want to use Apple's native clang for this.
CC=/usr/local/opt/llvm/bin/clang
CLANG_FORMAT=/usr/local/opt/llvm/bin/clang-format
endif

CFLAGS += $(shell pkg-config --cflags jansson) -Wall -Wextra -pedantic
LDFLAGS += $(shell pkg-config --libs jansson)
TARGETS = memory-leak memory-leak-fixed out-of-bounds out-of-bounds-fixed

all: $(TARGETS)

memory-leak memory-leak-fixed: CFLAGS += -fsanitize=leak -O1
memory-leak memory-leak-fixed: LDFLAGS += -fsanitize=leak -O1

out-of-bounds out-of-bounds-fixed: CFLAGS += -fsanitize=address -O1
out-of-bounds out-of-bounds-fixed: LDFLAGS += -fsanitize=address -O1

# format the source code according to llvm guidelines.
format:
	$(CLANG_FORMAT) -style=llvm -i $(TARGETS:%=%.c)

clean:
	$(RM) $(TARGETS)
