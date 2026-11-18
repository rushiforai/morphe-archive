# InstaRex Clone vs UnClone Identity & Adaptive Launcher Icon Report (`23479.png` & `23480.png`)

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

## 1. Clone vs UnClone Package Identity (`23479.png`)
- Updated `patches/src/main/kotlin/app/rex/patches/instagram/misc/clone/ClonePatch.kt` so `clonePatch` has `default = true` with default package `com.xboyrex.instarex` and app name `InstaRex`.
- Side-by-side installation alongside official Instagram (`com.instagram.android`) works out-of-the-box without Google Play Store update collisions (`23479.png`), while users who explicitly disable `Clone Package & App Name` still get the UnClone (`com.instagram.android`) variant.

## 2. Full-Scale Adaptive Launcher Icon (`23480.png` & `22951.png`)
- Replaced the raw `<vector>` `rex_ic_launcher_round.xml` with a true `<adaptive-icon>` backed by `@drawable/rex_ic_launcher_background` (`#F70125` crimson fill) and `@drawable/rex_ic_launcher_foreground` (centered white Instagram camera glyph inside the 66dp safe zone of the 108dp canvas).
- Registered `rex_ic_launcher_background.xml`, `rex_ic_launcher_foreground.xml`, `rex_ic_launcher_instarex.xml`, and `rex_ic_launcher_round.xml` in `SettingsResourcePatch.kt`, eliminating the shrunken red dot inside a white circle on Poco / MIUI / HyperOS / Pixel launchers (`23480.png`).
