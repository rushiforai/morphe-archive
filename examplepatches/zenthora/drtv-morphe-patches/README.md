# DRTV Morphe Patches

[Morphe](https://github.com/MorpheApp) patch bundle with a permanent **dark theme** for the DRTV Android TV app (`dk.dr.tvplayer`).
Built from [morphe-patches-template](https://github.com/morpheapp/morphe-patches-template).

| Patch | Package | Tested version | Form factor |
|---|---|---|---|
| Dark theme | `dk.dr.tvplayer` | 4.39.0 (versionCode 439000) | TV |

Other versions are marked as experimental. The fingerprints match on method/class names and resource IDs, so they may still work after small app updates.

## What the patch changes

- **Resource patch** (`DarkThemeResourcePatch.kt`)
  - Recolors about 75 entries in `res/values/colors.xml`: backgrounds `#121212`, cards `#242424`/`#313131`, text white or grey.
  - Moves `ActivityTheme` and the dialog/popup styles to their AppCompat dark parents, and switches about 30 text styles from black to white text.
  - Recolors backgrounds and text in the card, dialog and splash layouts, plus black vector drawables (including `drawable-anydpi-v24`).
  - Replaces `shadow.9.png`, `bg_search_focused.png` and 12 xhdpi icons with precompiled dark versions bundled in `resources/drtv/darktheme`.
- **Bytecode patch** (`DarkThemePatch.kt`)
  - Calls `AppCompatDelegate.setDefaultNightMode(MODE_NIGHT_YES)` in `MainApplication`/`MainActivity`.
  - Changes hardcoded title colors from `black_*` to `white_one` in the list/item-summary view holders, search and episodes.
  - Makes the text-color getters (`BasePageEntryViewModel`, `ListEntryViewModel`, `PageUiUtils`) return white.
  - Ignores the light background and text colors the server sends (`PageUiUtils` `Color.parseColor` results).
  - Darkens selection overlays, the Chromecast menu and the DR Syn dialog, and recolors the Compose EPG and full-screen dialog palette.

## Build

```bash
./gradlew buildAndroid generatePatchesList
# -> patches/build/libs/patches-<version>.mpp, patches-list.json
```

`app.morphe:morphe-patcher` and the `app.morphe.patches` Gradle plugin are published to GitHub Packages, which requires authentication.
You can either set `gpr.user`/`gpr.key` in `~/.gradle/gradle.properties`, or build both from source with `./gradlew publishToMavenLocal`
(`settings.gradle.kts` includes `mavenLocal()`).

## Verify against an APK

```bash
DRTV_APK=/path/to/dk.dr.tvplayer-4.39.0.apk DRTV_OUT=/tmp/drtv-dark.apk ./gradlew verifyPatch
```

This runs the built `.mpp` through Morphe Patcher with `validate = true` and writes an unsigned patched APK.
Sign it with `apksigner` before installing. Uninstall the Play Store build first, because the signatures differ.
If you install from Play as split APKs, pass a merged universal APK instead.

## Use with Morphe Manager

Add `patches/build/libs/patches-<version>.mpp` as a local patch source, choose DRTV, and apply **Dark theme**.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/zenthora/drtv-morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📺 DRTV (Android TV)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.39.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Dark theme](#dark-theme) | Applies a permanent dark theme across all views, cards, carousels, and dialogs in DRTV. |  |

</details>

<!-- PATCHES_END -->
