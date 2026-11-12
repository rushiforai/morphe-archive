# Anytype custom font

A **runtime font patch** that adds an `Application → Font` row. It does not bundle a
font into the APK or replace Anytype's own font resources.

## Build and use

Use JDK 21 and Android SDK 36 from the repository root.

```sh
./gradlew buildAndroid
```

Output: the full bundle `patches/build/libs/patches-<version>.mpp`.

Apply **Anytype custom font** to the original `io.anytype.app` APK. In the app, open
Settings → Application → Font and pick a TTF or OTF with `Choose custom font…`.
`Default` or `Reset to default` restores the original font.

## Implementation

- Settings: calls the original `Option` composable. Only the Font row with this patch's
  click handler shows the current file name instead of the trailing arrow. Spacing,
  icon, typography and the app's `text_secondary` color are reused.
- Picking: an Android dialog in the app theme and a private SAF relay Activity call
  `ACTION_OPEN_DOCUMENT`, then validate the extension, SFNT/cmap/maxp and an Android
  Typeface load. Cancelling keeps the current state.
- Storage: keys `morphe.anytype.font.file` and `morphe.anytype.font.name` in Anytype's
  `prefs` SharedPreferences. The validated font is copied to private storage, so it does
  not depend on the source file or a persistable URI grant.
- Startup: synchronous init in the manifest Application's `attachBaseContext`, so the
  Typeface is ready before the first UI. If the app already has its own
  attachBaseContext, the patch fails instead of guessing.
- Compose: the shared resolver returns the chosen Typeface; no screen's `Text` or
  TextStyle is changed. Size, line height and letter spacing are kept; requested weight,
  italic and Android's font-weight accessibility adjustment apply.
- Views: hooks the shared AppCompat text attribute loader, TextView/EditText Typeface
  setters, dialog show paths and layout refresh, Anytype's own Paint setter (inline
  mentions) and the TypefaceSpan/StyleSpan layer (inline code, bold, italic).
  **AndroidX emoji Paint is not changed.**
- Cache: one Typeface per font, weight and slant, shared with the Compose resolver. The
  fvar `wght` axis is set explicitly within its range; static fonts and italics use
  Android synthesis.
- Changes: the cache is swapped after the new file is validated and saved, and live
  Activities are recreated, so no process restart is needed. The previous file may still
  back a native Typeface and is deleted on the next cold start.

## Structural matching and failure conditions

`Fingerprint.matchAll(1..1)` combined with caller/callee, fields, Android APIs and
resource IDs.

- Option: static void, argument shape, icon/arrow semantics, Material Text call.
- Application section: `settings_application` from the resource table and the Section
  callee shape of its caller. Generated lambda class names are not used.
- Resolver: interface implementation with two objects and two ints, a request built from
  the same arguments and cache key, and a Comparable weight object with one int field.
- Result object: the only class implementing the result interface with Object and
  boolean fields and a matching constructor. The constructor argument order, which
  varies by version, is read rather than assumed.
- View loader: AttributeSet/int arguments, a single TextView field, and calls to
  getTransformationMethod and setAllCaps.

No instruction indexes, offsets or original register numbers are hard-coded. Rewritten
calls read the matched instruction's actual registers; added code uses its own wrapper
and locals. If the Compose Image/Text ABI changes, the patch fails clearly instead of
picking the first similar method.

## Verification and limits

Patch application was checked on 0.48.10, 0.49.0 and 0.50.1-alpha. A separate API 36 test
app covered font validation, variable weight, emoji, storage and reset. **This is not a
hands-on check of every screen of the full app.**

- Characters missing from the font fall back to Android; characters the OS lacks are not
  added. There is no guarantee for every device, font or Unicode range.
- Unicode 17 emoji cmap mappings are removed so the system emoji font is used instead of
  the font's monochrome glyphs. Digits and math characters stay. cmap 4/12/13 are read
  and rewritten as Unicode 12; format 14 variation sequences are not kept, so fonts that
  rely on CJK IVS need extra checking.
- KaTeX math renders in a WebView with its own math fonts, which are left unchanged.
  Text drawn inside images or SVGs is not affected.
- Changing fonts recreates Activities rather than updating every Compose state in place;
  selection and focus restore while editing still need checking in the app.
- Supported files: a single TTF or OTF up to 32 MB. TTC, WOFF and WOFF2 are rejected.

## Source layout

- `CustomFontPatch.kt`, `Compatibility.kt`: the Morphe patch and structural matching.
- `patches/src/anytype/java/app/font/extension/anytype/`: the Android runtime.
- `patches/framework-runtimes.gradle.kts`: wires the framework-only runtime DEX into the
  full `.mpp` build.
- `scripts/anytype/`: real-APK smoke test, SFNT unit checks and the separate Android test app.

The shared `extensions/extension.mpe` is not injected. Only this dedicated runtime is
bundled, so another app's library cannot shadow Anytype classes with the same names.
