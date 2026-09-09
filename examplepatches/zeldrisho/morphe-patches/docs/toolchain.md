# Toolchain setup (Fedora WSL + macOS, fish)

Canonical install reference. Other docs link here instead of repeating commands.
Run setup commands only when provisioning a host, not on every build.
Code blocks marked `fish` run in fish; blocks marked `bash` run in bash.

## 1. Python and host tools

Fedora WSL already includes `python3`; verify with `python3 --version`.
On macOS, install it explicitly. Keep Python applications isolated with uv.

```fish
# Fedora WSL
sudo dnf install -y uv git curl unzip zip ripgrep binutils bash fish jq gh

# macOS (Homebrew available)
brew install python uv git curl unzip zip ripgrep binutils bash fish jq gh coreutils grep gnu-sed
```

For a fresh host, install [Homebrew](https://brew.sh/) first (macOS may prompt
for Command Line Tools; they can also be requested with `xcode-select --install`):

```bash
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o /tmp/homebrew-install.sh
bash /tmp/homebrew-install.sh
```

Follow its platform-specific `brew shellenv` instructions for fish. Homebrew's
prefix differs between Linux, Intel Macs, and Apple Silicon; use `brew --prefix`
instead of hardcoding it.

macOS scripts need modern Bash (`mapfile`) and GNU utilities (`grep -P`, `sort -z`):

```fish
# macOS: persist these search paths with fish_add_path
fish_add_path (brew --prefix)/bin (brew --prefix coreutils)/libexec/gnubin (brew --prefix grep)/libexec/gnubin (brew --prefix gnu-sed)/libexec/gnubin (brew --prefix binutils)/bin
```

Helpers with `#!/bin/bash` use the OS Bash even when PATH is changed. On macOS,
invoke them with Homebrew Bash from PATH:

```bash
bash scripts/apk-recon.sh app.apkm
bash scripts/extract-smali.sh app.apkm out-smali/
```

## 2. Java, Android CLI, and analysis tools

```fish
# Both hosts
brew install openjdk@21 jadx apktool android-cli shellcheck actionlint
```

Use Java **21** for this repo (CI uses Temurin; Homebrew OpenJDK 21 works locally).
If switching from Homebrew's unversioned JDK, your existing setup is:

```fish
brew unlink openjdk
brew link openjdk@21
```

Since versioned Java is keg-only, explicitly configure fish too. Put these lines
in `~/.config/fish/config.fish`:

```fish
set -l jdk (brew --prefix openjdk@21)
if test (uname) = Darwin
    set -gx JAVA_HOME "$jdk/libexec/openjdk.jdk/Contents/Home"
else
    set -gx JAVA_HOME "$jdk/libexec"
end
fish_add_path "$JAVA_HOME/bin"
# A shared convention for both hosts; retain your existing root if different.
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
android --sdk="$ANDROID_HOME" info
android --sdk="$ANDROID_HOME" sdk list
android --sdk="$ANDROID_HOME" sdk install platforms/android-36
android --sdk="$ANDROID_HOME" sdk install platform-tools
# Explicit analysis/signature tools; not a repo build-tools pin:
android --sdk="$ANDROID_HOME" sdk install build-tools/36.1.0
fish_add_path "$ANDROID_HOME/build-tools/36.1.0" "$ANDROID_HOME/platform-tools" ~/.local/bin
```

