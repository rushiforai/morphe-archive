# Bare webpage fonts

ARM64 port of the Brave webpage-font engine for `org.barebrowser`
(Bare 1.0.0, Chromium `156.0.8078.25`). Bare is a Chromium fork with the same
Java seams and `FontFallbackIterator::Next()` shape as Brave, so this directory
mirrors `../../brave/font` with Bare's package, settings key and extension classes.

Morphe entries:

- **Bare custom webpage fonts**: native rendering hooks and FD transport.
- **Bare font picker in settings**: Appearance > Custom font (last entry);
  includes the rendering patch as a dependency.

Java runtime: `extensions/extension/src/main/java/app/fontism/extension/bare`.
Native engine: the shared source in `native/brave/font`, built with Bare's JNI
class and log tag:

```sh
sh native/brave/font/build-arm64.sh bare
./gradlew buildAndroid
```

Static checks on Bare 1.0.0: the Brave locator (`scripts/brave/NativeLocatorCheck.c`)
finds exactly one candidate (stage field 24, system stage 4); every patch applies
and the rewritten dex verifies. Rendering still has to be confirmed on a device
(`adb logcat -s BareFontNative`).
