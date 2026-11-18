# Zank Remote Morphe Patches Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create, build, and publish an open-source Morphe patch repository for Zank Remote (`zank.remote`), delivering three modular bytecode patches (`DisableSignatureCheckPatch`, `UnlockProPatch`, and `RemoveAdsPatch`), automated CI/CD releases producing `.mpp` patch bundles, and submission setup for `morphe-patches.software`.

**Architecture:** Kotlin Gradle project structured via `MorpheApp/morphe-patches-template` utilizing `app.morphe.patcher`. Patches operate via pure Dalvik bytecode transformations (dexlib2 instructions) targeting stable anchor classes (`LicenseClient`, `MyApp`, `AppOpenManager`). Automated semantic-release via GitHub Actions packages `.mpp` bundles and updates `patches-list.json`.

**Tech Stack:** Kotlin 1.9+, Java 21 LTS, Gradle 8+, `app.morphe:morphe-patcher:2.4.0`, smali/dexlib2, GitHub Actions, Semantic Release.

**Spec:** `/home/ubuntu/zenkremote/docs/superpowers/specs/2026-11-16-zank-remote-morphe-patches-design.md`

## Global Constraints

- **Language / Runtime**: Kotlin with OpenJDK 21 LTS toolchain.
- **Framework**: `app.morphe:morphe-patcher` Kotlin DSL (pure bytecode patches, no extra DEX extension runtime needed).
- **Branching & Commits**: Conventional Commits (`feat:`, `fix:`, `chore:`) on branch `dev`.
- **Target App**: Zank Remote (`zank.remote`), Version 21.0.7 (vcode 153)+.
- **Publishing Format**: Standard Morphe `.mpp` bundle, `patches-list.json`, and `patches-bundle.json`.

## Review Focus

1. **GitHub Packages Maven Auth**: `app.morphe.patches` plugin resides on GitHub Packages (`maven.pkg.github.com/MorpheApp/registry`). Local builds must resolve dependencies gracefully using standard GitHub credentials or public fallbacks.
2. **PairIP License Check Neutralization**: `LicenseClient.checkLicense` must inject `return-void` cleanly without leaving orphaned registers or invalid stack frames.
3. **Pro Flag Bytecode Replacement**: `MyApp.d()Z` must replace the SharedPreferences lookup with a clean `const/4 v0, 0x1` + `return v0`.
4. **Ad View Null Safety**: `id/adLayout` (`0x7f090044`) may be null on Android TV / Leanback mode; the patch must handle missing views without NullPointerException.
5. **Semantic Release Configuration**: `.releaserc` must point to proper release branches (`dev`, `main`) and export the generated `.mpp` and `patches-list.json` assets to GitHub Releases.

---

### Task 1: Repository Scaffolding & Build Configuration

**Files:**
- Create: `settings.gradle.kts`
- Create: `build.gradle.kts`
- Create: `gradle.properties`
- Create: `gradle/libs.versions.toml`
- Create: `patches/build.gradle.kts`
- Create: `.releaserc`
- Create: `package.json`
- Create: `.github/workflows/release.yml`

**Interfaces:**
- Produces: Working Gradle build environment capable of executing `./gradlew :patches:build` and generating patch metadata.

- [ ] **Step 1: Scaffold root Gradle files and Version Catalog**

Setup `settings.gradle.kts` with GitHub Packages repository and plugin configuration. Setup `gradle/libs.versions.toml` with `morphe-patcher = "2.4.0"` and `gson = "2.15.0"`.

- [ ] **Step 2: Setup patches submodule build script (`patches/build.gradle.kts`)**

Configure `patches` extension with metadata:
- Name: "Zank Remote Patches"
- Description: "Morphe patches for Zank Remote Android & TV controller"
- Package / Group: `com.morphe.patches.zankremote`
- Author: `yogeshchavan-jd`

- [ ] **Step 3: Setup GitHub Actions Release Workflow and `.releaserc`**

Copy and configure `.github/workflows/release.yml` and `.releaserc` to automate semantic releases on push to `dev` and `main`.

- [ ] **Step 4: Verify Gradle wrapper and basic project compilation**

Run: `./gradlew tasks --no-daemon`
Expected: SUCCESS

- [ ] **Step 5: Commit**

```bash
git add .
git commit -m "chore: scaffold morphe patch repository structure and build config"
```

---

### Task 2: Implement Target Compatibility & License Check Bypass Patch

**Files:**
- Create: `patches/src/main/kotlin/com/morphe/patches/zankremote/Constants.kt`
- Create: `patches/src/main/kotlin/com/morphe/patches/zankremote/Fingerprints.kt`
- Create: `patches/src/main/kotlin/com/morphe/patches/zankremote/DisableSignatureCheckPatch.kt`

**Interfaces:**
- Produces:
  - `COMPATIBILITY_ZANK_REMOTE`: Target definition for `zank.remote`.
  - `LicenseCheckFingerprint`: Matches `com/pairip/licensecheck/LicenseClient->checkLicense`.
  - `disableSignatureCheckPatch`: Patch that injects `return-void` at index 0.

- [ ] **Step 1: Define `Constants.kt` with Zank Remote compatibility**

```kotlin
package com.morphe.patches.zankremote

import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_ZANK_REMOTE = Compatibility(
    name = "Zank Remote",
    packageName = "zank.remote"
)
```

