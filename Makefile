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
	install -D --mode=755 beret $(PREFIX)/games/beret
	install -D --mode=644 beret.6 $(PREFIX)/share/man/man6/beret.6
	install -D --mode=644 beret.desktop $(PREFIX)/share/applications/beret.desktop
	install -D --mode=644 beret.png $(PREFIX)/share/pixmaps/beret.png

uninstall:
	rm -f $(PREFIX)/games/berete
	rm -f $(PREFIX)/share/applications/beret.desktop
	rm -f $(PREFIX)/share/pixmaps/beret.png

debian-build:
	cd .. && tar -jcf beret_1.2.2.orig.tar.bz2 beret-1.2.2
	debuild -us -uc

debian-clean: clean
	rm -f ../beret_1.2.2*
	rm -f ../beret-dbgsym*
	rm -rf debian/.debhelper
	rm -rf debian/beret
	rm -f debian/beret.substvars

%.o: %.c %.h

beret: game.o physics.o thing.o
	$(CC) $^ $(LDLIBS) -o $@
