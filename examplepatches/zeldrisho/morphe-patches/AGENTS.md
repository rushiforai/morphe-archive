# Agent Instructions

## Tools

- Gradle via wrapper: `./gradlew` (Java 21, see `.github/workflows/release.yml`).
- JS tooling via `vp`: `vp install`.
- Android SDK (`platforms`, `build-tools`, `platform-tools` for `adb`/`aapt`); see `docs/lessons-learned.md` for this box's install.

## Project Layout

| Path | Purpose |
| ---- | ------- |
| `patches/` | Patch + fingerprint sources; builds `patches/build/libs/patches-*.mpp` |
| `extensions/extension/` | Companion extension source; builds `extensions/extension.mpe` |
| `scripts/` | Helper scripts (APK recon, re-patch, cleanup) |

## Commands

| Task | Command |
| ---- | ------- |
| Build patches bundle | `./gradlew buildAndroid` → `patches/build/libs/patches-*.mpp` |
| Regenerate patch list | `./gradlew generatePatchesList` → `patches-list.json` |
| Verify without release | `./gradlew :patches:buildAndroid clean --no-daemon` |
| Re-patch + sign an APK | `scripts/repatch.sh <app.apk\|apkm> [out.apk]` (`APP_NAME`, `PACKAGE_NAME`, `MPP`/`GITHUB_REPO`, `KEYSTORE`, `MORPHE_CLI` env overrides) |

## Key Conventions

- Work on `dev`; merge (no squash) `dev` → `main` for stable releases.
- Commits: `feat:` (minor), `fix:` (patch), `chore:` (no release); see `docs/release.md`.
- Never hand-edit `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`, `README.md` patch list, `gradle.properties` version.
- Never create releases by hand; `release.yml` + `.releaserc` own versioning, assets, backmerge.
- Risky patches (login/providers/push at risk) ship `default = false` with a WARNING; see `docs/maintenance.md`.

## External References

| Need | File |
| ---- | ---- |
| User setup / patch list | `README.md` |
| Development setup | `docs/development.md` |
| Patch/extension structure | `docs/architecture.md` |
| Finding targets (recon→hunt) | `docs/reverse-engineering.md` |
| Writing fingerprints | `docs/fingerprint-guide.md` |
| Writing/building patches | `docs/patch-development.md` |
| Incident-driven rules (signing, TV/ABI, unpatchable) | `docs/lessons-learned.md` |
| Smali, obfuscation, match debugging | `docs/bytecode-reference.md` |
| Bypass techniques per system | `docs/bypass-patterns.md` |
| Release process | `docs/release.md` |
| Remaining work | `docs/plan.md` |
| Per-release / per-update QA | `docs/qa-checklist.md` |
| Recurring maintenance / project decisions | `docs/maintenance.md` |
