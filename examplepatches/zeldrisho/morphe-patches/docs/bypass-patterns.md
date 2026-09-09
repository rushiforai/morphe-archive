# Bypass patterns

Optional starting recipes for common patch goals, distilled from community patch repos.
Always confirm against the target app's smali before writing a fingerprint
(see [hunt targets](reverse-engineering.md#hunt-targets)); adapt register use to the method
(see [bytecode reference](bytecode-reference.md)).

`scripts/hunt-signals.sh` owns the exact search expressions. The tables below name
the signal family only; do not copy expressions from here into scripts.

## Which billing system? (decision guide)

```
RevenueCat (CustomerInfo/EntitlementInfos) → entitlement-check override
Google Play Billing (BillingClient/Purchase) → purchase/result override
Client-side integrity/license (Pairip etc.) → response-code + validation bypass
SharedPreferences flag (isPremium/isPro) → getter override
Remote-config gate (getBoolean) → key override
Legacy license checker (LVL Policy) → skip check / force LICENSED
Enum tier (SubscriptionTier.PRO) → return premium constant
Complex license object → injected factory method + redirect
```

| System | Approach |
| ------ | -------- |
| RevenueCat | Match the `CustomerInfo → getEntitlements → getActive` chain, override to allowed |
| Play Billing | Override the purchase check or force `BillingResponseCode.OK (0)` |
| Integrity/license, client-side | Zero the license response code, short-circuit the validator (never beats server attestation) |
| Prefs flag | Override the `isPremium`-style getter |
| Remote config | Override `getBoolean` for the gating key |
| Enum tier | `sget-object` the premium constant, `return-object` |
| Constructed license object | Inject a static factory that builds a "paid" object; redirect the getter to call it |

## Ads (per SDK)

1. Run `scripts/hunt-signals.sh` and work the `ads` bucket it reports.
2. Per SDK found, neutralize its `load`/`show`/`initialize` entry points on the SDK's
   well-known (non-obfuscated) classes — e.g. AdMob banner/interstitial/native/rewarded/app-open
   loaders, Unity `initialize`/`isInitialized`/`load`/`show`, Meta `loadAd`/`show`, and so on.
3. Don't forget mediation adapters — they re-enable ads behind the main SDK's back.

SDK class names are stable; the app's own ad-wrapper classes are obfuscated — anchor
fingerprints on the former. For feed-style apps, runtime list filtering via an extension
(drop promoted items) survives layout changes better than hiding individual views.

## Protections

| Protection | Signal family (see `hunt-signals.sh`) | Neutralize |
| ---------- | -------------------------------------- | ---------- |
| Root (incl. Firebase root checks, RootBeer, Magisk paths) | root | Force `false` on each check |
| SSL pinning (OkHttp `CertificatePinner`, custom `TrustManager`) | pinning/trust | `return-void` the `check` methods |
| Signature verification | signature | Return the original hash/bytes; deepest option is an `Application`-level hook (see below) |
| Play Integrity / license response | integrity/license | Client-side bypass only (see billing table) |
| Emulator / debug | emulator/debug | Force `false` / skip |
| Update nag | version/update check | Early return / `return-void` |

Signature-spoof depth ladder (shallow → deep): return the original hash string →
return raw signature bytes (`new-array` + `fill-array-data`) → manifest-swapped
`Application` subclass intercepting checks → `PackageInfo.CREATOR` replacement so
every SDK reader sees the spoofed signature. Pick the shallowest level that works.

### Dynamic confirmation (Frida — which hook proves which protection)

Static hunt finds candidates; a short Frida run decides the patch shape.
Setup and invocation live in
[dynamic confirmation](reverse-engineering.md#dynamic-confirmation-for-runtime-gates);
always run objection via `uvx objection`.

| Protection | Confirm with | Patch implication |
| ---------- | ------------ | ----------------- |
| SSL pinning, OkHttp 3/4 `CertificatePinner` | `uvx objection --gadget com.target.app explore -s "android sslpinning disable"`, else hook `CertificatePinner.check(String, List)` → log host | `check` returns void: bypass with `return-void`; if only some hosts fail, both OkHttp **and** `HttpsURLConnection` paths exist — hook `checkServerTrusted` + `HostnameVerifier.verify` too |
| SSL pinning, Conscrypt `TrustManagerImpl` | Hook `verifyChain` → log host; Burp shows cert errors until bypassed | `verifyChain` returns the chain: bypass by returning the untrusted chain as-is (passthrough, **not** `return-void`); note the AOSP version — impl signature moves across API levels |
| Root (`isRooted`/`RootBeer`/su paths) | Hook `File.exists` + `Runtime.exec(String)` → log blocked path/cmd | Force `false` on each Java check **and** hide su paths; one bypass rarely covers all SDKs |
| Emulator / debug | Spoof `Build.*` fields, hook `Debug.isDebuggerConnected` → `false` | Test-only bypass; ship only if the check blocks patched-app launch |
| HMAC / request signing | Hook `SecretKeySpec.$init` (algo+key) + `Mac.doFinal` (input→tag) | Decides bulk-string vs interceptor approach: static secret → replace `const-string`; derived key → hook builder/interceptor |
| WebView-gated flow | Hook `loadUrl` / `evaluateJavascript` → log URL (first 200 chars) | Often a URL allowlist — patch the gate, not the renderer |

Rule: log parameters + return values first, mutate second. A confirmed
`class.method(args)` triple goes into the hunt notes next to the smali quote
(see [dynamic confirmation](reverse-engineering.md#dynamic-confirmation-for-runtime-gates))
and becomes the fingerprint anchor.

## Analytics and Firebase

Cheapest first: manifest `meta-data` flags (`firebase_analytics_collection_deactivated`,
`firebase_crashlytics_collection_enabled=false`, performance/ad-ID flags) and removing
measurement receivers/services — all `resourcePatch` work, no fingerprints needed. Then
bytecode: disable init/getter entry points (Crashlytics `getInstance`, Advertising ID
client), spoof the ad ID, spoof the Firebase certificate hash after re-signing. For
tag-dispatched telemetry (one dispatcher, many event tags), generate one guarded block
that `return-void`s on each blocked tag instead of writing N patches.

## Universal (app-agnostic) patches

- **Screenshot:** clear `FLAG_SECURE` (`and-int` the window flags) and/or remove
  `registerScreenCaptureCallback` calls via instruction transform.
- **Mock location / ADB / emulator hiding:** rewrite the corresponding platform-call
  results (`isMock` → false, `Settings.Global.getInt` for ADB → 0).
- **Certificate transparency for debugging:** inject a `network_security_config` that
  trusts user CAs (`resourcePatch` on the manifest + a new XML).
- **Ktor pinning (Kotlin apps):** same `checkServerTrusted`/`TrustManager` hunt as OkHttp,
  plus Ktor `defaultRequest`/engine config; Koin bindings (`single {}`/`factory {}`)
  locate which client impl is actually wired.
- **Crash reporting off-switch:** manifest `meta-data` (Sentry `io.sentry.enabled=false`, …).
- These scan every class, so implement them as instruction transforms with tight
  filters — broad matchers are slow and risky.

## Advanced techniques (when simple overrides don't fit)

- **Method injection:** synthesize a static method on the target class (fake license
  object, sponsored-content helper) and redirect the original to call it. Needed when
  the patch must *return* something complex, not just a boolean.
- **Bulk string replacement:** `matchAll()` over a string-anchored fingerprint, swapping
  each occurrence's `const-string` (endpoints, client IDs, redirect URIs).
- **JSON key bogusing:** replace a JSON field name with a bogus string so the parser
  silently drops the item — handy for feed filtering without touching layout code.
- **HTTP interception:** hook the OkHttp builder to install an interceptor; most powerful
  for API-driven apps (modify requests/responses globally).
- **Extension delegation:** inject a one-line `invoke-static` into bytecode and put the
  real logic (settings checks, player seeking, type checks) in Java — see
  [patch development](patch-development.md#extensions-vs-inline-smali) for the split rules.
- **Resource-limit overrides:** some gates live in `res/values/*` (max counts) or
  localized `strings.xml` — a `resourcePatch` beats a fingerprint there.

## App architectures (where to look)

| App type | Detect | Patch surface |
| -------- | ------ | ------------- |
| Native Java/Kotlin | Default (DEX holds the logic) | Standard jadx + smali + fingerprint flow |
| React Native | `index.android.bundle` in assets | JS via Hermes-level replacement; native modules normally |
| Cordova / Capacitor | `assets/www/` or `assets/public/` shell | HTML/JS — unzip and inspect, no DEX work |
| Xamarin / .NET MAUI | `libmonodroid.so` or `assemblies/` | .NET DLLs via ILSpy/dotPeek; jadx shows only the host |
| Flutter | `libflutter.so` / `libapp.so` | Compiled Dart in `libapp.so` — binary `hexPatch`, or attack the platform-channel bridge instead |
| Kotlin Multiplatform | — | Same as native (shared code compiles to DEX) |
| DEX-loading (plugins) | `DexClassLoader\|loadClass` | Patch the loader or the loaded code |

Start every hunt with `scripts/hunt-signals.sh`, then the manager/billing class names
(`SubscriptionManager`, `BillingManager`, `PurchaseManager`, `LicenseManager`) and the
generic gate names (`isPremium|isSubscribed|hasPurchased|isFeatureEnabled|canAccess|isUnlocked|isPro`) —
they locate the billing neighborhood in any native app.