- [ ] **Step 2: Define `LicenseCheckFingerprint` in `Fingerprints.kt`**

Target class `Lcom/pairip/licensecheck/LicenseClient;`, method `checkLicense(Landroid/content/Context;)V`. Match string `"Cannot check license with null context."` or opcode pattern.

- [ ] **Step 3: Implement `disableSignatureCheckPatch` in `DisableSignatureCheckPatch.kt`**

Inject `return-void` at index 0 of `checkLicense`:
```kotlin
val disableSignatureCheckPatch = patch(
    name = "Disable signature check",
    description = "Bypasses PairIP Play Integrity and license checks to allow patched APKs to run."
) {
    compatibleWith(COMPATIBILITY_ZANK_REMOTE)
    execute {
        LicenseCheckFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
```

- [ ] **Step 4: Run compilation verification**

Run: `./gradlew :patches:compileKotlin`
Expected: SUCCESS

- [ ] **Step 5: Commit**

```bash
git add patches/src/main/kotlin/com/morphe/patches/zankremote/
git commit -m "feat: add disable signature check patch for pairip license validation"
```

---

### Task 3: Implement Pro & Premium Feature Unlock Patch

**Files:**
- Modify: `patches/src/main/kotlin/com/morphe/patches/zankremote/Fingerprints.kt`
- Create: `patches/src/main/kotlin/com/morphe/patches/zankremote/UnlockProPatch.kt`

**Interfaces:**
- Consumes: `COMPATIBILITY_ZANK_REMOTE`
- Produces: `unlockProPatch`

- [ ] **Step 1: Define `IsProFingerprint` in `Fingerprints.kt`**

Target class `Lzank/remote/MyApp;`, method `d()Z`. Match string `"remote1"`.

- [ ] **Step 2: Implement `unlockProPatch` in `UnlockProPatch.kt`**

Replace method body of `MyApp.d()Z` with `const/4 v0, 0x1` and `return v0`:
```kotlin
val unlockProPatch = patch(
    name = "Unlock Pro",
    description = "Unlocks Pro features including Air Mouse mode and Floating Remote."
) {
    compatibleWith(COMPATIBILITY_ZANK_REMOTE)
    execute {
        IsProFingerprint.method.replaceInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
```

- [ ] **Step 3: Run compilation verification**

Run: `./gradlew :patches:compileKotlin`
Expected: SUCCESS

- [ ] **Step 4: Commit**

```bash
git add patches/src/main/kotlin/com/morphe/patches/zankremote/
git commit -m "feat: add unlock pro patch for zank remote"
```

---

### Task 4: Implement Ad Removal Patch

**Files:**
- Modify: `patches/src/main/kotlin/com/morphe/patches/zankremote/Fingerprints.kt`
- Create: `patches/src/main/kotlin/com/morphe/patches/zankremote/RemoveAdsPatch.kt`

**Interfaces:**
- Consumes: `COMPATIBILITY_ZANK_REMOTE`
- Produces: `removeAdsPatch`

- [ ] **Step 1: Define Ad Fingerprints in `Fingerprints.kt`**

Target `Lzank/remote/AppOpenManager;` (intercept ad show/load) and `MainActivity` ad layout initialization.

- [ ] **Step 2: Implement `removeAdsPatch` in `RemoveAdsPatch.kt`**

Neutralize app open ads by injecting early return in `AppOpenManager` methods and suppress ad view initialization.

- [ ] **Step 3: Run compilation verification**

Run: `./gradlew :patches:compileKotlin`
Expected: SUCCESS

- [ ] **Step 4: Commit**

```bash
git add patches/src/main/kotlin/com/morphe/patches/zankremote/
git commit -m "feat: add remove ads patch for app open and banner ads"
```

---

### Task 5: Build Package Verification, Key Generation & Publishing Setup

**Files:**
- Create: `README.md`
- Create: `patches-bundle.json`
- Create: `morphe-signing.pub` (generated via gradle task)
- Modify: `patches/build.gradle.kts`

**Interfaces:**
- Produces:
  - Compiled `.mpp` patch bundle via `./gradlew buildAndroid`.
  - Generated `patches-list.json` manifest.
  - Setup instructions for `morphe-patches.software` directory submission.

- [ ] **Step 1: Generate signing key for Morphe bundle verification**

Run: `./gradlew generateSigningKey`
Verify: `morphe-signing.pub` is generated in root and `morphe-signing.key` is kept secure.

- [ ] **Step 2: Build the full Android patch bundle (`.mpp`)**

Run: `./gradlew buildAndroid`
Verify: `patches/build/libs/patches-*.mpp` and `patches-list.json` are generated successfully.

- [ ] **Step 3: Test patch bundle against local APK using Morphe Patcher / CLI test harness**

Verify that fingerprints match successfully on `/tmp/zank_untrusted/base.apk`.

- [ ] **Step 4: Write comprehensive `README.md`**

Include:
- Overview of Zank Remote patches.
- "Add to Morphe" deep-link badge: `https://morphe.software/add-source?github=yogeshchavan-jd/zank-remote-morphe-patches`.
- Manual import instructions for Morphe Manager.
- Submission guide for `https://morphe-patches.software`.

- [ ] **Step 5: Commit and prepare release push**

```bash
git add .
git commit -m "docs: add readme, bundle metadata, and publishing guide"
```
