# Development

## Prerequisites

JDK 21, an Android SDK with accepted licenses, the checked-in Gradle wrapper, and Vite+ with `vp` on `PATH`. The Morphe plugin resolves from GitHub Packages with the credentials already configured in `~/.gradle/gradle.properties` as unquoted `gpr.user` and `gpr.key`; never commit them.

## Build and validate

```bash
vp install --frozen-lockfile
./gradlew :patches:buildAndroid --no-daemon
morphe --help
morphe list-patches --patches patches/build/libs/patches-<version>.mpp --with-packages --with-versions
```

The bundle is written to `patches/build/libs/`. Follow [testing and qualification](testing.md) before claiming app compatibility. A successful build does not prove that patches apply or work on a device. See [architecture](architecture.md), [bytecode](bytecode.md), the [target evidence template](template.md), and [Zalo microG Drive support](microg.md) for patch development.

## Branches and releases

Develop on `dev` using semantic commits. See [releases](releasing.md) for branch conventions, generated files and publication.

## References

- [Morphe development setup](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md)
- [Patcher documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/README.md)
- [Morphe Desktop CLI](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md)
