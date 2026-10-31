# Agent Instructions

## Toolchain

- Use JDK 21, the checked-in Gradle wrapper, an Android SDK, and Vite+; see `docs/development.md`.
- Use `python3`, `fd`, `morphe`, `aapt`, `baksmali`, and `adb` for inspection and validation; see `docs/recon.md` and `docs/testing.md`.

## Commands

| Task | Command |
| --- | --- |
| Install release dependencies | `vp install --frozen-lockfile` |
| Build patch bundle | `./gradlew :patches:buildAndroid --no-daemon` |
| Find local APK and bundle inputs | `fd --hidden --no-ignore -t f -e apk -e apkm -e apks -e xapk . analysis/` |
| Inspect an APK or APKM | `python3 scripts/apk_recon.py <input> <report>` |
| Disassemble an APK or APKM | `python3 scripts/extract_smali.py <input> <output>` |
| List bundle patches and targets | `morphe list-patches --patches patches/build/libs/patches-<version>.mpp --with-packages --with-versions` |

## Rules

- Before implementing patches, check the [Morphe Patcher documentation index](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/README.md) and [Morphe development guide](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md); read the relevant linked sections for the task.
- Verify patch targets against the exact input's smali before implementation; follow `docs/template.md`.
- Validate patch changes with Morphe Desktop against the intended app version; record fingerprint, application, installation and behavior separately, marking unavailable checks BLOCKED. See `docs/testing.md`.
- Keep APK inputs, smali, notes, and diagnostic outputs under ignored `analysis/<package>/<version>/`; preserve existing evidence and never commit private artifacts.
- If the target APK or bundle is missing from `analysis/<package>/<version>/apk/`, ask the user for its path and move it there without overwriting existing files; follow `docs/recon.md`.
- Before patching, ask which output package ID to use. Never install over a user-owned app, uninstall it, or clear its data without explicit approval.
- Before installation, verify the output package ID; check signing identity before updates. See `docs/testing.md`.
- Never log or commit credentials, tokens, account data, signing keys or private artifacts.
- Put Kotlin patch definitions and fingerprints under `patches/src/main/kotlin/app/template/patches/`.
- Put app-specific runtime Java extension code under `extensions/extension/src/main/java/`; preserve injected class descriptors.
- Keep injected Dalvik class descriptors and method signatures consistent with the actual extension classes.
- Keep `extendWith(...)` paths aligned with the extension artifact name in `extensions/extension/build.gradle.kts`.
- Declare shared app compatibility and tested target versions in `patches/src/main/kotlin/app/template/patches/shared/Constants.kt`.
- Keep Gson off the bundled runtime classpath; `patches/build.gradle.kts` provides a separate configuration for the patch-list generator.
- Do not manually edit or commit generated `patches-list.json`, `patches-bundle.json`, or `CHANGELOG.md`.
- Do not hand-edit the generated patch-list section between `PATCHES_START` and `PATCHES_END` in `README.md`.
- Make development changes on `dev` with semantic commits; merge `dev` into `main` without squashing for stable releases. See `docs/releasing.md`.
- Use `.github/workflows/release.yml` and `.releaserc` for releases; do not create replacement release scripts or manually upload releases.
- Keep CI to `release.yml` and `codeql.yml`; do not add other CI gates.
- Do not force-push semantic-release commits.

## References

| Need | File |
| --- | --- |
| Local build, development, and release conventions | `docs/development.md` |
| Patch and extension layout | `docs/architecture.md` |
| Release process and automation | `docs/releasing.md`, `.github/workflows/release.yml`, `.releaserc` |
| Dependency versions and plugin setup | `gradle/libs.versions.toml`, `settings.gradle.kts` |
| Zalo microG Drive support | `docs/microg.md` |
| Validation and version updates | `docs/testing.md`, `docs/template.md` |
| Injection and bytecode rules | `docs/bytecode.md` |
| APK inspection and evidence | `docs/recon.md` |
