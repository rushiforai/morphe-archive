# Remaining work

Zalo **26.08.01** (`260801903`) roadmap. Keep APKs and evidence in ignored
`analysis/zalo/26.08.01/`. Cross-app engineering belongs in [maintenance](maintenance.md);
release execution and evidence requirements belong in [validation](validation.md).

## Feature feasibility investigations

These are **not implemented behavior or release expectations**. Before implementation,
record the exact smali gate, callers, local data flow, server dependencies, narrow
change, and regression risks in local notes. Classify each as **ready to implement**,
**needs runtime proof**, or **server-dependent**. Use patch-time fingerprints and
app-specific extensions, not broad runtime plumbing or remote symbol catalogs.

| Candidate | Evidence required / boundary |
| --- | --- |
| zBusiness catalog | Entry points, creation/editing, limits, storage/sync, backend authorization, restart persistence, and recipient-visible sharing. |
| Gold Business badge | Asset and entitlement/display path; local cosmetics are not server-visible verification. |
| Change username | Distinguish display name, unique handle, and business link; trace validation, cooldowns, requests, persistence, and visibility from another account. A local alias is not a server rename. |
| Username friend search / additional devices | Removed from shipped patches; require compatible fingerprints and independent runtime/server evidence before reconsidering. |
| Inactivity deletion | Verify policy and activity definition; server-managed deletion is not a local unlock. No silent generated activity; reminders/backups are separate mitigations. |
| Muted-chat count / asymmetric online-seen privacy | Server-dependent until a client gate is demonstrated. |

### Local backup/export

Trace native transfer/export first: messages, media associations, snapshots/WAL,
schema, keys, and restore ordering. Prove stock-to-patched migration, patched
reinstall, and cross-device restore separately; private-file access does not prove portability.
Export only to a user-selected external destination. Test unauthorized access,
unexpected destinations, and excessive URI grants (also for notification-history
and recording exports). Require integrity/version checks, bounded extraction,
recoverable staging, and corrupt-archive, low-space, and interrupted-transfer tests.
See [local-data investigation rules](reverse-engineering.md#learning-from-other-patch-projects).

## Remaining Zalo investigations

### P1: Configurable native backup interval

Trace `SERVER_CONFIG_SYNC_MESSAGE_INTERVAL_*` for 1/3/6/12-hour scheduling while
preserving native opt-in, authentication, network, and backup guards. Prove complete
backup/restore round trips, not timer execution. Measure battery, wakeups, network,
and account switching against stock/control before setting thresholds.

### P2: Inbox and navigation controls

Re-hunt 26.08.01 anchors for chat/group/OA/stranger categories and initial filter;
preserve datasets, unread counts, refresh, pagination, search, and unknown categories.
For main-tab, Me, media-box, and banners, prove promotional-only scope; preserve
alerts and backup access. Prefer exact IDs/scoped binding changes and test localization,
accessibility, badges, deep links, and resume.

### P2: Open ordinary content links externally

Trace URL dispatch; allow only validated HTTP(S) content links. Preserve mini-app,
OA H5, authenticated, payment, OAuth, and non-web handlers. Test malformed URLs,
missing browsers, cancellation, redirects, chat/feed links, login/payment, deep
links, and safe in-app fallback.

### P2: Analytics and privacy candidates

Trace analytics Room DAO/upload workers before suppressing writes; avoid null DAOs.
Decide whether a separate opt-in patch is justified. Advertising-ID reduction needs
all app/SDK consumers checked while preserving unrelated attribution/advertising.
Compare search keypress/focus telemetry with existing coverage; patch only gaps,
preserving suggestions and searches. Notification history and call recording remain
separate default-off investigations requiring consent, privacy, storage, and second-account tests.

### P2: Content and playback controls

Trace content-WebView autoplay separately from native Timeline/Video players;
preserve tap-to-play, calls, and explicit previews. Establish local player support
before adding playback controls; preserve default speed, seeking, audio sync, and
lifecycle. Initially exclude calls and live playback.

### P3: Security and appearance

- **Passcode grace period:** trace preference/lifecycle; any default-off option needs
  a warning and must preserve authentication and expiry.
- **Capture:** establish restrictions and outbound events separately. Default-off,
  sensitive-content warning, second-account proof; never globally clear security flags.
- **Bubbles:** establish native support; preserve Android API, permission, and resource
  requirements. Never spoof unsupported-device eligibility.
- **True-black theme:** use verified resources/runtime colors, scoped to dark mode
  and default-off. Test light mode, contrast, dialogs, system bars, and switching.

## Boundaries

- zStyle and Video Original quality are excluded: the pinned APK has `VIDEO` and
  `VIDEO_HD`, not `VIDEO_ORIGINAL`.
- Forced-update suppression needs a traced trigger chain. The permission audit
  found no safe zero-usage removal candidates.
- Catalog, username changes, badge entitlement, local export, inactivity prevention,
  zCloud capacity, and business quotas remain unproven or server-dependent.
- No HTTP-header OAuth fixes, global paid-account spoofing, broad MicroG rewrites,
  unrelated app ports, or generic shared runtime infrastructure. Pairip/native/Hermes
  infrastructure requires a demonstrated consumer.

## Acceptance evidence

Follow [validation](validation.md): positive and control checks, remote visibility
or restore round trips where relevant, then repeat build/repatch/install/device
checks with the published `.mpp`. Keep hashes, patch selection, device/Android,
signing identity, and sanitized evidence outside Git. Unexecuted candidates are
not validated features.
