# Toolchain setup (Fedora WSL, fish)

Canonical install reference. Other docs link here instead of repeating commands.
Run setup commands only when provisioning a host, not on every build.
Code blocks marked `fish` run in fish; blocks marked `bash` run in bash.

## 1. Python and host tools

Fedora WSL already includes `python3`; verify with `python3 --version`.
Keep Python applications isolated with uv. Install the host tools and analysis
applications with:

```fish
sudo dnf install -y uv curl fish
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fish_add_path /home/linuxbrew/.linuxbrew/bin
brew install openjdk@21 jadx apktool android-cli
uv tool install frida-tools
fish_add_path ~/.local/bin ~/Android/Sdk/build-tools/36.1.0 ~/Android/Sdk/platform-tools ~/Android/Sdk/ndk/29.0.14206865/toolchains/llvm/prebuilt/linux-x86_64/bin
```

Install the remaining host utilities used by the scripts as needed:

```fish
sudo dnf install -y git unzip zip ripgrep binutils bash jq gh
```

## 2. Java, Android CLI, and analysis tools

Use Java **21** for this repo (CI uses Temurin). The command above installs the
JDK, jadx, apktool, and Android CLI through the configured `brew`. Set
`ANDROID_HOME` in `~/.config/fish/config.fish`:

```fish
set -gx ANDROID_HOME "$HOME/Android/Sdk"
```

### SDK packages: build requirements versus analysis utilities

