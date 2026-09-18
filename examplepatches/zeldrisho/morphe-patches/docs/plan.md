# Remaining work

This roadmap is scoped to Zalo Android APK `26.08.01` (version code
`260801903`). APKs, smali, logs, screenshots, and generated analysis files stay
under the ignored `analysis/zalo/26.08.01/` directory.

Cross-app structure, patch safety, tests, tooling, release safeguards, and
documentation work are tracked in the [repository maintenance plan](maintenance.md),
including the comparisons with Doom's and Hoodles' Morphe Patches.

zStyle is excluded. Video Original quality is also excluded: the pinned APK
contains `VIDEO` and `VIDEO_HD`, but no `VIDEO_ORIGINAL` path.

## Zalo 26.08 requested features

- Username friend search and additional logged-in devices were removed from the
  shipped patch set. Keep these as investigation-only backlog items until a
  compatible fingerprint and independent runtime/server evidence exist.
- Keep muted-chat count and asymmetric online/seen privacy classified as
  server-dependent unless runtime evidence identifies a client-side gate. The
  outbound seen-acknowledgement investigation below does not establish asymmetric
  privacy or control online presence.

## Photo Original quality validation

- Confirm that the current patch does not affect video sending.
- Complete control testing with identical source photos and compare source and
  received hashes, dimensions, metadata, and encoding.
- Verify ordinary quality selection and multi-image selection.
- Do not claim recovery of originals discarded by the client or server.

## Feature feasibility investigations

Before implementing any item, record the exact smali gate, callers, local data
flow, server dependencies, narrow proposed change, and regression risks in
`analysis/zalo/26.08.01/notes/`. Classify each result as **ready to implement**,
**needs runtime proof**, or **server-dependent**. Do not globally spoof a paid
account or mutate HTTP traffic.

### zBusiness product catalog

- Trace entry points, product creation/editing, count limits, storage, sync, and
  sharing.
- Determine whether local templates are usable without an authorized backend.
- Verify persistence after restart and what recipients see when a product is
  shared.

### Local backup/export

- Trace phone-transfer and local export machinery, including messages, media
  associations, database snapshots/WAL, schema, and encryption keys.
- If an extension is needed, export only to a user-selected external location.
- Prove stock-to-patched migration, patched reinstall, and cross-device restore
  separately.
- Require integrity/version checks, bounded extraction, recoverable staging, and
  tests for corrupt archives, low space, and interrupted transfers.

### Gold Business badge

- Identify the exact asset and entitlement/display path.
- Separate local cosmetic rendering from server-visible verification.
- Treat server-issued verification as server-dependent unless contrary evidence
  is established.

### Change username

- Distinguish display name, unique handle, and business contact link.
- Trace validation, cooldowns, persistence, update requests, and visibility from
  another account.
- Patch only proven local restrictions; a local alias is not a server rename.

### Inactivity deletion

- Verify the current policy and what counts as activity.
- Determine whether deletion is server-managed; do not silently generate account
  activity.
- If no client enforcement point exists, classify prevention as server-dependent.
  Optional reminders and backup are separate mitigations.

### Google Drive backup and restore — remaining work

- Validate the new **Remove media backup age limit** patch against an unmodified
  control. Confirm that the 365-day filter is removed during both backup and
  restore; existing Drive objects must still be indexed and downloadable.
- Trace Google Drive scheduling, Wi-Fi constraints, authentication, token
  refresh, upload completion, pagination, retention, and restore order.
- Account for every test photo: excluded by policy, absent from the Drive index,
  upload failure, download failure, missing message association, or restored.
- Compare first-login restore with manual restore, including checkpoints,
  retries, process death, offline recovery, low storage, duplicate work, and
  wrong-account restore.
- Preserve live data and the last usable backup after failure; never log tokens
  or backup contents. Keep videos, files, voice messages, and groups over 100
  members classified as explicit stock exclusions unless separately proven.
- Treat Google OAuth/provider authorization as a backend boundary, not a local
  unlock. zCloud is out of scope for this investigation.

## Candidates from Zalo Patch

Reference implementation: `~/Projects/zalo-patch/`, primarily
`app/src/main/java/com/ez/zalopatch/`; `~/Projects/com.ez.zalopatch/` contains
release documentation only. Upstream targets 26.08.02 (`260802903`), not our
pinned 26.08.01. These are investigation leads, not verified compatible patches.
Apply the evidence and classification requirements above to every candidate.

