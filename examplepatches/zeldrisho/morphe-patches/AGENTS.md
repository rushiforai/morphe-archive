# Agent Instructions

## Toolchain
- Use the checked-in Gradle wrapper (`./gradlew`) with Java 21.
- Use `python3` for scripts, `morphe` for patching, and `adb` for device operations.
- Use `fd` for file discovery.

## Commands
| Task | Command |
| ---- | ------- |
| Install APK for main user only (not Samsung Dual Apps) | `adb install --user 0 <apk>` |
| Enable an existing package for main user only | `adb shell pm install-existing --user 0 <package>` |
| Test Python script file | `python3 -m unittest discover -s scripts/tests -p 'test_<script>.py' -v` |
| Test patch class | `./gradlew :patches:test --tests '<fully.qualified.Class>' --no-daemon` |
| Test extension class | `./gradlew :extensions:<app>:testDebugUnitTest --tests '<fully.qualified.Class>' --no-daemon` |
| Build bundle and verify embedded extensions | `./gradlew :patches:verifyBundleExtension --no-daemon` |
| Check Morphe patch flags | `morphe patch --help` |
| Patch with Morphe's default signing key | `morphe patch -p "$MPP" -o /tmp/out.apk <app.apkm>` (default: `$(brew --prefix)/var/morphe/morphe.keystore`; details: `docs/cli.md#signing`) |
| Full verification | Follow `docs/development.md#verify` |
| Locate downloaded APKM | `fd -t f -e apkm . /mnt/c/Users/zeldrisho/Downloads` |
| Re-patch and sign | `python3 scripts/repatch.py <app.apkm> [out.apk]` (options: `docs/cli.md`) |
| Extract APK/APKM smali | `python3 scripts/extract_smali.py <apk-or-bundle> [output]` |

## Key Conventions
- Before patching, ask the user to choose the output package ID: the original package for an in-place update or a clone package ID; do not assume either choice.
- Before installing, inspect the APK manifest with `aapt dump badging <apk>` and require its package to exactly match the user-selected target.
- Never install a patched or diagnostic APK over an original user-owned package without explicit approval for that exact in-place update, even when the user selected the original package ID for patching.
- Require explicit approval before uninstalling a package or clearing its data; uninstalling wipes app data.
- Never print account names, tokens, or raw logs; use counts or redacted greps.
- Patch sources and adjacent fingerprints live under `patches/src/main/kotlin/com/zeldrisho/patches/`; app-agnostic helpers belong in `patches/src/main/kotlin/com/zeldrisho/patches/shared/`.
- Keep runtime extensions app-specific: `extensions/<app>/` are independent modules.
- Extension artifact or class-descriptor renames must update both Gradle wiring in `patches/build.gradle.kts` and injected bytecode call sites.
- Follow `docs/patch-development.md#file-layout` for exact compatibility targets, patch descriptions, and risky-patch defaults.
- Follow `docs/release.md#rules` for generated-file ownership; do not hand-edit release metadata or the generated README patch list.
- Follow `docs/release.md#changelog-policy` for `CHANGELOG.md`; add only user-visible app changes under `## Unreleased`. For audits or cleanup, follow `docs/release.md#changelog-audits-and-edits`.
- Follow `docs/development.md#testing-guidance` for synthetic DEX tests, Robolectric tests, and opt-in private APK qualification.
- Before extracting, check the gitignored `analysis/<app>/<version>/` workspace and notes and reuse verified evidence. Follow `docs/reverse-engineering.md#analysis-workspace`.
- Build and unit-test success does not establish real-APK compatibility or device behavior; use `docs/validation.md`.
- Keep credentials, signing keys, APK analysis, logs, and screenshots out of Git.

## External References
| Need | File |
| ---- | ---- |
| Host setup, Morphe, and DEX tools | `docs/toolchain.md` |
| Morphe CLI workflow and flags | `docs/cli.md` |
| APK analysis, workspace layout, and cleanup | `docs/reverse-engineering.md` |
| Staging and publishing | `docs/release.md` |
| Bytecode and smali reference | `docs/bytecode-reference.md` |
| Fingerprints, bypass patterns, and target selection | `docs/patch-development.md#fingerprints`, `docs/patch-development.md#target-selection` |
| Patch scope and code provenance | `docs/patch-development.md#provenance-and-scope` |
