# Development guide

Developer entry point. Start here, then follow the reading order below.
For environment setup see [toolchain setup](toolchain.md).

## Reading order

1. [Toolchain setup](toolchain.md) — install once per host.
2. [CLI patching](cli.md) — terminal flows (Morphe CLI flags, `repatch.py`, signing).
3. [Reverse engineering workflow](reverse-engineering.md) — finding targets.
4. [Patch development](patch-development.md) — writing, building, and testing patches.
5. [Validation guide](validation.md) — per-release and per-update device procedure.
6. [Release process](release.md) — branching, versioning, and publishing.

## Prerequisites

All tools, SDK packages, Python (`uv`/`uvx`) tooling, GitHub Packages credentials, and Morphe
come from [toolchain setup](toolchain.md). Original APKs/APKMs come only from
[APKMirror](https://www.apkmirror.com/).

## Repo state

Template init is complete. Keep patch sources under the repository package, place app-agnostic helpers in
`shared/`, and keep each runtime extension in an independent sibling module.
Extension class descriptors embedded in injected smali are compatibility
interfaces: rename them only when all injected call sites and Gradle wiring are
updated. Only re-scaffold from the upstream template when starting a new bundle repo.

## Repository structure

The `patches` module contains Kotlin patch sources and produces
`patches/build/libs/patches-*.mpp`. The app-specific runtime modules
`extensions/threads` and `extensions/zalo` produce embedded extension artifacts;
the `app.morphe.patches` plugin wires them into the bundle.

App compatibility belongs with its app's sources. Genuinely reusable bytecode
and resource helpers belong under `shared/`. Each extension is scoped to one
target app; injected bytecode must call only its matching artifact. Extension
class descriptors are part of that contract, so renames require matching Gradle
wiring and call-site updates.

The patch flow is:

```text
original split APK -> jadx/apktool analysis -> fingerprint + patch
  -> ./gradlew buildAndroid -> .mpp -> Morphe -> patched APK -> adb install
```

`extendWith(...)` loads extension artifacts through the bundle classloader.
`:patches:verifyBundleExtension` builds the bundle and verifies embedded
artifacts; `:patches:checkExtensionArtifact` is the faster pre-check.
`generatePatchesList` creates `patches-list.json`; release-owned metadata and the
README patch table are staged by the [release process](release.md).

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
python3 -m unittest discover -s scripts/tests -v
./gradlew qualityCheck :patches:test :patches:verifyBundleExtension --no-daemon
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
| Android Lint | Extension lint tasks; production and test sources |
| Ruff check + format | `.pre-commit-config.yaml`; `scripts/*.py` |
| actionlint | `.pre-commit-config.yaml`; GitHub Actions workflows; also uses ShellCheck when on PATH (installed explicitly in CI) |
| Merge conflicts + mixed line endings | `.pre-commit-config.yaml`; tracked text files |

`qualityCheck` aggregates Spotless, detekt, and Android Lint. It does not run unit
tests or build the bundle; `buildAndroid` alone does not run this quality gate.
Reports are under `patches/build/reports/detekt/` and
`extensions/*/build/reports/`.

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
uvx ruff check scripts && uvx ruff format --check scripts
```

Review the diff and rerun verification before committing. Kotlin naming/KDoc
errors that cannot be autoformatted must be corrected manually.

## Operating rules

- Treat a successful build as necessary, not sufficient: verify the patched artifact and device behavior.
- Pin exact target versions and tested version codes; verify fingerprints against smali, not decompiler output alone.
- Establish a stock control before diagnosing a patched run and record artifact hashes, options, signing certificate, and bounded logs.
- Keep risky patches disabled until device validation proves the default path.
- Keep credentials, keys, APK analysis, logs, and screenshots out of Git.
