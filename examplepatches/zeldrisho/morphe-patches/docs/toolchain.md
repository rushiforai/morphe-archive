# Toolchain setup

For routine work, use [development verification](development.md#verify).

## 1. Host tools

Install Homebrew by following [brew.sh](https://brew.sh). Repository development
and Android/Java tools are managed with Brew:

```sh
brew install pre-commit openjdk@21 morphe
brew install --cask android-cli
brew link openjdk@21
```

Install APKiD with `brew install apkid` for APK recon. `uv` is optional;
install it with `brew install uv` for tools such as Frida and objection.

## 2. Java, Android CLI, and analysis tools

Use **Java 21** and the checked-in `./gradlew`; no separate Gradle install. Morphe's Homebrew formula also installs OpenJDK, but the repository requires Java 21.
Set `ANDROID_HOME` to `$HOME/Android/Sdk` in your shell's environment using its
normal configuration mechanism, or export it for the current session:

```sh
export ANDROID_HOME="$HOME/Android/Sdk"
```

### SDK packages: build requirements versus analysis utilities

The `android-cli` package provides the `android` command for SDK management.
Gradle downloads the Android 36 platform
required by Morphe's `compileSdk` and the AGP-compatible Build-Tools as needed, so
neither needs a manual install command. The SDK manager can install platform-tools
and NDK for local device/native analysis. It treats NDK releases as side-by-side
packages whose IDs include the release number, so
`android sdk install ndk` is not a valid package name. List stable candidates
with `android sdk list --all 'ndk/*'`, then install the desired exact ID. Build
Tools IDs also include a version; don't install one manually here because AGP
selects and downloads its compatible Build-Tools version.

```sh
android info
android sdk list
android sdk install platform-tools
# Optional: select a stable package ID from `android sdk list --all 'ndk/*'`:
android sdk install "ndk;29.0.14206865"
# Add these directories to PATH using your shell's normal mechanism:
#   $HOME/.local/bin
#   $HOME/Android/Sdk/platform-tools
# After a Gradle build installs Build-Tools, add the selected version's directory:
find "$HOME/Android/Sdk/build-tools" -mindepth 1 -maxdepth 1 -type d | sort -V | tail -n1
# Optional NDK compiler tools directory for native-code analysis:
echo "$HOME/Android/Sdk/ndk/29.0.14206865/toolchains/llvm/prebuilt/linux-x86_64/bin"
```

Morphe sets `compileSdk = 36`; AGP chooses and installs its compatible build-tools
(the repo does not pin `buildToolsVersion`). [Gradle can download missing build
packages](https://developer.android.com/studio/intro/update#download-with-gradle)
with an existing SDK, accepted licenses, and network access. Add the resulting
AGP-selected `build-tools` directory to PATH when using tools such as `aapt`
and `apksigner`.

`platform-tools` supplies `adb`; build-tools supplies `aapt`, `aapt2`, `apksigner`,
and `zipalign`. An already-installed suitable build-tools version is fine; adjust
PATH accordingly. `ANDROID_HOME` controls Gradle discovery, PATH controls terminal
tools. No emulator or system image is required.

Use `android` only for SDK management. Use `adb` for device operations,
including pairing, installation, launch, UI inspection, screen capture, and
logs; see [validation](validation.md).

### Smali tools

`smali` assembles DEX; `baksmali` disassembles DEX. These are optional APK
analysis tools, not build prerequisites. The proposed Homebrew Core formula
([PR #314481](https://github.com/Homebrew/homebrew-core/pull/314481)) is still a
draft, so `brew install smali` is not currently available. Install them from a
trusted source when needed; `scripts/doctor.py analysis` reports `baksmali` as
optional. `scripts/extract_smali.py` requires `baksmali` to disassemble APKs.

```sh
# Optional: verify an installed Smali toolchain.
smali --help
baksmali --help
```

Use `scripts/extract_smali.py` for canonical baksmali output. `dexdump` from
Android SDK build-tools is useful for DEX-level class, method, and instruction
inspection; locate it under `$ANDROID_HOME/build-tools/<version>/dexdump` and run
`dexdump -f <file.dex>`. Prefer baksmali for source-like smali and the extractor
for repeatable APK/APKM output.

### Python applications: persistent tools versus one-shot runs

| Tool | Command | Use |
| --- | --- | --- |
| Frida | `uv tool install frida-tools` (optional; requires uv) | Runtime instrumentation; install only when needed |
| APKiD | `brew install apkid`, then `apkid app.apk` | APK recon |
| objection | `uvx objection --help` (requires uv) | On-demand dynamic triage; never assume a persistent install |

These are optional investigation tools, not build or test prerequisites. APKiD
is used by `scripts/apk_recon.py`; install it with Homebrew. The script retains
`uvx` as a fallback when no standalone `apkid` is available. Frida and objection are only needed when a specific runtime question
cannot be answered statically; objection is a convenience layer over Frida, not
a required workflow step. `uv tool` puts isolated executables in `~/.local/bin`;
`uvx` uses cached temporary environments. Ruff and actionlint are installed in
isolated environments by their pinned pre-commit hooks; no separate system
installation is needed. Install Frida tooling only for runtime instrumentation, with a
matching-version/ABI `frida-server` **on the device**:
[releases](https://github.com/frida/frida/releases), [Android setup](https://frida.re/docs/android/).
Use `scripts/extract_smali.py` with baksmali for canonical smali output; `rg` and
`strings` are useful for searching extracted DEX evidence.

## 3. Device access

Wireless ADB avoids USB passthrough:

```sh
adb pair DEVICE_IP:PAIRING_PORT
adb connect DEVICE_IP:DEBUG_PORT
adb devices
```

Use the distinct ports from Android's Wireless debugging screen. The WSL host
network/firewall must allow access to the phone.

## 4. Repository dependencies

Use a GitHub PAT with `read:packages` for the Morphe Gradle registry:
`GITHUB_ACTOR` / `GITHUB_TOKEN`, or `gpr.user` / `gpr.key` in private
`~/.gradle/gradle.properties`. Never commit credentials. Installing Morphe
does not supply this repository's Gradle dependencies or remove its registry
authentication requirement. No JS toolchain is required; release tooling uses
`gh` and `python3`.

## 5. Morphe

Morphe is available from Homebrew and installed with the host tools above:

```bash
morphe --help
```

Its Homebrew formula depends on OpenJDK. That runtime does not replace this repository's Java 21 requirement or remove its Gradle registry authentication requirement.

Homebrew registers `morphe` on PATH. The helper uses it automatically:

```bash
python3 scripts/repatch.py <app.apkm>
```

Previous local checks against the pinned Zalo APKM found that `FULL`
and `STRIP_FAST` fail Morphe's internal DEX hierarchy verification because
Google IMA classes are absent. `STRIP_SAFE` can produce an unsigned output when
SDK verification is omitted, but `--verify-with-sdk` still fails on those missing
classes. This is not a successful qualification: do not install or release that
output. A Homebrew installation or upgrade may select a newer version, which must
be revalidated against the target APK; record a passing SDK and device check
before treating the APK as supported.

Do not upgrade Morphe during an active patch run. `scripts/repatch.py` uses
`morphe` from PATH; legacy JAR discovery remains available as a fallback.
Bundle and keystore discovery remain unchanged. See
[patching](cli.md) for commands, runtime data-directory resolution, and
[signing](cli.md#signing) for key/password selection.
Upstream: [README](https://github.com/MorpheApp/morphe-desktop),
[command reference](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md#cli).

### Default data location

By default, the Homebrew launcher stores Morphe runtime data in the stable
Homebrew var directory:

```bash
$(brew --prefix)/var/morphe
```

This is outside the versioned Cellar installation. No environment setup is
needed for the default. Set `MORPHE_DATA_DIR` to use a different writable location.
The startup log reports the selected data root.

## 6. Storage and path conventions

APKMirror downloads may live in any local directory.
Keep APK investigation artifacts in the gitignored [analysis workspace](reverse-engineering.md#analysis-workspace).
To update an app installed by Morphe Manager on a phone, export its keystore
and install it as Morphe's default signing key at
`$(brew --prefix)/var/morphe/morphe.keystore` (or under the active
`MORPHE_DATA_DIR`). Keep a separate backup privately; never commit or share the
key. Morphe and `scripts/repatch.py` use the active data directory by default,
so routine patch commands need no `--keystore` flag. Match exported-key
credentials when they differ from the shared defaults; see [signing](cli.md#signing).
Use `KEYSTORE` only when deliberately selecting a non-default key.

## 7. Original APK source

Download originals **only from [APKMirror](https://www.apkmirror.com/)**. Pass the
split `.apkm` directly to Morphe or `scripts/repatch.py`, never an extracted
`base.apk`. Record the source page URL, version name, versionCode, ABI/variant,
and input SHA-256.

## Build-tool behavior

The current extension builds use Morphe's `extension` plugin and AGP's D8
`dexBuilder`/`mergeDex` tasks. Neither extension has minification enabled, the
release task graphs contain no `minifyReleaseWithR8` task, and no R8 mapping output
is produced. Shrinker keep rules are therefore not currently applicable. Reassess
if minification is enabled; never shrink the proprietary host APK. The bundle
contract checks the resulting extension DEX descriptors and flags.

## Verify setup

```sh
python3 --version
java -version
./gradlew --version
adb version
aapt version
# Optional Smali tools:
smali --help
baksmali --help
morphe --help
```

Then run [canonical verification](development.md#verify), followed by
[device validation](validation.md).
