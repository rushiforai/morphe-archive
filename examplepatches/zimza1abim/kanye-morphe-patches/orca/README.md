# Orca font and bot pictures

Morphe patch for the Android package `dev.orca.app`. Supported versions are listed in
`patches/src/main/kotlin/app/template/patches/orca/Compatibility.kt`; adapter identities are in
`patches/src/main/resources/orca/adapters/*.properties`.

## Behavior

- **Settings > Appearance > Font** adds one row that opens the font screen, built with Orca's own
  `SettingsScreen` / `SettingsSection` / `ListRow` components, colors and navigation.
- Choices: **System default**, **Pretendard** (shipped with the patch), an installed device font
  (Samsung FlipFont / Galaxy Store font packages and `/system/fonts` faces) or a TTF imported with
  the system document picker.
- Every row previews its **own** face: the preview is a native PNG rendered from that font by the
  patch, not the app's current typeface, so changing the selection does not change other rows.
  Preview requests are keyed by font and inventory generation, so scrolling does not ask again,
  and native caches keep a bounded bitmap plus a capped total.
- The selection is stored in a private directory and committed before the new typeface is
  published. A revision number lets open screens redraw without remounting inputs.
- Text is replaced app-wide: React Native's shared typeface resolver and text paints created
  without a family return the selected face, code and monospace included. Only icon and symbol
  glyph fonts (Nerd/terminal symbols, icon fonts, emoji) keep their faces, because a text face
  has no glyphs for their code points.
- Imported files are copied into a private directory; the user's original is not modified. TrueType
  or OpenType signatures, a 48 MiB cap and native loading are checked before a font is accepted.
- The font screen and its native bridge travel as a rebuilt Hermes bundle, stored as a delta
  against the official bundle. The patch verifies the SHA-256 of the official bundle for that exact
  version, rebuilds the adapter from it and verifies the adapter's own checksum. Expo updates stay disabled in the manifest, so a downloaded bundle
  cannot outlive the patch.
- Orca 0.0.70 draws each bot's uploaded picture itself. The patch adds the device copy behind
  that read: the picture the app last drew is kept under the app's cache and drawn on the first
  paint after a launch, so a restart shows the picture instead of the initial, and the file for an
  upload the host replaced is removed rather than kept beside the new one.
- The web shell — home, bot and worktree chats, review and files — fetches every resource through one
  WebView client. The patch serves the selected face from the shell's own origin under
  `/__morphe-font/` (allowed by its `font-src 'self'`) and writes a stylesheet link into the shell
  document before its first paint. The stylesheet redefines the shell's family names — text
  (`Geist`, `-apple-system`, `Segoe UI`, `Roboto`, `Helvetica`, `Arial`, `Inter`), code
  (`SF Mono`, `Menlo`, `Consolas`, `JetBrains Mono`, `Fira Code`, `Geist Mono`, …) and KaTeX text
  faces — instead of using selectors, because React Native Web writes a family on every text
  element. KaTeX_Size/AMS (delimiters and symbols) stay. With **System default** nothing is served.
- The terminal is a separate WebView whose page the app builds as a string. The rebuilt bundle
  inlines the selected face there, puts it first in every terminal font stack and adds it to the
  startup font probe, so cells are measured with the face already loaded.
- Open screens keep the text layouts React Native already measured. After a change the font screen
  shows **Restart Orca**, which starts the app process again from a separate restart process.

## Build

Bundle adapter first; it needs the official source checkout with installed dependencies.

```sh
git clone --depth 1 --branch android-v<version> https://github.com/stablyai/orca.git build/orca-source-<version>
(cd build/orca-source-<version>/mobile && pnpm install --frozen-lockfile)
node orca/build-bundle.cjs build/orca-source-<version> <original-app-release.apk>
```

The script verifies the original APK's bundle checksum, injects the font UI into the source,
exports the JavaScript with `expo export:embed`, compiles it with the release flags of the React
Native Gradle plugin (no debug info in the bundle), checks the bytecode header, and writes
`adapters/<version>.bdelta` (the adapter as a delta against the official bundle, made with
`scripts/delta/BundleDelta.java`), `<version>.assets.zip` and the checksums in
`adapters/<version>.properties`.

Then build the patch bundle:

```sh
./gradlew buildAndroid --max-workers=2
```

The runtime in `orca/runtime/` is plain Java compiled against `android.jar` and dexed into
`extensions/orca.mpe`; it has no React Native dependency.

## Adding a version

1. Build the adapter for the new version (above); it reads the version from the source's
   `mobile/app.json`.
2. Add the version to `ORCA_VERSIONS` in `Compatibility.kt`.
3. Run the compatibility smoke test against that APK:

```sh
./gradlew -I scripts/compat/compat.init.gradle :patches:compatSmoke -x :patches:test \
  -Dcompat.apk=<orca app-release.apk> -Dcompat.out=build/orca-smoke \
  -Dcompat.sdk=$ANDROID_HOME -Dcompat.patches='Orca font and bot pictures'
```

The patch loads the adapter for the APK's own `versionName`; a version without an adapter, or an
APK whose bundle does not match the recorded checksum, stops with a clear message instead of
half-applying the hooks.

## Files

- `patches/` — bytecode patches: typeface and text-paint hooks, WebView stylesheet, resource
  install, compatibility list.
- `runtime/` — plain Java dexed into `extensions/orca.mpe`: font store, device font scan, content
  provider, native previews, typeface resolution.
- `ui/` — font section, screen and `content://` bridge copied into the app source by
  `prepare-source.cjs`.
- `patches/src/main/resources/orca/` — bundled OFL faces and one adapter per supported version.
- `build-bundle.cjs`, `prepare-source.cjs` — adapter build and source injection.
