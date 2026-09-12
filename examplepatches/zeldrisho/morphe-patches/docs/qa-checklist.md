# QA checklist (per release / supported target)

Canonical repeatable device procedure. Other docs link here; they do not restate it.
Manual E2E — run on a **throwaway account** where an account is required
(re-signed build + VPN/proxy on a real account may create account risk; see
[lessons learned](lessons-learned.md#what-is-and-isnt-patchable)). Use the
version and package metadata defined by the target's source of truth.

## Build

```bash
./gradlew :patches:test :extensions:threads:testDebugUnitTest :extensions:zalo:testDebugUnitTest buildAndroid --no-daemon
python3 -m unittest discover -s scripts/tests -v  # offline helper regression tests
```

Shell/shfmt/workflow lint is already covered by the `pre-commit` gate in Verify — do not re-run `shellcheck`/`actionlint` standalone here.

The `.mpp` lands in `patches/build/libs/patches-*.mpp`. Successful Check workflow
runs also retain a `patches-<sha>-<attempt>` artifact for seven days. Record the
run/commit and downloaded bundle hash; CI artifacts are test builds, not releases.

Optional local target validation against the original pinned APK's extracted
`base.apk` (analysis only; actual patching still takes the original split bundle)
should use the target-specific test command and environment variable documented
by that target. No proprietary APK is committed or downloaded by the tests.

## Re-patch + install

```bash
MPP="patches/build/libs/patches-<version>.mpp" \
  bash scripts/repatch.sh /path/to/input.apkm /tmp/patched.apk
# Only update an existing install if its signing certificate matches.
adb install -r /tmp/patched.apk
```

For startup isolation, `repatch.sh` accepts a strict comma-separated patch
allow-list. Use `PATCHES=''` for a minimal patched control with every patch
disabled, then enable the target's patches incrementally. Install and cold-start
each control before enabling the next patch.

```bash
PATCHES='<first patch>' bash scripts/repatch.sh /path/to/input.apkm /tmp/control-1.apk
PATCHES='<first patch>,<second patch>' bash scripts/repatch.sh /path/to/input.apkm /tmp/control-2.apk
```

`PATCHES` disables every bundle patch not named and rejects unknown names;
this prevents a control from silently including default-on patches.

Release QA must include one SDK-verified re-patch (compilation alone only
proves the toolchain ran; the patcher verifier defaults to existence checks):

```bash
MPP="patches/build/libs/patches-<version>.mpp" VERIFY_SDK=1 \
  bash scripts/repatch.sh /path/to/input.apkm /tmp/verified.apk
```

`VERIFY_SDK=1` uses `$ANDROID_HOME` → `$ANDROID_SDK_ROOT` → OS-default SDK
discovery; pass `VERIFY_SDK=/path/to/sdk` to pin a specific SDK. Record the
verification result alongside the bundle/input hashes.

If verification fails identically across the available toolchains with an
internal D8 error (not a patch error), the owner may waive it after passing
device QA: record the waiver, the reproduced versions, and the device
evidence in [lessons learned](lessons-learned.md), and revisit only if Morphe
ships a verifier fix. Do not block a release indefinitely on a broken
verifier.

Record the input APK version/code and hash, bundle path/hash, enabled patches,
package ID, device/Android version, and signing certificate fingerprint (never
passwords). Multiple local bundles can exist; do not assume the helper selected
the newest one — pass `MPP=` explicitly. Offline helper tests verify
orchestration, not real APK signing or device behavior. Keep screenshots, UI
dumps, and logs outside Git; temporary files are not durable evidence. Retain
sanitized notes in the release/PR record.

- [ ] Manifest and package metadata match the intended target; verify removal of
      any permission targeted by a patch.
- [x] Startup & Lifecycle — Pass: SplashActivity launch, cold start,
      background/kill/resume on SM-S936B.
- [ ] Existing-session behavior and fresh-login behavior are tested separately;
      preserve existing data unless the test plan explicitly authorizes reset.
- [ ] Every enabled patch has a positive behavior check and a negative/control
      check proving unrelated behavior remains intact.
- [x] Messaging & Calling — Pass: 1-on-1 chats, group messaging, and VoIP
      calls.
- [x] Notification Preservation — Pass: push notifications received while
      running in background.
- [x] Ad surfaces — Pass: target ad patches active without crashes.
- [ ] Inputs, navigation, network-dependent screens, notifications, media, and
      background work relevant to the target remain functional.
- [ ] For provider-backed authentication, verify account selection, transport,
      token issuance, and feature access separately; record upstream OAuth
      attestation failures as BLOCKED rather than as patch failures. If the
      provider is absent, show installation guidance without blocking normal
      app use; keep request logs bounded and redact credentials and tokens.
- [ ] Optional renamed-package/coexistence behavior is tested when supported by
      the target and its signing/OAuth configuration.

Record each result as PASS / FAIL / BLOCKED with concise evidence. Do not merge
the stable release while required checks remain blocked.

## Version bump (supported target)

For each supported version:

- [ ] Fingerprints still resolve uniquely and the target ABI remains compatible.
- [ ] Re-confirm that each patch target still has the intended semantics; a
      matching signature alone does not prove behavior.
- [ ] Re-run [Build](#build) through device/regression validation for the new
      version before updating the target's version metadata.
