# Wispr Flow Android — static analysis note

**Artefact**: base APK of `wispr-flow-2.6.2.xapk` (71 683 304 bytes)
**SHA-256**: `3401144f705912c4b53c4f3142290e4b6333e705456f420a1023bf0a69691286`
**Package**: `com.wispr.flowapp` — minSdk 33 (Android 13), targetSdk 36
**AOSP line numbers** below refer to the 2.6.2 smali as produced by apktool.

Static analysis only. Nothing was executed, no account was created, and no server was contacted
apart from the public endpoints in §3.3.

---

## 1. Executable summary

| Question | Answer | Evidence |
|---|---|---|
| Architecture | Kotlin/Compose, 5 DEX (~49.6 MB), **no native library**: all ASR is server-side | zip inventory |
| STT inference | bidirectional gRPC streaming to **Baseten** (`flow_api.v1.TranscriptionService/Transcribe`) | `flow_api/v1/TranscriptionServiceGrpc.smali` |
| Endpoint discovery | GET `https://inference-info.wisprflow.com/dictation_url.txt` + allowlist + geo probe | `transcription/GetGrpcUrlLogic.smali`, `grpc/GrpcGeoProber.smali` |
| Auth | Supabase (project `dodjkfqhwrzqjwkfnthl`) + `Authorization: Bearer` header | `supabaseBearerInterceptor`, DEX strings |
| Product API | generated OpenAPI (`com.wispr.flow.openapi`), base `https://api.wisprflow.ai` | 2 786 class refs + `api/v1/...` paths |
| Text insertion | **AccessibilityService**, no bundled keyboard | `BIND_ACCESSIBILITY_SERVICE`, `FlowAccessibilityService`, `ui/accessibility` (161 classes) |
| Monetisation | **RevenueCat** (`flow_pro`), paywalls, entitlements, offline entitlements | `Lcom/revenuecat/purchases/...`, `payment/**` |
| Free tier | 1000 words/week (soft), block at 1500, warning at 800 | `payment/wordlimit/WordLimitPolicy.smali` |
| Anti-tamper | **Google Play PairIP** (`com.pairip.*`, LicenseClient, VMRunner) | DEX strings + manifest |
| Analytics | PostHog (`eu./us.i.posthog.com`), Firebase, Sentry, AppsFlyer, RevenueCat | DEX strings |

---

## 2. The dictation chain

### 2.1 Pipeline

```
microphone (VoiceRecorder, AudioRecord)
  └─ AudioBatcher (audio packets)
       └─ TranscribeGrpcInteractor / GrpcStreamingClient
            └─ bidirectional gRPC flow_api.v1.TranscriptionService/Transcribe
                 ├─ host: model-v31pl413.grpc.api.baseten.co or inference.wisprflow.com (default)
                 └─ headers: baseten-authorization, baseten-model-id, Authorization
       ← response stream: Result / State (raw_text, formatted_text) / Heartbeat
  └─ insertion: FlowAccessibilityService → text pasted/typed into the foreground app
```

Key classes (smali): `transcription/VoiceRecorder`, `transcription/AudioBatcher`,
`transcription/GrpcRequestBuilder`, `transcription/TranscribeGrpcInteractor`,
`transcription/TranscribeRepository`, `transcription/DictationStateManager`
(`Idle → Initializing → Listening → Processing → Error`), `transcription/DictationReliabilityGate`,
`grpc/FlowClient`, `grpc/GrpcChannelProvider`, `grpc/GrpcGeoProber`, `grpc/GrpcHostResolver`.

### 2.2 The gRPC client repairs itself

* `GrpcGeoProber` asks the API for a server list, pings each, keeps a `PingResult(modelId,
  latencyMs)` and retains the winner (`gRPC geo probe complete: winner=` log).
* `GrpcChannelProvider` warms and closes channels (`GrpcChannelProvider: warming ...`).
* `GetGrpcUrlLogic.validate()` filters the received URL against an **allowlist** before caching
  it: `inference.wisprflow.com` ("inference" region) and `model-v31pl413.grpc.api.baseten.co`
  ("baseten" region). URL cache TTL is server-driven.

### 2.3 Protocol schema (reconstructed from protobuf field descriptors)

Service: `flow_api.v1.TranscriptionService`, methods **`Transcribe`** and **`TranscribeStream`**.

