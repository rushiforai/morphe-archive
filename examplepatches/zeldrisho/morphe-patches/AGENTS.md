# Agent Instructions

## Tools

- Gradle via wrapper: `./gradlew` (Java 21).
- Host setup (Android SDK, Morphe Desktop CLI, credentials): see `docs/toolchain.md`.

## Project Layout

| Path | Purpose |
| ---- | ------- |
| `patches/` | Patch + fingerprint sources; builds `patches/build/libs/patches-*.mpp` |
| `extensions/extension/` | Companion extension source; builds `extensions/extension.mpe` |
| `scripts/` | Helper scripts (APK recon, re-patch, release staging, cleanup) |

## Commands

| Task | Command |
| ---- | ------- |
| Build patches bundle | `./gradlew buildAndroid` → `patches/build/libs/patches-*.mpp` |
| Regenerate patch list | `./gradlew generatePatchesList` → `patches-list.json` |
| Verify (tests + build) | `./gradlew :patches:test :extensions:extension:testDebugUnitTest buildAndroid --no-daemon` |
| Re-patch + sign an APK | `bash scripts/repatch.sh <app.apkm> [out.apk]` (`APP_NAME`, `PACKAGE_NAME`, `MPP`/`GITHUB_REPO`, `KEYSTORE`, `MORPHE_CLI` env overrides) |
| Stage a release | `bash scripts/prepare-release.sh <X.Y.Z>` on `main`, then push tag (see `docs/release.md`) |

## Key Conventions

- Work on a branch; open a PR to `main` and merge (no squash), then stage + tag the release — see `docs/release.md`.
- Never hand-edit `patches-list.json`, `patches-bundle.json`, `README.md` patch list, `gradle.properties` version.
- `CHANGELOG.md`: add bullets under `## Unreleased` only; never touch versioned entries (`prepare-release.sh` promotes them).
- Never create releases, tags, or `.mpp` uploads by hand; `scripts/prepare-release.sh` stages the release and `release.yml` publishes it from the pushed tag.
- Risky patches (login/providers/push at risk) ship `default = false` with a WARNING; see `docs/patch-development.md`.

## External References

| Need | File |
| ---- | ---- |
| User setup / patch list | `README.md` |
| Host setup (Fedora WSL + macOS installs) | `docs/toolchain.md` |
| CLI patching (Desktop JAR flags, repatch flows, signing) | `docs/cli.md` |
| Development entry + reading order | `docs/development.md` |
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
