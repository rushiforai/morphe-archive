# Changelog

Release and changelog policy: [docs/release.md](docs/release.md#changelog-policy).

## Unreleased

## [1.6.3](https://github.com/zeldrisho/morphe-patches/compare/v1.6.2...v1.6.3) (2026-09-27)

### 🐛 Bug Fixes
* **Zalo - Prefer original photo quality:** Corrects instruction targeting so the original-quality photo flag is set on the outgoing media model, fixing image sending on Zalo `26.08.01`.

## [1.6.2](https://github.com/zeldrisho/morphe-patches/compare/v1.6.1...v1.6.2) (2026-09-26)

### 🐛 Bug Fixes
* **Zalo - Enable Google Drive photo backup:** Fixes a patching error on Zalo `26.08.01`.

## [1.6.1](https://github.com/zeldrisho/morphe-patches/compare/v1.6.0...v1.6.1) (2026-09-26)

### 🔧 Improvements
* **Zalo - Enable Google Drive photo backup:** Makes the patch opt-in while its startup verifier issue is investigated.

## [1.6.0](https://github.com/zeldrisho/morphe-patches/compare/v1.5.0...v1.6.0) (2026-09-22)

### 🐛 Bug Fixes
* **Zalo - microG Drive support:** Declares MicroG-RE package visibility so Android package filtering does not hide the installed provider.
* **Zalo - microG Drive support:** Corrects the installation prompt's download link to the official Morphe MicroG page.
* **Zalo - microG Drive support:** Cancels the previous pending Drive refresh when another account is selected for the same backup view.

### ✨ New Features
* **Zalo - Suppress outbound seen status:** Disables the dedicated outbound seen-status packet path by default for `26.08.01`; message delivery and incoming status rendering are not modified.
* **Zalo - Enable Google Drive photo backup:** Restores Zalo's existing Google Drive photo-backup option for `26.08.01`; Google authorization, server retention, encryption, and media exclusions remain unchanged.

## [1.5.0](https://github.com/zeldrisho/morphe-patches/compare/v1.4.0...v1.5.0) (2026-09-17)

### ✨ New Features
* **Zalo - Remove media backup age limit:** Includes media of any age in Zalo's existing Google Drive backup and restore pipeline for `26.08.01`; Drive retention and unsupported media remain unchanged.
* **Zalo - Suppress outbound typing status:** Stops Zalo from sending typing indicators by default while leaving incoming status rendering unchanged.

### 🐛 Bug Fixes
* **Zalo - Prefer original photo quality:** Enables Original-quality photo sending by default, bypasses the client-side entitlement gate, and keeps the picker send-mode label consistent on Zalo `26.08.01`; server limits and remote media availability are unchanged.

## [1.4.0](https://github.com/zeldrisho/morphe-patches/compare/v1.3.0...v1.4.0) (2026-09-15)

### ✨ New Features
* **Zalo - Prefer original photo quality:** Enables Zalo's existing original-quality photo path for `26.08.01`; picker defaults, video handling, server limits, and account restrictions are unchanged.

### 🐛 Bug Fixes
* **Zalo - Keep expired media accessible:** Fixes patching Zalo `26.08.01` APKMirror bundles by matching the final media-status classifier method correctly.
* **Zalo - microG Drive support:** Delays the first Drive refresh after account selection so photo backup works without reopening the backup screen.

## [1.3.0](https://github.com/zeldrisho/morphe-patches/compare/v1.2.0...v1.3.0) (2026-09-14)

### ✨ New Features
* **Zalo - Hide Business Box:** Removes the Business Box entry from the main chat list without filtering ordinary conversations for `26.08.01`.
* **Zalo - Disable telemetry and crash reporting:** Suppresses Zalo's Room analytics writes, Firebase Crashlytics diagnostics, and native crash-handler registration for `26.08.01`.
* **Zalo - Keep expired media accessible:** Keeps locally stored large chat media usable after Zalo marks it expired for `26.08.01`; missing local files and server authorization are unchanged.
* **Zalo - Clone branding:** Optionally changes the app name and package name so a branded Zalo clone can be installed beside stock Zalo for `26.08.01`.

### 🐛 Bug Fixes
* **Zalo - microG Drive support:** Validated the missing-provider launch prompt and the complete initial OAuth + Google Drive photo-restore flow for `26.08.01` on-device.

## [1.2.0](https://github.com/zeldrisho/morphe-patches/compare/v1.1.0...v1.2.0) (2026-09-11)

### ✨ New Features
* **Zalo - microG Drive support:** Adds provider-backed Google Drive account selection and backup/restore support for `26.08.01`.
* **Zalo - Bypass native startup tamper check:** Initial patch for `26.08.01` — preserves native initialization while disabling the verified re-signing exit dispatch on arm64.
* **Zalo - Disable ads:** Initial patch for `26.08.01` — forces the Adtima offline gates closed, always drops admob/dfp/ima from the supported-network map, and reports limit-ad-tracking opted-out without calling the Play API.
* **Zalo - Disable sponsored placements:** Initial patch for `26.08.01` — forces the Story/community ad-enable flags off at their config reads (normal content path kept; server-stitched or OA-message promos may remain).
* **Zalo - Remove AD_ID permission:** Initial patch for `26.08.01` — strips the advertising-id manifest entries (in-app readers fall back to "unknown"); pairs with the limit-ad-tracking opt-out now in Disable Zalo ads.
* **Zalo - Filter promo notifications:** Initial patch for `26.08.01` — drops Timeline/Stories and Zalo Video pushes in the push dispatcher; message, call, friend-request and birthday notifications are untouched.

## [1.1.0](https://github.com/zeldrisho/morphe-patches/compare/v1.0.0...v1.1.0) (2026-09-09)

### 🚀 Updated App Support
* **Threads:** Add support for `445.0.0.46.83`.

## 1.0.0 (2026-09-07)

### ✨ New Features
* **Threads - Hide ads:** Initial patch for 434.0.0.41.74 — removes sponsored posts from the feed.
* **Threads - Remove AD_ID permission:** Initial patch for 434.0.0.41.74.
* **Threads - Change app name:** Initial patch for 434.0.0.41.74.
* **Threads - Change package name:** Initial patch for 434.0.0.41.74 (opt-in; renaming can break login, providers, or push).
