# Agent Instructions

## Toolchain
- Use the checked-in Gradle wrapper (`./gradlew`) with Java 21.
- Use `uvx` for on-demand Python tools.
- Use `adb` for device operations.

## Commands
| Task | Command |
| ---- | ------- |
| Test Python script file | `python3 -m unittest discover -s scripts/tests -p 'test_<script>.py' -v` |
| Test patch class | `./gradlew :patches:test --tests '<fully.qualified.Class>' --no-daemon` |
| Test Threads extension class | `./gradlew :extensions:threads:testDebugUnitTest --tests '<fully.qualified.Class>' --no-daemon` |
| Test Zalo extension class | `./gradlew :extensions:zalo:testDebugUnitTest --tests '<fully.qualified.Class>' --no-daemon` |
| Build bundle and verify embedded extensions | `./gradlew :patches:verifyBundleExtension --no-daemon` |
| Full verification | Follow `docs/development.md#verify` |
| Re-patch and sign | `python3 scripts/repatch.py <app.apkm> [out.apk]` (options: `docs/cli.md`) |

## Key Conventions
- Patch sources and adjacent fingerprints live under `patches/src/main/kotlin/com/zeldrisho/patches/`; app-agnostic helpers belong in `patches/src/main/kotlin/com/zeldrisho/patches/shared/`.
- Keep runtime extensions app-specific: `extensions/threads/` and `extensions/zalo/` are independent modules.
- Extension artifact or class-descriptor renames must update both Gradle wiring in `patches/build.gradle.kts` and injected bytecode call sites.
- Follow `docs/patch-development.md#file-layout` for exact compatibility targets, patch descriptions, and risky-patch defaults.
- Follow `docs/release.md#rules` for generated-file ownership; do not hand-edit release metadata or the generated README patch list.
- Follow `docs/release.md#changelog-policy` for `CHANGELOG.md`; add only user-visible app changes under `## Unreleased`.
- Work on branches and follow `docs/release.md` for staging and publishing.
- Follow `docs/development.md#testing-guidance` for synthetic DEX tests, Robolectric tests, and opt-in private APK qualification.
- Before APK reverse-engineering or qualification, inspect the existing gitignored `analysis/<app>/<version>/` workspace and its notes; reuse verified local evidence and avoid redundant extraction. Follow `docs/reverse-engineering.md#analysis-workspace`.
- Build and unit-test success does not establish real-APK compatibility or device behavior; use `docs/validation.md`.
- Keep credentials, signing keys, APK analysis, logs, and screenshots out of Git.

## External References
| Need | File |
| ---- | ---- |
| Host setup and credentials | `docs/toolchain.md` |
| APK analysis, workspace layout, and cleanup | `docs/reverse-engineering.md` |
| Bytecode and smali reference | `docs/bytecode-reference.md` |
| Fingerprints, bypass patterns, and target selection | `docs/patch-development.md#fingerprints`, `docs/patch-development.md#target-selection` |
| Zalo microG/Drive status and troubleshooting | `docs/zalo-microg.md` |
| Zalo feature roadmap | `docs/plan.md` |
| Cross-app maintenance backlog and provenance | `docs/maintenance.md` |
