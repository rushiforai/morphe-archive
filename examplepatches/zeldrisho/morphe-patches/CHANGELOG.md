# Changelog

Release and changelog policy: [docs/release.md](docs/release.md#changelog-policy).

## Unreleased

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
