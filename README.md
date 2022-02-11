# Beret

Beret is a 2D puzzle-platformer game about a scientist, astonishingly named Beret,
who has gained telekinetic abilities through his research at the Evil Corporation.
He decides that the Evil Corporation is a tad too evil for his liking, and begins
his solitary quest to overthrow the corporation and punish the evil deeds of his
employers. Beret has 21 puzzle-filled levels, 120 collectable Medallions, over
20 hours of gameplay, and an unlockable level editor.

# Fork

This is a fork of the now defunct gitorious repo.

# Changes

v1.2.2 - General maintaince for Debian. Redick. Moved to github.com

v1.2.1 - The last commited release in gitorious.

v1.2.0 - ?First public release?

# Author

Beret Copyright 2011 [Nigel Kilmer](mailto:kiwisauce@kiwisauce.com)

Currently maintained by David A. Redick.

Beret is licensed under the terms of the [LGPL](https://www.gnu.org/licenses/lgpl-3.0.html), copy is provided in this repo as well.

https://www.indiedb.com/games/beret

http://kiwisauce.com/beret

# Building

While the source code can be compiled and packaged by itself,
you'll need both the [beret source code](https://github.com/david-a-redick/beret)
and the [beret-data](https://github.com/david-a-redick/beret-data) to run the game.

These commands work for both source and data:

```shell
# View various variable defaults.
make echo

make

make install
```

# Dependencies

Debian 11

Run Time:
`apt-get libsdl1.2debian libsdl-image1.2 libsdl-ttf2.0 libsdl-mixer1.2 fonts-averia-sans-gwf`

Development:
`apt-get libsdl1.2-dev libsdl-image1.2-dev libsdl-ttf2.0-dev libsdl-mixer1.2-dev`
