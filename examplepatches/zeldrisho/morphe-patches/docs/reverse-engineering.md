# Reverse engineering workflow

How to go from an APK file to a working patch in this repo.
Companion doc: [fingerprint guide](fingerprint-guide.md) (writing the actual fingerprint + patch code).

## Pipeline

```
RECON → DECOMPILE → HUNT → WRITE → TEST
```

| Stage | Question | Output |
| ----- | -------- | ------ |
| Recon | What app is this? | Identity + protections + framework notes |
| Decompile | What does it do? | `decompiled/` (jadx Java) + `smali/` (apktool) |
| Hunt | Where is the check? | Smali-verified target (class, method, instruction sequence) |
| Write | How to bypass it? | `Fingerprints.kt` + `*Patch.kt` under `patches/src/main/kotlin/com/zeldrisho/patches/<app>/` |
| Test | Does it match? | `./gradlew buildAndroid`, then apply the `.mpp` in Morphe |

Analysis work lives in this repo's **gitignored `analysis/` scratch workspace**,
for example `analysis/<app>/` with `apk/`, `decompiled/`, `smali/`, and `notes/`.
Never commit analysis inputs or outputs. In the commands below, `<analysis>`
means this repository's `analysis/` directory (use its absolute path or run
relative paths from the repo root).

## Tools

See [toolchain setup](toolchain.md) for the complete inventory and install commands
for Fedora WSL and macOS, including fish PATH setup and the `uv tool` versus `uvx`
decision. The Morphe CLI applies `.mpp` bundles; `scripts/repatch.sh` finds
the Morphe JAR in its standard locations with no setup.

`scripts/apk-recon.sh` wraps the recon step (framework, HTTP/DI/billing
stack signals via DEX strings, obfuscation estimate, split-aware native libs,
recommended next step); `scripts/extract-smali.sh` wraps the
DEX → smali step (including split `.apkm`/`.xapk` handling);
`scripts/hunt-signals.sh <decompiled|smali>` counts protection/billing/ads/Ktor/Koin
signals in one pass before hunting; `scripts/recover-kotlin-names.sh <decompiled>`
rebuilds obfuscated → real Kotlin class names from `@DebugMetadata`/`@Metadata`.

## Recon

