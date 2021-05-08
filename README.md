# mitsumete-patch

This [ca65](https://cc65.github.io/doc/ca65.html) + [ld65](https://cc65.github.io/doc/ld65.html) project adds [*Kimi o Mitsumete -The time I'm seeing you-*](https://www.youtube.com/watch?v=jUqY5fJ-y9o) to *Super Robot Wars 4*. All robots from Mobile Suit Gundam F91 will use this song, except Rafflesia, which uses *Valsion* (in order to get the big explosion). This patch also comes with a karaoke mode entry, complete with lyrics and its own combat sequence.

To build `patched.sfc` in this directory:

* Ensure you have the original, unheadered ROM as `base.sfc` in this directory. Either revision works, expanded portions beyond the original 3 MB limit will be ignored.
* Ensure you have the cc65 suite and GNU Make installed.
* Run `make`. This generated ROM does not have the karaoke mode entry.
* Running `make karaoke=1` instead will *replace* the last two karaoke mode entries with this song.

This repository contains the bare minimum needed to insert the song into the game; the original source code did not look like this, because it has to support multiple songs.

The `etc` directory contains pre-built IPS / BPS patches for the V1.1 revision, plus an SPC rip.
