PREFIX ?= $(HOME)/.local

PATH_TO_DATA ?= $(PREFIX)/share/games/beret

PATH_TO_FONT ?= /usr/share/fonts/truetype/averia-gwf/AveriaSansGWF-Regular.ttf

# PATH_TO_DATA needs the trailing / !
CFLAGS ?= -DPATH_TO_FONT=$(PATH_TO_FONT) -DPATH_TO_DATA=$(PATH_TO_DATA)/ $(shell sdl-config --cflags) -Wall -g

LDLIBS ?= $(shell sdl-config --libs) -lSDL_image -lSDL_ttf -lSDL_mixer -lm

default: beret

echo:
	@echo PREFIX=$(PREFIX)
	@echo
	@echo PATH_TO_DATA=$(PATH_TO_DATA)
	@echo
	@echo PATH_TO_FONT=$(PATH_TO_FONT)
	@echo
	@echo CFLAGS=$(CFLAGS)
	@echo
	@echo LDLIBS=$(LDLIBS)
	@echo
	@echo CC=$(CC)

clean:
	rm -f beret *.o

install: beret
	install --mode=755 beret $(PREFIX)/bin

%.o: %.c %.h

beret: game.o physics.o thing.o
	$(CC) $^ $(LDLIBS) -o $@