Installing `android-cli` installs the SDK manager, not every SDK package.
The Morphe Gradle plugin currently sets `compileSdk = 36`; this repo does not pin
`buildToolsVersion`. The Android Gradle plugin chooses its build-tools version.
[Gradle can download missing required SDK packages](https://developer.android.com/studio/intro/update#download-with-gradle)
when the SDK exists, licenses are accepted, and network access is available.
It does **not** guarantee build-tools **36.1.0**, nor install `adb` just for a build.

Inspect first, then install packages needed for a fresh setup:

```fish
android info
android sdk list
android sdk install platforms/android-36
android sdk install platform-tools
android sdk install "ndk;29.0.14206865"
# Explicit analysis/signature tools; not a repo build-tools pin:
android sdk install build-tools/36.1.0
```

`build-tools/36.1.0` is valid [Android CLI package syntax](https://developer.android.com/tools/agents/android-cli#sdk-install).
Skip that install if the package already exists; use your installed version's
PATH instead if it supplies the needed tools. No emulator or system image is
required. `ANDROID_HOME` controls Gradle SDK discovery; PATH controls terminal tools.

### Required for every contributor

| Tool | Purpose |
| --- | --- |
| `java`, `javac`, `keytool` (`brew install openjdk@21`) | Build, run Morphe, inspect signing keys |
| `android` (`brew install android-cli`) | Manage SDK packages |
| `adb` (`android sdk install platform-tools`) | Device pairing, install, logcat |
| `aapt`, `aapt2`, `apksigner`, `zipalign` (`android sdk install build-tools/36.1.0`, or an installed suitable version) | APK metadata and signing/alignment checks |
| `git`, `curl`, `unzip`, `zip`, `bash`, `fish`, `python3` (host commands in [Python and host tools](#1-python-and-host-tools)) | Host/script prerequisites |
| Gradle (checked-in `./gradlew`; no separate install) | Build/test bundles and extensions |
| `gh`, `jq` (`sudo dnf install -y gh jq`) | GitHub releases/PRs and JSON |
| Morphe CLI/GUI (see [Morphe CLI and GUI share one JAR](#5-morphe-cli-and-gui-share-one-jar)) | Apply bundles and sign APKs |

### Needed only for reverse engineering

| Tool | Purpose |
| --- | --- |
| `jadx` (`brew install jadx`) | APK → Java |
| `apktool` (`brew install apktool`) | Resources and smali extraction (`apktool d`) |
| `rg` (`ripgrep` via `dnf`) | Search decompiled output |
| `strings` (`binutils` via `dnf`) | DEX string extraction |
| Frida / `objection` (see below) | Dynamic confirmation of runtime gates |

### Python applications: persistent tools versus one-shot runs

| Package | Method / command | Why |
| --- | --- | --- |
| `frida-tools` | `uv tool install frida-tools` | Persistent `frida`, `frida-ps`, etc. on PATH |
| `kaggle` | `uv tool install kaggle` | `scripts/remote_decompile.py` calls `kaggle` directly |
| `apkid` | `uvx apkid app.apk` | On-demand recon; `apk_recon.py` uses uvx too |
| `objection` | `uvx objection --help` | On-demand dynamic triage |

`uv tool install` creates isolated persistent executables in `~/.local/bin`;
`uvx` uses a cached temporary tool environment. Always invoke objection via
`uvx objection` (never assume a persistent install).
For Frida device work, obtain matching-version/ABI `frida-server` from the
[official releases](https://github.com/frida/frida/releases) and follow
[Android setup](https://frida.re/docs/android/); it runs on the device,
not on the development host. Kaggle requires credentials and a private notebook;
see [remote decompilation](reverse-engineering.md#remote-decompilation-for-large-apks).

## 3. Device access

Wireless ADB works without USB passthrough:

```fish
adb pair DEVICE_IP:PAIRING_PORT
adb connect DEVICE_IP:DEBUG_PORT
adb devices
```

Use the two distinct ports shown in Android's Wireless debugging screen. WSL
must be able to reach the phone through the host network/firewall.

## 4. Repository dependencies

No JS toolchain is required — releases run on `gh`, `python3`, and `jq`.
Use a GitHub PAT with `read:packages` for the Morphe Gradle registry:
`GITHUB_ACTOR` / `GITHUB_TOKEN`, or `gpr.user` / `gpr.key` in your private
`~/.gradle/gradle.properties`. Never commit credentials.

## 5. Morphe CLI and GUI share one JAR

Upstream distributes **`morphe-desktop-*-all.jar`**, not a separate CLI package.
The same JAR launches the Morphe GUI without a subcommand and the Morphe CLI with one.
See the [upstream README](https://github.com/MorpheApp/morphe-desktop) and
[CLI reference](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md#cli).
In this repo nothing needs to be exported: `scripts/repatch.py` discovers the
newest `morphe-desktop-*-all.jar` in `~/.local/share/morphe/`. For manual
testing, `scripts/repatch.py --jar <path>` overrides discovery.

Download the latest stable official JAR to `~/.local/share/morphe/`
(requires `gh auth login`):

```fish
mkdir -p ~/.local/share/morphe
gh release download --repo MorpheApp/morphe-desktop --pattern 'morphe-desktop-*-all.jar' --dir ~/.local/share/morphe
```

Do not replace a JAR during an active patch run.

```bash
MORPHE="${MORPHE:-$(find ~/.local/share/morphe -maxdepth 1 -type f \
  -name 'morphe-desktop-*-all.jar' -print0 |
  xargs -0 ls -t | head -n1)}"
java -jar "$MORPHE" --version
java -jar "$MORPHE" --help
# Morphe GUI:
java -jar "$MORPHE"
# Helper (no environment variables needed):
python3 scripts/repatch.py /path/to/app.apkm /tmp/app-patched.apk
```

`scripts/repatch.py` works out of the box with zero environment variable
configuration: it discovers the newest `morphe-desktop-*-all.jar`, the signing
keystore, and the patch bundle from their standard locations.

Morphe keeps its runtime data (cached patches, logs, scratch, default keystore)
under `MORPHE_DATA_DIR` when set to a writable directory, else
`<jar-dir>/morphe-data/`, else `~/morphe/` — see [CLI patching](cli.md) for the
full priority and the startup-log line that reports the winner.

`scripts/repatch.py` uses `java -jar`, `options-create`, and `patch`.
Full flag reference and terminal flows (discovery, single-patch isolation,
signing, updates): [CLI patching](cli.md).
It explicitly selects the patch
bundle and temporary directory, and passes the discovered keystore
(`Morphe.keystore` preferred, `imported.keystore` as a fallback,
`--keystore-password=Morphe` by default);
use `KEYSTORE=`/`KEYSTORE_PASSWORD=` only to override what discovery finds
and preserve its alias/password settings; see
[CLI signing guidance](cli.md#signing).
Morphe's data-directory defaults can change between versions; check startup
logs or the Morphe GUI **Tools → Open App Data**, rather than guessing a key
location. Signing-key priority and password overrides are documented in
[CLI patching](cli.md#signing).

## 6. Storage and path conventions

Keep host-specific runtime paths in this section; other procedures link here rather
than repeating them. On the standard Fedora WSL host, original APKMirror split
bundles (`.apkm`) are stored in `/mnt/c/Users/zeldrisho/Downloads/`. The default
Morphe runtime data and signing keys are discovered in this order:
`$MORPHE_DATA_DIR`, `<morphe-JAR-directory>/morphe-data/`, then `~/morphe/`.
The default local key is the repository's persistent `Morphe.keystore` (alias
`Morphe`); shared data-directory keys are fallback candidates. See
[CLI signing](cli.md#signing) for password, override, and legacy-repository-key
details.

## 7. Original APK source

Download original APKs/APKMs **only from [APKMirror](https://www.apkmirror.com/)**.
On the standard WSL host, store downloads in
`/mnt/c/Users/zeldrisho/Downloads/` (the canonical path used by
[CLI patching](cli.md)); other hosts may use any local directory. Pass the
downloaded split bundle (`.apkm`) directly to Morphe or
`scripts/repatch.py`; never pre-extract `base.apk`. Record the page URL, version
name, versionCode, ABI/variant, and SHA-256 of the downloaded input.
Other mirrors are not sources for this project's original APKs.

## Verify setup

```fish
python3 --version
java -version
./gradlew --version
android sdk list
adb version
aapt version
jadx --version
apktool --version
python3 -m unittest discover -s scripts/tests
```

Then follow [canonical verification](development.md#verify).
A successful build still needs [device validation](validation.md).
