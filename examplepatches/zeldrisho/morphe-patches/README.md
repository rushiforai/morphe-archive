# 🧩 Zeldris Patches

Patches for apps I like, built for [Morphe](https://morphe.software).

## ❓ About

A personal patch bundle for Morphe.
Patches, compatible app versions, and options are listed below; the list is
regenerated on every release.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=zeldrisho/morphe-patches

Or add the source URL manually in Morphe Manager → Sources.

Contributor docs: [development guide](docs/development.md) (start here),
[toolchain setup](docs/toolchain.md) (installs), [validation guide](docs/validation.md) (device testing),
[release process](docs/release.md) (publishing), [analysis workspace](docs/analysis.md) (APK investigation artifacts).

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v1.5.0](https://github.com/zeldrisho/morphe-patches/releases/tag/v1.5.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;18 patches total
<details>
<summary>📦 Zalo&nbsp;&nbsp;•&nbsp;&nbsp;14 patches</summary>
<br>

**🎯 Supported versions:**

| 26.08.01 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| Bypass native startup tamper check | Preserves native key initialization and NOPs only the JNI System.exit dispatch in the pinned arm64 26.08.01 build. |  |
| Change Zalo app name | Changes the name shown for Zalo under the launcher icon. Set the desired name in the patch options. | • App name |
| Change Zalo package name | Changes Zalo's package name so a clone can be installed beside stock Zalo, including package-owned provider references used after login. WARNING: package- and certificate-bound login, push, sharing, deep links, and backup may not work with the renamed application. | • Package name |
| Disable ads | Disables Zalo offline/Google ad networks (forces the Adtima offline gates closed, always drops admob/dfp/ima, and reports limit-ad-tracking opted-out). Sponsored Story/community placements need the companion patch. |  |
| Disable sponsored placements | Forces Zalo Story/community ad-enable flags to off at their config reads (normal content path kept). Server-stitched or OA-message promos may remain. |  |
| Disable telemetry and crash reporting | Stops Zalo's first-party analytics records and diagnostic crash data by suppressing its Room analytics writes, Firebase Crashlytics logs/keys, and native crash-handler registration. Messaging, sockets, and database initialization remain intact. |  |
| Filter promo notifications | Skips Zalo Timeline/Stories and Zalo Video push notifications (like/comment digests, new feeds/stories, video reminders) in the push dispatcher. Message, call, friend-request and birthday notifications are untouched; reaction/activity pushes on other channels may remain. |  |
| Hide Business Box | Removes Zalo's Business Box service entry from the main chat list without filtering ordinary conversations or user-initiated Official Account chats. |  |
| Keep expired media accessible | Keeps locally stored large chat media usable after Zalo's client-side expiry window by bypassing the expired/subscription state. It does not restore missing files or bypass server download authorization. |  |
| Prefer original photo quality | Enables Zalo's existing original-quality photo path by default. It does not change server upload limits, account restrictions, or video handling. |  |
| Remove AD_ID permission | Removes the advertising-id (AD_ID) permissions from Zalo so the device advertising id cannot be read for ad tracking. In-app readers fall back to "unknown"; core messaging is unaffected. |  |
| Remove media backup age limit | Includes media of any age in Zalo's existing Google Drive backup/restore pipeline. It does not bypass Drive retention or media exclusions. |  |
| Suppress outbound typing status | Stops Zalo from sending typing indicators. Incoming status rendering and messages remain unchanged. |  |
| microG Drive support | Adds Zalo launch/provider checks and redirects Google Drive account selection and token binding to microG-RE (app.revanced / app.revanced.android.gms). Initial photo restore and the complete backup/restore cycle were device-validated on Zalo 26.08.01. |  |

</details>

<details>
<summary>📦 Threads&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 434.0.0.41.74 | 445.0.0.46.83 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| Change app name | Changes the app name shown under the launcher icon. Set the desired name in the patch options. | • App name |
| Change package name | Changes the app package name so the patched app installs alongside the original. Set the desired name in the patch options. WARNING: hardcoded component/provider references can break login, content providers, or push. Disable this patch if needed. | • Package name |
| Hide ads | Removes sponsored posts from the Threads feed by filtering ad feed units (detected via Media.DED/DGK) out of the list merged into the feed cache, before they can render. Feed-scoped; other surfaces (clips/reels) are not affected. |  |
| Remove AD_ID permission | Removes the advertising-id (AD_ID) permissions so the device advertising id cannot be read for ad tracking. Does not disable Meta's core analytics. |  |

</details>

<!-- PATCHES_END -->

## 📜 License

Zeldris Patches are licensed under the [GNU General Public License v3.0](LICENSE).
