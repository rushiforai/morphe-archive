# 🧩 Zeldris Patches

## ❓ About

Personal patches for [Morphe](https://morphe.software).

### How to use these patches

Click the button below to add these patches to Morphe, or manually add `https://github.com/zeldrisho/morphe-patches` as a patch source.

<a href="https://morphe.software/add-source?github=zeldrisho/morphe-patches">
  <img src="https://raw.githubusercontent.com/MorpheApp/morphe-patches-template/main/.github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v1.14.0](https://github.com/zeldrisho/morphe-patches/releases/tag/v1.14.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;44 patches total
<details>
<summary>📦 Zalo&nbsp;&nbsp;•&nbsp;&nbsp;38 patches</summary>
<br>

**Package name:** `com.zing.zalo`

**🎯 Supported versions:**

| 26.08.01 | 26.10.02 | 26.11.01 |
| :---: | :---: | :---: |
| Only arm64-v8a has been validated; patching may retain other ABIs. | Only arm64-v8a has been validated; patching may retain other ABIs. |  |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED dark theme](#amoled-dark-theme) | Forces pure black surfaces across Zalo's dark theme, including the Me tab root. Light mode is untouched. |  |
| [Bypass Zalo Drive Contacts permission gate](#bypass-zalo-drive-contacts-permission-gate) | Allows Drive photo restore account selection without Contacts permission. |  |
| [Bypass native startup tamper check](#bypass-native-startup-tamper-check) | Allows the re-signed app to start on the supported arm64 Zalo build; removes other native ABIs. |  |
| [Change Zalo app icon](#change-zalo-app-icon) | Replaces the launcher icon with a user-supplied PNG. | • PNG icon path |
| [Change Zalo app name](#change-zalo-app-name) | Changes the app name shown in the launcher. | • App name |
| [Change Zalo package name](#change-zalo-package-name) | Allows a renamed clone alongside Zalo. Login, push, sharing and deep links may be affected. | • Package name |
| [Chat reaction picker](#chat-reaction-picker) | Allows the enabled reaction UI without a matching local subscription package. Server restrictions may still apply. |  |
| [Configurable native backup interval](#configurable-native-backup-interval) | Sets Zalo 26.08.01's automatic backup interval to 1, 3, 6 or 12 hours. Existing backup requirements still apply. For 26.10.02 use the in-app interval settings. | • Backup interval (hours) |
| [Custom Zalo call ringtone](#custom-zalo-call-ringtone) | Adds a global incoming-call audio file choice; the setting is unavailable in the current Zeldris settings screen, so the native ringtone is used by default. |  |
| [Customize Zalo accent color](#customize-zalo-accent-color) | Recolors Zalo's brand theme attributes from preset colors. Hardcoded colors, images and third-party branding keep their native values. |  |
| [Disable ads](#disable-ads) | Blocks selected offline and Google-served ads. Story and community sponsored placements require a separate patch. |  |
| [Disable sponsored placements](#disable-sponsored-placements) | Disables Story and community sponsored placements. Server-delivered and Official Account promotions may remain. |  |
| [Disable telemetry and crash reporting](#disable-telemetry-and-crash-reporting) | Stops selected Zalo analytics and crash reporting. Messaging is unaffected. |  |
| [Enable Google Drive photo backup](#enable-google-drive-photo-backup) | Makes Zalo's Google Drive photo backup available to more accounts. Google authorization and Drive retention still apply. |  |
| [Enable avatar saving](#enable-avatar-saving) | Restores Save photo for avatars opened from a profile and allows screenshots. Other screenshot protections are unchanged. |  |
| [Enable bubble chat](#enable-bubble-chat) | Keeps Zalo's bubble-chat entry point available when supported by Android and notification settings. |  |
| [Enable profile cover saving](#enable-profile-cover-saving) | Restores Save photo for profile cover photos and allows screenshots. Other viewers are unchanged. |  |
| [Enable stranger notifications](#enable-stranger-notifications) | Adds an initially off in-app switch to allow Stranger Box notifications. Off uses Zalo's native gate; other settings and delivery restrictions still apply. |  |
| [Filter promo notifications](#filter-promo-notifications) | Filters Timeline, Stories and Zalo Video notifications. Message, call, friend-request and birthday notifications are unaffected. |  |
| [Hide Business Box](#hide-business-box) | Hides Business Box from the chat list without hiding ordinary or user-initiated Official Account chats. |  |
| [Hide Media Box](#hide-media-box) | Hides Media Box from the chat list without deleting its content. |  |
| [Hide Newsfeed promotions](#hide-newsfeed-promotions) | Hides native Zinstant ad rows and suggested Zalo Video sections in Newsfeed automatically. Ordinary video posts remain visible. |  |
| [Hide chat list ads](#hide-chat-list-ads) | Removes ad cards from the chat list. Server-delivered promotions and other ads may remain. |  |
| [Hide navigation tabs](#hide-navigation-tabs) | Adds settings to hide Discovery, Contacts and Timeline individually. Tabs stay visible until hidden in Zeldris Patches; restart to apply. |  |
| [Hide zStyle conversation](#hide-zstyle-conversation) | Hides the exact name zStyle – Phong cách Zalo from the chat list. Another conversation with the same name is also hidden. |  |
| [Keep expired media accessible](#keep-expired-media-accessible) | Keeps locally stored large chat media accessible after expiry. Missing files and server restrictions are unaffected. |  |
| [Keep recalled messages](#keep-recalled-messages) | Adds an initially off recall-retention switch in Zeldris Patches. Preserves locally received content with a recalled label; cannot recover missing content. Restart to apply. |  |
| [Mark Zalo conversation read from notifications](#mark-zalo-conversation-read-from-notifications) | Adds a mark-as-read action to eligible message notifications using Zalo's native handler. |  |
| [Native backup interval settings](#native-backup-interval-settings) | Adds a backup interval choice in Zeldris Patches. Native is the default; existing backup requirements apply. |  |
| [Notification sound settings](#notification-sound-settings) | Kept for compatibility with existing patch selections; the notification settings shortcut is hidden. |  |
| [Open links externally by default](#open-links-externally-by-default) | Sets Zalo's existing link preference to the external browser by default while preserving the in-app browser option. |  |
| [Prefer original photo quality](#prefer-original-photo-quality) | Enables original photo quality by default. Upload limits and video are unaffected. |  |
| [Remove AD_ID permission](#remove-ad-id-permission) | Removes Zalo's advertising ID permissions. Messaging is unaffected. |  |
| [Remove media backup age limit](#remove-media-backup-age-limit) | Includes media of any age in Drive backup and restore. Drive retention and excluded media still apply. |  |
| [Save Zalo stories](#save-zalo-stories) | Adds the native save action to ordinary photo and video stories from other accounts. |  |
| [Suppress outbound seen status](#suppress-outbound-seen-status) | Stops sending read receipts while preserving delivery acknowledgements. |  |
| [Suppress outbound typing status](#suppress-outbound-typing-status) | Stops sending typing indicators. Incoming typing status is unaffected. |  |
| [microG Drive support](#microg-drive-support) | Uses microG-RE for Google Drive account selection and sign-in. Requires app.revanced.android.gms and the app.revanced account type. |  |

</details>

<details>
<summary>📦 Threads&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**Package name:** `com.instagram.barcelona`

**🎯 Supported versions:**

| 434.0.0.41.74 | 445.0.0.46.83 | 449.0.0.54.82 | 453.0.0.56.79 | 453.0.0.56.79 |
| :---: | :---: | :---: | :---: | :---: |
|  |  |  |  | Only arm64-v8a has been validated; ABI is not restricted by compatibility metadata. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change app name](#change-app-name) | Changes the app name shown in the launcher. | • App name |
| [Change package name](#change-package-name) | Allows a renamed clone alongside Threads. Login, content providers or push may break. | • Package name |
| [Hide ads](#hide-ads) | Removes sponsored posts from the Threads feed. Other surfaces are unaffected. |  |
| [Hide suggested accounts](#hide-suggested-accounts) | Removes suggested-account units from the Threads feed. Other suggestion surfaces are unchanged. |  |
| [Open links externally](#open-links-externally) | Opens web links externally when possible; otherwise Threads handles them normally. |  |
| [Remove AD_ID permission](#remove-ad-id-permission) | Removes advertising ID permissions. Meta's own analytics are unaffected. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Set up the toolchain using the [development guide](docs/development.md).
- Run `./gradlew :patches:buildAndroid --no-daemon`. The bundle is in `patches/build/libs/`.
- Apply it with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop). See [testing](docs/testing.md) for validation.

For Zalo Drive and custom icon setup, see the [Zalo guide](docs/zalo.md).

[Report a bug or request a feature](https://github.com/zeldrisho/morphe-patches/issues/new/choose).

## 📜 License

Zeldris Patches are licensed under the [GNU General Public License v3.0](LICENSE).
