# Agent Instructions

## Project Layout

| Path | Purpose |
| ---- | ------- |
| `patches/` | Patch + fingerprint sources; builds `patches/build/libs/patches-*.mpp` |
| `extensions/threads/` | Threads companion extension; builds `extensions/extension.mpe` |
| `extensions/zalo/` | Zalo companion extension; builds `extensions/zalo.mpe` |
| `scripts/` | Helper scripts (APK recon, re-patch, release staging, cleanup) |
| `docs/` | Contributor docs (setup, development, release, QA) |
| `config/` | Static-analysis config (`detekt/detekt.yml`) |
| `analysis/` | Gitignored local APK analysis scratch |

## Commands

| Task | Command |
| ---- | ------- |
| Verify | Follow [canonical verification](docs/development.md#verify) |
| Test single class | `./gradlew :patches:test --tests "<class>" --no-daemon` (Threads: `:extensions:threads:testDebugUnitTest --tests "<class>"`; Zalo: `:extensions:zalo:testDebugUnitTest --tests "<class>"`) |
| Build patches bundle | `./gradlew buildAndroid` → `patches/build/libs/patches-*.mpp` |
| Re-patch + sign an APK | `bash scripts/repatch.sh <app.apkm> [out.apk]` (env overrides: see `docs/cli.md`) |
| Stage a release | Follow [release staging](docs/release.md#staging-a-release) |

## Key Conventions

- Branching and publishing: follow the [release process](docs/release.md).
- Generated-file ownership: follow [release rules](docs/release.md#rules).
- `CHANGELOG.md`: follow [changelog policy](docs/release.md#changelog-policy) and [release rules](docs/release.md#rules).
- Risky-patch defaults and warnings: follow [patch authoring rules](docs/patch-development.md#file-layout).

## External References

| Need | File |
| ---- | ---- |
| Development entry + reading order | `docs/development.md` |
| Host setup | `docs/toolchain.md` |
| CLI patching + signing | `docs/cli.md` |
| Writing patches + fingerprints | `docs/patch-development.md`, `docs/fingerprint-guide.md` |
| Release process | `docs/release.md` |
| QA + remaining work | `docs/qa-checklist.md`, `docs/plan.md` |
