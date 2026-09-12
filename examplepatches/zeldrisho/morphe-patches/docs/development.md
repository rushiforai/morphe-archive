# Development guide

Developer entry point. Start here, then follow the reading order below.
For environment setup see [toolchain setup](toolchain.md).

## Reading order

1. [Toolchain setup](toolchain.md) — install once per host.
2. [CLI patching](cli.md) — terminal flows (Morphe CLI flags, `repatch.sh`, signing).
3. [Architecture](architecture.md) — module and data-flow overview.
4. [Reverse engineering workflow](reverse-engineering.md) — finding targets.
5. [Fingerprint guide](fingerprint-guide.md) — writing fingerprints.
6. [Patch development](patch-development.md) — writing, building, and testing patches.
7. [QA checklist](qa-checklist.md) — per-release and per-update device procedure.
8. [Release process](release.md) — branching, versioning, and publishing.
9. [Maintenance](maintenance.md) — durable decisions index.
10. [Lessons learned](lessons-learned.md) — incident context.

## Prerequisites

All tools, SDK packages, Python (`uv`/`uvx`) tooling, GitHub Packages credentials, and Morphe
come from [toolchain setup](toolchain.md). Original APKs/APKMs come only from
[APKMirror](https://www.apkmirror.com/).

## Repo state

Template init is complete. Current coordinates: Gradle `group` is
`com.zeldrisho.patches`; Kotlin patch sources live under
`com.zeldrisho.patches.threads` / `com.zeldrisho.patches.zalo` (app-agnostic
helpers in `com.zeldrisho.patches.shared`); the extension Java package
intentionally stays `com.zeldrisho.threads.extension` (its class descriptor
is embedded in injected smali). `:extensions:threads` is deliberately scoped
to Threads runtime; any future app (e.g. Zalo) requiring runtime extension
bytecode must declare its own independent sibling subproject
(e.g. `:extensions:zalo`) rather than sharing or overloading this
module. Only re-scaffold from the upstream template
when starting a new bundle repo.

## Adding a patch

Covered in [patch development](patch-development.md) (file layout, patch types,
build/test loop, troubleshooting) — nothing patch-specific lives here by design.

## Conventions

Generated-file ownership is defined in the [release rules](release.md#rules).
For `CHANGELOG.md`, follow the [changelog policy](release.md#changelog-policy)
and [release rules](release.md#rules).

## Verify

Canonical local verification (bash):

```bash
uvx pre-commit run --all-files --show-diff-on-failure
./gradlew qualityCheck :patches:test :extensions:threads:testDebugUnitTest :extensions:zalo:testDebugUnitTest :patches:verifyBundleExtension --no-daemon
```


The `.mpp` lands in `patches/build/libs/patches-*.mpp` (`verifyBundleExtension`
runs `buildAndroid`, then fails fast when the embedded
`extensions/extension.mpe` is missing). This only proves the
toolchain works — for the real loop (apply with Morphe, single-patch
isolation, troubleshooting) see [patch development](patch-development.md#build-and-test).

## Code quality

CI runs the same check-only commands above. Hooks are optional; CI does not rely
on contributors installing them. Generated metadata, build output, and local APK
analysis directories are not formatting targets.

| Check | Configuration / scope |
| --- | --- |
| Spotless: ktlint + google-java-format | Root `build.gradle.kts`; Kotlin sources/tests, Gradle scripts, extension Java sources/tests |
| detekt | `patches/build.gradle.kts`, `config/detekt/detekt.yml`; Kotlin source analysis, without type resolution |
| Android Lint | `:extensions:threads:lintDebug`, `:extensions:zalo:lintDebug`; extension production and test sources |
| ShellCheck + shfmt | `.pre-commit-config.yaml`; `scripts/**/*.sh` |
| actionlint | `.pre-commit-config.yaml`; GitHub Actions workflows; also uses ShellCheck when on PATH (installed explicitly in CI) |
| Merge conflicts + mixed line endings | `.pre-commit-config.yaml`; tracked text files |

`qualityCheck` aggregates Spotless, detekt, and Android Lint. It does not run unit
tests or build the bundle; `buildAndroid` alone does not run this quality gate.
Reports are under `patches/build/reports/detekt/` and
`extensions/threads/build/reports/`.

Tool versions are pinned in the Gradle files, hook revisions, and CI install step.
Detekt **2.0.0-alpha.6** is intentional: its embedded compiler matches Morphe's
Kotlin **2.4.10**, unlike stable detekt 1.23.8. Recheck the
[compatibility table](https://detekt.dev/docs/introduction/compatibility/) when
upgrading Morphe/Kotlin. Formatting belongs to Spotless; detekt keeps its default
rules with small documented exceptions, not a baseline of ignored findings.
These checks cannot establish real-APK fingerprint compatibility or device behavior.

### Optional commit hooks

```bash
uvx pre-commit install
# Remove only the pre-commit-managed hook:
uvx pre-commit uninstall
```

The first run downloads isolated hook environments (including Go for actionlint
if needed), so allow network access. No Gradle/SDK build runs during a commit.
For system tools and ShellCheck on PATH, see [toolchain setup](toolchain.md).

### Apply formatting explicitly

Checks do not rewrite files. To fix formatting locally:

```bash
./gradlew spotlessApply --no-daemon
# Same shfmt revision as the check-only hook:
uvx --from 'git+https://github.com/scop/pre-commit-shfmt@05c1426671b9237fb5e1444dd63aa5731bec0dfb' shfmt -w -i 4 -ci scripts/*.sh
```

Review the diff and rerun verification before committing. Kotlin naming/KDoc
errors that cannot be autoformatted must be corrected manually.