`build-tools/36.1.0` is valid [Android CLI package syntax](https://developer.android.com/tools/agents/android-cli#sdk-install).
Skip that install if the package already exists; use your installed version's
PATH instead if it supplies the needed tools. No emulator or system image is
required. `ANDROID_HOME` controls Gradle SDK discovery; PATH controls terminal tools.

### Required for every contributor

| Tool | Purpose |
| --- | --- |
| `java`, `javac`, `keytool` (`brew install openjdk@21`) | Build, run Morphe Desktop, inspect signing keys |
| `android` (`brew install android-cli`) | Manage SDK packages |
| `adb` (`android sdk install platform-tools`) | Device pairing, install, logcat |
| `aapt`, `aapt2`, `apksigner`, `zipalign` (`android sdk install build-tools/36.1.0`, or an installed suitable version) | APK metadata and signing/alignment checks |
| `git`, `curl`, `unzip`, `zip`, `bash`, `fish`, `python3` (host commands in [Python and host tools](#1-python-and-host-tools)) | Host/script prerequisites |
| Gradle (checked-in `./gradlew`; no separate install) | Build/test bundles and extensions |
| `gh`, `jq` (Fedora: `sudo dnf install -y gh jq`; macOS: `brew install gh jq`) | GitHub releases/PRs and JSON |
| Morphe Desktop CLI/GUI (see [Morphe Desktop is also the CLI](#5-morphe-desktop-is-also-the-cli)) | Apply bundles and sign APKs |
| `shellcheck`, `actionlint` (`brew install shellcheck actionlint`) | Standalone script/workflow linting; pinned hooks, shfmt, and JVM checks: [code quality](development.md#code-quality) |

### Needed only for reverse engineering

| Tool | Purpose |
| --- | --- |
| `jadx` (`brew install jadx`) | APK → Java |
| `apktool` (`brew install apktool`) | Resources and smali extraction (`apktool d`) |
| `rg` (Fedora: `ripgrep` via `dnf`; macOS: `brew install ripgrep`) | Search decompiled output |
| `strings` (Fedora: `binutils` via `dnf`; macOS: `brew install binutils`) | DEX string extraction |
| Frida / `objection` (see below) | Dynamic confirmation of runtime gates |

### Python applications: persistent tools versus one-shot runs

| Package | Method / command | Why |
| --- | --- | --- |
| `frida-tools` | `uv tool install frida-tools` | Persistent `frida`, `frida-ps`, etc. on PATH |
| `kaggle` | `uv tool install kaggle` | `scripts/remote-decompile.sh` calls `kaggle` directly |
| `apkid` | `uvx apkid app.apk` | On-demand recon; `apk-recon.sh` uses uvx too |
| `objection` | `uvx objection --help` | On-demand dynamic triage |

`uv tool install` creates isolated persistent executables in `~/.local/bin`;
`uvx` uses a cached temporary tool environment. Always invoke objection via
`uvx objection` (never assume a persistent install).
For Frida device work, obtain matching-version/ABI `frida-server` from the
[official releases](https://github.com/frida/frida/releases) and follow
[Android setup](https://frida.re/docs/android/); it runs on the device,
not on the development host. Kaggle requires credentials and a private notebook;
see [remote decompilation](reverse-engineering.md#remote-decompilation-for-large-apks).

## 3. WSL and macOS device access

Wireless ADB works on both hosts without USB passthrough:

```fish
adb pair DEVICE_IP:PAIRING_PORT
adb connect DEVICE_IP:DEBUG_PORT
adb devices
```

Use the two distinct ports shown in Android's Wireless debugging screen. WSL
must be able to reach the phone through the host network/firewall. macOS can also
use USB with device authorization; WSL USB needs separate Windows-side forwarding.

## 4. Repository dependencies

No JS toolchain is required — releases run on `gh`, `python3`, and `jq`.
Use a GitHub PAT with `read:packages` for the Morphe Gradle registry:
`GITHUB_ACTOR` / `GITHUB_TOKEN`, or `gpr.user` / `gpr.key` in your private
`~/.gradle/gradle.properties`. Never commit credentials.

## 5. Morphe Desktop is also the CLI

Upstream distributes **`morphe-desktop-*-all.jar`**, not a separate CLI package.
The same JAR launches the GUI without a subcommand and the CLI with one.
See the [upstream README](https://github.com/MorpheApp/morphe-desktop) and
[CLI reference](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md#cli).
In this repo, `morphe-cli.jar` is only the local filename alias for that JAR.

Download the latest stable official JAR (requires `gh auth login`):

```fish
mkdir -p ~/.local/share/morphe-desktop ~/.local/bin
gh release download --repo MorpheApp/morphe-desktop --pattern 'morphe-desktop-*-all.jar' --dir ~/.local/share/morphe-desktop
```

Choose the exact downloaded filename and either set `MORPHE_CLI` to it, or copy it
to `~/.local/bin/morphe-cli.jar`. Do not replace a JAR during an active patch run.

```fish
# Substitute the actual downloaded version; keep this in config.fish if desired.
set -gx MORPHE_CLI "$HOME/.local/share/morphe-desktop/morphe-desktop-VERSION-all.jar"
java -jar "$MORPHE_CLI" --version
java -jar "$MORPHE_CLI" --help
# GUI:
java -jar "$MORPHE_CLI"
# CLI via this repo's helper (bash):
# bash scripts/repatch.sh /path/to/app.apkm /tmp/app-patched.apk
```

`scripts/repatch.sh` uses `java -jar`, `options-create`, and `patch`.
Full flag reference and terminal flows (discovery, single-patch isolation,
signing, updates): [CLI patching](cli.md).
It needs a JAR path, **not** a shell wrapper. It explicitly selects the patch
bundle, temporary directory, and keystore; its keystore default is the repo's
`Morphe.keystore`, not the Desktop data directory. Set `KEYSTORE` to your
existing signing key and preserve its alias/password settings; see
[signing incidents](lessons-learned.md#signing).
Desktop's data-directory defaults can change between versions; check startup
logs or GUI **Tools → Open App Data**, rather than guessing a key location.

## 6. Original APK source

Download original APKs/APKMs **only from [APKMirror](https://www.apkmirror.com/)**.
Pass the downloaded split bundle (`.apkm`) directly to Morphe Desktop or
`scripts/repatch.sh`; never pre-extract `base.apk`. Record the page
URL, version name, versionCode, ABI/variant, and SHA-256 of the downloaded input.
Other mirrors are not sources for this project's original APKs.

## Verify setup

```fish
python3 --version
java -version
./gradlew --version
android --sdk="$ANDROID_HOME" sdk list
adb version
aapt version
jadx --version
apktool --version
shellcheck scripts/*.sh
actionlint
python3 -m unittest discover -s scripts/tests
uvx --from pre-commit==4.6.2 --with shellcheck-py==0.11.0.1 pre-commit run --all-files
./gradlew qualityCheck :patches:test :extensions:extension:testDebugUnitTest buildAndroid --no-daemon
```

The final command builds the bundle and companion extension; a successful build
still needs [device QA](qa-checklist.md).
