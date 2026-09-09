# CLI patching (Morphe Desktop JAR)

This repo patches from the terminal. The phone **Manager UI is out of scope**
here — every flow below is the Desktop JAR CLI plus `scripts/repatch.sh`.
Upstream GUI/Manager docs are linked, not duplicated.

## Prerequisites

Toolchain, JAR download, `MORPHE_CLI`, and GitHub Packages credentials:
[toolchain setup](toolchain.md) (esp. §5). Original split bundles (`.apkm`)
only from APKMirror: [toolchain §6](toolchain.md#6-original-apk-source).

## The JAR is the CLI

Upstream ships one artifact — `morphe-desktop-*-all.jar`. No subcommand starts
the GUI; with a subcommand it is the CLI. Full upstream reference:
[Morphe Desktop documentation](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md#cli).

```bash
java -jar "$MORPHE_CLI" --version
java -jar "$MORPHE_CLI" --help
java -jar "$MORPHE_CLI" patch --help
java -jar "$MORPHE_CLI" list-patches --help
```

`MORPHE_CLI` must be the **JAR path**, not a wrapper script
(`scripts/repatch.sh` execs `java -jar "$CLI"` directly).

Data root (patches cache, logs, scratch, default keystore): `morphe-data/`
next to the JAR, else `~/morphe/`; override with `MORPHE_DATA_DIR`. The startup
log prints `Morphe data root: ...`. Layout: `patches/ logs/ tmp/ libs/
morphe.keystore config.json`. `--temporary-files-path` defaults to `tmp/`;
`--keystore` defaults to `morphe.keystore` there.

## Discovery before patching

```bash
MPP="patches/build/libs/patches-<version>.mpp"
java -jar "$MORPHE_CLI" list-versions --patches "$MPP"
java -jar "$MORPHE_CLI" list-patches --patches "$MPP" --with-packages --with-versions --with-options
java -jar "$MORPHE_CLI" list-patches --patches "$MPP" -f com.instagram.barcelona
```

`-p/--patches` also accepts repeatable bundles and repo/release URLs
(`-p <file.mpp>`, `-p <github-url> [--prerelease]`); with several `-p`, name
flags (`-e/-d/-O`) scope to the bundle they follow, index flags (`--ei/--di`)
address the combined list. `options-create` generates the editable JSON that
`--options-file` consumes:

```bash
java -jar "$MORPHE_CLI" options-create -p "$MPP" -o /tmp/options.json
# edit enabled/options, then:
java -jar "$MORPHE_CLI" patch -p "$MPP" --options-file /tmp/options.json --options-update app.apkm
```

CLI flags beat the options file when both set one patch. A nonexistent
`--options-file` path is auto-created with defaults on first use.

## Canonical flows (this repo)

Fast path (first success):

```bash
./gradlew buildAndroid --no-daemon
MPP="patches/build/libs/patches-<version>.mpp" \
  bash scripts/repatch.sh /path/to/threads.apkm /tmp/threads_patched.apk
adb install -r /tmp/threads_patched.apk
```

Build first — the `.mpp` lands in `patches/build/libs/`:

```bash
./gradlew :patches:test :extensions:extension:testDebugUnitTest buildAndroid --no-daemon
```

Full re-patch via the helper (preferred — pins bundle, tmp dir, keystore):

```bash
MPP="patches/build/libs/patches-<version>.mpp" \
  bash scripts/repatch.sh /path/to/threads.apkm /tmp/threads_patched.apk
adb install -r /tmp/threads_patched.apk
```

What `repatch.sh` does: picks newest local `.mpp` (or latest GitHub release
via `GITHUB_REPO`), runs `options-create`, applies `APP_NAME` /
`PACKAGE_NAME` into the options JSON (rename patches only), then `patch -p`
with `--options-file`, `-o`, `-t`, and `--keystore*`. Env overrides:
`APP_NAME PACKAGE_NAME MPP KEYSTORE KEYSTORE_ALIAS KEYSTORE_PASSWORD
KEYSTORE_ENTRY_PASSWORD MORPHE_CLI VERIFY_SDK GITHUB_REPO`.
`VERIFY_SDK` is opt-in SDK verification: `1` uses SDK discovery, a path value
passes `--verify-with-sdk=<path>` (required release-QA step; see
[QA checklist](qa-checklist.md#re-patch--install)).

Raw equivalents when the helper hides what you need:

```bash
# Full suite, defaults:
java -jar "$MORPHE_CLI" patch -p "$MPP" -o /tmp/threads_patched.apk /path/to/threads.apkm
# One patch in isolation (debug one fingerprint without others masking it):
java -jar "$MORPHE_CLI" patch -p "$MPP" --exclusive -e "Hide ads" -o /tmp/threads_one.apk /path/to/threads.apkm
# Rename + label via flags instead of env:
java -jar "$MORPHE_CLI" patch -p "$MPP" \
  -e "Change app name" -OappName="Threads+" \
  -e "Change package name" -OpackageName="com.example.threads" \
  -o /tmp/threads_renamed.apk /path/to/threads.apkm
# Risky surface: force + keep going + record what happened:
java -jar "$MORPHE_CLI" patch -p "$MPP" --force --continue-on-error \
  -r /tmp/patch-result.json -o /tmp/threads_forced.apk /path/to/threads.apkm
```

Threads specifics: package `com.instagram.barcelona`, `ApkFileType.APKS` —
pass the downloaded `.apkm` bundle, never an extracted `base.apk`. Pinned
target lives in `shared/Constants.kt` (`TESTED_VERSION_CODE` is source of
truth, not this file).

## Flags you will actually reach for

| Flag | Effect |
| ---- | ------ |
| `-e/-d "Name"`, `--ei/--di N` | Enable/disable by exact name or `list-patches` index |
| `-Okey=value` | Patch option value (typed; `-Okey` = null). Check `list-patches --with-options` |
| `--exclusive` | Disable all except `-e/--ei` — single-patch isolation |
| `-f/--force` | Skip version check (newer-than-pinned APKs; incompatible patches still skip) |
| `--continue-on-error` | Apply the rest after one patch fails |
| `--striplibs arm64-v8a` | Keep only these native ABIs (smaller APK; wrong choice = won't run) |
| `--bytecode-mode FULL\|STRIP_SAFE\|STRIP_FAST` | Default `STRIP_FAST`; startup crashes → retry `STRIP_SAFE`/`FULL` |
| `--verify-with-sdk [/path]` | DEX/APK verify via SDK (`$ANDROID_HOME` → `$ANDROID_SDK_ROOT` → OS default) |
| `-o/--out` | Output path (default nests `<app>/<app>-Morphe-<ver>-patches-<pver>.apk` by input) |
| `-t/--temporary-files-path`, `--disable-purge` | Scratch location / keep scratch for failed-run forensics |
| `-r/--result-file` | JSON: package/version, per-step results, applied + failed (with errors) |
| `-i [SERIAL]`, `--mount` | ADB install after patch; `--mount` = root mount over stock (needs `su`, stock installed) |
| `utility install -a <apk> [--route-links] [--disable-stock PKG]`, `utility uninstall -p <pkg> [--unmount]`, `utility clear-cache [--info]` | Post-patch device ops; link routing = GUI "open with" step, reversible, ADB-only |

## Signing (keystore flags need `=`)

```bash
java -jar "$MORPHE_CLI" patch -p "$MPP" \
  --keystore="<jar-dir>/morphe-data/morphe.keystore" \
  --keystore-entry-alias=Morphe \
  -o /tmp/out.apk /path/to/threads.apkm
# Custom store (space-separated form FAILS — use =):
java -jar "$MORPHE_CLI" patch -p "$MPP" \
  --keystore=/path/to/mine.bks --keystore-entry-alias=morphe \
  --keystore-password=... --keystore-entry-password=... \
  -o /tmp/out.apk /path/to/threads.apkm
# Diagnose signing without patching noise:
java -jar "$MORPHE_CLI" patch -p "$MPP" --unsigned -o /tmp/unsigned.apk /path/to/threads.apkm
apksigner verify --print-certs /tmp/out.apk
```

Defaults: shared BKS `morphe.keystore`, alias `Morphe`, key password
`Morphe`, store password empty (`<jar-dir>` is the Desktop JAR's
directory — e.g. `~/.local/share/morphe-desktop/` per [toolchain §5](toolchain.md#5-morphe-desktop-is-also-the-cli);
fallbacks `~/morphe/`, override `MORPHE_DATA_DIR`). Note `scripts/repatch.sh`
defaults to the repo's `./Morphe.keystore` instead — pass `KEYSTORE=` to use
the shared one. PKCS12/JKS inputs are auto-detected and
converted to a BKS copy (original untouched). The repo's `Morphe.keystore` is
BKS — plain `keytool` says "unrecognized format" unless loaded with the
BouncyCastle provider from the Desktop JAR (see
[lessons learned](lessons-learned.md#signing)). Re-patch updates install over
the old build **only** when the signing key is unchanged; mismatched certs
need uninstall first (`adb install -r` fails otherwise).

## Updating and debugging

- Update = re-patch with the new `.mpp` (or new APK) and `adb install -r`;
  no uninstall when the cert matches. `Your apps`-style update badges are a
  Manager concept; on CLI compare `list-versions` output and the `-r` result JSON.
- Failed run: keep scratch (`--disable-purge`), save the result
  (`-r result.json`), read `morphe-data/logs/`, then device logcat:
  `adb logcat | grep 'morphe\|AndroidRuntime'`. Patched-app runtime logs are
  just logcat — no special CLI log subcommand.
- Post-install link routing (patched app opens its web links; optionally strip
  stock's claim after a rename): `utility install -a /tmp/out.apk --route-links
  [--disable-stock com.instagram.barcelona]` — needs ADB-authorized device.

## Not here

GUI walkthroughs (Quick/Expert, Icon Studio, source manager), Manager phone
flows (sources, Your apps, update badges), and general patch authoring live
upstream or in sibling docs: [toolchain](toolchain.md),
[patch development](patch-development.md), [QA](qa-checklist.md),
[lessons learned](lessons-learned.md). This file owns the terminal path only.
