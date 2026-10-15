# MC@GT General Meeting — Oct 15, 2026

Slide deck for the Motorcycle Club at Georgia Tech general meeting (Thursday, October 15, 2026, 6:30 PM, George & Scheller Tower 266).

**Live:** https://bobbyiii21.github.io/mcgt-2026-10-15/

The whole deck is one self-contained file, `index.html` (photos, map tiles, QR codes and the map library are embedded, so it also works offline).

**Controls:** → / Space / click to advance · ← / right-click to go back · Home / End · `F` for fullscreen · `#5` in the URL jumps to slide 5 · the gear buttons jump between sections.

## Presenting locally (with the Welcome background video)

The Welcome slide can play a background video, `welcome-bg.mp4`, which is kept out of this repo because of its size. On the public site that slide just shows a plain dark background.

To present with the video, put `welcome-bg.mp4` next to `index.html` and run:

```sh
./present.sh        # opens the deck on slide 1
./present.sh 6      # or start on a specific slide
```

It starts a small local web server, opens the deck in Chrome, and stops the server when you press Ctrl-C.
