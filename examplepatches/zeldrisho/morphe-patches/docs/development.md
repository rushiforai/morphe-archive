# Development guide

Use this guide for environment setup and first-time template init.
For writing patches see `patch-development.md`; for finding targets
see `reverse-engineering.md`; for module layout see `architecture.md`.

## Prerequisites

- Java 21 (Temurin, per `.github/workflows/release.yml`).
- Node.js tooling via `vp install` (semantic-release deps in `package.json`).
- GitHub PAT with `read:packages` for the Morphe registry in
  `settings.gradle.kts` (`gpr.user` / `gpr.key` or `GITHUB_ACTOR` / `GITHUB_TOKEN`).
- Morphe Desktop for local `.mpp` testing.

## First-time init

Template init is done (group `com.zeldrisho.threads`, `about` = Zeldris Patches,
`app.template.*` scaffolding removed, extension namespace
`com.zeldrisho.threads.extension`). If re-scaffolding from upstream template, finish:

- `patches/build.gradle.kts`: `group` and `patches { about { ... } }`.
- `patches/src/main/kotlin/app/template/`: rename `app.template.*` packages.
- `patches/src/main/kotlin/app/template/patches/shared/Constants.kt`: real app targets.
- `extensions/extension/build.gradle.kts`: `android { namespace }`.
- `README.md`: title, About, add-source link, License holder.
- `.github/ISSUE_TEMPLATE/`: repo links.
- Optional `patches-bundle.png` for a custom Manager icon.

## Adding a patch

Covered in `patch-development.md` (file layout, patch types, build/test loop,
troubleshooting) — nothing patch-specific lives here by design.

## Verify

```bash
./gradlew buildAndroid
./gradlew generatePatchesList
./gradlew clean :patches:buildAndroid --no-daemon
```

The `.mpp` lands in `patches/build/libs/patches-*.mpp`. This only proves the
toolchain works — for the real loop (apply in Morphe Desktop, single-patch
isolation, troubleshooting) see `patch-development.md` § Build and test.
Never hand-edit `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`, or the `gradle.properties` version — the release pipeline owns them (see `release.md`).
