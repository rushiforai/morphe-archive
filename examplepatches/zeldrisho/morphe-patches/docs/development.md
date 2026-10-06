# Development guide

## Reading order

1. [Toolchain setup](toolchain.md) — provision a host and registry credentials.
2. [CLI patching](cli.md) — patch, sign, and install an APK.
3. [Reverse engineering](reverse-engineering.md) and [analysis workspace](reverse-engineering.md#analysis-workspace) — find targets and organize local evidence.
4. [Patch development](patch-development.md) — file layout, fingerprints, and the build/test loop.
5. [Validation](validation.md) — real-APK and device checks.
6. [Release process](release.md) — branching, changelog, generated-file ownership, and publishing.

## Repository structure

| Location | Responsibility |
| --- | --- |
| `patches/src/main/kotlin/com/zeldrisho/patches/` | App patches and adjacent fingerprints; reusable helpers in `shared/` |
| `extensions/threads/`, `extensions/zalo/` | Independent, app-specific runtime extensions |
| `patches/build/libs/patches-*.mpp` | Built bundle, including extension artifacts |

Injected extension descriptors are compatibility interfaces: renames must update
both call sites and `patches/build.gradle.kts` wiring. Each app must call only its
matching extension. `extendWith(...)` loads artifacts through the bundle classloader.

```text
original split APK → baksmali smali → fingerprint + patch → .mpp → Morphe → patched APK → device validation
```

## Verify

Check prerequisites without installing tools or changing the host:

```bash
python3 scripts/doctor.py build      # Java 21+, Python, Gradle wrapper
python3 scripts/doctor.py analysis   # plus APK recon tools; baksmali is optional
python3 scripts/doctor.py device     # Android CLI deployment capability
```

Run from the repository root with the [configured toolchain](toolchain.md):

```bash
python3 -m unittest discover -s scripts/tests -v
./gradlew verify --no-daemon
```

`verify` runs quality checks, patch tests, both extension unit-test suites, bundle
verification, and coverage verification. Coverage floors are 80% for patches,
91% for Threads, and 80% for Zalo. Reports are written beneath each module's
`build/` directory; coverage is a regression signal, not proof of real-APK or
device compatibility. `buildAndroid` alone does **not** run the quality gate.

### Testing guidance

Prefer pure synthetic inputs for transformation and descriptor-matching logic:
small in-memory DEX/class descriptors exercise exact compatibility constraints
without proprietary APK fixtures. APK qualification tests are opt-in through
`THREADS_TEST_APK` or `ZALO_TEST_APK` and skip when those private inputs are
absent. Keep APK-dependent qualification separate from standard CI.

Use Robolectric for Android extension behavior that depends on `Context`,
`PackageManager`, dialogs, handlers, or looper timing; tests must remain local
JVM tests and must not require an emulator/device. The Zalo runtime uses a paused
main looper for deterministic delayed-refresh assertions. Add assertions for
observable behavior, including missing-provider fallback, invalid/null inputs,
activity lifecycle edges, and superseded callbacks. Avoid introducing custom
source-set fragmentation merely to accommodate tests.
Successful verification still requires [real-APK and device validation](validation.md).

## Code quality

CI runs the Python tests, Gradle verification, and pinned file checks. Local
commit hooks also run file checks before commit; the pre-push hook runs
`gradle-quality` for matching JVM files. Generated metadata, build output, and
local APK analysis are not formatting targets.

| Check | Configuration / scope |
| --- | --- |
| Spotless: ktlint + google-java-format | Root `build.gradle.kts`; Kotlin, Gradle scripts, extension Java |
| detekt | `patches/build.gradle.kts`, `config/detekt/detekt.yml`; Kotlin, without type resolution |
| Android Lint | Extension production and test sources |
| Ruff check + format | Pinned isolated hooks in `.pre-commit-config.yaml`; `scripts/*.py` |
| actionlint | Pinned isolated hook in `.pre-commit-config.yaml`; workflows; ShellCheck when available |
| Conflict markers, mixed line endings, and YAML/JSON syntax | `.pre-commit-config.yaml`; tracked text/config files |

`qualityCheck` aggregates Spotless, detekt, and Android Lint. Reports live in
`patches/build/reports/detekt/` and `extensions/*/build/reports/`.
Gradle dependencies and CI action revisions are pinned for reproducible builds.
The configured Git hooks run the pinned Ruff and actionlint checks for matching
files before commit; CI also runs these checks. Other hook repositories and
revisions remain pinned in `.pre-commit-config.yaml`; update them with
`pre-commit autoupdate --freeze`, then review the resolved commits.
A bare `pre-commit install` installs both configured hook types. Commits do not
run Gradle or SDK builds; pushes with files matching the hook's pattern run
`gradle-quality`.
Detekt **2.0.0-alpha.6**
remains intentional: its compiler matches Morphe's Kotlin **2.4.10**; stable Detekt
1.23.8 targets Kotlin 2.0.21 and is not a compatible drop-in. Recheck the
[compatibility table](https://detekt.dev/docs/introduction/compatibility/) before
changing either. Use documented rule exceptions, not a baseline of ignored findings.

### Optional commit hooks

Install the configured commit hook with:

```bash
pre-commit install
```

Remove it with `pre-commit uninstall`. The first run needs network access to
fetch the configured isolated hook environments.

### Apply formatting explicitly

```bash
./gradlew spotlessApply --no-daemon
# Python lint and format checks run through the configured commit hooks.
```

Review the diff and rerun verification. Fix non-autoformattable naming/KDoc errors manually.

## Operating rules

- Pin exact target versions and tested version codes; verify fingerprints against smali.
- Establish a stock control; record artifact hashes, options, signing certificate, and bounded logs.
- Keep risky patches disabled until device validation proves the default path.
- Keep credentials, keys, APK analysis, logs, and screenshots out of Git.
- Follow [release rules](release.md#rules) and [changelog policy](release.md#changelog-policy); do not hand-edit generated release metadata.