Get the original split bundle only from [APKMirror](https://www.apkmirror.com/).
Record the download page URL and input SHA-256 alongside versionCode and ABI.
Run `scripts/apk-recon.sh` (bash; on macOS invoke with Homebrew `bash`, as explained in
[toolchain setup](toolchain.md#1-python-and-host-tools)):

```bash
bash scripts/apk-recon.sh <analysis>/<app>/apk/<app>_<version>.apkm
```

Manual equivalent:

1. `aapt dump badging <apk>` — package, version, versionCode, SDK levels, label, launch activity.
2. `aapt dump xmltree <apk> AndroidManifest.xml | rg -i 'split|requiredSplit'` — split-APK detection.
   For `.apkm`/`.xapk`, extract `base.apk` to a temp dir first and run `aapt` on that.
3. `uvx apkid <apk>` — compiler, obfuscator, packer, anti-debug, anti-VM (per DEX / lib).
4. `unzip -l <apk> | rg '\.dex'` — DEX count.
5. `unzip -l <apk> | rg 'index.android.bundle|libflutter|libapp'` — framework:
   `index.android.bundle` = React Native, `libflutter.so`/`libapp.so` = Flutter,
   `assets/www|public/` = Cordova/Capacitor, `libmonodroid.so|assemblies/` = Xamarin/MAUI,
   else native (Compose vs Kotlin distinguished via `androidx.compose` / `kotlin_module`
   DEX strings — `apk-recon.sh` does all of this automatically).
6. Record native-lib architectures and notable permissions (billing, internet, etc.).
7. Note HTTP/DI/billing stack signals from the recon report (Retrofit/OkHttp/Ktor/Apollo,
   Hilt/Koin, RevenueCat/Adapty/Play Billing) — they pick the hunt patterns in
   [Hunt targets](#hunt-targets).

Save as `<analysis>/<app>/notes/recon.md` (rename the APK to `<app>_<version>.<ext>`).

## Decompile

```bash
jadx -d <analysis>/<app>/decompiled <analysis>/<app>/apk/<app>_<version>.apkm
bash scripts/extract-smali.sh <analysis>/<app>/apk/<app>_<version>.apkm <analysis>/<app>/smali
```

### Remote decompilation for large APKs

Local jadx can OOM on large APKs:

```bash
KAGGLE_API_TOKEN=... KAGGLE_KERNEL_ID=user/jadx-apk-decompiler \
  bash scripts/remote-decompile.sh "<direct-apk-url>" <analysis>/<app>/
cd <analysis>/<app> && unzip *_decompiled.zip -d decompiled/
```

Needs the `kaggle` CLI plus a private Kaggle notebook with internet access.
The URL must be a direct download link (mirror links expire in ~1 hour — use a fresh one).

Notes:

- If you have a big machine handy, local `jadx` there works too — the rest of the
  workflow only needs the files copied back.
- `"finished with errors"` from jadx is normal for obfuscated apps. Continue as long
  as `.java` files were produced.
- Always extract smali from **all** DEX files; the class you need is often in
  `classes2.dex` or later, not `classes.dex`.

## Hunt targets

Search in a fixed order — protections first, because an integrity/root check will
break testing of everything else. Start with a one-pass triage:

```bash
bash scripts/hunt-signals.sh <analysis>/<app>/decompiled [--files]
```

`scripts/hunt-signals.sh` is the canonical pattern list. The buckets below
summarize intent only; read the script for exact expressions. When a pattern
changes, update the script first, then the recipe that motivated the change in
[bypass patterns](bypass-patterns.md).

- **BuildConfig sweep** (usually not obfuscated — base URLs, flavors, keys):
  search `BuildConfig.java` files for base URLs, flavors, and API keys.
  Read every hit; each Gradle module emits its own file.
- **Protections** — integrity/license, signature verification, root, pinning.
- **Billing SDK detection** — tells you which bypass recipe applies
  (RevenueCat, Adapty, Play Billing, LVL, local gates, remote config).
- **SDK-specific search** — entitlement chains, purchase queries, or local
  `isPremium`-style fallbacks.
- **Ads** — `load`/`show`/`initialize` entry points. SDK class names are stable;
  app class names are not.
- **Feature gates** — remote-config and feature-flag reads.
- **Modern Kotlin stacks** (when Retrofit patterns miss — KMP/Kotlin-only apps):
  Ktor, Apollo, Koin, and request-signing signals.

### Learning from other patch projects

Treat another project's hooks and symbol maps as candidate evidence, not a
compatibility guarantee. Runtime-hook frameworks (such as LibXposed) and Morphe
APK rewriting have different capabilities; transfer target knowledge and safety
invariants rather than copying framework infrastructure.

1. Record the reference repository revision and exact target profile. Compare
   like-for-like artifact hashes: a profile's base-APK hash must be compared with
   our extracted original `base.apk`, not the enclosing APKM or re-signed output.
   A matching versionCode alone is insufficient.
2. Independently verify candidates in our input's smali. Record owner/signature,
   semantic anchors, field relationships, callers/consumers, intended mutation,
   and regression risks in local analysis. Reject ambiguous matches; heuristic
   scores and upstream verification labels do not replace evidence.
3. Trace the state around the target. UI removal can require consistent lists,
   counts, indices, parallel arrays, adapters, and startup selection. Suppression
   should target specific branches or writes, preserving unrelated operations
   and unknown inputs rather than disabling whole subsystems.
4. Borrow negative test cases as well as intended behavior: operational alerts
   and ordinary messages must survive notification filtering, for example.
   Do not silently import the reference project's broader feature scope.
5. Distinguish fingerprint match, patch application, app launch, target-path
   execution, and observed behavior in the [QA record](qa-checklist.md).
   An installed hook or successful build does not prove the feature worked.
6. Check licensing before copying code; retain required notices for copied
   substantial portions. Remote catalogs, settings, recording, and diagnostics
   infrastructure require separate scope decisions, not automatic adoption.

Reference inspected: the separate `zalo-patch` checkout at commit `deadb56` (MIT).
Useful entry points, relative to that repository:

- `app/src/main/assets/symbol-schema.json`: versioned symbols and artifact
  identities. Its 260801903 profile is labeled static-verified; the 260802903
  profile is labeled device-verified. These are upstream claims, not our QA.
- `app/src/main/java/com/ez/zalopatch/xposed/features/`: target semantics and
  surrounding state, especially `BottomTabsFeature.java` and `TelemetryFeature.java`.
- `app/src/main/java/com/ez/zalopatch/NotificationPromoClassifier.java`:
  notification preservation rules; its content classifier is not equivalent to
  our dispatcher-branch filtering.
- `app/src/main/java/com/ez/zalopatch/FingerprintResolver.java`: evidence and
  ambiguity checks. It explicitly implements a shadow resolver, not runtime
  hook selection; its scoring thresholds are not established confidence levels.

This was a source inspection, not a build or device validation. Recheck these
references if the checkout changes. Keep extracted symbol tables and APK evidence
in gitignored `analysis/`, not in feature-specific session documents.

### Investigating data-migration patches

External transfer utilities can suggest a user workflow without supplying any
patch targets. Reference inspected: the separate `zalo-transfer-data` checkout at
`3672218`, source only; no execution or device validation. Its `app/services.py`
copies the external `Android/data/com.zing.zalo` tree through ADB and still relies
on Zalo's own message backup. It does not demonstrate private-database recovery,
decryption, or a native transfer hook. Do not copy its source-video deletion,
destination wipe, or unconditional deletion of the recovery archive on failure.

Apply these principles when investigating any app's local-data patch:

- **Execution context changes feasibility, not portability.** An injected
  extension runs with the host app's permissions and can access its own app data
  without ADB. This does not grant access to another installation's sandbox or
  make encrypted files portable across devices, accounts, or reinstalls.
- **Prefer native machinery.** Find existing backup/import/phone-transfer flows
  before designing a replacement. Verify entry points, prerequisites, callers,
  and restore ordering in smali and on-device; a hidden screen alone does not
  establish a working local export. New UI needs explicit scope approval under
  the [standing rules](maintenance.md#standing-rules).
- **Separate media from messages.** External-file copies do not establish chat
  recovery or attachment associations. Trace databases, attachment references,
  consistent snapshot handling (including SQLite WAL), and key lifecycle.
  Android Keystore or device/account-bound keys can prevent raw-copy restoration;
  in-process file access alone is insufficient evidence.
- **Account for the first migration.** A re-signed APK normally cannot update
  over stock. An in-app patch cannot recover stock private data after uninstall;
  initial migration needs a supported stock export/backup route. Distinguish
  stock-to-patched, patched-to-patched, and cross-device recovery claims.
- **Design for recovery before convenience.** Export through a user-selected
  document destination outside app-owned storage so uninstall does not remove
  the backup. Preserve source data and recovery copies; validate archive paths,
  integrity, account/schema compatibility, and storage capacity before writes.
  Use bounded extraction and recoverable staging rather than wiping live data.
  Treat archives as sensitive; keep chat contents, credentials, and keys out of
  logs and committed analysis.
- **Prove a round trip.** Test with disposable data: same-device reinstall,
  cross-device recovery if claimed, media-to-message associations, incompatible
  accounts/versions, corrupt archives, and interrupted transfers. Archive size,
  successful extraction, and app launch are not restoration proof. Do not change
  the existing [reinstall order](qa-checklist.md#re-patch--install) based only on
  an external utility's instructions.

Keep app-specific symbols and experimental results in gitignored `analysis/`;
keep outstanding scope decisions in [the plan](plan.md), not a session transcript.

### Recover Kotlin names for obfuscated Kotlin apps

R8 renames JVM symbols, but builds that keep `@DebugMetadata`/`@Metadata` strings
leave a trail back to the original names. (Stripped or DexGuard-style builds may
not; treat recovery coverage as best-effort.) Before tracing call flows, rebuild
the real names:

```bash
bash scripts/recover-kotlin-names.sh <analysis>/<app>/decompiled <analysis>/<app>/mapping
# → mapping.tsv / mapping.json / by_package/
```

Use the mapping to *find* classes (never to *match* — fingerprints still anchor on
SDK calls/strings/opcodes per the [fingerprint guide](fingerprint-guide.md)).
`jadx --deobf` alone is not equivalent: it invents synthetic names instead of
recovering the originals.

Obfuscation-resistant fallback: when call sites inline to `a.b(c, "…")`, grep the
path literals themselves — R8 does not obfuscate string contents:

```bash
rg -o '"(/[A-Za-z0-9_{}.\-]+(/[A-Za-z0-9_{}.\-]+)+/?)"' <analysis>/<app>/decompiled -g '*.java'
```

### Dynamic confirmation for runtime gates

Static locates, dynamic confirms. For runtime gates (pinning, root, signature,
request signing), confirm the candidate actually runs before freezing a
fingerprint. For pure static string gates (feature flags, manifest-gated ad SDK
entry points), static smali evidence alone is acceptable; dynamic confirmation
stays recommended but optional.

Prerequisites: USB debugging on, target device visible via `adb`, `frida-server`
matching the device ABI running. On a non-rooted, non-debuggable Android build,
ADB visibility alone is insufficient for Frida attach: use an early-loaded
Gadget in a disposable repackaged build instead. An integrity check may terminate
that build before an attached script runs; autonomous Gadget script mode or a
rooted `frida-server` is required for earliest hooks. Keep instrumentation builds
and signing keys outside the release pipeline. Stop with `Ctrl-C` (no device
state is modified by the hooks below). Setup lives in [toolchain setup](toolchain.md#python-applications-persistent-tools-versus-one-shot-runs).

```bash
adb devices && frida-ps -U                 # device + target process visible
frida -U -f com.target.app -l hook.js --pause   # spawn early, don't attach late
```

`--pause` leaves the main thread paused after spawning; omit it to let the app
run immediately. If the installed Frida CLI reports a different flag set, check
`frida --help` on that host before scripting it.

Minimal hooks (log first, mutate only after you see traffic):

```javascript
function bytesToHex(b) { return Array.from(new Uint8Array(b)).map(x => ('0' + (x & 0xFF).toString(16)).slice(-2)).join(''); }
// Enable only for a disposable test account; never share raw capture logs.
const CAPTURE_CRYPTO_BYTES = false;
// Cryptographic metadata only by default.
Java.perform(function() {
  Java.use("javax.crypto.spec.SecretKeySpec").$init.overload('[B', 'java.lang.String')
    .implementation = function(k, a) {
      console.log("[key] algorithm=" + a + " bytes=" + k.length);
      if (CAPTURE_CRYPTO_BYTES) console.log("[key] raw=" + bytesToHex(k));
      return this.$init(k, a);
    };
  Java.use("javax.crypto.Cipher").doFinal.overload('[B')
    .implementation = function(b) {
      console.log("[cipher] algorithm=" + this.getAlgorithm() + " inBytes=" + b.length);
      if (CAPTURE_CRYPTO_BYTES) console.log("[cipher] in=" + bytesToHex(b));
      var r = this.doFinal(b);
      console.log("[cipher] outBytes=" + r.length);
      if (CAPTURE_CRYPTO_BYTES) console.log("[cipher] out=" + bytesToHex(r));
      return r;
    };
});
// OkHttp request / response (skip if okhttp3.* absent — R8-relocated; use TrustManager hooks instead)
Java.perform(function() {
  Java.use("okhttp3.RealCall").execute.implementation = function() {
    console.log("[http] " + this.request().method() + " " + this.request().url().toString());
    var r = this.execute(); console.log("[http] code=" + r.code()); return r;
  };
});
// Pinning triage: try one-click first, hand-roll only on failure (same command as below)
```

Order: `uvx objection --gadget com.target.app explore -s "android sslpinning disable"` → generic unpinning script
(`CertificatePinner.check` + `TrustManagerImpl.verifyChain` +
`HostnameVerifier.verify`) → hand-written hook for the app's exact class found in
[Hunt targets](#hunt-targets). If the app exits on inject, suspect anti-Frida (port/file self-check) — switch
to `frida-gadget`/Zygisk rather than grinding more static patterns. Log the
confirmed class/method/args into `notes/<topic>.md` alongside the smali quote;
a fingerprint with static smali plus one dynamic observation outlives refactors
that kill static-only guesses for runtime gates.

### Smali verification is mandatory

Never trust jadx output alone — it mis-decompiles obfuscated code. For every candidate:

1. Find the smali file across **all** DEX dirs: `find <analysis>/<app>/smali -name '<ClassName>.smali'`.
2. Read the exact method: `rg -B 2 -A 50 '\.method.*<methodName>' <file>`.
3. Record: access flags, return type (the descriptor after `)` in the method header),
   full parameter descriptors, register count, invoke sequence **in order**, and which
   DEX it came from.
4. If Java and smali disagree, **trust smali**.
5. Write the finding down (`<analysis>/<app>/notes/<topic>.md`) with the smali evidence
   quoted, plus a fingerprint strategy (which stable strings/calls to match on —
   see the [fingerprint guide](fingerprint-guide.md)). Unverified findings are not ready for patch-writing.

## Write the patch

Covered in the [fingerprint guide](fingerprint-guide.md) and
[patch development](patch-development.md). The handoff from hunting is:

- Fully qualified class + exact smali method signature ([smali verification](#smali-verification-is-mandatory), mandatory).
- Ordered instruction sequence (invoke calls / const-strings).
- Dynamic confirmation for runtime gates (Frida log of class/method/args,
  [dynamic confirmation](#dynamic-confirmation-for-runtime-gates)); static-only is
  acceptable for pure static gates, draft status otherwise.
- Suggested bypass (`addInstructions` override, instruction replacement, etc.).

## Test the patch

```bash
./gradlew buildAndroid
```

Check the patch is registered (`list-patches` in the Morphe CLI against
`patches/build/libs/patches-*.mpp`), apply to the **downloaded split bundle**
(never an extracted `base.apk`), install via `adb install -r`. If a fingerprint fails to
match, go back to the hunt step and re-verify smali — the app version probably
moved the code.
