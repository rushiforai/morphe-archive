# Architecture

Personal Morphe patch bundle: small, reviewable bytecode patches that unlock
features or strip ads, distributed as a versioned `.mpp` bundle.

Goals: fingerprints that survive app updates (SDK anchors, never obfuscated
names), one concern per patch, everything reproducible from
`./gradlew buildAndroid`. Non-goal: server-side bypasses — client-side only
(see `patch-development.md` § Known limitations).

## Modules

| Module | Entry | Output |
| ------ | ----- | ------ |
| `patches` | `patches/build.gradle.kts`, `patches/src/main/kotlin/` | `patches/build/libs/patches-*.mpp` |
| `extensions/extension` | `extensions/extension/build.gradle.kts`, `extensions/extension/src/main/java/` | `extensions/extension.mpe`, embedded via `extendWith` |

Plugin `app.morphe.patches` (see `settings.gradle.kts`, `gradle/libs.versions.toml`) builds both.
`patchListGeneratorClasspath` keeps `gson` available to the generator without bundling it.

## Patch flow (APK → device)

```
original APK ──▶ jadx + baksmali ──▶ target (class + method + instruction seq)
   (analysis/, outside repo)            smali is source of truth, never jadx alone
                                           │
                 Fingerprint (named object: SDK/string/opcode anchors)
               + bytecodePatch { execute { ... } }  (.kt sources, per-app folders)
                                           │ ./gradlew buildAndroid
                                           ▼
                 patches-*.mpp ──▶ Morphe Desktop ──▶ patched APK ──▶ adb install
```

## Decisions

- **`bytecodePatch` first.** No resource decoding → fastest builds and smallest
  match surface. `resourcePatch` only for manifest/`res/values` gates
  (see `patch-development.md` § Patch types).
- **Fingerprints beside patches, per-app folders.** A folder is self-contained:
  `Fingerprints.kt` + `*Patch.kt`. Shared targets live in `shared/Constants.kt`.
- **Named `Fingerprint` objects, SDK-anchored.** Match failures print the name;
  anchors are SDK calls/strings/opcodes because R8 renames everything else
  (see `fingerprint-guide.md`, `bytecode-reference.md`).
- **Inline smali vs extension split.** Trivial overrides stay inline; anything
  needing settings, branching, or Android APIs goes in the Java extension and is
  called via one `invoke-static` (see `patch-development.md` § Extensions).
- **Exact `AppTarget` versions over `version = null`.** Fingerprints drift with app
  updates; pinning versions makes staleness explicit instead of silently matching
  the wrong code.
- **Analysis stays out of the repo.** Only `.kt` sources live here; per-app
  `apk/`, `decompiled/`, `smali/`, `notes/` live in a sibling `analysis/` folder.

## Patch anatomy

- `ads/HideAdsPatch.kt` (Threads): user-visible `bytecodePatch` with `compatibleWith(...)`, `extendWith(...)`, `execute { ... }` — the reference example in this repo.
- `ads/Fingerprints.kt` pattern: named `Fingerprint` objects (class, method, access flags, return type, parameters, instruction filters) kept beside the patch; Threads inlines its single-method fingerprint as a private object at the bottom of `HideAdsPatch.kt`.
- Unnamed `bytecodePatch` (no `name`) stays hidden from Manager/CLI and is wired in via `dependsOn(...)`.
- `shared/Constants.kt`: `Compatibility` records (package name, `ApkFileType`, icon color, `AppTarget` versions, optional `versionCodes` per `SupportedAbi`).

## Generated data flow

1. `./gradlew generatePatchesList` runs `util/PatchListGenerator.kt`, which loads the `.mpp` and writes `patches-list.json`.
2. Release (`exec` step in `.releaserc`) stamps `version`, then runs `.github/scripts/generate_patches_readme.py` to inject the patch table into `README.md` between `PATCHES_START` / `PATCHES_END`.
3. `patches-bundle.json` is written by the `@MorpheApp/changelog` plugin with the release download URL.

`patches-list.json` groups by `compatiblePackages[].packageName`; entries with null compatibility are universal.