Use patch-time fingerprints and app-specific extension code where needed; do
not port LSPosed/root plumbing or remote symbol catalogs wholesale. Preserve
license notices if reusing source. Continue with seen acknowledgements,
then native backup scheduling.

### P1: Outbound seen acknowledgements

- Use `xposed/features/StatusPrivacyFeature.java` and
  `StatusPrivacyAckFilter.java` to investigate single/batched seen acknowledgements
  (upstream type `3`) and the direct seen-send path on the pinned APK.
- Prove acknowledgement semantics before filtering; preserve delivery
  acknowledgements and every non-seen batch entry.
- Validate remote visibility, reconnect/retry, queued acknowledgements, and
  Android/Web/Desktop interactions. Incoming rendering remaining unchanged is
  not proof of asymmetric server-visible privacy; online presence is separate.

### P1: Configurable native backup interval

- Extend the automatic backup investigation using
  `xposed/features/BackupPushFeature.java` and `BackupPushDecision.java`.
- Trace `SERVER_CONFIG_SYNC_MESSAGE_INTERVAL_*` and investigate 1/3/6/12-hour
  scheduling while preserving native opt-in, authentication, network, and other
  backup guards.
- Verify completed backups and restore round trips, not merely timer execution;
  measure battery/network impact and account-switch behavior.
- This is not a zCloud entitlement or OAuth fix.

### P2: Inbox category controls

- Investigate `xposed/features/InboxFeature.java` for chats, groups, official
  accounts, strangers, and a configurable initial filter.
- Preserve the original dataset and verify unread counts, refresh, pagination,
  search, category switching, and correct handling of unknown categories.

### P2: Hide long-press reaction row

- Investigate `xposed/features/ChatFeature.java` to hide only emoji reactions in
  the message popup, preserving copy, reply, forward, and other actions.
- Validate different message types, popup layouts, and accessibility.

### P2: Local notification history

- Investigate `NotificationHistoryStore.java` and
  `xposed/features/NotificationFeature.java` for opt-in local capture with bounded
  retention, account isolation, explicit export, and deletion.
- Store sensitive content privately; export only to a user-selected location and
  test duplicates, redacted notifications, process death, and retention cleanup.
- Describe this as observed notification history, not complete message history
  or recovery of unseen/deleted messages.

### P3: One-to-one call audio recording

- Investigate `xposed/features/CallRecordingFeature.java` and its lifecycle helper
  for the native ZRTC recorder; do not assume group-call or video capture support.
- Require default-off opt-in, visible recording status, consent requirements,
  private storage, explicit export/delete, and bounded storage use.
- Test both audio directions, Bluetooth/headsets, interruptions, overlapping
  lifecycle events, low storage, process death, and incomplete-file recovery.

### P3: Configurable passcode grace period

- Investigate `xposed/features/PasscodeGraceFeature.java` and the
  `SaveActiveTimePasscodeSetting` preference path.
- Keep this security-sensitive option default-off with a clear warning; preserve
  authentication and avoid changing unrelated preference reads.
- Validate background/resume, device locking, process restart, and grace expiry.

### Existing patch coverage comparison

- Compare upstream ads, telemetry, AD_ID removal, and promotional filtering with
  our current patches; add only proven coverage gaps, not duplicate features.
- Preserve chat, calls, alerts, and other non-promotional behavior. Keep the
  existing promotional-filter device validation below as a release requirement.

## Candidates from Doom's Morphe Patches

Reference checkout: `~/Projects/morphe-patches-doom/`, commit `51561b0`
(`v1.22.0`). Source paths below are relative to
`patches/src/main/kotlin/app/template/patches/` unless stated otherwise.
No direct Zalo or Threads patches were found; these are cross-app investigation
leads, not verified compatibility. Apply the evidence and classification
requirements above and preserve applicable notices before reusing source.

### Strengthen existing P1 investigations first

- **Photo Original:** use `messenger/media/DisableMediaTranscodingPatch.kt` as
  a lead to trace selection, resizing/transcoding, upload, and received bytes.
  Establish whether selecting Original still enters a conversion path. Keep
  Video Original excluded; a Messenger implementation proves nothing about Zalo.

### P2: Content autoplay and search telemetry

- Investigate content-WebView autoplay using
  `amazon/disableautoplay/DisableVideoAutoplayPatch.kt`. Trace native
  Timeline/Video players separately; preserve tap-to-play, calls, and explicit
  media previews.
