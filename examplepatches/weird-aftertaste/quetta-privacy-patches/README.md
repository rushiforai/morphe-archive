# Quetta Privacy Patches

Tools for rebuilding Quetta Browser APKs with selected analytics, crash-reporting, and vendor endpoints replaced by reserved `.invalid` hostnames.

This repository contains patch source and DNS lists. Obtain the original APK or split bundle separately. APKs, private signing keys, downloaded tools, and build caches are excluded from version control.

## Contents

- `patch_quetta.py`: Python patcher for a single APK or a bundle containing base and split APKs.
- `morphe-patches/`: Kotlin patches for DEX strings, native library strings, network security configuration, and `QUERY_ALL_PACKAGES`.
- `morphe-apply/`: CLI to verify, sign, and apply Morphe patch bundles.
- `share/dns/`: supplementary DNS blocklists in plain, hosts, and AdGuard formats. Review the comments for feature costs.
- `share/patches-1.0.0.pub`: public key for the existing locally signed patch bundle. Builds are not automatically signed with this key.

## Requirements

- Python 3.12 or newer for the Python patcher.
- JDK 21, with `java` and `keytool` on `PATH`.
- Android SDK build-tools providing `zipalign`, `apksigner`, and `aapt2`; set `ANDROID_HOME` or `ANDROID_SDK_ROOT`.
- Internet access for the first Gradle build and for downloading smali tools.
- GitHub Packages credentials with access to Morphe's registry for Gradle dependency resolution. Set `GITHUB_ACTOR` and `GITHUB_TOKEN` in your environment, or `gpr.user` and `gpr.key` in your user-level Gradle properties. Do not put credentials in this repository.

The Python patcher downloads smali/baksmali 3.0.10 into `tools/` if missing and verifies pinned SHA-256 hashes before use.

## Python patcher

```powershell
python patch_quetta.py original.apk -o patched.apk
python patch_quetta.py bundle.zip --strict
python patch_quetta.py bundle.zip --strict --kill-updater --kill-push --drop-query-all-packages
python patch_quetta.py --help
```

The default tier replaces selected analytics and crash-reporting endpoints. `--strict` also disables selected vendor services, including favicon proxies and start-page suggestions. `--kill-updater` stops component and filter-list updates; `--kill-push` breaks push registration. Network security hardening disables explicit cleartext permissions and removes user-installed CA trust.

The script creates or reuses `quetta-patched.jks` beside the input and signs the output APKs with it. Preserve that key outside version control if you need to install future builds as updates. The current script uses the fixed password `quetta-patched`; the keystore file itself must remain private.

Single APK input produces one APK. Bundle input produces a directory of patched splits and a ZIP; the script prints an `adb install-multiple` command. It verifies signatures, ZIP alignment, manifest parsing, selected host removal, and DEX header checksums.

## Morphe builds

From the repository root on Windows:

```powershell
.\morphe-patches\gradlew.bat -p morphe-patches :patches:buildAndroid
.\morphe-apply\gradlew.bat -p morphe-apply build installDist
```

On Linux/macOS, use the corresponding `gradlew` scripts. The patch bundle is written under `morphe-patches/patches/build/libs/`. Use the actual generated filename in the commands below.

The installed CLI is `morphe-apply/build/install/morphe-apply/bin/morphe-apply.bat` on Windows, or `morphe-apply` in the same directory on Linux/macOS. Its commands are:

```text
morphe-apply sign <bundle.mpp> <private-key-file>
morphe-apply verify <bundle.mpp> <expected-public-key-file>
morphe-apply <input.apk> <bundle.mpp> <output.apk> <keystore.jks> <expected-public-key-file>
```

Keep the private bundle signing key outside the repository and obtain the expected public key through a trusted channel. Application rejects unsigned bundles. Always supply the expected public key to authenticate the signer; omitting it only checks the embedded signature. The APK keystore must contain alias `quetta` with the passwords expected by the CLI (`quetta-patched`).

By default the CLI applies all four patches, including endpoint replacements that disable updates, push registration, and some vendor features. An optional sixth argument filters patches by comma-separated substrings of their names.

## Validation and limits

Both Kotlin projects build locally. A small DEX assembly/rewrite smoke check and trusted/mismatched signer checks passed during review. Android installation and runtime behavior have not been verified. Replacing known endpoint strings does not guarantee that every telemetry path is disabled, especially after app updates.

## License

GPL-3.0-only, matching the patch bundle metadata. Third-party build dependencies and tools retain their own licenses. This repository is an independent project and is not affiliated with Quetta Browser.
