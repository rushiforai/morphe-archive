# Brave webpage fonts

Experimental ARM64 port for `com.brave.browser`, checked against `1.97.57`
(Chromium `155.0.8059.80`). Version matching is unrestricted; structural Java
checks and native runtime validation still apply. Other releases have not
been verified.

Morphe entries:

- **Brave custom webpage fonts**: native rendering hooks and FD transport.
- **Brave font picker in settings**: Appearance > Custom font;
  includes the rendering patch as a dependency. Supports installed-font APKs,
  TTF/OTF/TTC import, searchable previews and a separate restart process.

The internal native dependency is installed automatically. Font files remain
inside Brave's private storage; no separate Fontism app is required.

## Implementation

Patch definitions and structural Java fingerprints live in this directory.
Java runtime components live in
`extensions/extension/src/main/java/app/fontism/extension/brave`.
The independently built native engine is in `native/brave/font`.
The Titanium engine payload and its source paths are not replaced.

The native C source was recovered from historical source changes and its
unmodified build matched the existing 2.3.3 engine byte-for-byte (SHA-256
`bc34ee1b3c29253bc66d32f1e33d72466b6141ee6f9fcb4f1b77fe93107073d4`).
The Brave variant changes JNI binding/log identity and the fallback locator.
Selected-family registration, cmap checks, styles, Han/emoji/PUA handling,
GSUB icon checks and missing-glyph fallback remain the 2.3.3 implementation.

`fallback_locator.h` recognizes the iterator and hint arguments, the stage
field load, three consecutive stage comparisons and their conditional
destinations, the hint-list read in the system stage and the terminal state
store in the first-candidate stage. Register choices, offsets, enum values
and branch targets are decoded, not hard-coded APK addresses. The former
Titanium TLS/canary prologue is not required by Brave's compiler output.

The port routes native-only renderer selection through Chromium's existing
Java service and keeps RELRO private in both producer and consumer paths.
It reuses Chromium's child FD payload and activates after native FD ownership
registration, before renderer startup continues.

Brave Android's support for Titanium's `--load-extension` ligature helper has
not been established. This port does not load that helper; web-icon handling
is provided by the native engine. Logo cases that depended on the helper are
not covered by the static validation.

## Rebuild and checks

From the repository root, build the ARM64 engine with:

```sh
sh native/brave/font/build-arm64.sh        # Brave (default); `bare` builds the Bare variant
./gradlew :patches:buildAndroid
```

The native build uses Android NDK 29.0.13599879 by default and accepts
`ANDROID_NDK_HOME`. ShadowHook 2.0.1's vendored public header retains its
upstream license; linking reuses the existing packaged `libshadowhook.so`.

Host-only locator validation (never executes the ELF):

```sh
clang -O2 scripts/brave/NativeLocatorCheck.c -o /tmp/brave-locator-check
/tmp/brave-locator-check /absolute/path/to/brave/libchrome.so
```

On the inspected APK this found exactly one candidate, with stage field 24
and system stage 4. Breaking the saved hint argument or truncating input was
rejected. Those reported values are test observations, not locator constants.

`scripts/brave/smoke.init.gradle` adds the `:patches:braveSmoke` executable
check. Supply absolute `-Dbrave.apk`, `-Dbrave.out`, and `-Dbrave.sdk` paths.
It applies the picker and dependencies, compiles resources, verifies seven
DEX files and the cross-DEX hierarchy, and checks menu, manifest, native
payload and uncompressed-library metadata. It does not install the APK.
This executable check is not a JUnit suite; if combining list generation
with the smoke init script, exclude `:patches:test` (there are no JUnit tests
in this harness) and run `:patches:braveSmoke` explicitly.

Device rendering, font appearance, ligature behavior and restart behavior
remain to be validated on a patched installation. Static compilation success
is not evidence of successful live native hook activation.