- Compare search keypress/focus events against our existing telemetry coverage,
  using `amazon/nosuggesttrack/DisableSearchSuggestionsTrackingPatch.kt` as a
  lead. Add only proven gaps and preserve suggestions and actual searches.

### P3: Optional capture controls and chat bubbles

- Establish whether Zalo has capture restrictions and outbound capture events
  before considering `messenger/privacy/AllowScreenCapturePatch.kt` and
  `BlockScreenshotDetectionPatch.kt`. Treat capture permission and notification
  suppression as separate behaviors; keep options default-off, warn about
  sensitive-content exposure, and verify remote effects with a second account.
  Do not globally clear security flags.
- Investigate existing native bubble support using
  `messenger/chatheads/EnableChatHeadsPatch.kt` as a lead. Preserve Android API,
  permission, and resource requirements; do not force an unsupported device to
  report eligibility.

### Boundaries

- `shared/firebase/SpoofFirebaseCertHashPatch.kt` is not evidence of a Drive
  OAuth fix. Its HTTP-header mutation conflicts with this roadmap's constraints.
- Do not import global paid-account spoofing or shared helper frameworks without
  a concrete, independently verified need.
- Unrelated app ports require a separate backlog, not expansion of this
  Zalo-scoped roadmap.

## Candidates from Hoodles' Morphe Patches

Reference checkout: `~/Projects/morphe-patches-hoodles/`, commit `f7a88fc`
(`v1.44.0`). Paths below are relative to
`patches/src/main/kotlin/hoodles/morphe/patches/`. No direct Zalo or Threads
patches were found; these are investigation leads, not compatible implementations.
Apply the evidence and classification requirements above and preserve applicable
license notices before reusing source.

### Strengthen existing investigations

- **Telemetry coverage:** use
  `camscanner/misc/telemetry/DisableTelemetryPatch.kt` and
  `soundcloud/misc/telemetry/DisableTelemetryPatch.kt` to compare collection,
  queued events, and dispatch against our analytics DAO and Crashlytics coverage.
  Add only proven gaps; do not disable a generic message handler or transport.

### P2: Native video playback-speed controls

- Investigate `primevideo/speed/EnableSpeedPatch.kt`, which enables existing
  experimental controls rather than implementing a player.
- Trace whether Zalo has equivalent local controls and player support; preserve
  default speed, seeking, audio sync, and lifecycle behavior.
- Exclude calls and live playback initially. Verify normal playback and speed
  changes against an unmodified control before claiming support.

### P3: Optional true-black dark theme

- Investigate `github/misc/theme/AmoledPatch.kt` and
  `soundcloud/misc/theme/AmoledPatch.kt` for resource and runtime-color approaches,
  not their app-specific parameter positions or resource names.
- Scope changes to the existing dark theme and keep the option default-off.
  Validate light mode, contrast, dialogs, system bars, and theme switching.
- This is local appearance only, not zStyle or a theme entitlement unlock.

### Boundaries

- Do not import generic premium/RevenueCat spoofing or broad MicroG rewrites;
  these are not evidence of a Zalo entitlement or Drive OAuth fix.
- Pairip, native, and Hermes infrastructure require a demonstrated consumer;
  unrelated app ports remain outside this roadmap.
- Signing-identity qualification and other engineering ideas belong in the
  [repository maintenance plan](maintenance.md#ideas-from-hoodles-to-adapt).

## Deferred validation

- Validate expired-media behavior in chat, including missing local files,
  unusable remote URLs, restore, and deleted messages. Confirm whether the
  existing local expiry patch changes only presentation or also affects access.
- Validate the existing `SOCIAL_STORY` / `ZALO_VIDEO` notification filter without
  suppressing chat, group activity, friend requests, calls, or alerts.
- Validate QR login, read/delivery state, message history, media scope, and
  session revocation across Android, Web, and Desktop.
- Update the MicroG-RE source only after a stable upstream release or official
  project page provides the OAuth SHA-1 normalization fix; verify provenance and
  checksum first.

## Acceptance evidence

For every implemented candidate, record a positive behavior check and an
unmodified/control comparison. Include remote visibility or a complete restore
round trip where relevant. Before release, repeat build, original-APKM repatch,
installation, and device validation with the published `.mpp`; record the APK
hash, patch bundle hash, enabled patches, device, Android version, and signing
certificate fingerprint outside this repository.
