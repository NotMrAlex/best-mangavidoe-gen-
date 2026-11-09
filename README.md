# DANK ENGINE STUDIO

Turns your manga/manhwa panels and narration audio into ready-to-upload recap videos (long videos and Shorts) — with motion, captions, and background music, all automatic.

---

## 1. Install (one time only)

1. Double-click **`install.bat`**.
2. If a window says Python or FFmpeg is missing, follow the steps it shows you, then double-click `install.bat` again.
3. When it says **"Done!"**, close the window.

That's it. You never need to type commands.

---

## 2. Add your files

The engine reads `story.json` (already included) and takes files from these folders. Create a folder only if it's missing.

- **`output_panels/`** — your panel images. Name them like `page1_panel1.jpg`, `page1_panel2.jpg` (any image type works: jpg, png, webp...).
- **`audio/<language>/`** — the spoken narration. Name each file with the page and panel, like `audio/english/1_1.mp3`, `audio/spanish/1_1.mp3`.
- **`assets/background/`** — **required**: one background image or looping video (for example `background.mp4`).
- **`assets/bgm/`** — background music (optional).
- **`assets/sfx/`** — sound effects (optional).
- **`assets/transitions/`** — transition sounds (optional).

Each panel in `story.json` already tells the engine what to do (animation, sound effect, language text, skip/render). You rarely need to edit it.

---

## 3. Make your videos

1. Double-click **`engine.bat`**.
2. Wait for it to finish (it shows a progress bar).
3. Your videos are saved in:
   - **`output/<language>/long_video.mp4`** — the full video
   - **`output/<language>/shorts/`** — the Shorts

Run `engine.bat` again any time to rebuild.

---

## Problems?

- **"Python was not found"** — install Python from https://www.python.org/downloads/ (tick **"Add Python to PATH"**), then run `install.bat` again.
- **"ffmpeg/ffprobe missing"** — FFmpeg was not installed. Run `install.bat` again, or download it from https://www.gyan.dev/ffmpeg/builds/ and add its `bin` folder to PATH.
- **No videos appear** — make sure `assets/background/` has a file and that `output_panels/` and `audio/` contain matching `pageX_panelY` files.