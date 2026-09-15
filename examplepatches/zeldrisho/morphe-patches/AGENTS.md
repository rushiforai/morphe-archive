# Agent Instructions

## Toolchain
- Use the checked-in Gradle wrapper (`./gradlew`) with Java 21; setup and registry credentials: `docs/toolchain.md`.
- Use `uvx` for Python tools; do not repeat host provisioning during routine builds.

## Commands
| Task | Command |
| ---- | ------- |
| Check selected scripts/workflows | `uvx pre-commit run --files <file> --show-diff-on-failure` |
| Test patch class | `./gradlew :patches:test --tests '<fully.qualified.Class>' --no-daemon` |
| Test Threads extension class | `./gradlew :extensions:threads:testDebugUnitTest --tests '<fully.qualified.Class>' --no-daemon` |
| Test Zalo extension class | `./gradlew :extensions:zalo:testDebugUnitTest --tests '<fully.qualified.Class>' --no-daemon` |
| Build bundle and verify embedded extensions | `./gradlew :patches:verifyBundleExtension --no-daemon` |
| Full verification | Follow `docs/development.md#verify` |
| Re-patch and sign | `python3 scripts/repatch.py <app.apkm> [out.apk]` (options: `docs/cli.md`) |

## Key Conventions
- Patch sources and adjacent fingerprints live under `patches/src/main/kotlin/com/zeldrisho/patches/`; app-agnostic helpers belong in `shared/`.
- Keep runtime extensions app-specific: `extensions/threads/` and `extensions/zalo/` are independent modules.
- Extension artifact or class-descriptor renames must update both Gradle wiring in `patches/build.gradle.kts` and injected bytecode call sites.
- Follow `docs/patch-development.md#file-layout` for exact compatibility targets, patch descriptions, and risky-patch defaults.
- Follow `docs/release.md#rules` for generated-file ownership; do not hand-edit release metadata or the generated README patch list.
- Follow `docs/release.md#changelog-policy` for `CHANGELOG.md`; add only user-visible app changes under `## Unreleased`.
- Work on branches and follow `docs/release.md` for staging and publishing.
- Build and unit-test success does not establish real-APK compatibility or device behavior; use `docs/validation.md`.

## External References
| Need | File |
| ---- | ---- |
| Development entry and verification | `docs/development.md` |
| Host setup and credentials | `docs/toolchain.md` |
| Patch authoring and fingerprints | `docs/patch-development.md` |
| APK analysis and reverse-engineering | `docs/reverse-engineering.md` |
| Bytecode and smali reference | `docs/bytecode-reference.md` |
| Bypass patterns and SDK recipes | `docs/bypass-patterns.md` |
| CLI patching and signing | `docs/cli.md` |
| Release and generated-file policy | `docs/release.md` |
| Device validation and project status | `docs/validation.md`, `docs/plan.md` |
