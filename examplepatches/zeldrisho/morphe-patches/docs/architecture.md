# Architecture

Gradle builds a patch bundle (`.mpp`) that Morphe Desktop or Manager applies to an Android app.

| Path | Purpose |
| --- | --- |
| `patches/src/main/kotlin/app/template/patches/` | Patch definitions, fingerprints and shared helpers, grouped by target app and concern. |
| `patches/src/main/kotlin/app/template/patches/shared/Constants.kt` | Compatibility declarations and target versions. |
| `extensions/extension/src/main/java/` | Runtime code injected into patched apps. Keep app-specific classes separate. |
| `extensions/extension/build.gradle.kts` | Extension artifact name; it must match patch `extendWith(...)` paths. |
| `patches/src/main/kotlin/util/PatchListGenerator.kt` | Release patch-list generator. |
| `scripts/` | Local APK inspection and reverse-engineering helpers; see [recon](recon.md). |
| `.github/workflows/release.yml`, `.releaserc` | Semantic-release workflow and configuration; the same workflow compiles the bundle when no release is published. |
| `.github/workflows/codeql.yml` | Weekly and pull-request CodeQL analysis for Kotlin, Python and workflow files. |
| `.github/workflows/open_pull_request.yml` | Opens the `dev` to `main` pull request for the next stable release. |

A patch can modify bytecode, decoded resources or raw files. Runtime extension calls use Dalvik class descriptors and method signatures; changing a Java class or method requires updating its injection sites. Compatibility is declared per target and must not imply that an unverified app version has been tested.

Gson is supplied separately to the patch-list generator, not bundled into the patch runtime. For the patcher API, see [Morphe's documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/README.md).
