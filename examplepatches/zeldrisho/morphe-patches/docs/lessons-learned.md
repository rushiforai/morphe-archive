# Lessons learned

Incident-driven rules, distilled from a sibling Morphe patch bundle
(`chiggi_morphe_patches`, see its `RULEBOOK.md`). Each rule earned its place
because an incident cost someone something — the "Why" column is the actual
incident. Add rows here when it happens to us; one line each.

Read this before writing a bypass, re-signing a build, or touching release config.

## Bypasses: what is (and isn't) patchable

| Rule | Why |
| ---- | --- |
| Before bypassing a server "verdict", grep for the client enum/branch that READS it; if the payload is opaque (ByteString/blob) and only the network layer touches it, there is nothing to bypass. | A "proxy-state bypass" shipped against an opaque server-minted `ByteString` with no client-side `NO_PROXY`/`BLOCKED` enum — the bypass was fictional. |
| Never neuter a stateful echo/ACK protocol; if the client stores a server value and echoes it back on later requests, dropping it self-reports tamper on EVERY request. | Returning Unit in a proxy-state interceptor made the client echo "clean" forever while the server said BLOCKED → 24h account lock for "malicious activity". |
| An `AD_ID`/billing permission does NOT imply a patchable surface; verify real `AdView`/`InterstitialAd`/`BillingClient` usage in app code first. | An app with AD_ID had zero in-app ads and no billing (AdMob string was just the ads-identifier SDK) → nothing to patch. |
| Don't fake an "unlock" for server-config-driven lists; confirm a client gate exists. | Video quality came from a server JSON with no client subscription filter; the real ceiling was server manifest + Widevine — unpatchable. |
| Block screens rendered from server widgets (protobuf-driven fragments re-fetched on every navigation) are not client-patchable; the block text isn't in the APK. | "Go to home" just re-ran the server's own actions → same screen loop. |
| Telemetry-only signals (`isRooted`/`isEmulator`/attestation logged but never gating) must NOT be patched — risk for zero benefit. | Operator feared a block that didn't exist; nothing gated login/playback on those signals. |
| Re-signing + VPN/proxy + client spoofs on a REAL streaming/social/paid account = ban risk; recommend a throwaway account early, official app for the real one. | Re-signed build + VPN got a real account locked 24h. |

## Patching pitfalls

