# Validation and release qualification

Repeatable procedure, **not a previous run's results**. Use compatibility constants
for target package/version and throwaway accounts for manual tests; re-signed builds
with VPN/proxy on real accounts can create account risk. Preserve existing data
unless a reset is explicitly authorized.

For each run, record input version/code/hash, bundle path/hash, enabled patches,
package ID, device/Android, signing fingerprint, and sanitized evidence in the
release/PR record. Keep APKs, logs, screenshots, UI dumps, credentials, and tokens
outside Git. Mark assertions **PASS**, **FAIL**, or **BLOCKED**; after a failure,
mark later steps unexecuted. Do not promote a stable release with required checks blocked.

## Build validation

Run the canonical local gates from the repository root:

```bash
uvx pre-commit run --all-files --show-diff-on-failure
python3 -m unittest discover -s scripts/tests -v
./gradlew verify --no-daemon
```

`verify` includes `coverageVerification` for `:patches`, `:extensions:threads`,
and `:extensions:zalo`. To generate/verify coverage by itself:

```bash
./gradlew coverageVerification --no-daemon
```

Current enforced line floors are 80% for patches, 91% for Threads, and 80%
for Zalo; see [development verification](development.md#verify) for measured
baselines. The bundle lands in `patches/build/libs/patches-*.mpp`. Successful CI runs retain
`patches-<sha>-<attempt>` artifacts for seven days; record run/commit and bundle
hash. These are test builds, not releases.

Qualify the original pinned Zalo APK locally; the task fails if it is absent:

```bash
ZALO_TEST_APK=/private/path/to/zalo-base.apk ./gradlew :patches:qualifyZaloApk --no-daemon
```

Check base/split metadata, stock certificate, arm64 native libraries, and
unsupported ABIs. Synthetic CI tests do not establish APK compatibility; never
commit or download proprietary APKs in tests.

## Re-patch and install

Use the original split `.apkm`, with the chosen bundle pinned through `MPP`.
Release qualification requires SDK verification:

```bash
MPP="patches/build/libs/patches-<version>.mpp" VERIFY_SDK=1 \
  python3 scripts/repatch.py /path/to/input.apkm /tmp/verified.apk
android install --apks=/tmp/verified.apk --device="$SERIAL"
# Or install and launch:
android run --apks=/tmp/verified.apk --device="$SERIAL"
```

Update only when signing certificates match; see [signing](cli.md#signing).
`VERIFY_SDK=1` searches `$ANDROID_HOME`, `$ANDROID_SDK_ROOT`, then the OS default;
use `VERIFY_SDK=/path/to/sdk` to pin it. Record the result and hashes. Compilation
alone is insufficient: the patcher verifier defaults to existence checks.

For startup isolation, set the same `MPP` and use strict patch allow-lists.
Install and cold-start each build before adding the next patch:

```bash
export MPP="patches/build/libs/patches-<version>.mpp"
PATCHES='' python3 scripts/repatch.py /path/to/input.apkm /tmp/control-0.apk
PATCHES='<first patch>' python3 scripts/repatch.py /path/to/input.apkm /tmp/control-1.apk
PATCHES='<first patch>,<second patch>' python3 scripts/repatch.py /path/to/input.apkm /tmp/control-2.apk
```

`PATCHES` rejects unknown names and disables all unnamed patches, including defaults.

Qualify the private output signing identity (distinct from the stock certificate):

```bash
ZALO_OUTPUT_APK=/private/patched.apk \
ZALO_OUTPUT_CERTIFICATE='certificate SHA-256 digest: ...' \
./gradlew :patches:qualifySignedOutput --no-daemon
```

This repeats `apksigner` inspection twice by default; increase `QUALIFICATION_REPEATS`
for larger checks. Keep certificate output private.

If all available toolchains reproduce an internal D8 error unrelated to the patch,
the owner may waive SDK verification **after device validation**. Record the waiver,
toolchain versions, and device evidence in the release/PR record; revisit after
Morphe fixes the verifier. Other required checks still apply.

## Repeatable device journeys

Run stock, minimally re-signed no-patch control, and selected-patch builds. Use
`android layout --device="$SERIAL" --full` for primary UI inspection and
`android screen capture --device="$SERIAL" --output=<path>` for visual evidence.
A successful tap is not proof of the expected state.

Record stock, minimally re-signed control, and patched results separately for
these pinned targets: Threads `com.instagram.barcelona` version code
`511507647`; Zalo `com.zing.zalo` version code `260801903`. Include cold launch,
feed load/order, sponsored filtering, scrolling and refresh for Threads; include
background/resume, provider prompt and cancellation, account-picker refresh, Drive,
and notification behavior for Zalo. Mark each assertion PASS, FAIL, BLOCKED, or
UNEXECUTED in the release/PR record; keep evidence private as described above.

## Device validation scope

| Area | Required assertions |
| --- | --- |
| Manifest/package | Intended metadata and permission removals; explain every security-relevant change to exported components, permissions, provider authorities, URI grants, and package visibility. |
| Lifecycle/session | Splash/cold launch, background/kill/resume without crash/freeze; existing sessions and fresh login tested separately. |
| Patch behavior | Positive check for every enabled patch plus negative/control comparison; ad filtering preserves organic ordering, scrolling, and refresh. |
| Regression | Inputs, navigation, network screens, media, background work, one-to-one/group messaging, VoIP, and background chat/call/alert notifications. |
| Provider absent | Installation guidance appears, cancellation leaves normal Zalo use available. |
| Provider present | Account callback replaces stale state; assess transport, token issuance, authorization, and feature access separately. |
| Restore | Initial media restore and a complete backup/restore cycle where supported. |
| Optional coexistence | Renamed-package behavior only where supported by signing/OAuth configuration. |

Test malformed/unexpected intents and unauthorized access where applicable.

## Controlled performance baseline

Measure cold launch and Threads scrolling on stock/control/patched builds using
the same device and network. Capture startup time, frame timing/jank, memory, and
background/network activity; at least three repetitions, with variance recorded.
Set thresholds only after control variance is known. Add backup scheduling when
implemented. Keep traces/heap dumps private and bounded under the
[analysis retention policy](reverse-engineering.md#analysis-workspace); do not make release APKs debuggable.

## Zalo microG/Drive issue checklist

Use the [Zalo microG/Drive guide](zalo-microg.md) to distinguish package discovery,
account-picker behavior, OAuth rejection, and restore failures. Issue #11's local
visibility/download-link fixes still require device confirmation.

## Provider boundaries

Picker or IPC success does not prove authorization for the patched package and
certificate. Treat upstream OAuth attestation rejection as **BLOCKED**, not a
patch failure. Bound and redact request logs; never log credentials or tokens.

## Version update qualification

Before updating supported-version metadata:

1. Verify fingerprints resolve uniquely and ABI compatibility is unchanged.
2. Verify target semantics, not just matching signatures.
3. Repeat build, original-APKM, signing, device, and regression qualification above.
