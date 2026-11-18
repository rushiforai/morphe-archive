# Development

## Prerequisites

JDK 21, an Android SDK location with accepted licenses, the checked-in Gradle wrapper, Node.js LTS, and pnpm. `ANDROID_HOME` must name an existing directory; once the relevant SDK licenses are accepted, Android Gradle Plugin can download missing platform and build-tools packages. The Gradle wrapper downloads Gradle, not license acceptance. CI uses the latest Node.js LTS and latest pnpm. The Morphe plugin resolves from GitHub Packages with credentials configured in `~/.gradle/gradle.properties` as unquoted `gpr.user` and `gpr.key`; never commit them.

## Build and validate

```bash
pnpm install --frozen-lockfile
./gradlew :patches:buildAndroid --no-daemon
morphe --help
morphe list-patches --patches patches/build/libs/patches-<version>.mpp --with-packages --with-versions
```

The bundle is written to `patches/build/libs/`. Follow [testing and qualification](testing.md) before claiming app compatibility. A successful build does not prove that patches apply or work on a device. See [bytecode](recon.md#bytecode-and-fingerprinting), the [target evidence template](template.md), and [Zalo microG Drive support](zalo.md#google-drive-and-microg-re) for patch development.

## Architecture

Gradle builds a patch bundle (`.mpp`) that Morphe Desktop or Manager applies to an Android app.

| Path | Purpose |
| --- | --- |
| `patches/src/main/kotlin/app/zeldrisho/patches/` | Patch definitions, fingerprints and shared helpers, grouped by target app and concern. |
| `patches/src/main/kotlin/app/zeldrisho/patches/shared/Constants.kt` | Compatibility declarations and target versions. |
| `extensions/extension/src/main/java/` | Runtime code injected into patched apps. Keep app-specific classes separate. |
| `extensions/extension/build.gradle.kts` | Extension artifact name; it must match patch `extendWith(...)` paths. |
| `patches/src/main/kotlin/util/PatchListGenerator.kt` | Release patch-list generator. |
| `scripts/` | Local APK inspection and reverse-engineering helpers; see [recon](recon.md). |
| `.github/workflows/release.yml`, `.releaserc` | Semantic-release workflow and configuration; the same workflow compiles the bundle when no release is published. |
| `.github/workflows/codeql.yml` | Weekly and pull-request CodeQL analysis for Kotlin, Python and workflow files. |
| `.github/workflows/open_pull_request.yml` | Opens the `dev` to `main` pull request for the next stable release. |

A patch can modify bytecode, decoded resources or raw files. Runtime extension calls use Dalvik class descriptors and method signatures; changing a Java class or method requires updating its injection sites. Compatibility is declared per target and must not imply that an unverified app version has been tested.

Gson is supplied separately to the patch-list generator, not bundled into the patch runtime. For the patcher API, see [Morphe's documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/README.md).

## Branches and releases

Fetch before implementing, fast-forward `dev` when possible, and inspect divergence instead of creating unnecessary merge commits. Develop on `dev` using semantic commits. See [releases](releasing.md) for branch conventions, generated files and publication.

## References

- [Morphe development setup](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md)
- [Patcher documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/README.md)
- [Morphe Desktop CLI](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md)
