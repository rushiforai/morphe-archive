# Morphe Patches & Zank Remote Reverse Engineering Knowledge Base

> **Purpose:** This document is an exhaustive, production-tested reference for any developer or AI coding agent working on Morphe patch repositories, specifically for **Zank Remote** (`zank.remote`). It contains every architectural insight, reverse-engineering finding, and hard-earned troubleshooting fix discovered during the creation of the patch bundle.

---

## 1. Morphe Architecture & Patcher Concepts

Morphe decouples patch definitions from the Morphe Manager client. Patches are written in Kotlin using the `morphe-patcher` library, compiled into a Dalvik DEX package (`.mpp`), and distributed via GitHub Releases alongside a `patches-list.json` manifest.

### Key Components
- **`app.morphe.patcher.patch.patch`**: DSL function to declare patch metadata, target compatibility, and execution logic.
- **`Fingerprint`**: Resolves target classes and methods without relying on fragile, obfuscated class names. Uses opcode sequences, method signatures, parameter types, and string constants.
- **Instruction Extensions (`app.morphe.patcher.extensions.InstructionExtensions`)**:
  - `addInstructions(index, smali)`: Injects instructions at a specific index (e.g., prepending `return-void` at index 0).
  - `replaceInstructions(index, smali)`: Overwrites existing method instructions.
- **Patch Bundle Artifact (`.mpp`)**: A zip/jar container containing compiled Dalvik bytecode and metadata that Morphe Manager (or Morphe Desktop) applies to target APKs.

---

## 2. Zank Remote (`zank.remote`) Internal Architecture

Dissected from Zank Remote v21.0.7 (Build 153).

### Target Package & Format
- **Package Name:** `zank.remote`
- **Application Class:** Inherits from `Lzank/remote/MyApp;`, wrapped at runtime by PairIP's `Lcom/pairip/application/Application;`.
- **Target SDK:** 36 (Android 16), Min SDK: 29 (Android 10).

---

### Patch 1: PairIP Google Play Integrity Bypass (`DisableSignatureCheckPatch.kt`)
- **Problem**: Zank Remote is protected with Google Play's PairIP license validation. Modifying or sideloading the APK causes `com.pairip.licensecheck.LicenseClient` to detect signature tampering and force the user to the Play Store or terminate the process.
- **Target Class**: `Lcom/pairip/licensecheck/LicenseClient;`
- **Target Method**: `public static checkLicense(Landroid/content/Context;)V`
- **Disassembled Smali**:
  ```smali
  .method public static checkLicense(Landroid/content/Context;)V
      .locals 2
      const-string v0, "LicenseClient"
      if-nez p0, :cond_0
      const-string p0, "Cannot check license with null context."
      invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
      return-void
      ...
  ```
- **Fingerprint**:
  ```kotlin
  internal object LicenseCheckFingerprint : Fingerprint(
      definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
      name = "checkLicense",
      returnType = "V",
      filters = listOf(
          string("Cannot check license with null context.")
      )
  )
  ```
- **Patch Transformation**:
  Inject `return-void` at index 0. The method exits immediately before initiating background threads or contacting Play licensing services.

---

### Patch 2: Pro & Premium Feature Unlock (`UnlockProPatch.kt`)
- **Problem**: Features like Air Mouse mode (`airMouseMode`), Floating Remote (`floatMode`), and ad suppression check subscription status.
- **Root Mechanism**:
  Zank Remote stores subscription state in SharedPreferences under key `"remote1"`.
  The central gatekeeper is `Lzank/remote/MyApp;->d()Z`:
  ```smali
  .method public static d()Z
      .locals 3
      sget-object v0, Lzank/remote/MyApp;->f:Landroid/content/SharedPreferences;
      const-string v1, "remote1"
      const/4 v2, 0x0
      invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
      move-result v0
      return v0
  .end method
  ```
- **Auxiliary Checks (`"remote2"`)**:
  In `MainActivity` and `jq0`, secondary checks for `"remote2"` gate Air Mouse and Floating Remote. However, all these checks start with:
  ```smali
  invoke-static {}, Lzank/remote/MyApp;->d()Z
  move-result v1
  if-nez v1, :cond_1
  // only checks "remote2" if MyApp.d() returns false!
  ```
  **Critical Finding:** Making `MyApp.d()Z` return `true` natively satisfies all Pro checks across the entire app without needing to touch obfuscated classes like `jq0`!
- **Fingerprint**:
  ```kotlin
  internal object IsProFingerprint : Fingerprint(
      definingClass = "Lzank/remote/MyApp;",
      name = "d",
      returnType = "Z",
      filters = listOf(
          string("remote1")
      )
  )
  ```
- **Patch Transformation**:
  ```smali
  const/4 v0, 0x1
  return v0
  ```

---

### Patch 3: Ad Removal (`RemoveAdsPatch.kt`)
- **Problem**: Interstitial and App Open ads are managed by `Lzank/remote/AppOpenManager;`.
- **Target Method**: `public final d(Z)Z` in `Lzank/remote/AppOpenManager;`.
  This method checks the time delta since the last ad, compares it to SharedPreferences key `"OpenAdsLimit"`, logs `"showAdOpen"`, and inflates ad containers.
- **Fingerprint**:
  ```kotlin
  internal object AppOpenManagerShowAdFingerprint : Fingerprint(
      definingClass = "Lzank/remote/AppOpenManager;",
      name = "d",
      returnType = "Z",
      filters = listOf(
          string("OpenAdsLimit"),
          string("showAdOpen")
      )
  )
  ```