**Client → server** (`flow_api.v1.Request`, oneof):

| # | Field | Role |
|---|---|---|
| 1 | `init` | `metadata` (user_id, session_id, request_id, audio_encoding, environment, client, debug, referral_code, always_wait_scribe), `preferences` (user, language, vocabulary, replacements, style_config), `state` |
| 2 | `context` | `app` (name, bundle_id, url, type), `textbox` (contents, before_text, selected_text, after_text), `vocabulary` (dynamic), `user_identifier`, `content_text`, `content_html`, `session_dictation_apps`, `screenshot` (bytes), `conversation` |
| 3 | `payload` | `audio_packets` (streaming) or `audio_file` |
| 4 | `commit` | end of utterance, triggers transcription |

**Server → client** (`flow_api.v1.Response`): `result`, `state` (`progress`, `raw_text`,
`formatted_text`, `confidence`, `user_actions`, `candidate_beams`, `audio_snr`, `audio_volume`,
`mean_alignment_score`), `all_states`, `heartbeat`.

Other messages: `Metadata`, `Preferences`, `Personalization` (+ `SignatureStyle`, `TaggingStyle`,
`GeneralWritingStyle`), `Replacements`, `StaticVocabulary`/`DynamicVocabulary`, `Textbox`,
`Client`, `Language`, `TranscriptionStats`, `WordAlignment`, `ResponseTime`, `SkipAhead`,
`Progress`, `Text`.

What this reveals: personal writing style, dictionary, replacements and target-app context —
including the text already in the field and, optionally, a screenshot — leave with the audio.
That is what produces the contextual clean-up and formatting, and it is the main privacy point.

### 2.4 Latency: request prefetch

`GrpcRequestBuilder` builds an `Init` request **in advance** and queues it before the microphone
is pressed (`GrpcStreamingClient: prefetched request has no Init — dropping style config`
confirms the path). Closing the audio queue triggers the commit.

---

## 3. Network and services

### 3.1 Product backend

* Base: `https://api.wisprflow.ai` — generated OpenAPI client (`apis/`: `LLMApi`, `SyncApi`,
  `NotesApi`, `TodosApi`, `TeamsApi`, `DashApi`, `GeoApi`, `SMSApi`, `ConnectorsApi`, …).
* ~150 `api/v1/...` paths: dictionary (personal/team/admin), snippets, styles, contacts,
  calendar + notetaker, OAuth connectors, teams/enterprise (audit logs, cost centers), analytics,
  `api/v1/dash/api`, `api/v1/context`, `api/v1/llm/api`.
* Auth: `Authorization: Bearer <jwt>` through `supabaseBearerInterceptor`; Supabase project
  `https://dodjkfqhwrzqjwkfnthl.supabase.co` (anon key embedded in the APK, normal client use).

### 3.2 Embedded third parties

| SDK | Role | Traces |
|---|---|---|
| RevenueCat (+ paywall UI, Amazon, SimulatedStore) | subscriptions, paywalls, entitlements | public key `goog_GYFlhLDUKlgiAoqnHzlICtioLeB`, `api.revenuecat.com`, `api-paywalls.revenuecat.com` |
| PostHog (EU + US) | product analytics, feature flags | `eu.i.posthog.com`, `RemoteConfigKeys` |
| Firebase (Analytics, Messaging, Installations) | push, analytics | `app-measurement.com`, `FirebaseMessagingService` |
| Sentry | crashes + `SentryInitProvider` | `io.sentry.*` |
| AppsFlyer | attribution | `appsflyer_*` rules, `%sconversions.%s` |
| Google Play Billing + **PairIP** | purchases + anti-tamper | `com.android.billingclient`, `com.pairip.licensecheck.*` |
| LinkedIn | sign-in/sharing | `ui/linkedin`, `www.linkedin.com/in/me/` |

### 3.3 Public endpoints checked (GET, unauthenticated)

```
GET https://inference-info.wisprflow.com/dictation_url.txt
→ 200 text/plain, body: "inference.wisprflow.com"
```

The only endpoint queried from this container. `api.wisprflow.ai/v1/health/connectivity` answers
`{"detail":"Not Found"}` (non-public route).

---

## 4. Monetisation and limits

### 4.1 Free-tier constants

`com/wispr/payment/wordlimit/WordLimitPolicy`:

