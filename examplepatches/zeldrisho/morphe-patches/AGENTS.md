# Agent Instructions

## Toolchain

- Use JDK 21, the checked-in Gradle wrapper, an Android SDK, and pnpm; see `docs/development.md`.
- Use `python3`, `fd`, `morphe`, `aapt`, `baksmali`, and `adb` for inspection and validation; see `docs/recon.md` and `docs/testing.md`.
- Use the local CLI-first Android inspection workflow in `docs/recon.md`.

## Commands

| Task | Command |
| --- | --- |
| Install release dependencies | `pnpm install --frozen-lockfile` |
| Build patch bundle | `./gradlew :patches:buildAndroid --no-daemon` |
| Find local APK and bundle inputs | `fd --hidden --no-ignore -t f -e apk -e apkm -e apks -e xapk . analysis/` |
| Inspect an APK or APKM | `python3 scripts/apk_recon.py <input> <report>` |
| Disassemble an APK or APKM | `python3 scripts/disassemble_apk.py <input> <output>` |
| List bundle patches and targets | `morphe list-patches --patches patches/build/libs/patches-<version>.mpp --with-packages --with-versions` |

## Rules

- If a required tool is missing or needs a PATH change, stop and tell the user; do not install it, change PATH, or substitute an absolute executable path.
- Before implementing patches, check the [Morphe Patcher documentation index](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/README.md); read the relevant linked sections for the task.
- Verify patch targets against the exact input's smali before implementation; follow `docs/template.md`.
- Validate patch changes with Morphe Desktop against the intended app version; record fingerprint, application, installation and behavior separately, marking unavailable checks BLOCKED. See `docs/testing.md`.
- Keep APK inputs, smali, notes, and diagnostic outputs under ignored `analysis/<package>/<version>/`; preserve existing evidence and never commit private artifacts.
- If the target APK or bundle is missing from `analysis/<package>/<version>/apk/`, ask the user for its path and move it there without overwriting existing files; follow `docs/recon.md`.
- Never install over a user-owned app, uninstall it, or clear its data without explicit approval.
- Before building when the intended package ID is unknown, confirm it with the operator. Before installation, verify the output package ID; check signing identity before updates. See `docs/testing.md`.
- Never log or commit credentials, tokens, account data, signing keys or private artifacts.
- Put Kotlin patch definitions and fingerprints under `patches/src/main/kotlin/app/zeldrisho/patches/`.
- Give every patch a concise, user-facing sentence-case action name and a non-blank one-sentence description explaining its behavior, scope and important limitations; do not expose implementation details or version fingerprints in the name.
- Put app-specific runtime Java extension code under `extensions/extension/src/main/java/`; preserve injected class descriptors.
- Keep injected Dalvik class descriptors and method signatures consistent with the actual extension classes.
- Keep `extendWith(...)` paths aligned with the extension artifact name in `extensions/extension/build.gradle.kts`.
- Declare shared app compatibility and tested target versions in `patches/src/main/kotlin/app/zeldrisho/patches/shared/Constants.kt`.
- Keep Gson off the bundled runtime classpath; `patches/build.gradle.kts` provides a separate configuration for the patch-list generator.
- Do not manually edit or commit generated `patches-list.json`, `patches-bundle.json`, or `CHANGELOG.md`.
- Do not hand-edit the generated patch-list section between `PATCHES_START` and `PATCHES_END` in `README.md`.
- Fetch before implementation; fast-forward `dev` when possible and inspect divergence before integrating. Do not rewrite published commits.
- Make development changes on `dev` with scoped semantic commits: `<type>(<scope>): <imperative summary>`. Use app scopes such as `zalo` for patch behavior and repository scopes such as `readme`, `ci`, or `repo` for project behavior (for example, `fix(readme): correct generated compatibility output`). Use release-recognized types (`feat`, `fix`, `bump`, `perf`, `build`) for changelog entries; use `docs`, `chore`, or `refactor` only for non-release changes. Merge `dev` into `main` without squashing for stable releases. See `docs/releasing.md`.
- Use `.github/workflows/release.yml` and `.releaserc` for releases; do not create replacement release scripts or manually upload releases.
- Keep CI to the existing workflows; issue automation workflows are separate and must remain narrowly permissioned.
- Do not push commits unless the user explicitly asks; never force-push semantic-release commits.

## References

| Need | File |
| --- | --- |
| Local build, development, and release conventions | `docs/development.md` |
| Patch and extension layout | `docs/development.md` |
| Release process and automation | `docs/releasing.md`, `.github/workflows/release.yml`, `.releaserc` |
| Dependency versions and plugin setup | `gradle/libs.versions.toml`, `settings.gradle.kts` |
| Zalo Drive and custom icons | `docs/zalo.md` |
| Validation and version updates | `docs/testing.md`, `docs/template.md` |
| Injection and bytecode rules | `docs/recon.md` |
| APK inspection and evidence | `docs/recon.md` |
