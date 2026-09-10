# Lessons learned

Incident-driven context, distilled from sibling Morphe patch bundles
(`chiggi_morphe_patches`, see its `RULEBOOK.md`; `FroggoMorphePatches`
Facebook 573 patches) and from this repo's Threads work. Each rule earned
its place because an incident cost someone something —
the "Why" column is the actual incident. Add rows here when it happens to us;
one line each.

Canonical procedures live elsewhere; this file explains *why*, not *how*.
Follow the linked owner doc for the current rule.

Read this before writing a bypass, re-signing a build, or touching release config.

## What is (and isn't) patchable

Canonical bypass recipes: [bypass patterns](bypass-patterns.md).
Authoring policy: [patch development](patch-development.md#file-layout).

| Observation (historical) | Why |
| ---- | --- |
| Before bypassing a server "verdict", grep for the client enum/branch that READS it; if the payload is opaque (ByteString/blob) and only the network layer touches it, there is nothing to bypass. | A "proxy-state bypass" shipped against an opaque server-minted `ByteString` with no client-side `NO_PROXY`/`BLOCKED` enum — the bypass was fictional. |
| Never neuter a stateful echo/ACK protocol; if the client stores a server value and echoes it back on later requests, dropping it self-reports tamper on EVERY request. | Returning Unit in a proxy-state interceptor made the client echo "clean" forever while the server said BLOCKED → 24h account lock for "malicious activity". |
| An `AD_ID`/billing permission does NOT imply a patchable surface; verify real `AdView`/`InterstitialAd`/`BillingClient` usage in app code first. | An app with AD_ID had zero in-app ads and no billing (AdMob string was just the ads-identifier SDK) → nothing to patch. |
| Don't fake an "unlock" for server-config-driven lists; confirm a client gate exists. | Video quality came from a server JSON with no client subscription filter; the real ceiling was server manifest + Widevine — unpatchable. |
| Block screens rendered from server widgets (protobuf-driven fragments re-fetched on every navigation) are not client-patchable; the block text isn't in the APK. | "Go to home" just re-ran the server's own actions → same screen loop. |
| Telemetry-only signals (`isRooted`/`isEmulator`/attestation logged but never gating) must NOT be patched — risk for zero benefit. | Operator feared a block that didn't exist; nothing gated login/playback on those signals. |
| Re-signing + VPN/proxy + client spoofs on a REAL streaming/social/paid account = ban risk; recommend a throwaway account early, official app for the real one. | Re-signed build + VPN got a real account locked 24h. |

## Patching pitfalls

Hunt and authoring owners: [hunt targets](reverse-engineering.md#hunt-targets),
[patch development](patch-development.md).

| Observation (historical) | Why |
| ---- | --- |
| Force boxed getters carefully: returning null NPE-crashes when the caller unboxes; return a safe value instead (e.g. version getter → `"0"`). | A forced-update patch NPE'd because the caller `.intValue()`'d the result immediately. |
| Verify a pasted `.java` isn't truncated (unterminated `/**`): `awk '{o+=gsub(/\/\*/,"&")-gsub(/\*\//,"&")} END{print o}' file.java` must print 0. | A file cut at 80 cols ate method bodies → compile break only surfaced at `:patches:build`. |
| Leave dependency-injected UI SDKs (e.g. CleverTap) intact; disable only standalone telemetry (AppsFlyer, Firebase flags). | CleverTap drives in-app overlays via DI — disabling it crashed parts of the app. |
| Renaming a package can break web-OAuth/App-Links/Google sign-in (package+cert bound); keep rename toggleable and offer label-only as fallback. | Rename risked breaking Google/Apple/OAuth login; only email/password survived. |
| PairIP-style license checks on re-signed builds must be neutered or the app won't open at all; ship that bypass on by default. | Patched app redirected to the Play Store on every launch until the license check was bypassed. |
| Never edit a large shared dispatcher to suppress one caller: patching the shared `refreshForRevisit` itself caused `VerifyError` crashes on some devices. Neutralize the specific callsites instead (const-overwrite the triggering registers before the invoke) and leave the shared method stock. | Froggo Facebook 573 refresh patch: touching the big shared method crashed devices; per-callsite guards in `NewsFeedFragment` worked. |
| SDK verification can fail inside D8 even when Morphe's normal compiler succeeds. | On Threads 445 (`445.0.0.46.83`, versionCode `511507647`), `VERIFY_SDK=1` with the installed Android SDK (`platforms/android-36`, build-tools `36.1.0`) applied all patches but failed verifying the generated `classes6.dex` with an internal `SdkDexVerifier`/D8 `NullPointerException` (`e6.H1()`). Retries pinned to build-tools `36.0.0` (`H2.G1()` returned null) and `35.0.0` / D8 `8.6.2-dev` (`D2.K1()` returned null) reproduced the same failure shape across three D8 versions (`9.0.3`, `8.10.9`, `8.6.2`), pointing at a Morphe-verifier input issue rather than a single bad toolchain version. Stock `classes6.dex` passes the same standalone D8 invocation; `STRIP_SAFE` reproduces the failure and `FULL` instead exceeds the single-dex limit. Waived for this release (owner decision): the same internal NPE reproduces across three D8 versions, so no available toolchain unblocks it, while device QA on the single test phone passed (feed, pagination, video, no crash, no AD_ID). Revisit only if Morphe ships a verifier fix; this waiver is not a patch-success claim for other phones. |
| Never remove an ad provider — filter its output. Deleting the Story-ads provider broke its lifecycle and cold-start logging showed the first Story failing before provider init. Let the provider run stock, then strip ad items from its returned collection at the return boundary. | Froggo Facebook 573 Story-ads patch: provider removal broke cold start; return-value filtering (`instanceof` strip) kept lifecycle intact. |

## App identity, compatibility, and device testing

| Observation | Why it matters |
| ---- | ---- |
| Meta apps may depend on their original package identity even when a resource patch successfully rewrites the manifest. | Threads 445 launched and logged in with `com.instagram.barcelona`, but the renamed `com.instagram.barcelona.morphe.test` build crashed when the first feed loaded (`PostLiveMetricsRepository` NPE). Treat package renaming as best-effort; verify login and feed behavior separately. |
| A Work Profile can isolate app data and install a second copy, but it does not make a differently signed APK with the original package coexist reliably with the stock APK. | Shelter is useful for data isolation, not for bypassing Android package/signature rules. |
| A successful patch run is not runtime proof; test the exact APK installed on the device and retain its input/bundle hashes, options, package ID, and certificate fingerprint. | The 445 build patched successfully and removed visible ads, while the renamed variant failed at runtime; patch-time success alone would not distinguish those outcomes. |

## TV / ABI / install issues

Device procedure owner: [QA checklist](qa-checklist.md).

| Observation (historical) | Why |
| ---- | --- |
| An arm64-only "universal" APK fails `INSTALL_FAILED_NO_MATCHING_ABIS` on 32-bit (armeabi-v7a) TVs; merge the ABI splits into one universal before patching. | An APK shipping only `arm64-v8a` `.so` files failed to install on an armeabi-v7a TV. |
| Morphe Manager auto-selects the config split matching the PATCHING phone, so patching a multi-ABI TV bundle on an arm64 phone drops the other ABI split; feed the Manager a pre-merged universal instead (a patch cannot override split selection). | Phone-patched TV output wouldn't install on a differently-ABI'd Android TV. |
| "Not compatible with your TV" = a REQUIRED `<uses-feature>` the device lacks; check `aapt dump badging` (e.g. `android.software.live_tv required=true` blocks tuner-less devices). Mark it optional — distinct from the touchscreen phone→TV case. | A TV build's required `live_tv` feature blocked Chromecast/Google TV installs. |
| Verify native-lib page-alignment with the REAL tool (`zipalign -c -p 4`), never a hand-rolled offset calc; the Desktop CLI already page-aligns `.so` on rebuild. | A python offset check falsely flagged aligned `.so` files; `zipalign -c` said OK. |
| Mark TV-only apps with an `(Android TV)` suffix in `Compatibility(name)`, verified by a `LEANBACK_LAUNCHER` / `android.software.leanback` manifest check. | TV builds were indistinguishable from phone apps in the Manager list. |

## Signing

Helper owner: `scripts/repatch.sh`. CLI reference: run `java -jar "$MORPHE_CLI" --help`.

| Observation (historical) | Why |
| ---- | --- |
| Morphe.keystore is **BKS**: empty store password, alias `Morphe`, key password `Morphe`. Read/convert it with keytool only via `-provider org.bouncycastle.jce.provider.BouncyCastleProvider -providerpath <desktop-jar>`; plain keytool says "Unrecognized keystore format". | Recovered by listing with the BC provider. |
| The repo's default keystore historically signed with NO password/alias flags; that applied to that BKS store, not to every keystore. `scripts/repatch.sh` supports `KEYSTORE_ALIAS`, `KEYSTORE_PASSWORD`, and `KEYSTORE_ENTRY_PASSWORD` overrides — use them for keytool-made stores (which often lowercase the alias to `morphe`). CLI options need the `=` form (`--keystore-entry-alias=Morphe`), not space-separated. | Both the missing-flag and wrong-alias mistakes cost real build cycles. |
| The CLI's "Keystore does not contain entry with alias Morphe Key" is a MASK for a swallowed earlier error; when signing masks the real failure, build `--unsigned` then sign with `apksigner` (export key to PKCS12 first). If `apksigner` then fails reading the manifest, `zipalign -p -f 4` the APK and pass `--min-sdk-version <N>`. | ~10 cycles chased on a phantom alias error. |

## Feed / list-based removal (ads, promoted items)

Recipe owner: [bypass patterns](bypass-patterns.md). QA owner: [QA checklist](qa-checklist.md#feed-ad-removal-issue-5-regression).

| Observation (historical) | Why |
| ---- | --- |
| "Labels/tags disappeared but the content is still there" is the signature of RELABELING (neutralizing a classification predicate), not removal. Removing means filtering the item out of the visible list; relabeling only hides chrome. | An ad patch that forced the app's isAd predicate false stripped the "Sponsored" tag but left the ad post in the feed (the user-visible bug). |
| In feed-style apps find the single merge/insertion funnel the fetched list passes through and filter there (gap-free, cache stays clean); don't chase per-item render hooks. | Runtime probes showed the feed's only ad signal was one isAd predicate and every page merged through one cache method; no ad-specific construction/insert hook existed. |
| Same-named classes can exist in several dex copies with only ONE active at runtime (legacy/longtail duplicates) — confirm which copy actually runs (entry log markers, counts) before anchoring a fingerprint. | A whole "spool coordinator" layer matched smali perfectly yet never fired; the live copy lived in another dex. |
| When injecting into an unknown list type, don't mutate in place with `Iterator.remove()`: immutable/copy lists throw `UnsupportedOperationException` — swallow it and it silently does nothing. Return a filtered COPY and overwrite the parameter register. | Filter found the ad unit ("DED true") but removed 0 because the list was immutable and the exception was swallowed. |
| Overwriting a suspend/coroutine method's parameter register at entry worked in the observed case because that producer copied params to locals immediately. Re-verify per method: count parameter **words** (wide `J`/`D` take two registers), since param registers are not guaranteed preserved across suspension. | Original code did `move-object v3, pN` right after entry, so a replaced pN flowed into the rest of the method. |
| Give each feed surface its own patch (Feed vs Reels/clips vs Stories) with its own seams; a shared six-seam feed patch that also touched Reels/Stories becomes untestable and unportable. | Froggo Facebook 573 ships Block-Feed-ads, Block-Reels-ads, and Block-Story-ads as three patches; our Hide-ads patch is likewise feed-scoped by design. |
| When hooking a provider's return, read the actual return register and guard it (`require` the opcode is `RETURN_OBJECT` and the register fits the invoke encoding) so drift fails loudly at patch time instead of silently shipping an unfiltered list. | Froggo Facebook 573 Story-ads patch injects its filter before the provider's normal return using the matched return register. |

## Runtime confirmation on non-rooted devices

Dynamic owner: [dynamic confirmation](reverse-engineering.md#dynamic-confirmation-for-runtime-gates).
QA owner: [QA checklist](qa-checklist.md).

| Observation (historical) | Why |
| ---- | --- |
| For runtime flow questions, inject `Log.i(tag, site)` entry markers via a throwaway bytecode patch and read `adb logcat -s <tag>`; avoid frida-gadget on non-rooted phones unless you must. | Gadget CLI attach fought "Failed to spawn: connection closed" and accepted only one connection per app start; logcat-canaries needed no root and no extra tooling. |
| Wireless adb needs no root for install/logcat/uiautomator; the pairing port differs from the connect port on the Wireless-debugging screen. | Repeated "connection refused" until the main listener port was used; adb also drops the listener on phone lock/timeout. |
| When you can't view screenshots (headless/vision-less model), read the screen as text: `uiautomator dump` + grep for labels/content-desc (e.g. an "Ad" tag) to confirm what's rendered. | A screenshot was unreadable by the agent; UI-dump text confirmed the ad was a normal post with an "Ad" tag. |
| Frida-gadget embed needs the `.so` in the target's native dir AND a load trigger; injected smali must respect each instruction's register encoding (some forms address only low registers — the build caught a `v17` that needed a `from16` form). | A high-register move was rejected until the wide-register encoding was used. |

## Build hygiene

Release owner: [release process](release.md). Environment owner: [toolchain setup](toolchain.md).

| Observation (historical) | Why |
| ---- | --- |
| Use only APKMirror for original APKs. Verify versionCode, variant, and hash even when the version NAME matches — fingerprints pin to the code path, not the marketing version. | Pinned `434.0.0.41.74`; tested APKMirror 510406926 while the plan documented 510406907. |
