# Patch validation

Adapted from the previous repository's qualification guide. A successful build or fingerprint match does not prove behavior on a device.

## Record evidence

For each target, record the original APK or split bundle's package, version, version code and SHA-256; bundle path and hash; selected patches and options; output package ID; Morphe version; and device/Android version. Keep APKs, signing keys, raw logs, screenshots, and account data outside Git. Mark fingerprint resolution, patch application, installation, launch, target-path execution and observed behavior separately as PASS, FAIL, BLOCKED or UNEXECUTED.

See the [target evidence template](template.md) and [bytecode reference](bytecode.md). Do not declare a new supported target until its fingerprints, reflection ABI, transformations and behavior have been independently reviewed.

## Build and patch

```bash
./gradlew :patches:buildAndroid --no-daemon
morphe --help
morphe patch --help
morphe list-patches --patches patches/build/libs/patches-<version>.mpp --with-packages --with-versions
```

Use the original APK or split bundle with Morphe Desktop. Ask the owner to choose an original or clone output package ID before patching. Normal validation uses the default-enabled patches; exclusive single-patch runs are diagnostic only. For unsupported versions `--force` skips compatibility checks; it does not establish support. Use `--validate` to check fingerprint uniqueness for `match()`; it does not validate `matchAll()`. Use `--verify-with-sdk` for optional SDK verification. Consult the installed CLI help and the [Morphe Desktop CLI reference](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md) for current options.

## Device and regression checks

Before installation, inspect the output package with `aapt dump badging` and confirm it matches the chosen ID. Never install over an original user-owned app without explicit approval for that exact in-place update; never uninstall or clear data without explicit approval. Check the signing identity before any update.

Compare stock, re-signed control and patched behavior using disposable accounts where possible. Verify launch, background/resume and each enabled feature, including negative cases and unaffected app functionality. For Threads, check feed order, ad filtering and refresh. For Zalo, check messaging, notifications, media, and any enabled backup/provider flow. Provider selection does not prove OAuth authorization or successful restore.

Record missing APK, device, account or provider checks as BLOCKED rather than assuming success. Do not advertise a new version as tested on the basis of a build or patch application alone.
