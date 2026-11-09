# Edge Window Patches

An experimental Android patch source, compatible with Morphe.

Repository: <https://github.com/ymshin-dev/edge-window-patches>

## Patch

**Hide status bar and ignore display cutouts** changes every app-defined `Activity` window:

- Android 9 and newer: allows the window to extend into display cutout areas.
- Hides the status bar directly, without enabling Android's sticky immersive mode. The navigation bar remains visible.
- Android 11 and newer: removes status-bar and display-cutout insets before dispatching them from the window root to app views.
- Reapplies the settings after resume, window-focus, and configuration changes, and when drawing detects that the app has shown the status bar again or re-fitted its window to the system bars.

The patch ships in two variants:

- **Hide status bar and ignore display cutouts** — listed for YouTube only. Enable it when patching YouTube.
- **Hide status bar and ignore display cutouts (universal)** — listed for any app. It relies on a browser-safe runtime helper that installs the top-inset filter at the window root, so Chromium-based browsers (Edge, Chrome, and similar) no longer shift their whole window below the cutout on the new tab page; a window that re-fits itself to the system bars is re-applied and re-laid out. Both variants share the same runtime helper, so the fix is included in both.

The patch is disabled by default. Enable only a variant of it for the app where the content should use the notch or punch-hole area. Do not enable more than one variant on the same app.

**Proper Korean translation** applies DVRP's [옳은 한글 (ProperKorean)](https://dvrp-balatro-mods.pages.dev/properkorean)
v0.7.1 to **Balatro Android 1.8**, including the supplied merged Korean/Latin
font, translated descriptions, grammar, booster selection order, voucher
restocking, deck labels, orbital tags and credits. It supports both
`com.playstack.balatro.android` and the Morphe-renamed
`com.playstack.balatro.android.morphe` package. It is disabled by default.

In Morphe Manager, refresh this source, select the Balatro **1.8 APK**, enable
**Proper Korean translation** in Expert mode, patch and install. Select
**한국어** in Balatro's language settings. No PC Lovely DLL, Steamodded or
external Mods folder is needed. Start from an APK without this translation;
duplicate installations and incompatible Lua layouts are rejected.

The patch edits nine Lua assets and the Korean font directly. It retains
Android-only translation keys and existing Morphe bytecode changes; description
lists replace completely to prevent leftover lines. Language switching remains
available, and achievement settings are preserved. The original game files/APK
are not included in this repository. Attribution and font notices are bundled
with the patch; see [ProperKorean NOTICE](patches/src/main/resources/balatro/properkorean/NOTICE.md).

**Adjust app font scale** multiplies only the font scale in the patched app's Activity contexts. It leaves display density and density-based layout dimensions unchanged, so it can be combined with Samsung's screen-zoom/DPI setting to keep a denser feed while making text easier to read. Set the multiplier slider between `0.5×` and `2.0×`: `1.0×` keeps the current system font scale, while `1.2×` increases it by that factor. Android 14 and newer scale fonts nonlinearly, so the slider value does not guarantee an identical physical-size change for every text style. The patch is disabled by default; enable it only for the app whose text should change.

## Add the source in Morphe

After the updated GitHub release is published, open **Sources → + → Remote** in Morphe Manager and enter:

```text
github.com/ymshin-dev/edge-window-patches
```

Patches are optional and must be selected in Expert mode. Enable only one variant of the hide patch per app, and only for the app where the content should use the notch or punch-hole area. Apply **Adjust app font scale** only to the app whose text should change.

## Limits

The inset filter reaches view layouts that use the normal window-inset dispatch path. An app can still add padding itself or read root window insets directly, which may leave the player below the punch-hole. A browser that reads display cutout information from the display object instead of window insets can also offset its page. Removing top insets can move interactive controls close to the camera. Below Android 11, the patch can allow the window into the cutout but does not filter inset dispatch; below Android 9, it can hide the status bar but there is no display-cutout window API.

The font-scale patch only affects text laid out with Android's `sp` scaling. Text drawn at fixed pixel sizes, WebView or browser page content, and custom Canvas/OpenGL rendering may not change. An app that reads the system font scale directly instead of its Activity resources can bypass the override.

## Build

Build the Morphe patch bundle with:

```sh
./gradlew buildAndroid
```

The `.mpp` file is written to `patches/build/libs/`. Morphe's patcher artifacts are served through GitHub Packages; builds need a token with `read:packages` access configured as `gpr.user` and `gpr.key` in your Gradle user properties.

For GitHub Actions releases, add a `GPR_KEY` repository secret with a GitHub token that can read packages. `GPR_USER` is optional and defaults to the workflow actor. Keep package tokens out of committed files.

The cutout patch changes Android window policy and inset dispatch but has not been validated against a target APK or Galaxy device.

The Balatro patch was applied successfully with Morphe Desktop to the supplied
Morphe-patched Android 1.8 APK (version code 47, game Lua 1.0.1o). All 50 Lua
files compiled with LuaJIT. A Lua runtime harness exercised the actual patched
`Game:set_language`, Korean/English switching, translation merging, description
replacement and grammar helpers. APK comparison confirmed that the original
DEX, manifest and unrelated assets were unchanged. Android device launch,
rendering and gameplay have **not** been tested.

To repeat validation with your own local APKs (LuaJIT required):

```sh
java -jar morphe-desktop.jar patch original.apk \
  -p patches/build/libs/patches-<version>.mpp \
  -e 'Proper Korean translation' --exclusive --unsigned -o patched.apk
python3 scripts/validate-properkorean.py original.apk patched.apk
```

To reproduce the imported mod resources, download the official v0.7.1 ZIP linked
in the NOTICE and run `python3 scripts/import-properkorean.py ProperKorean.zip`.
The importer checks its SHA-256 and generates the Android Lua edits. It never
imports a game APK or complete game Lua files.

## Patch catalog

<!-- PATCHES_START EXPANDED -->
> **[v1.5.1](https://github.com/ymshin-dev/edge-window-patches/releases/tag/v1.5.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide status bar and ignore display cutouts](#hide-status-bar-and-ignore-display-cutouts) | Hides the status bar and removes top status-bar and cutout insets from app content. |  |

</details>

<details open>
<summary>📦 Balatro&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Proper Korean translation](#proper-korean-translation) | Applies DVRP's ProperKorean (옳은 한글) translation, font, grammar and UI fixes to Balatro. |  |

</details>

<details open>
<summary>📦 Balatro&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Proper Korean translation](#proper-korean-translation) | Applies DVRP's ProperKorean (옳은 한글) translation, font, grammar and UI fixes to Balatro. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Adjust app font scale](#adjust-app-font-scale) | Scales text in this app without changing display density or layout sizing. | • Font scale multiplier |
| [Hide status bar and ignore display cutouts (universal)](#hide-status-bar-and-ignore-display-cutouts-universal) | Hides the status bar and removes top status-bar and cutout insets from app content in any app. |  |

</details>

<!-- PATCHES_END -->
