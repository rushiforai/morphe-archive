# Changelog

Release and changelog policy: [docs/release.md](docs/release.md#changelog-policy).

## Unreleased

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
