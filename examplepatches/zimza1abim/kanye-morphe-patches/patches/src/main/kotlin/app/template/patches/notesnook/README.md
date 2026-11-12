# Notesnook custom font — Morphe patch

Applies a device font or a TTF/OTF/TTC file to every piece of Notesnook text
the app draws itself: app UI, note list, editor, reader, dialogs and menus.
Icon fonts (MaterialCommunityIcons, EvilIcons), emoji and KaTeX math keep their
own glyphs. Verified on official Android **3.4.14** (`notesnook-arm64-v8a.apk`).

This folder, `extensions/.../extension/notesnook/` and `scripts/notesnook/`
hold everything the Notesnook patch uses.

## Using it

Patch the original APK in Morphe with **Notesnook custom font**, then open the
font screen from any of:

- **Settings → Customization → Appearance → Font** (registered releases)
- long-press the app icon → **Font**
- Android App info → gear icon (app preferences)
- `notesnook-font://settings`

Pick a font from **Device fonts** (system fonts, and Samsung FlipFont / Galaxy
Store font apps listed under the name Samsung's font screen shows; Hangul-capable
fonts first) or **Choose file**, then **Restart** so already-open screens are
redrawn. **Default** restores Inter.

## How it works

- `fontswap/NotesnookNativeFontHooks.kt`: structural hooks, no class names. The release
  APK is R8-renamed (`ReactTypefaceUtils` → `com/facebook/react/views/text/s`,
  RNCWebViewClient → `com/reactnativecommunity/webview/h`); discovery uses the
  Typeface ABI and WebViewClient ancestry, and stops on ambiguous matches.
  - RN text: a wrapper calls the original `applyStyles`, then
    `NotesnookFontInjector`. `Inter-*` weight/italic come from the family name.
  - WebView: `shouldInterceptRequest` serves `https://morphe-font.invalid/`
    (stylesheet + committed font); `onPageCommitVisible`/`onPageFinished` keep
    the stylesheet link current on other pages and after a font switch.
- `fontswap/NotesnookFontResourcesPatch.kt`: startup provider, settings
  activity, `QUERY_ALL_PACKAGES` (font apps are invisible on Android 11+
  otherwise), and a render-blocking `<link>` in `assets/index.html` and
  `assets/plaineditor.html`, so the editor's first paint already uses the font.
- Runtime (`app.fontism.extension.notesnook`):
  - `NotesnookFontProvider` runs before React Native; `SystemTypefaces`
    replaces `Typeface.DEFAULT`/`sans-serif*` so dialogs, menus and RN text
    without a font family follow too.
  - `NotesnookFontStore` copies a sanitized font (`FontSanitizer` rebuilds the
    Unicode cmap without symbol/emoji ranges) to private storage atomically.
  - `FontInfo`/`DeviceFonts` read names, weight and Hangul coverage from
    name/OS2/cmap without loading outlines, and extract one face from TTC
    collections (most Korean system fonts).

## Appearance menu adapter

`fontswap/NotesnookAppearanceMenuPatch.kt` swaps in a JS bundle rebuilt from
the same official tag with one added settings item, chosen by the original
bundle's SHA-256 (`resources/notesnook/adapters`). Unregistered releases keep
their bundle and still get the font. To add a release, check out tag
`<version>-android`, bootstrap it like CI
(`npm ci --ignore-scripts && npm run bootstrap -- --scope=mobile && npm run tx mobile:build`),
then run `node scripts/notesnook/build-bundle.cjs <version> <checkout> <original.apk>`.
An unmodified rebuild of 3.4.14 matches the official bundle's function, string
and identifier counts exactly.

## Limits

Text drawn outside the app process cannot be changed: notifications, home
screen widgets, status bar, keyboard and share sheet. Some paid Galaxy Store
fonts are encrypted and are not listed.

## Testing

```sh
./gradlew buildAndroid
./gradlew -I scripts/notesnook/smoke.init.gradle :patches:notesnookSmoke \
  -Dnotesnook.apk=/path/notesnook-arm64-v8a.apk -Dnotesnook.out=/tmp/nn \
  -Dnotesnook.sdk=$ANDROID_HOME
```
