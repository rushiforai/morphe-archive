# Changelog

Release and changelog policy: [docs/release.md](docs/release.md#changelog-policy).

## Unreleased

## [1.7.1](https://github.com/zeldrisho/morphe-patches/compare/v1.7.0...v1.7.1) (2026-10-03)

### 🐛 Bug Fixes
* **Zalo - Configurable native backup interval:** Fixes patching for the supported Zalo APK.

## [1.7.0](https://github.com/zeldrisho/morphe-patches/compare/v1.6.3...v1.7.0) (2026-10-02)

### ✨ New Features
* **Threads - Open links externally:** Opens HTTP(S) links in an external app when available; otherwise Threads handles them normally.
* **Zalo - Configurable native backup interval:** Add an opt-in option for automatic backup checks every 1, 3, 6, or 12 hours. Device behavior is not yet validated.

### 🚀 Updated App Support
* **Threads:** Add support for 449.0.0.54.82.

## [1.6.3](https://github.com/zeldrisho/morphe-patches/compare/v1.6.2...v1.6.3) (2026-09-27)

### 🐛 Bug Fixes
* **Zalo - Prefer original photo quality:** Fixes image sending by applying the original-quality option to outgoing photos.

## [1.6.2](https://github.com/zeldrisho/morphe-patches/compare/v1.6.1...v1.6.2) (2026-09-26)

### 🐛 Bug Fixes
* **Zalo - Enable Google Drive photo backup:** Fixes an error when patching the app.

## [1.6.1](https://github.com/zeldrisho/morphe-patches/compare/v1.6.0...v1.6.1) (2026-09-26)

### 🔧 Improvements
* **Zalo - Enable Google Drive photo backup:** Makes the patch opt-in while its startup verifier issue is investigated.

## [1.6.0](https://github.com/zeldrisho/morphe-patches/compare/v1.5.0...v1.6.0) (2026-09-22)

### 🐛 Bug Fixes
* **Zalo - microG Drive support:** Makes the provider visible to Android package queries, fixes the installation link, and cancels stale refreshes when switching accounts.

### ✨ New Features
* **Zalo - Suppress outbound seen status:** Stops sending seen-status updates by default; message delivery and incoming status display are unaffected.
* **Zalo - Enable Google Drive photo backup:** Restores the app's existing Google Drive photo-backup option.

## [1.5.0](https://github.com/zeldrisho/morphe-patches/compare/v1.4.0...v1.5.0) (2026-09-17)

### ✨ New Features
* **Zalo - Remove media backup age limit:** Includes older media in the existing Google Drive backup and restore flow.
* **Zalo - Suppress outbound typing status:** Stops sending typing indicators by default; incoming status display is unaffected.

### 🐛 Bug Fixes
* **Zalo - Prefer original photo quality:** Enables original-quality photo sending by default and keeps the picker mode label consistent.

## [1.4.0](https://github.com/zeldrisho/morphe-patches/compare/v1.3.0...v1.4.0) (2026-09-15)

### ✨ New Features
* **Zalo - Prefer original photo quality:** Enables the app's existing original-quality photo sending option.

### 🐛 Bug Fixes
* **Zalo - Keep expired media accessible:** Fixes patching APKMirror bundles.
* **Zalo - microG Drive support:** Refreshes Drive data after account selection without requiring the backup screen to be reopened.

## [1.3.0](https://github.com/zeldrisho/morphe-patches/compare/v1.2.0...v1.3.0) (2026-09-14)

### ✨ New Features
* **Zalo - Hide Business Box:** Hides the Business Box entry without hiding ordinary chats.
* **Zalo - Disable telemetry and crash reporting:** Stops selected analytics recording and crash-report uploads.
* **Zalo - Keep expired media accessible:** Keeps locally stored large chat media available after expiry.
* **Zalo - Clone branding:** Optionally changes the app name and package name to allow installing a branded clone alongside the original app.

## [1.2.0](https://github.com/zeldrisho/morphe-patches/compare/v1.1.0...v1.2.0) (2026-09-11)

### ✨ New Features
* **Zalo - microG Drive support:** Adds provider-backed Google Drive account selection and photo backup/restore.
* **Zalo - Bypass native startup tamper check:** Preserves native initialization while bypassing the re-signing exit check on arm64.
* **Zalo - Disable ads:** Disables selected offline and Google ad-network paths.
* **Zalo - Disable sponsored placements:** Disables selected Story and Community ad slots; server-stitched or OA-message promotions may remain.
* **Zalo - Remove AD_ID permission:** Removes advertising-ID manifest permissions; in-app readers may report an unknown ID.
* **Zalo - Filter promo notifications:** Filters Timeline, Stories, and Zalo Video promotions while retaining message, call, friend-request, and birthday notifications.

## [1.1.0](https://github.com/zeldrisho/morphe-patches/compare/v1.0.0...v1.1.0) (2026-09-09)

### 🚀 Updated App Support
* **Threads:** Add support for `445.0.0.46.83`.

## 1.0.0 (2026-09-07)

### ✨ New Features
* **Threads - Hide ads:** Removes sponsored posts from the feed.
* **Threads - Remove AD_ID permission:** Removes the advertising-ID permission.
* **Threads - Change app name:** Lets you customize the app name.
* **Threads - Change package name:** Allows installing a renamed clone; may affect login, providers, or push notifications.
