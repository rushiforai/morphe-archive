# Joplin custom font v11 — multiple release adapters

Morphe patch preserving **Appearance font selection and Blush Pink**.
The shipped adapters cover official Android **3.7.8, 3.7.10, and 3.7.11** in one MPP.
Use the original APK, not an already patched installation. Keep the existing
Morphe signing key; do not uninstall Joplin or clear data on a signature mismatch.

## Why the previous patch rejected 3.7.10

The v10 metadata advertised only 3.7.8 and its resource patch required the
3.7.8 original bundle hash. The native Typeface ABI is the same in both tested
releases. Thus changing a fingerprint offset was not the primary fix.

The old source patch also depended on nearby settings lines. Android 3.7.10
removed a sync-wizard button near the insertion point, so this unrelated change
prevented applying the old text patch. Appearance insertion now uses the
TypeScript AST to find the settings-section branch in the scope containing
the button builder. It preserves all unrelated settings code.

## Structural native layer

`NativeFontHooks.kt` is separate from release UI resources.

- Typeface discovery uses Android parameter/return types; there is no fixed
  ReactTypefaceUtils class name, applyStyles method name, opcode position, or
  original return-register assumption. Ambiguous/absent matches are rejected.
- A fresh wrapper calls the preserved original method and then the font helper.
  Old locals, branches and parameter-register layouts are not rewritten.
- WebView discovery uses superclass ancestry and callback shape within the
  React Native WebView namespace, not one fixed client class name.
- If request interception already exists, its implementation is preserved and
  called for non-font requests instead of rejecting that layout or replacing it.
- The working v10 font runtime, native preparation and icon protection remain.
- Global coverage (bundle-independent): at provider startup the committed font
  replaces `Typeface.DEFAULT`/`DEFAULT_BOLD`/`SANS_SERIF`, the style defaults,
  the `sans-serif*` system family aliases and the native default typeface. RN text
  without font props, native dialogs, menus and toasts now use the font. Each
  step is independent best-effort reflection; disabling restores the originals.
  Monospace, serif and explicit (icon) typefaces are not replaced.
- Every page committed by the RN WebView client receives an idempotent,
  per-revision document-wide rule (`#morphe-font-global`), so editor, viewer and
  plugin panels are covered beyond the bundle's fixed selector list. KaTeX,
  MathJax, SVG and icon-font elements are excluded.
- The native hook accepts any `JoplinCustomFont_N` family, so a stale JS family
  during a font switch no longer falls back to the system font. Unreadable
  stored fonts (which newer Android reports as `Typeface.DEFAULT`) are rejected.

These are structural contracts, not a claim that every future React Native or
WebView architecture will work unchanged.

## Release UI adapters

`joplin/adapters/index.properties` enumerates versions. Each adapter has the
original bundle hash, its matching modified bundle, source commit, and modified
bundle checksum. The patch selects by original bundle content, not by guessing
the nearest version. It verifies the replacement checksum before writing it.

The original and replacement bundles belong to the **same release**. An unknown
bundle is never silently replaced with an older app's JavaScript. Keeping both
Appearance and the custom theme means an unregistered future release still
requires adapter generation and a new MPP. This is intentionally **not** a
fully version-independent, no-rebuild patch.

## Add a release

Prepare official source at tag `android-vVERSION` in a separate checkout and run
`corepack yarn install --immutable` there. Then, from this Morphe project:

```sh
ANDROID_HOME=/path/to/sdk node scripts/joplin/update-release.cjs VERSION /path/to/source /path/to/original.apk
./gradlew buildAndroid -Pversion=NEW_PATCH_VERSION
```

The script verifies APK package/version and the source tag, performs guarded
source edits (AST-based Appearance insertion), compiles TypeScript and Hermes,
and registers the new adapter **alongside previous releases**. It does not build
the Android app. The remaining source edits and native ABI may still need
maintenance if upstream changes them. Errors stop the process rather than
forcing a partial adapter into a release.

Check actual patch application against the new original APK before distributing.
The existing `scripts/joplin/smoke.init.gradle` and `JoplinSmoke.kt` support this;
run `buildAndroid` last so Android patch DEX is included in the final MPP.

## Licenses and scope

Joplin bundle modifications follow upstream AGPL-3.0-or-later. Corresponding
upstream sources are the official Android tags, combined with
`scripts/joplin/source-3.7.8.patch`, `appearance-transform.cjs`, and the guarded
React Native getter edits in `build-bundle.cjs`. The legacy patch filename is a
baseline name, not a requirement to replace newer apps with 3.7.8 code.

- https://github.com/laurent22/joplin/tree/android-v3.7.8
- https://github.com/laurent22/joplin/tree/android-v3.7.10
- https://github.com/laurent22/joplin/tree/android-v3.7.11

Do not include Gradle credentials, signing keys, private fonts, or notes in
source distributions. Existing non-Joplin project changes are not part of this
Joplin redesign and must be preserved.
