# Patching with the Morphe CLI

This repo patches from the terminal. The phone **Manager UI is out of scope**
here — every flow below is the Morphe CLI plus `scripts/repatch.py`.
Upstream GUI docs are linked, not duplicated.

## Prerequisites

Toolchain, JAR download, and GitHub Packages credentials:
[toolchain setup](toolchain.md) (esp. §5). Original split bundles (`.apkm`)
only from APKMirror: [toolchain §7](toolchain.md#7-original-apk-source); host paths are
centralized in [toolchain §6](toolchain.md#6-storage-and-path-conventions). On this
host, APKMirror downloads are stored in `/mnt/c/Users/zeldrisho/Downloads/`;
use the `.apkm` file matching the target version there.

## The JAR is the CLI

Upstream ships one artifact — `morphe-desktop-*-all.jar`. No subcommand starts
the Morphe GUI; with a subcommand it is the Morphe CLI. Full upstream reference:
[Morphe documentation](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md#cli).

```bash
MORPHE="${MORPHE:-$(find ~/.local/share/morphe -maxdepth 1 -type f \
  -name 'morphe-desktop-*-all.jar' -print0 |
  xargs -0 ls -t | head -n1)}"
java -jar "$MORPHE" --version
java -jar "$MORPHE" --help
java -jar "$MORPHE" patch --help
java -jar "$MORPHE" list-patches --help
```

The JAR is kept at `~/.local/share/morphe/morphe-desktop-1.15.0-all.jar` (see
[toolchain setup](toolchain.md)). `scripts/repatch.py` works out of the box
with zero environment variable configuration:
it discovers the newest `morphe-desktop-*-all.jar` in
`~/.local/share/morphe/` (`--jar <path>` overrides discovery for manual
testing).

Data root (patches cache, logs, scratch, default keystore): `MORPHE_DATA_DIR`
when set to a writable directory, else `morphe-data/` next to the JAR
(`<jar-dir>/morphe-data/`), else `~/morphe/`. The startup
log prints `Morphe data root: ...`. An unwritable `MORPHE_DATA_DIR` is
ignored with a warning. On Linux, when `MORPHE_DATA_DIR` is unset but
`XDG_DATA_HOME` is exported, a fallback install uses `$XDG_DATA_HOME/morphe`;
an existing `~/morphe/` folder is kept as-is so upgrades never strand data.
Layout: `patches/ logs/ tmp/ libs/
morphe.keystore config.json`. `--temporary-files-path` defaults to `tmp/`;
`--keystore` defaults to `morphe.keystore` there. Both the Morphe GUI and the
Morphe CLI use this folder; in the GUI open it via Tools → Open App Data.

## Discovery before patching

```bash
MPP="patches/build/libs/patches-<version>.mpp"
java -jar "$MORPHE" list-versions --patches "$MPP"
java -jar "$MORPHE" list-patches --patches "$MPP" --with-packages --with-versions --with-options
java -jar "$MORPHE" list-patches --patches "$MPP" -f com.example.app
```

`-p/--patches` also accepts repeatable bundles and repo/release URLs
(`-p <file.mpp>`, `-p <github-url> [--prerelease]`); with several `-p`, name
flags (`-e/-d/-O`) scope to the bundle they follow, index flags (`--ei/--di`)
address the combined list. `options-create` generates the editable JSON that
`--options-file` consumes:

```bash
java -jar "$MORPHE" options-create -p "$MPP" -o /tmp/options.json
# edit enabled/options, then:
java -jar "$MORPHE" patch -p "$MPP" --options-file /tmp/options.json --options-update app.apkm
```

CLI flags beat the options file when both set one patch. A nonexistent
`--options-file` path is auto-created with defaults on first use.

## Canonical flows (this repo)

Fast path (first success):

```bash
./gradlew buildAndroid --no-daemon
MPP="patches/build/libs/patches-<version>.mpp" \
  python3 scripts/repatch.py /path/to/app.apkm /tmp/app_patched.apk
adb install -r /tmp/app_patched.apk
```

Build first — the `.mpp` lands in `patches/build/libs/`:

```bash
./gradlew :patches:test buildAndroid --no-daemon
```

Full re-patch via the helper (preferred — pins bundle, tmp dir, keystore):

```bash
MPP="patches/build/libs/patches-<version>.mpp" \
  python3 scripts/repatch.py /path/to/app.apkm /tmp/app_patched.apk
adb install -r /tmp/app_patched.apk
```

What `repatch.py` does: picks newest local `.mpp` (or latest GitHub release
via `GITHUB_REPO`), runs `options-create`, applies `APP_NAME` /
`PACKAGE_NAME` into the options JSON (rename patches only), then `patch -p`
with `--options-file`, `-o`, `-t`, and `--keystore*`. Optional overrides:
`APP_NAME PACKAGE_NAME MPP KEYSTORE KEYSTORE_ALIAS KEYSTORE_PASSWORD
KEYSTORE_ENTRY_PASSWORD VERIFY_SDK GITHUB_REPO` — unset means
automatic discovery (newest local `.mpp`, standard-dir JAR, and the repository's
persistent `Morphe.keystore`; shared data-dir keys are fallback).
`VERIFY_SDK` is opt-in SDK verification: `1` uses SDK discovery, a path value
passes `--verify-with-sdk=<path>` (required release-QA step; see
[validation guide](validation.md#re-patch-and-install)).

Raw equivalents when the helper hides what you need:

```bash
# Full suite, defaults:
java -jar "$MORPHE" patch -p "$MPP" -o /tmp/app_patched.apk /path/to/app.apkm
# One patch in isolation (debug one fingerprint without others masking it):
java -jar "$MORPHE" patch -p "$MPP" --exclusive -e "Hide ads" -o /tmp/app_one.apk /path/to/app.apkm
# Rename + label via flags instead of env:
java -jar "$MORPHE" patch -p "$MPP" \
  -e "Change app name" -OappName="Example+" \
  -e "Change package name" -OpackageName="com.example.app" \
  -o /tmp/app_renamed.apk /path/to/app.apkm
# Risky surface: force + keep going + record what happened:
java -jar "$MORPHE" patch -p "$MPP" --force --continue-on-error \
  -r /tmp/patch-result.json -o /tmp/app_forced.apk /path/to/app.apkm
```

Split-app specifics: pass the downloaded `.apkm` bundle, never an extracted
`base.apk`. The pinned target and tested version code live in the app
compatibility constants, not this document.

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
java -jar "$MORPHE" patch -p "$MPP" \
  --keystore="<jar-dir>/morphe-data/morphe.keystore" \
  --keystore-entry-alias=Morphe \
  -o /tmp/out.apk /path/to/app.apkm
# Custom store (space-separated form FAILS — use =):
java -jar "$MORPHE" patch -p "$MPP" \
  --keystore=/path/to/mine.bks --keystore-entry-alias=morphe \
  --keystore-password=... --keystore-entry-password=... \
  -o /tmp/out.apk /path/to/app.apkm
# Diagnose signing without patching noise:
java -jar "$MORPHE" patch -p "$MPP" --unsigned -o /tmp/unsigned.apk /path/to/app.apkm
apksigner verify --print-certs /tmp/out.apk
```

Aliases are case-sensitive: `morphe` and `Morphe` select different key
entries. Verify the exact alias and matching key password before patching.
Defaults: shared BKS `morphe.keystore`, alias `Morphe`, key password
`Morphe`, store password empty (`<jar-dir>` is the Morphe JAR's
directory — e.g. `~/.local/share/morphe/` per [toolchain §5](toolchain.md);
resolution priority `MORPHE_DATA_DIR` → `<jar-dir>/morphe-data/` → `~/morphe/`).
`scripts/repatch.py` uses the repository's persistent `Morphe.keystore` first,
then falls back to shared data-dir keys. For the repository key it uses an
empty store password and the `Morphe` entry password by default. Override
`KEYSTORE`, `KEYSTORE_PASSWORD`, and `KEYSTORE_ENTRY_PASSWORD` for a different
persistent key. Consecutive builds using the same key have the same signing
certificate and can use `adb install -r`; switching keys still requires one
uninstall. PKCS12/JKS inputs are auto-detected and
converted to a BKS copy (original untouched). The repo's `Morphe.keystore` is
BKS — plain `keytool` says "unrecognized format" unless loaded with the
BouncyCastle provider from the Morphe JAR (see
[lessons learned](cli.md#signing)). Re-patch updates install over
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
  [--disable-stock com.example.app]` — needs ADB-authorized device.

## Not here

GUI walkthroughs (Quick/Expert, Icon Studio, source manager), Manager phone
flows (sources, Your apps, update badges), and general patch authoring live
upstream or in sibling docs: [toolchain](toolchain.md),
[patch development](patch-development.md), [validation](validation.md),
[validation](validation.md). This file owns the terminal path only.