- **Patch Transformation**:
  ```smali
  const/4 v0, 0x0
  return v0
  ```

---

## 3. Critical Gotchas & Troubleshooting Solutions

### 1. GitHub Packages Maven Authentication (401 Unauthorized)
- **The Issue**:
  The Gradle plugin `app.morphe.patches` is hosted on `https://maven.pkg.github.com/MorpheApp/registry`.
  Running `./gradlew` locally fails with `HTTP Error 401: Unauthorized` if you don't have a Personal Access Token with the `read:packages` scope. Standard tokens with only `repo` or `read:org` will be rejected.
- **The Solution**:
  - In **GitHub Actions**, `secrets.GITHUB_TOKEN` automatically receives package read/write permissions.
  - For **Local Development**, generate a GitHub PAT with `read:packages` and export:
    ```bash
    export GITHUB_ACTOR="<your-github-username>"
    export GITHUB_TOKEN="<your-pat-with-read:packages>"
    ```

---

### 2. Pushing Workflow Files over HTTPS (OAuth Scope Error)
- **The Issue**:
  Pushing to GitHub via HTTPS using `gh auth token` or credential helper fails with:
  ```
  refusing to allow an OAuth App to create or update workflow .github/workflows/... without workflow scope
  ```
- **The Solution**:
  Always use SSH for repository remotes when pushing GitHub Actions workflows:
  ```bash
  git remote set-url origin git@github.com:<username>/<repo>.git
  git push -u origin dev
  ```
  SSH keys are not restricted by OAuth App token scopes.

---

### 3. Automated README Generation Failure in CI
- **The Issue**:
  The semantic-release pipeline runs `.github/scripts/generate_patches_readme.py`. If `README.md` is missing the exact HTML marker comments, the script crashes and fails the release job with:
  ```
  Markers <!-- PATCHES_START [EXPANDED] --> / <!-- PATCHES_END --> not found in README.md. Printed to stdout instead.
  ```
- **The Solution**:
  Ensure `README.md` contains the required marker block:
  ```markdown
  ## 🩹 Patches list

  <!-- PATCHES_START EXPANDED -->

  #### A list of your patches will automatically be shown here after your first patches release is created.

  <!-- PATCHES_END -->
  ```
  The release workflow automatically replaces the content between these tags with the generated markdown table of patches.

---

### 4. Semantic-Release Branching & Backmerge Conflicts
- **The Issue**:
  `.releaserc` is configured to publish stable releases on `main` and pre-releases on `dev`. It uses `@cleyrop-org/semantic-release-backmerge` to rebase `main` into `dev` after a release.
  If you push different commits to both `dev` and `main` simultaneously, both run release jobs independently, generating conflicting release commits (`chore: Release v1.0.0` vs `chore: Release v1.0.0-dev.1`).
- **The Solution**:
  - Always commit and push feature changes to **`dev`** first.
  - When ready for a stable release, merge `dev` into `main` (`git checkout main && git merge dev && git push origin main`). Do not create divergent commits on `main`.

---

## 4. Playbook: Updating for a New Zank Remote Version

When a new version of Zank Remote is released (e.g., `21.0.8` or `22.0.0`):

### Step 1: Obtain and Disassemble the New APK
```bash
# Extract base APK
unzip -q zank.remote_<new_version>.apkm base.apk -d /tmp/new_zank
# Disassemble smali
apktool d -r -f /tmp/new_zank/base.apk -o /tmp/new_zank/smali_out
```

### Step 2: Verify Fingerprint Anchors Still Exist
```bash
# Verify LicenseClient
grep -rn "Cannot check license with null context." /tmp/new_zank/smali_out/

# Verify MyApp.d()
grep -rn '"remote1"' /tmp/new_zank/smali_out/

# Verify AppOpenManager
grep -rn '"OpenAdsLimit"' /tmp/new_zank/smali_out/
```
If the methods are unchanged, proceed directly. If method signatures changed, update `Fingerprints.kt`.

### Step 3: Update `Constants.kt`
Add the new version to `COMPATIBILITY_ZANK_REMOTE` in `patches/src/main/kotlin/com/morphe/patches/zankremote/Constants.kt`:
```kotlin
val COMPATIBILITY_ZANK_REMOTE = Compatibility(
    name = "Zank Remote",
    packageName = "zank.remote",
    apkFileType = ApkFileType.APK,
    targets = listOf(
        AppTarget(
            version = "21.0.8", // Add new version here
            minSdk = 29
        ),
        AppTarget(
            version = "21.0.7",
            minSdk = 29
        )
    )
)
```

### Step 4: Commit and Push (Semantic Commit)
```bash
git checkout dev
git add patches/src/main/kotlin/com/morphe/patches/zankremote/Constants.kt
git commit -m "feat: add support for zank remote 21.0.8"
git push origin dev
```
GitHub Actions will automatically build the `.mpp` package and publish the release.

---

## 5. Submission & Indexing Pointers

- **Direct Morphe Manager Link**:
  `https://morphe.software/add-source?github=yogeshchavan-jd/zank-remote-morphe-patches`
- **Morphe Patches Directory**:
  Visit [https://morphe-patches.software](https://morphe-patches.software) and click **Submit a bundle**.
  Submit `https://github.com/yogeshchavan-jd/zank-remote-morphe-patches`.
