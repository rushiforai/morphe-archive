# Patching with Morphe

Terminal workflow using Morphe and `scripts/repatch.py`.

## Prerequisites

Follow [toolchain setup](toolchain.md) for tools and registry credentials.
Use the target-version `.apkm` from [APKMirror](toolchain.md#7-original-apk-source);
see [storage conventions](toolchain.md#6-storage-and-path-conventions) for local paths.

## Commands

Homebrew registers `morphe` on PATH. Use `morphe patch --help` for flags
supported by the installed version; the current upstream reference is [Morphe
documentation](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md#cli).

```bash
morphe --version
morphe --help
morphe patch --help
morphe list-patches --help
```

`scripts/repatch.py` uses `morphe` from PATH automatically.

The Homebrew launcher defaults runtime data (patches cache, logs, scratch,
default keystore) to `$(brew --prefix)/var/morphe`, outside the versioned Cellar.
Set `MORPHE_DATA_DIR` to use a different writable location. The startup log prints
`Morphe data root: ...`. An unwritable override is ignored by Morphe with a
warning; check the log before relying on the selected directory.
`scripts/repatch.py` uses the selected `MORPHE_DATA_DIR`, or discovers
Homebrew's `var/morphe` path, when looking for the default keystore. See
[signing](#signing) for key discovery and custom-key details.
Layout: `patches/ logs/ tmp/ libs/ morphe.keystore config.json`.
`--temporary-files-path` defaults to `tmp/`; `--keystore` defaults to
`morphe.keystore` there.

## Discovery before patching

```bash
MPP="patches/build/libs/patches-<version>.mpp"
morphe list-versions --patches "$MPP"
morphe list-patches --patches "$MPP" --with-packages --with-versions --with-options
morphe list-patches --patches "$MPP" -f com.example.app
```

`-p/--patches` also accepts repeatable bundles and repo/release URLs
(`-p <file.mpp>`, `-p <github-url> [--prerelease]`); with several `-p`, name
flags (`-e/-d/-O`) scope to the bundle they follow, index flags (`--ei/--di`)
address the combined list. `options-create` generates the editable JSON that
`--options-file` consumes:

```bash
morphe options-create -p "$MPP" -o /tmp/options.json
# edit enabled/options, then:
morphe patch -p "$MPP" --options-file /tmp/options.json --options-update app.apkm
```

Command flags beat the options file when both set one patch. A nonexistent
`--options-file` path is auto-created with defaults on first use.

## Canonical flows (this repo)

Build/test, then use the helper (pins bundle, scratch directory, and keystore).
With no `PATCHES` override, `repatch.py` uses the bundle's normal default-enabled
patch set; this is the required user-like flow for routine feature and device
validation. Do not set `PATCHES` to only the patch under development for normal
verification. Replace `<version>` with the built bundle version:

```bash
./gradlew :patches:test buildAndroid --no-daemon
MPP="patches/build/libs/patches-<version>.mpp" \
  python3 scripts/repatch.py /path/to/app.apkm /tmp/app_patched.apk
adb -s "$SERIAL" install -r /tmp/app_patched.apk
# Launch the patched package (use its renamed ID if applicable):
adb -s "$SERIAL" shell monkey -p "$PACKAGE_NAME" -c android.intent.category.LAUNCHER 1
```

For release QA, follow [full verification](development.md#verify) and
[device validation](validation.md); this quick loop is not a substitute.

What `repatch.py` does: picks newest local `.mpp` (or latest GitHub release
via `GITHUB_REPO`), runs `options-create`, applies `APP_NAME` /
`PACKAGE_NAME` into the options JSON (rename patches only), then `patch -p`
with `--options-file`, `-o`, and `-t`. When the active default key is found,
the helper lets Morphe select it without passing keystore flags. Optional
credential overrides are `KEYSTORE KEYSTORE_ALIAS KEYSTORE_PASSWORD
KEYSTORE_ENTRY_PASSWORD`; unset, key discovery prefers Morphe's active data
directory (`MORPHE_DATA_DIR`, otherwise `$(brew --prefix)/var/morphe`), then the
repo's ignored `Morphe.keystore` and legacy locations. `APP_NAME PACKAGE_NAME
MPP VERIFY_SDK BYTECODE_MODE GITHUB_REPO` are also supported. Normally, let
Morphe use its default keystore; no `--keystore` flag is needed for direct CLI
patching. Set `KEYSTORE` only to select a non-default key.
When downloading a release, `GITHUB_REPO` must be an `owner/repository`
value. The helper accepts only HTTPS URLs hosted by GitHub or its release
asset CDN and validates every redirect.
`VERIFY_SDK` is opt-in SDK verification: `1` uses SDK discovery, a path value
passes `--verify-with-sdk=<path>` (required release-QA step; see
[validation guide](validation.md#re-patch-and-install)). `BYTECODE_MODE` optionally
selects `FULL`, `STRIP_SAFE`, or `STRIP_FAST`; unset leaves Morphe's default.

Raw equivalents when the helper hides what you need:

```bash
# Full suite, defaults:
morphe patch -p "$MPP" -o /tmp/app_patched.apk /path/to/app.apkm
# Optional diagnosis only: isolate a patch after the normal default-set run fails.
morphe patch -p "$MPP" --exclusive -e "Hide ads" -o /tmp/app_one.apk /path/to/app.apkm
# Rename + label via flags instead of env:
morphe patch -p "$MPP" \
  -e "Change app name" -OappName="Example+" \
  -e "Change package name" -OpackageName="com.example.app" \
  -o /tmp/app_renamed.apk /path/to/app.apkm
# Risky surface: force + keep going + record what happened:
morphe patch -p "$MPP" --force --continue-on-error \
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
| `--exclusive` | Disable all except `-e/--ei` — diagnostic isolation only; routine validation should use the normal default-enabled set |
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

## Signing

Morphe's default keystore is `morphe.keystore` in its active data directory:
`$(brew --prefix)/var/morphe` with Homebrew, or the directory selected by
`MORPHE_DATA_DIR`. For normal patching, let Morphe choose that key automatically:

```bash
morphe patch -p "$MPP" -o /tmp/out.apk /path/to/app.apkm
```

Use `--keystore=...` only for a non-default key; keystore flags require `=` and
space-separated forms are rejected. For example:

```bash
morphe patch -p "$MPP" \
  --keystore=/path/to/mine.bks --keystore-entry-alias=morphe \
  --keystore-password=... --keystore-entry-password=... \
  -o /tmp/out.apk /path/to/app.apkm
# Diagnose signing without patching noise:
morphe patch -p "$MPP" --unsigned -o /tmp/unsigned.apk /path/to/app.apkm
apksigner verify --print-certs /tmp/out.apk
```

Aliases are case-sensitive: `morphe` and `Morphe` select different key
entries. Verify the exact alias and matching key password before patching.
The shared BKS `morphe.keystore` defaults to alias `Morphe`, key-entry password
`Morphe`, and empty keystore password. With Homebrew it lives at
`$(brew --prefix)/var/morphe/morphe.keystore`; `MORPHE_DATA_DIR` selects another
active data directory. Morphe uses this default automatically, so normal CLI
commands need no `--keystore` flag. Keep a backup of signing keys privately.

To update an app installed from Morphe Manager, use the keystore exported from
that Manager installation so the patched APK has the same signing identity.
Match its actual alias and passwords; exported/custom keys may not use the shared
default credentials. `scripts/repatch.py` searches the active Morphe data
location first and supports `KEYSTORE` and credential variables for custom keys.
Never commit or share keystores. An integrity-check failure indicates the store
password or key format is wrong; it does not necessarily mean the alias is wrong.
The Manager alias/key must refer to the same signing identity as the installed
app for Android to accept an update. An `INSTALL_FAILED_UPDATE_INCOMPATIBLE`
error only proves the output and installed app certificates differ; it does
not identify either certificate as stock. Confirm by comparing signing
certificate SHA-256 fingerprints before considering uninstalling, which can
remove app data.

Override `KEYSTORE`, `KEYSTORE_ALIAS`, `KEYSTORE_PASSWORD`, and
`KEYSTORE_ENTRY_PASSWORD` for a different persistent key. Consecutive builds
using the same key have the same signing certificate and can be installed as
updates; switching keys requires uninstalling first, which may remove app
data. PKCS12/JKS inputs are auto-detected and converted to a BKS copy (original
untouched). The repo's `Morphe.keystore` is BKS — plain `keytool` says
"unrecognized format" unless loaded with the BouncyCastle provider from the
Morphe JAR.

## Updating and debugging

- Update = re-patch with the new `.mpp` (or new APK) and install with
  `adb -s "$SERIAL" install -r <path-to-verified.apk>`; no uninstall when the cert matches. `Your apps`-style update badges are a
  Manager concept; compare `list-versions` output and the `-r` result JSON.
- Failed run: keep scratch (`--disable-purge`), save the result
  (`-r result.json`), read `morphe-data/logs/`, then device logcat:
  `adb -s "$SERIAL" logcat | grep 'morphe\|AndroidRuntime'`. Patched-app runtime logs are
  just logcat — no special Morphe log subcommand. For UI diagnosis, use the
  [ADB inspection commands](validation.md#repeatable-device-journeys).
- Post-install link routing (patched app opens its web links; optionally strip
  stock's claim after a rename): `utility install -a /tmp/out.apk --route-links
  [--disable-stock com.example.app]` — needs ADB-authorized device.
