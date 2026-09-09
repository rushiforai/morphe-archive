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
| `patches` | `patches/build.gradle.kts`, `patches/src/main/kotlin/` | `patches/build/libs/patches-*.mpp` |
| `extensions/extension` | `extensions/extension/build.gradle.kts`, `extensions/extension/src/main/java/` | `extensions/extension.mpe`, embedded via `extendWith` |

Plugin `app.morphe.patches` (see `settings.gradle.kts`, `gradle/libs.versions.toml`) builds both.

## Patch flow (APK to device)

```
original APK ──▶ jadx + apktool ──▶ target (class + method + instruction seq)
   (sibling analysis/ dir, outside repo)   smali is source of truth, never jadx alone
                                           │
                 Fingerprint (named object)
               + bytecodePatch { execute { ... } }  (.kt sources, per-app folders)
                                           │ ./gradlew buildAndroid
                                           ▼
                 patches-*.mpp ──▶ Morphe Desktop ──▶ patched APK ──▶ adb install
```

## Extension artifact wiring

`extendWith("extensions/extension.mpe")` resolves relative to the patch
working dir (repo root), but the extension module only emits
`extensions/extension/build/morphe/extensions/extension.mpe`.
`:patches:copyExtensionMpe` bridges the gap automatically and
`:patches:verifyExtensionMpe` fails fast when the dex is missing
(`extendWith` is a load-time reference, so the bundle builds fine without
it — the failure would otherwise surface on-device). `buildAndroid`
depends on both; CI runs the verify step explicitly. The repo-root copy
stays git-ignored. Never commit `extensions/extension.mpe` or analysis work
(see `scripts/clean-analysis.sh`).

Authoring rules for fingerprints, patches, and extensions live in
[fingerprint guide](fingerprint-guide.md) and
[patch development](patch-development.md#extensions-vs-inline-smali).
Version-pinning policy lives in
[patch development](patch-development.md#file-layout);
the per-update routine lives in the [QA checklist](qa-checklist.md#version-bump-new-threads-release).

## Generated data flow

1. `./gradlew generatePatchesList` runs `util/PatchListGenerator.kt`, which loads the `.mpp` and writes `patches-list.json`.
2. Release staging (`scripts/prepare-release.sh`) stamps `version`, then regenerates the `README.md` patch table between `PATCHES_START` / `PATCHES_END`.
3. `patches-bundle.json` is written by `release.yml` after the GitHub release exists, with the release download URL.

`patches-list.json` groups by `compatiblePackages[].packageName`; entries with null compatibility are universal.
Generated-file ownership and the release pipeline live in the [release process](release.md).
