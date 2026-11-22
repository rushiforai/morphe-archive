# Transit

[Back to the collection](../../README.md)

Package: `com.thetransitapp.droid`

Patch: **Unlock Royale**

## Supported version

Transit **6.3.7**, version code **5128316**, Android **12L / API 32** or later. This target was checked against the supplied APK manifest and all four DEX files. Other versions are not declared supported by this source yet.

Use an original APK matching this version. Morphe can also accept a complete split bundle for the same app version. Select **Ben's Morphe Patches → Unlock Royale** in Manager.

## What changes

- The Royale subscription status getter reports active.
- The patch forces the result of the specific `activate_royale_subscription` check to true, selecting the app's existing active-status path instead of the RevenueCat lookup. It derives the destination register from the matched instruction.
- A helper runs before Transit initializes its SDKs. It presents the original Transit certificate from the upstream helper to package-information queries inside the app, to accommodate the APK's changed signature. It does not change Android's signature verification or the installed APK's actual signing certificate.

These changes affect local membership checks. They do not purchase a subscription, change server-side entitlements, or guarantee every online feature. Device testing, including map rendering, is still required.

## Google Maps

Unlike the upstream implementation, the default configuration preserves the Maps API key already shipped with Transit. It does not depend on the upstream maintainer's shared API key or replace an existing key with an empty value.

The optional **Google Maps API key** patch setting can supply your own compatible key if needed. Leave it blank for the normal configuration. A supplied key is embedded only in your patched APK; no private key or account credential is shipped in this repository. The certificate hook uses Android internals, so its behavior can vary across Android releases.

The helper starts in `Application.attachBaseContext`, before providers can cache Maps credentials, and refreshes the caches again at `onCreate`. It updates already-created package-manager delegates and the app's cached `ApplicationInfo`, not just Android's static package-manager reference.

If the map is blank, capture Transit logs while opening the map and look for `TransitHelper` and `Google Maps Android API`. The helper logs initialization failures and the app-reported certificate SHA-1, but never logs an API key. Redact any API key printed by Google's own authorization error before sharing logs.

An `Authorization failure` can still require a replacement key authorized for this package/certificate, with Maps SDK for Android enabled and any required billing configured. Certificate hooks cannot guarantee that Google will accept the original key from a re-signed app. The upstream maintainer's private shared key is not included.

Morphe extracts the original signing certificate from the full input APK at patch time and embeds it in the helper. It prefers APK Signature Scheme v3.1, then v3, then v2; source-stamp certificates are ignored. If no signing certificate is available, the patch logs a warning and retains the upstream certificate fallback. Always patch the original APK rather than a previously patched copy.

## Attribution

Adapted from the [Transit patch and TransitHelper in rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches/tree/92c0fca0ae103a419c7fc61f9c5b8b38b7d6b82a/patches/src/main/kotlin/app/template/patches/thetransit), with updates for 6.3.7 and Morphe Patcher 2.4.0. The helper uses [LSPosed AndroidHiddenApiBypass](https://github.com/LSPosed/AndroidHiddenApiBypass).

See the repository's [license](../../LICENSE) and [notices](../../NOTICE).