| Rule | Why |
| ---- | --- |
| Force boxed getters carefully: returning null NPE-crashes when the caller unboxes; return a safe value instead (e.g. version getter → `"0"`). | A forced-update patch NPE'd because the caller `.intValue()`'d the result immediately. |
| Verify a pasted `.java` isn't truncated (unterminated `/**`): `awk '{o+=gsub(/\/\*/,"&")-gsub(/\*\//,"&")} END{print o}' file.java` must print 0. | A file cut at 80 cols ate method bodies → compile break only surfaced at `:patches:build`. |
| Leave dependency-injected UI SDKs (e.g. CleverTap) intact; disable only standalone telemetry (AppsFlyer, Firebase flags). | CleverTap drives in-app overlays via DI — disabling it crashed parts of the app. |
| Renaming a package can break web-OAuth/App-Links/Google sign-in (package+cert bound); keep rename toggleable and offer label-only as fallback. | Rename risked breaking Google/Apple/OAuth login; only email/password survived. |
| PairIP-style license checks on re-signed builds must be neutered or the app won't open at all; ship that bypass on by default. | Patched app redirected to the Play Store on every launch until the license check was bypassed. |

## TV / ABI / install issues

| Rule | Why |
| ---- | --- |
| An arm64-only "universal" APK fails `INSTALL_FAILED_NO_MATCHING_ABIS` on 32-bit (armeabi-v7a) TVs; merge the ABI splits into one universal before patching. | An APK shipping only `arm64-v8a` `.so` files failed to install on an armeabi-v7a TV. |
| Morphe Manager auto-selects the config split matching the PATCHING phone, so patching a multi-ABI TV bundle on an arm64 phone drops the other ABI split; feed the Manager a pre-merged universal instead (a patch cannot override split selection). | Phone-patched TV output wouldn't install on a differently-ABI'd Android TV. |
| "Not compatible with your TV" = a REQUIRED `<uses-feature>` the device lacks; check `aapt dump badging` (e.g. `android.software.live_tv required=true` blocks tuner-less devices). Mark it optional — distinct from the touchscreen phone→TV case. | A TV build's required `live_tv` feature blocked Chromecast/Google TV installs. |
| Verify native-lib page-alignment with the REAL tool (`zipalign -c -p 4`), never a hand-rolled offset calc; `morphe-cli` already page-aligns `.so` on rebuild. | A python offset check falsely flagged aligned `.so` files; `zipalign -c` said OK. |
| Mark TV-only apps with an `(Android TV)` suffix in `Compatibility(name)`, verified by a `LEANBACK_LAUNCHER` / `android.software.leanback` manifest check. | TV builds were indistinguishable from phone apps in the Manager list. |

## Signing (morphe-cli + Morphe.keystore)

| Rule | Why |
| ---- | --- |
| Morphe.keystore is **BKS**: empty store password, alias `Morphe`, key password `Morphe`. Read/convert it with keytool only via `-provider org.bouncycastle.jce.provider.BouncyCastleProvider -providerpath <morphe-cli.jar>`; plain keytool says "Unrecognized keystore format". | Recovered by listing with the BC provider. |
| Default sign = `--keystore Morphe.keystore` with NO password/alias flags; do NOT pass `--keystore-password` (BKS integrity check fails). CLI options need the `=` form (`--keystore-entry-alias=Morphe`), not space-separated. | Both mistakes cost real build cycles. |
| The CLI's "Keystore does not contain entry with alias Morphe Key" is a MASK for a swallowed earlier error; when signing masks the real failure, build `--unsigned` then sign with `apksigner` (export key to PKCS12 first). If `apksigner` then fails reading the manifest, `zipalign -p -f 4` the APK and pass `--min-sdk-version <N>`. | ~10 cycles chased on a phantom alias error. |

## Build / release hygiene

| Rule | Why |
| ---- | --- |
| `patches-list.json` is GENERATED — never hand-edit; run `./gradlew generatePatchesList` and commit the result. | Hand edits drift from sources and leak unrelated work into feature commits via shared generated files. |
| Pin exact `AppTarget` versions; a null ("any") version is rejected by Morphe Manager (the whole source fails to load), and R8-obfuscated bytecode patches only verifiably resolve on the fingerprinted version. | Null versions broke Manager loading; version drift silently broke matches. |
| `gradlew` must be tracked executable (`git update-index --chmod=+x gradlew`); `core.fileMode=false` checkouts silently commit it non-executable. | CI died with exit 126 "Permission denied", so no release was ever cut. |
| The Manager serves the `.mpp` from the GitHub RELEASE named in `patches-bundle.json` — pushing source does nothing until a versioned release is cut. | New patches "not showing in Morphe" while the release stayed stale. |
| Keep unrelated pending work OUT of commits touching shared generated files: restore the other subsystem to HEAD, regenerate, commit, then re-apply. | A pending revert leaked into unrelated commits via `patches-list.json`. |

## Feed / list-based removal (ads, promoted items)

| Rule | Why |
| ---- | --- |
| "Labels/tags disappeared but the content is still there" is the signature of RELABELING (neutralizing a classification predicate), not removal. Removing means filtering the item out of the visible list; relabeling only hides chrome. | An ad patch that forced the app's isAd predicate false stripped the "Sponsored" tag but left the ad post in the feed (the user-visible bug). |
| In feed-style apps find the single merge/insertion funnel the fetched list passes through and filter there (gap-free, cache stays clean); don't chase per-item render hooks. | Runtime probes showed the feed's only ad signal was one isAd predicate and every page merged through one cache method; no ad-specific construction/insert hook existed. |
| Same-named classes can exist in several dex copies with only ONE active at runtime (legacy/longtail duplicates) — confirm which copy actually runs (entry log markers, counts) before anchoring a fingerprint. | A whole "spool coordinator" layer matched smali perfectly yet never fired; the live copy lived in another dex. |
| When injecting into an unknown list type, don't mutate in place with `Iterator.remove()`: immutable/copy lists throw `UnsupportedOperationException` — swallow it and it silently does nothing. Return a filtered COPY and overwrite the parameter register. | Filter found the ad unit ("DED true") but removed 0 because the list was immutable and the exception was swallowed. |
| Overwriting a suspend/coroutine method's parameter register at entry is safe because producers copy params to locals immediately (param registers aren't preserved across suspension); compute the reg as `registerCount - (params+1) + index`. | Original code did `move-object v3, pN` right after entry, so a replaced pN flowed into the rest of the method. |

## Runtime confirmation on non-rooted devices

| Rule | Why |
| ---- | --- |
| For runtime flow questions, inject `Log.i(tag, site)` entry markers via a throwaway bytecode patch and read `adb logcat -s <tag>`; avoid frida-gadget on non-rooted phones unless you must. | Gadget CLI attach fought "Failed to spawn: connection closed" and accepted only one connection per app start; logcat-canaries needed no root and no extra tooling. |
| Wireless adb needs no root for install/logcat/uiautomator; the pairing port differs from the connect port on the Wireless-debugging screen. | Repeated "connection refused" until the main listener port was used; adb also drops the listener on phone lock/timeout. |
| When you can't view screenshots (headless/vision-less model), read the screen as text: `uiautomator dump` + grep for labels/content-desc (e.g. an "Ad" tag) to confirm what's rendered. | A screenshot was unreadable by the agent; UI-dump text confirmed the ad was a normal post with an "Ad" tag. |
| Frida-gadget embed needs the `.so` in the target's native dir AND a load trigger; morphe snippet injection only accepts registers v0-v15 — keep scratch registers low. | v17 in an injected snippet was rejected ("must be between v0 and v15"). |

## Build / tooling environment

| Rule | Why |
| ---- | --- |
| These patch repos need the Android SDK locally even for the Kotlin bundle (the companion extension dex step) — `android-cli` (`android sdk install platforms/android-N build-tools/N`) in WSL is enough; no AVD/system images needed. | `:patches:buildAndroid` failed with "SDK location not found" until `platforms` + `build-tools` were installed. |
| Tool-source docs drift: install lines must match THIS box (Fedora WSL): base tools via `dnf` (`uv`, `rg`), `java`/`jadx`/`apktool` via `brew`, `frida-tools` via `uv tool install`, `adb` + `aapt` from the Android SDK (`platform-tools`, `build-tools/*/aapt2`) managed by `android-cli`, `morphe-cli` jar+wrapper in `~/.local/bin`; `apt`-style lines only apply on Debian/Ubuntu. | Running documented `apt install adb` here did nothing — adb lives in `~/Android/Sdk/platform-tools`, `aapt` in `~/Android/Sdk/build-tools/*`, and `dnf`/`brew`/`uv` are the package managers. |
| The Morphe Gradle plugin (`app.morphe.patches`) resolves from GitHub Packages, which requires credentials even for public packages: `gpr.user`/`gpr.key` in `~/.gradle/gradle.properties` (or `GITHUB_ACTOR`/`GITHUB_TOKEN` env). | Local build failed "plugin not found" until the token was configured. |
| Same version NAME from different mirrors can have different versionCodes (APKPure vs APKMirror) — the smali may still match, but re-verify; fingerprints pin to the code path, not the marketing version. | Pinned `434.0.0.41.74`; tested APKMirror 510406926 while the plan documented 510406907. |
