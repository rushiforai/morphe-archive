# Architecture

Personal Morphe patch bundle: small, reviewable bytecode patches that unlock
features or strip ads, distributed as a versioned `.mpp` bundle.

Goals: stable fingerprints (SDK calls, strings, and opcodes where possible),
one concern per patch, everything reproducible from `./gradlew buildAndroid`.
Non-goal: server-side bypasses — client-side only (see
[patch development](patch-development.md#known-limitations-set-expectations-in-patch-descriptions)).

## Modules

| Module | Entry | Output |
| ------ | ----- | ------ |
| `patches` | `patches/build.gradle.kts`, `patches/src/main/kotlin/com/zeldrisho/patches/` | `patches/build/libs/patches-*.mpp` |
| `extensions/threads` | `extensions/threads/build.gradle.kts`, `extensions/threads/src/main/java/` | embedded `extensions/extension.mpe` via `extendWith` |
| `extensions/zalo` | `extensions/zalo/build.gradle.kts`, `extensions/zalo/src/main/java/` | embedded `extensions/zalo.mpe` via `extendWith` |

Plugin `app.morphe.patches` (see `settings.gradle.kts`, `gradle/libs.versions.toml`) builds all extension modules.

## Patch sources (multi-app)

```
patches/src/main/kotlin/com/zeldrisho/patches/
├── shared/
│   ├── bytecode/MethodExtensions.kt  # clearBody/ensureRegisters (all apps)
│   └── resources/AdIdStrip.kt        # AD_ID manifest helper (all apps)
├── threads/shared/Constants.kt       # Threads compatibility only
├── threads/ads/                      # Hide ads (+ feed helpers)
├── threads/misc/{analytics,branding,packagename}/
├── zalo/shared/Constants.kt          # Zalo compatibility only
└── zalo/{ads,notif}/
```

App-specific compatibility lives with its app; only truly app-agnostic
bytecode/resource helpers live in `shared/`. Tests mirror production packages;
bundle-wide guards live in `com.zeldrisho.patches.bundle`.

## Patch flow (APK to device)

```
original APK ──▶ jadx + apktool ──▶ target (class + method + instruction seq)
   (in-repo analysis/, gitignored)         smali is source of truth, never jadx alone
                                           │
                 Fingerprint (named object)
               + bytecodePatch { execute { ... } }  (.kt sources, per-app folders)
                                           │ ./gradlew buildAndroid
                                           ▼
                 patches-*.mpp ──▶ Morphe ──▶ patched APK ──▶ adb install
```

## Extension artifact wiring

The Morphe Gradle plugin publishes each extension module's `build/morphe`
directory and consumes them as `patches` resources, so the built `.mpp` embeds
both extension artifacts. `extendWith(...)` loads an artifact through the bundle
classloader (`ClassLoader.getResourceAsStream`), not from a repo-relative
filesystem path. `:patches:verifyBundleExtension` (which runs `buildAndroid`) is
the authoritative signal that both embedded dex artifacts are present.
`:patches:checkExtensionArtifact` is a lightweight pre-check that runs before
`buildAndroid` and fails in seconds when an extension module produced no
artifact. Never commit analysis work (see `scripts/clean-analysis.sh`).

## Extension scoping

Each extension module is deliberately scoped to one target app:
`:extensions:threads` contains `com.zeldrisho.threads.extension`, while
`:extensions:zalo` contains `com.zeldrisho.zalo.extension`. Shared runtime
helpers belong in a separate `extensions/shared` module only when they are
truly app-agnostic; target-specific code must not be shared across modules.

Authoring rules for fingerprints, patches, and extensions live in
[fingerprint guide](fingerprint-guide.md) and
[patch development](patch-development.md#extensions-vs-inline-smali).
Version-pinning policy lives in
[patch development](patch-development.md#file-layout);
the per-update routine lives in the [QA checklist](qa-checklist.md#version-bump-new-threads-release).

## Generated data flow

`./gradlew generatePatchesList` runs `util/PatchListGenerator.kt`, which loads the
`.mpp` and writes `patches-list.json`.
For release-owned metadata updates, see [staging](release.md#staging-a-release)
and the [release workflow](release.md#what-releaseyml-does).

`patches-list.json` groups by `compatiblePackages[].packageName`; entries with null compatibility are universal.
Generated-file ownership and the release pipeline live in the [release process](release.md).
