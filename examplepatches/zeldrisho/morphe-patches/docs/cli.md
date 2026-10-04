# Patching with the Morphe CLI

Terminal workflow using Morphe CLI and `scripts/repatch.py`; Manager/GUI flows are out of scope.

## Prerequisites

Follow [toolchain setup](toolchain.md) for tools, JAR, and registry credentials.
Use the target-version `.apkm` from [APKMirror](toolchain.md#7-original-apk-source);
see [storage conventions](toolchain.md#6-storage-and-path-conventions) for local paths.

## The JAR is the CLI

Upstream ships one artifact — `morphe-desktop-*-all.jar`. No subcommand starts
the Morphe GUI; with a subcommand it is the Morphe CLI. Full upstream reference:
[Morphe documentation](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md#cli).

```bash
MORPHE="$HOME/.local/share/morphe/morphe-desktop-<version>-all.jar"
java -jar "$MORPHE" --version
java -jar "$MORPHE" --help
java -jar "$MORPHE" patch --help
java -jar "$MORPHE" list-patches --help
```

For raw CLI commands, replace `<version>` with your installed JAR version.
The helper discovers the newest JAR automatically (`--jar <path>` overrides it).

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

Build/test, then use the helper (pins bundle, scratch directory, and keystore).
Replace `<version>` with the built bundle version:

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
with `--options-file`, `-o`, `-t`, and `--keystore*`. Optional overrides:
`APP_NAME PACKAGE_NAME MPP KEYSTORE KEYSTORE_ALIAS KEYSTORE_PASSWORD
KEYSTORE_ENTRY_PASSWORD VERIFY_SDK BYTECODE_MODE GITHUB_REPO` — unset means
automatic discovery (newest local `.mpp`, standard-dir JAR, and the repository's
persistent `Morphe.keystore`; shared data-dir keys are fallback).
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

## Signing

Keystore flags need `=`; space-separated forms are rejected.

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
Defaults for the shared BKS `morphe.keystore`: alias `Morphe`, key-entry
password `Morphe`, and empty keystore password (`<jar-dir>` is the Morphe
JAR's directory — e.g. `~/.local/share/morphe/` per [toolchain §5](toolchain.md);
resolution priority `MORPHE_DATA_DIR` → `<jar-dir>/morphe-data/` → `~/morphe/`).
`scripts/repatch.py` prefers the repository's persistent `Morphe.keystore`,
then falls back to shared data-dir keys. It uses the same empty-store / `Morphe`
entry-password defaults for the repository key. For a key at another path, its
defaults differ: store password `Morphe`, empty key-entry password. Do not
assume a Manager-exported key uses those external-path defaults. To update an
app installed from Morphe Manager on a phone, use the keystore exported from
that Manager installation so the patched APK has the same signing identity.
If you trust the exported key and want the normal repository-key defaults,
copy it to the ignored local `Morphe.keystore` file (never commit or share it), or explicitly
set `KEYSTORE_PASSWORD` and `KEYSTORE_ENTRY_PASSWORD` to the credentials used
when that key was created/exported. The documented Morphe defaults are not a
guarantee for a particular exported file; an integrity-check failure means the
store password/key format is wrong, not that the alias is necessarily wrong.
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
  Manager concept; on CLI compare `list-versions` output and the `-r` result JSON.
- Failed run: keep scratch (`--disable-purge`), save the result
  (`-r result.json`), read `morphe-data/logs/`, then device logcat:
  `adb -s "$SERIAL" logcat | grep 'morphe\|AndroidRuntime'`. Patched-app runtime logs are
  just logcat — no special CLI log subcommand. For UI diagnosis, use the
  [ADB inspection commands](validation.md#repeatable-device-journeys).
- Post-install link routing (patched app opens its web links; optionally strip
  stock's claim after a rename): `utility install -a /tmp/out.apk --route-links
  [--disable-stock com.example.app]` — needs ADB-authorized device.
