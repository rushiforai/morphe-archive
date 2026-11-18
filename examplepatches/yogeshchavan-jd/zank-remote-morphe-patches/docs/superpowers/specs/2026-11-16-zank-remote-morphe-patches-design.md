# Design Document: Morphe Patches for Zank Remote (`zank.remote`)

- **Date:** 2026-11-16
- **Status:** Ready for Review
- **Target App:** Zank Remote (`zank.remote`), Version 21.0.7 (vcode 153)+

---

## 1. Intent and Why

The goal is to create, build, and publish an open-source patch bundle for the Android / Android TV application **Zank Remote** within the **Morphe** patch ecosystem. Once published to GitHub with automated semantic release workflows, the patch bundle will be submitted to [morphe-patches.software](https://morphe-patches.software), allowing Morphe Manager users to import the source repository and patch Zank Remote on-device with granular feature selection.

---

## 2. Goals, Non-Goals, and Anti-Goals

### Goals
- Create a standalone Gradle-based patch repository based on `MorpheApp/morphe-patches-template` (branch `dev`).
- Implement modular, fingerprint-resilient patches in Kotlin using `app.morphe.patcher`:
  1. **Disable PairIP License Checks**: Neutralize Google Play integrity and signature verification (`com.pairip.licensecheck.LicenseClient`) so patched APKs run without crashing or forcing Play Store verification.
  2. **Unlock Pro & Premium Features**: Enable Pro mode (`MyApp.d()` returning true) which natively satisfies all feature gates across the app (including Air Mouse mode and Floating Remote window) without touching obfuscated classes.
  3. **Remove Ads**: Suppress app-open / interstitial ad loading in `AppOpenManager` and remove banner containers (`id/adLayout`).
- Provide continuous integration and automated semantic release pipelines via GitHub Actions (`.github/workflows/release.yml`) producing standard `.mpp` patch packages and `patches-list.json`.
- Provide automated release signing via `./gradlew generateSigningKey` with guidance for the `MORPHE_SIGNING_KEY` secret.
- Provide complete indexing and integration instructions for `morphe-patches.software` and Morphe Manager deep links (`add-source`).

### Non-Goals
- Modifying core networking protocols of Zank Remote (e.g., changing ADB pairing, FireTV/AndroidTV protobuf communication).
- Repacking and hosting pirated APK binaries (distribution is strictly DEX bytecode patches via `.mpp` files according to Morphe guidelines).

### Anti-Goals
- Monolithic uncustomizable patches: avoid combining unrelated patches together without user toggle options in Morphe Manager.
- Hardcoded absolute instruction offsets or targeting transient R8-obfuscated classes (e.g., `jq0`) that break on app updates. All hooks target stable anchor classes (`MyApp`, `LicenseClient`, `AppOpenManager`).
- Unnecessary auxiliary extension DEX runtimes: all patches are designed as pure, self-contained bytecode transformations.

---

## 3. Constraints

- **Language / Runtime**: Kotlin 1.9+ with Java 21 LTS toolchain.
- **Framework**: `app.morphe:morphe-patcher` Kotlin DSL.
- **Release Strategy**: Automated semantic releases via `.releaserc` and GitHub Actions triggered by Conventional Commits (`feat:`, `fix:`). Releases must never be created manually.
- **Morphe Manager Compatibility**: The repository must produce `patches-<version>.mpp`, `patches-list.json`, and `patches-bundle.json` conforming to Morphe bundle specification.

---

## 4. Approaches Considered

### Approach 1: Modular Patches (Chosen)
- Deconstruct the functionality into 3 distinct patches:
  1. `DisableSignatureCheckPatch`: Targets PairIP license validation.
  2. `UnlockProPatch`: Targets Pro feature flags (`MyApp.d()`).
  3. `RemoveAdsPatch`: Targets ad display logic and `AppOpenManager`.
- **Pros**: Follows Morphe's modular design philosophy, allowing users in Morphe Manager Expert Mode to toggle specific patches while maintaining sensible defaults in Simple Mode.
- **Cons**: Requires defining 3 patch specifications and fingerprint sets instead of one.

### Approach 2: Monolithic Single "All-in-One" Patch
- A single patch that applies all changes together.
- **Pros**: Slightly fewer files in the repository.
- **Cons**: Violates Morphe community conventions; users cannot disable ad blocking if it conflicts with specific OEM TV launchers, nor can they toggle Pro features independently.

**Decision**: Approach 1 is selected.

---

## 5. Architectural & Technical Specifications

### 5.1 Repository Layout
```
zank-remote-morphe-patches/
├── .github/
│   └── workflows/
│       ├── build.yml
│       └── release.yml
├── patches/
│   ├── build.gradle.kts
│   └── src/
│       └── main/
│           └── kotlin/
│               └── com/
│                   └── morphe/
│                       └── patches/
│                           └── zankremote/
│                               ├── Constants.kt
│                               ├── Fingerprints.kt
│                               ├── LicenseCheckPatch.kt
│                               ├── UnlockProPatch.kt
│                               └── RemoveAdsPatch.kt
├── gradle/
│   └── wrapper/
├── build.gradle.kts
├── settings.gradle.kts
├── gradle.properties
├── package.json
├── .releaserc
└── README.md
```

### 5.2 Patch Implementations (Pure Smali Transformations)

#### Target Compatibility Definition (`Constants.kt`)
```kotlin
package com.morphe.patches.zankremote

import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_ZANK_REMOTE = Compatibility(
    name = "Zank Remote",
    packageName = "zank.remote"
)
```

#### 1. `DisableSignatureCheckPatch`
- **Target**: `com.pairip.licensecheck.LicenseClient->checkLicense(Landroid/content/Context;)V`
- **Mechanism**: Fingerprints `checkLicense` by string literal `"Cannot check license with null context."` or `"LicenseClient"`.
- **Transformation**: Prepends `return-void` at index 0, neutralizing PairIP verification before background threads or network validation trigger.

#### 2. `UnlockProPatch`
- **Target**: `Lzank/remote/MyApp;->d()Z`
- **Discovery**: In the bytecode, `MyApp.d()` checks `"remote1"` (Pro status). When `MyApp.d()` returns `true`, callers in `MainActivity` and remote dialog handlers skip auxiliary `"remote2"` checks and immediately grant Air Mouse mode and Floating Remote access.
- **Transformation**: Replaces method body with:
  ```smali
  const/4 v0, 0x1
  return v0
  ```

#### 3. `RemoveAdsPatch`
- **Target 1**: `Lzank/remote/AppOpenManager;`
  - **Mechanism**: Fingerprints `AppOpenManager` methods handling ad requests and inserts early `return-void`.
- **Target 2**: `Lzank/remote/MainActivity;` layout initialization
  - **Mechanism**: Locates resource `0x7f090044` (`id/adLayout`) in `onCreate` and ensures visibility is set to `View.GONE` (8) or suppresses the view inflation.

---

## 6. Build, Release & Publishing Pipeline

1. **Local Build**:
   ```bash
   ./gradlew buildAndroid
   ```
   Generates `patches/build/libs/patches-<version>.mpp` and `patches-list.json`.

2. **Signing Key Setup**:
   ```bash
   ./gradlew generateSigningKey
   ```
   Generates `morphe-signing.pub` (committed) and `morphe-signing.key` (added as secret `MORPHE_SIGNING_KEY` on GitHub).

3. **GitHub Actions Semantic Release**:
   - Commits with `feat:` trigger minor version bumps (`v1.1.0`).
   - Commits with `fix:` trigger patch version bumps (`v1.0.1`).
   - Generates release artifacts, updates `patches-list.json`, and attaches `.mpp` to GitHub Releases.

4. **Submitting to `morphe-patches.software`**:
   - Provide public repo URL: `https://github.com/<username>/zank-remote-morphe-patches`.
   - Direct import URL for Morphe Manager:
     ```
     https://morphe.software/add-source?github=<username>/zank-remote-morphe-patches
     ```

---

## 7. What Is Left to the Builder

- Creating the repository files from `MorpheApp/morphe-patches-template`.
- Writing the Kotlin patch definitions in `patches/src/main/kotlin/com/morphe/patches/zankremote/`.
- Verifying the build and testing with `./gradlew buildAndroid`.
- Initializing git on `dev` branch with initial semantic commit.
