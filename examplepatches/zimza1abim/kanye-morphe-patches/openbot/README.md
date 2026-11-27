# OpenBot custom font

Morphe patch for the Android package `run.openbot.mobile`. Supported APKs are
listed in `patches/OpenBotCompatibility.kt`; adapter identities are in
`resources/openbot/adapters/*.properties`. Unknown bundle hashes stop patching.

## Behavior

- **Settings > Appearance > Font**, using OpenBot's own grouped settings rows,
  native search, navigation and theme colors.
- **System default** follows the phone font and replaces OpenBot's explicit Inter
  text family. This is the default for a new patch installation.
- **Installed fonts** reads Galaxy Store/FlipFont font packages, including split
  APKs. System font files are listed in their own group. A virtualized section
  list replaces pagination; search and pull-to-refresh work on the same list.
- **Import TTF file** uses the system document picker. TrueType signatures,
  metadata, text coverage, native loading and a 48 MiB limit are checked. A
  private copy appears under **Imported fonts**, applies immediately and remains
  available after returning to the system font. The picker's cache copy is
  removed; the user's original is not modified.
- Each visible row previews its own face using a native PNG, independently of
  the selected app font. Off-screen previews are unmounted. The encoded preview
  cache is capped at 1 MiB and a single render bitmap at 1.5 MiB. The preview
  queue is bounded and separate from the settings queue. Preview faces are not
  registered in React Native, and preview bitmaps are recycled after encoding.
- Choosing a font saves a validated private copy and updates text, input fields,
  headers and packaged DOM views. Inputs and navigation are not remounted.
- The selected face is restored by a private startup provider before React Native
  measures text. Only the selected face is loaded at startup, not the full list.
- System default clears the override. Invalid saved data falls back to the phone
  font. The previous selection survives a failed selection or a font-app update.
- Icon, emoji and mathematical font families retain their glyphs. A font without
  a character can use Android fallback. Encrypted, invalid and non-text fonts are
  omitted from the picker.

The native typeface and text-paint hooks cover React Native text and TextInput.
Revision font aliases bypass React Native's persistent font registry, so repeated
selection changes do not accumulate aliases there. Other families retain the
original resolver followed by the existing text override. The JSON bridge uses
the modern stream-closing File API; its existence/read pair shares one operation.
Failed selection responses are reconciled with committed native state.
Packaged Expo DOM pages load an intercepted stylesheet before paint. Font data
is served only to these local pages; remote and agent-authored HTML cannot use
the font bridge. PDF document fonts and text already drawn into images/canvas
are intrinsic to those documents and are not rewritten.

Expo OTA updates are disabled in the patched manifest, so a downloaded official
bundle cannot remove the patched Appearance entry. Updating the app requires a
new APK and matching verified adapter. Account and chat storage are unchanged.

## Build

Run commands from the patch repository root. The `work/` and `build/` directories
are ignored.

```sh
./gradlew buildAndroid --max-workers=2
```

The runtime has no React Native binary dependency; it is compiled against Android
and packaged as `extensions/openbot.mpe` by `openbot/openbot.gradle.kts`.

The adapter for a supported release ships in
`openbot/resources/openbot/adapters/`, and the patch checks it against the version,
the original bundle SHA-256 and the adapter checksums recorded in the matching
`.properties` file. An adapter is rebuilt from the official Android release tag
that matches the original APK with `node openbot/build-bundle.cjs <source> <apk>`.
That build needs the app's own source checkout and a separate export toolchain, so
it happens outside this repository. After renaming a checkout to a new version,
move `apps/mobile/.expo/metro-cache` aside first: Metro stores absolute file paths
there and the export otherwise fails on imports from the old folder name.
The bundle ships as a delta against the official one (`<version>.bdelta`), compiled
with the React Native Gradle release flags. Generated DOM assets ship inside
`<version>.assets.zip` because their filenames depend on the source build; files
identical to the APK are left out and web files are stored as deltas against an APK
file (`overlay.manifest`), each checked by SHA-256 before it is written.

Apply the patch with Morphe Manager by importing the built
`patches/build/libs/patches-<version>.mpp`, selecting the supported original APK,
and selecting **OpenBot custom font**.

For an offline APK application and DEX check:

```sh
./gradlew -I scripts/compat/compat.init.gradle :patches:compatSmoke \
  -x :patches:test --max-workers=2 \
  -Dcompat.apk=<absolute-original.apk> \
  -Dcompat.out=<absolute-output-directory> \
  -Dcompat.sdk=<absolute-android-sdk> \
  '-Dcompat.patches=OpenBot custom font'
```

## Validation

The patch bundle builds, the official APK passes the patch application and DEX
verification, and the parser and source transformation checks pass. Static APK
inspection confirms the React Native, native header, Expo DOM and RN WebView
hook structures. See `VALIDATION.md` for the recorded artifact hashes and scope.

No Galaxy was attached during implementation. First launch, live system/custom
font switching, restart persistence, installed-font enumeration, input selection,
and light/dark rendering still require a Galaxy device check. These are not
established by compilation or static analysis.

The user subsequently confirmed that the first patch changes fonts correctly.
The preview/virtualization update has its own notes in `VALIDATION.md`; it still
needs an on-device check after manually applying the new MPP.

## Upstream attribution

OpenBot: https://github.com/nightly-labs/openbot

The generated adapter contains OpenBot application code, which retains the
upstream PolyForm Noncommercial 1.0.0 license. This patch does not relicense
OpenBot or redistribute device font files. The font parser and scanner adapt
the existing Notesnook implementation in this patch repository.
