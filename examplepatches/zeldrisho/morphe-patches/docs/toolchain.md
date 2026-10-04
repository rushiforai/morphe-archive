# Toolchain setup

For routine work, use [development verification](development.md#verify).

## 1. Host tools

Install Homebrew by following [brew.sh](https://brew.sh). Repository development
and Android/Java tools are managed with Brew:

```sh
brew install pre-commit openjdk@21
brew install --cask android-cli
```

`uv` is optional; install it with `brew install uv` to run on-demand Python
analysis tools such as APKiD and objection. Java and Android SDK tooling support
repository builds and device workflows. If another OpenJDK version takes
precedence, optionally run `brew link openjdk@21` to select Java 21.

## 2. Java, Android CLI, and analysis tools

Use **Java 21** and the checked-in `./gradlew`; no separate Gradle install.
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
android sdk list
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

### Python applications: persistent tools versus one-shot runs

| Tool | Command | Use |
| --- | --- | --- |
| Frida | `uv tool install frida-tools` (optional; requires uv) | Runtime instrumentation; install only when needed |
| APKiD | `uvx apkid app.apk` (requires uv) | On-demand recon |
| objection | `uvx objection --help` (requires uv) | On-demand dynamic triage; never assume a persistent install |

These are optional investigation tools, not build or test prerequisites. APKiD
is used by `scripts/apk_recon.py`; install it persistently or run it on demand
with `uvx`. Frida and objection are only needed when a specific runtime question
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
`~/.gradle/gradle.properties`. Never commit credentials. No JS toolchain is required;
release tooling uses `gh` and `python3`.

## 5. Morphe CLI and GUI share one JAR

Morphe Desktop is distributed upstream as a JAR; this repo does not configure a
package-manager package for it. Fetch the latest stable release without hard-coding
a version, and verify it against the SHA-256 digest published in GitHub release
metadata before using it. This release digest is an integrity check against GitHub's
published asset metadata, not an independent trust anchor:

```bash
set -euo pipefail
repo=MorpheApp/morphe-desktop
release=$(gh release view --repo "$repo" --json tagName,assets)
tag=$(python3 -c 'import json,sys; print(json.load(sys.stdin)["tagName"])' <<< "$release")
version=${tag#v}
asset="morphe-desktop-${version}-all.jar"
digest=$(python3 -c 'import json,sys; asset=sys.argv[1]; print(next((a.get("digest", "").removeprefix("sha256:") for a in json.load(sys.stdin)["assets"] if a["name"] == asset), ""))' "$asset" <<< "$release")
[[ "$digest" =~ ^[[:xdigit:]]{64}$ ]] || { echo "Missing published SHA-256 for $asset" >&2; exit 1; }
mkdir -p "$HOME/.local/share/morphe"
gh release download "$tag" --repo "$repo" --pattern "$asset" --dir "$HOME/.local/share/morphe"
printf '%s  %s\n' "$digest" "$HOME/.local/share/morphe/$asset" | sha256sum -c -
```

Morphe Desktop 1.17.0 was checked locally against the pinned Zalo APKM. `FULL`
and `STRIP_FAST` fail Morphe's internal DEX hierarchy verification because
Google IMA classes are absent. `STRIP_SAFE` can produce an unsigned output when
SDK verification is omitted, but `--verify-with-sdk` still fails on those missing
classes. This is not a successful qualification: do not install or release that
output. The latest-release download above may select a newer version, which must
be revalidated against the target APK; record a passing SDK and device check
before treating the APK as supported.

`morphe-desktop-*-all.jar` starts the GUI without a subcommand, the CLI with one.
Do not replace a JAR during an active patch run. `scripts/repatch.py` discovers
the highest numeric version in this directory; `--jar <path>` pins a specific one.
No environment
configuration is needed for its default JAR, bundle, or keystore discovery. See
[CLI patching](cli.md) for commands, runtime data-directory resolution, and
[signing](cli.md#signing) for key/password selection.
Upstream: [README](https://github.com/MorpheApp/morphe-desktop),
[CLI reference](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md#cli).

## 6. Storage and path conventions

APKMirror downloads may live in any local directory.
Keep APK investigation artifacts in the gitignored [analysis workspace](reverse-engineering.md#analysis-workspace).
The helper prefers the repository's persistent `Morphe.keystore`, with shared
Morphe data-directory keys as fallbacks; see [signing](cli.md#signing).

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
android sdk list
adb version
aapt version
```

Then run [canonical verification](development.md#verify), followed by
[device validation](validation.md).
