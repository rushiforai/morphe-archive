# Toolchain setup (Fedora WSL, fish)

Provision once per host, not on every build. Run `fish` blocks in fish and `bash`
blocks in bash. For routine work, use [development verification](development.md#verify).

## 1. Python and host tools

Fedora WSL includes `python3`. Install host tools and isolated Python applications:

```fish
sudo dnf install -y uv curl fish git unzip zip ripgrep binutils bash jq gh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fish_add_path /home/linuxbrew/.linuxbrew/bin
brew install openjdk@21 jadx apktool android-cli
fish_add_path ~/.local/bin ~/Android/Sdk/build-tools/36.1.0 ~/Android/Sdk/platform-tools ~/Android/Sdk/ndk/29.0.14206865/toolchains/llvm/prebuilt/linux-x86_64/bin
```

## 2. Java, Android CLI, and analysis tools

Use **Java 21** and the checked-in `./gradlew`; no separate Gradle install.
Set this in `~/.config/fish/config.fish`:

```fish
set -gx ANDROID_HOME "$HOME/Android/Sdk"
```

### SDK packages: build requirements versus analysis utilities

`android-cli` installs the SDK manager, not its packages. Inspect before installing:

```fish
android info
android sdk list
android sdk install platforms/android-36
android sdk install platform-tools
android sdk install "ndk;29.0.14206865"
# Analysis/signature tools, not a repository build-tools pin:
android sdk install build-tools/36.1.0
```

Morphe sets `compileSdk = 36`; AGP chooses build-tools (the repo does not pin
`buildToolsVersion`). [Gradle can download missing build packages](https://developer.android.com/studio/intro/update#download-with-gradle)
with an existing SDK, accepted licenses, and network access, but this does not
ensure build-tools 36.1.0 or `adb` is installed.

`platform-tools` supplies `adb`; build-tools supplies `aapt`, `aapt2`, `apksigner`,
and `zipalign`. An already-installed suitable build-tools version is fine; adjust
PATH accordingly. `ANDROID_HOME` controls Gradle discovery, PATH controls terminal
tools. No emulator or system image is required.

Use the `android` CLI for supported deployment and UI workflows (install/run,
layout inspection, and screen capture); see [validation](validation.md). Keep
`adb` for lower-level device operations such as Wireless debugging pairing,
connection/listing, and commands not exposed by `android`. `fd-find` is not part
of the maintained toolchain; use `rg` for repository searches.

### Python applications: persistent tools versus one-shot runs

| Tool | Command | Use |
| --- | --- | --- |
| Frida | `uv tool install frida-tools` (optional) | Runtime instrumentation; install only when needed |
| Kaggle | `uv tool install kaggle` | Required by `scripts/remote_decompile.py` |
| APKiD | `uvx apkid app.apk` | On-demand recon |
| objection | `uvx objection --help` | On-demand dynamic triage; never assume a persistent install |

`uv tool` puts isolated executables in `~/.local/bin`; `uvx` uses cached temporary
environments. Install Frida tooling only for runtime instrumentation, with a
matching-version/ABI `frida-server` **on the device**:
[releases](https://github.com/frida/frida/releases), [Android setup](https://frida.re/docs/android/).
Kaggle requires credentials and a private notebook; see [remote decompilation](reverse-engineering.md#remote-decompilation-for-large-apks).
Host analysis tools are `jadx` (Java), `apktool` (resources/smali), `rg` (search),
and `strings` (DEX strings).

## 3. Device access

Wireless ADB avoids USB passthrough:

```fish
adb pair DEVICE_IP:PAIRING_PORT
adb connect DEVICE_IP:DEBUG_PORT
adb devices
```

Use the distinct ports from Android's Wireless debugging screen. The WSL host
network/firewall must allow access to the phone.

## 4. Repository dependencies

Use a GitHub PAT with `read:packages` for the Morphe Gradle registry:
`GITHUB_ACTOR` / `GITHUB_TOKEN`, or `gpr.user` / `gpr.key` in private
`~/.gradle/gradle.properties`. Never commit credentials. No JS toolchain is required;
release tooling uses `gh`, `python3`, and `jq`.

## 5. Morphe CLI and GUI share one JAR

The current official stable release is Morphe Desktop **1.17.0**. Download that
versioned JAR and verify the published GitHub asset digest before using it:

```fish
mkdir -p ~/.local/share/morphe
gh release download v1.17.0 --repo MorpheApp/morphe-desktop \
  --pattern 'morphe-desktop-1.17.0-all.jar' --dir ~/.local/share/morphe
printf '%s  %s\n' \
  '8cf6a9eab4ee9dab146bddc24681897851564f53116baec11f36ba2fa2f589be' \
  "$HOME/.local/share/morphe/morphe-desktop-1.17.0-all.jar" | sha256sum -c -
```

This release was checked locally against the pinned Zalo APKM. It still fails
Morphe's internal DEX hierarchy verification on missing Google IMA classes, in
both `FULL` and `STRIP_FAST` bytecode modes; upgrading alone does not unblock that
APK. Do not treat SDK verification as passed or install an output that failed
patching.

`morphe-desktop-*-all.jar` starts the GUI without a subcommand, the CLI with one.
Do not replace a JAR during an active patch run. `scripts/repatch.py` discovers the
newest JAR in this directory; `--jar <path>` pins a specific one. No environment
configuration is needed for its default JAR, bundle, or keystore discovery. See
[CLI patching](cli.md) for commands, runtime data-directory resolution, and
[signing](cli.md#signing) for key/password selection.
Upstream: [README](https://github.com/MorpheApp/morphe-desktop),
[CLI reference](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md#cli).

## 6. Storage and path conventions

On the standard Fedora WSL host, APKMirror downloads live in
`/mnt/c/Users/zeldrisho/Downloads/`; other hosts may use any local directory.
Keep APK investigation artifacts in the gitignored [analysis workspace](reverse-engineering.md#analysis-workspace).
The helper prefers the repository's persistent `Morphe.keystore`, with shared
Morphe data-directory keys as fallbacks; see [signing](cli.md#signing).

## 7. Original APK source

Download originals **only from [APKMirror](https://www.apkmirror.com/)**. Pass the
split `.apkm` directly to Morphe or `scripts/repatch.py`, never an extracted
`base.apk`. Record the source page URL, version name, versionCode, ABI/variant,
and input SHA-256.

## Effective repository toolchain

| Layer | Effective value | Source / qualification |
| --- | --- | --- |
| Gradle wrapper | 9.7.1 | `gradle/wrapper/gradle-wrapper.properties` |
| Morphe patches plugin | 1.3.4 | `settings.gradle.kts` |
| Android Gradle Plugin | 9.1.0 | Resolved transitively from Morphe plugin |
| Morphe patcher libraries | 1.12.0 | `gradle/libs.versions.toml` |
| Kotlin compiler/runtime | 2.4.10 | Test catalog and resolved model |
| Compile SDK | Android 36 | Morphe plugin default |
| Java | 21 | Repository requirement (CI uses Temurin) |
| D8/R8 | No standalone R8 artifact resolved | Shrinker behavior remains unqualified |

Record effective values for releases/toolchain changes; do not infer AGP or R8
from the wrapper:

```bash
./gradlew --version
./gradlew buildEnvironment --no-daemon
./gradlew :extensions:threads:dependencies --configuration debugRuntimeClasspath --no-daemon
./gradlew :extensions:zalo:dependencies --configuration debugRuntimeClasspath --no-daemon
java -version
```

Extensions package compiled DEX through Morphe's `extension` plugin without a
standalone R8 configuration. Do not claim shrinker safety until the resolved build
confirms whether R8 runs; the bundle contract checks resulting DEX descriptors and flags.

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
```

Then run [canonical verification](development.md#verify), followed by
[device validation](validation.md).