| Constant | Value | Meaning |
|---|---|---|
| `WARNING_THRESHOLD_USED` | `0x320` = **800** | first warning |
| `SOFT_LIMIT` | `0x3e8` = **1000** | end of the free weekly quota |
| `HARD_CAP` | `0x5dc` = **1500** | hard block |
| `WEEK_MS` | `0x240c8400` = **604 800 000 ms** | window = 7 days |

`computeGate(...)` produces a `DictationGate`: `Allow` | `Warn` | `SoftLimit` | `Block`.
`DictationStartGate.decide(gate, …)` turns that into a UI decision:
`Start` | `Warn` | `SoftLimit` | `Block` | `MicPrompt` | `NotSignedIn`.

The state lives in `payment/wordlimit/WordLimitEngine` (`projection`, `sync`, `resolvePlan`),
with `WordLimitNotificationCoordinator` / `WordLimitNotifier` (quota notifications) and
`WordLimitSheetActivity` + `WordLimitSheetContent` (the upsell sheet).

### 4.2 Entitlement

* Entitlement identifier: **`flow_pro`**; `StoreEntitlement(isProActive=…)` and `isProOrProTrial=`
  (analytics) are the two booleans that drive the Pro UI.
* `payment/MonetizationGate` reads a variant flag (`VariantIsTestStateFlow`) from
  `FeatureFlagStateHolder`: paywalls and limits are **remote-controlled**.
* RevenueCat also holds **offline entitlements** (local cache), which is worth knowing to
  understand what still holds without a network.
* Internal tools ship in the build (`payment/internaltools/`: `SimulatedPlanPreset`,
  `SimulatedWeeklyLimitPreset`, `InternalPlanOverrideStore`, `InternalOverrideStore`) but are
  gated by `InternalToolGate`, which needs the `IsWisprFlowUser` flag **and** a remote tool flag.
  They are not a usable production back door.
* Reference string in the resources: "A Play entitlement is active on this device: upsells and
  word limits keep treating you as Pro."

### 4.3 Where the quota is enforced

The weekly counter is synced from the product backend (`HistoryRepository.getHistoryStats` →
`Projection(serverBase=…, pendingLocal=…)`), and the gRPC `Init` message carries no plan or
entitlement field at all. The barrier the user hits is therefore local: `DictationGate` stops the
audio from being *sent*. Whether the inference server additionally refuses an over-quota user is
the open point in §7.

### 4.4 The licensing chain (why a re-signed build does not start)

PairIP is wired in at process start, before any application code:

| Step | Location | What it does |
|---|---|---|
| 1 | `com/pairip/application/Application.smali:19` | `attachBaseContext` calls `LicenseClient.checkLicense()` |
| 2 | `.../LicenseClient.smali:1402` | `performLocalInstallerCheck()` reads `getInstallSourceInfo()` (`:1480`) and compares `getInstallingPackageName()` (`:1495`) against `com.android.vending` (`:1502`) |
| 3 | `.../LicenseClient.smali:1015` | the boolean decides whether the state becomes `LOCAL_CHECK_OK` (`:1037`) |
| 4 | `.../LicenseClient.smali:2427` | if neither the full check nor the local check passed, `startErrorDialogActivity()` (`:2004`) is shown |
| 5 | `.../LicenseClient.smali:83` | the full check is verified against an embedded RSA public key, i.e. against the Play signing certificate |

The service names are hardcoded (`com.android.vending.licensing.ILicensingService`,
`…IBackgroundLicensingService`) and the manifest declares `com.android.vending.CHECK_LICENSE`.

Consequences, in order: a locally re-signed build fails the full check by construction; the local
fallback is decided by the installer package name; a side-loaded install reports something else;
the app ends on the licensing dialog. [`WHY.md`](../WHY.md) covers the reasoning that makes
restoring the installer the right fix rather than a broader one.

Any other installer read in the app is only consistency work, and the patch lists all of them:
`PlayStoreInAppReviewKt.installerPackageName` (review suppression token),
`AFg1zSDK.getRevenue` and `AFg1zSDK.AFAdRevenueData` (AppsFlyer attribution),
`FirebaseCommonRegistrar.lambda$getComponents$3` (analytics user property),
`ContextUtils.retrieveSideLoadedInfo` (Sentry crash tagging).

---

## 5. Android platform

