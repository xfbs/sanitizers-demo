CFLAGS += $(shell pkg-config --cflags jansson)
LDFLAGS += $(shell pkg-config --libs jansson)
TARGETS = memory-leak

all: $(TARGETS)

memory-leak: CFLAGS += -fsanitize=leak
memory-leak: LDFLAGS += -fsanitize=leak

clean:
	$(RM) $(TARGETS)