* **AccessibilityService** is the insertion mechanism (`FlowAccessibilityService`,
  `ui/accessibility`, 161 classes, `res/xml/accessibility_service_config.xml`). No IME keyboard.
* Declared permissions: `RECORD_AUDIO`, `FOREGROUND_SERVICE_MICROPHONE`,
  `FOREGROUND_SERVICE_SPECIAL_USE`, `SYSTEM_ALERT_WINDOW` (floating bubble), `POST_NOTIFICATIONS`,
  `RECEIVE_BOOT_COMPLETED`, `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`, `WAKE_LOCK`, `VIBRATE`,
  `INTERNET`, `ACCESS_NETWORK_STATE`, `BIND_ACCESSIBILITY_SERVICE`, `BIND_JOB_SERVICE`,
  `com.android.vending.CHECK_LICENSE`.
* Notable activities: `MainActivity`, `SpeechPermissionActivity`,
  `AccessibilitySettingsPipActivity`, `PlanPageEntryActivity`, `WordLimitSheetActivity`,
  `PromptActivity`, `AccessibilityShortcutInfoActivity`.
* Infrastructure: Room (`AppDatabase`), DataStore/SharedPreferences (`data/preferences`),
  WorkManager, JobScheduler, `BootCompletedReceiver`, history stores (`TranscribeRepository`,
  `TranscriptionHistoryLimitProvider`).
* The service also watches sensitive apps: `com.ally.MobileBanking`, `com.nequi.MobileApp`,
  `com.sbi.SBIFreedomPlus` (sensitive-field exclusion).

---

## 6. Build shape

* Split bundle: `base__abi` and `base__density` are declared in `android:requiredSplitTypes`, so
  the base APK installs alone only on a device whose installer ignores the declaration — in
  practice it does not. `config.arm64_v8a.apk`, `config.en.apk` and `config.xxhdpi.apk` are part
  of the app.
* `resources.arsc` makes a full apktool resource rebuild fail while serialising one value; the
  pipeline therefore never re-encodes resources. It replaces the targeted dex inside the original
  APK and re-signs, so every other zip entry stays byte-identical (asserted by
  `scripts/verify_apk.py`).

---

## 7. Open questions

1. **Does the server also enforce the quota?** The client barrier is local (§4.3) and `Init`
   carries no plan field, so the patch works if the server does not refuse. To settle on a device:
   read `WordLimitEngine.resolvePlan`/`sync`, then dictate past 1000 words on a patched build.
2. **Request signing.** `FlowClient$AuthInterceptor` only sets headers; no HMAC is visible. To
   confirm by reading the interceptor in full.
3. **Extraction stability.** Names are R8-obfuscated outside `com.wispr.**`; `com.wispr.**` and
   `com/pairip/**` are kept, so hooks can anchor to stable names, but anchors remain version-bound.

---

## 8. Tooling and method

| Tool | Role |
|---|---|
| `tools/dexscan.py` | string extraction and search across the 5 DEX |
| `tools/smali.py` | targeted reading of one smali class, noise stripped |
| `tools/proto_fields.py` | protobuf schema rebuilt from the smali `*_FIELD_NUMBER` constants |
| `tools/arsc_strings.py` | dump of the 768 user-facing strings of `resources.arsc` |
| `tools/manifest_strings.py` | permissions/components/classes from the binary AXML |

None of the five needs a third-party Python package, and each reads the APK you provide
(`APK=... python3 analysis/tools/dexscan.py ...`). They are the source of every claim above.

Full chain used for this note:

1. `tools/dexscan.py` — string inventory: endpoints, third-party SDKs, `com/wispr/**` packages.
2. `tools/smali.py` — targeted reading (`wordlimit`, `payment`, `grpc`, `transcription`), to walk
   from constants down to branches.
3. `tools/proto_fields.py` — gRPC schema reconstruction without a `.proto`.
4. `tools/arsc_strings.py` and `tools/manifest_strings.py` — advertised features, permissions,
   components, and the presence of PairIP.
5. `jadx` (JDK 17, `-Xmx3g`) to cross-check the key classes in readable Java
   (`WordLimitEngine`, `WordLimitPolicy`, `DictationStartGate`); the field and method names cited
   here come from there.

Decompilation: **43 232 smali files** over 5 DEX (49.6 MB of bytecode), no native `lib/`.
