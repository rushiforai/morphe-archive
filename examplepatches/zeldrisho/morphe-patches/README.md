# 🧩 Zeldris Patches

## ❓ About

Patches for apps I like, built for [Morphe](https://morphe.software).

### How to use these patches

Click the button below to add these patches to Morphe.

<a href="https://morphe.software/add-source?github=zeldrisho/morphe-patches">
  <img src="https://raw.githubusercontent.com/MorpheApp/morphe-patches-template/main/.github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v1.12.0](https://github.com/zeldrisho/morphe-patches/releases/tag/v1.12.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;36 patches total
<details>
<summary>📦 Zalo • 30 patches</summary>

**🎯 Supported versions:**

| 26.10.02 (APKM) | 26.08.01 (APKM) |
| :---: | :---: |
| Only arm64-v8a has been validated; patching may retain other ABIs. | Only arm64-v8a has been validated; patching may retain other ABIs. |

| 💊&nbsp;Patch | 📜&nbsp;Description | 🎯&nbsp;Versions / file type | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| AMOLED dark theme | Forces pure black surfaces across Zalo's dark theme, including the Me tab root. Light mode is untouched. | 26.10.02 (APKM) |  |
| Bypass Zalo Drive Contacts permission gate | Allows Drive photo restore account selection without Contacts permission. | 26.08.01, 26.10.02 (APKM) |  |
| Bypass native startup tamper check | Allows the re-signed app to start on the supported arm64 Zalo build; removes other native ABIs. | 26.08.01, 26.10.02 (APKM) |  |
| Change Zalo app icon | Replaces the launcher icon with a user-supplied PNG. | 26.10.02 (APKM) | • PNG icon path |
| Change Zalo app name | Changes the app name shown in the launcher. | 26.08.01, 26.10.02 (APKM) | • App name |
| Change Zalo package name | Allows a renamed clone alongside Zalo. Login, push, sharing and deep links may be affected. | 26.08.01, 26.10.02 (APKM) | • Package name |
| Chat reaction picker | Allows the enabled reaction UI without a matching local subscription package. Server restrictions may still apply. | 26.10.02 (APKM) |  |
| Configurable native backup interval | Sets Zalo 26.08.01's automatic backup interval to 1, 3, 6 or 12 hours. Existing backup requirements still apply. For 26.10.02 use the in-app interval settings. | 26.08.01 (APKM) | • Backup interval (hours) |
| Disable ads | Blocks selected offline and Google-served ads. Story and community sponsored placements require a separate patch. | 26.08.01, 26.10.02 (APKM) |  |
| Disable sponsored placements | Disables Story and community sponsored placements. Server-delivered and Official Account promotions may remain. | 26.08.01, 26.10.02 (APKM) |  |
| Disable telemetry and crash reporting | Stops selected Zalo analytics and crash reporting. Messaging is unaffected. | 26.08.01, 26.10.02 (APKM) |  |
| Enable Google Drive photo backup | Makes Zalo's Google Drive photo backup available to more accounts. Google authorization and Drive retention still apply. | 26.08.01, 26.10.02 (APKM) |  |
| Enable avatar saving | Restores Save photo for avatars opened from a profile and allows screenshots. Other screenshot protections are unchanged. | 26.08.01, 26.10.02 (APKM) |  |
| Enable profile cover saving | Restores Save photo for profile cover photos and allows screenshots. Other viewers are unchanged. | 26.08.01, 26.10.02 (APKM) |  |
| Enable stranger notifications | Adds an initially off in-app switch to allow Stranger Box notifications. Off uses Zalo's native gate; other settings and delivery restrictions still apply. | 26.10.02 (APKM) |  |
| Filter promo notifications | Filters Timeline, Stories and Zalo Video notifications. Message, call, friend-request and birthday notifications are unaffected. | 26.08.01, 26.10.02 (APKM) |  |
| Hide Business Box | Hides Business Box from the chat list without hiding ordinary or user-initiated Official Account chats. | 26.08.01, 26.10.02 (APKM) |  |
| Hide Media Box | Hides Media Box from the chat list without deleting its content. | 26.08.01, 26.10.02 (APKM) |  |
| Hide Newsfeed promotions | Hides native Zinstant ad rows and suggested Zalo Video sections in Newsfeed automatically. Ordinary video posts remain visible. | 26.10.02 (APKM) |  |
| Hide chat list ads | Removes ad cards from the chat list. Server-delivered promotions and other ads may remain. | 26.08.01, 26.10.02 (APKM) |  |
| Hide navigation tabs | Adds settings to hide Discovery, Contacts and Timeline individually. Tabs stay visible until hidden in Zeldris Patches; restart to apply. | 26.10.02 (APKM) |  |
| Keep expired media accessible | Keeps locally stored large chat media accessible after expiry. Missing files and server restrictions are unaffected. | 26.08.01, 26.10.02 (APKM) |  |
| Keep recalled messages | Adds an initially off recall-retention switch in Zeldris Patches. Preserves locally received content with a recalled label; cannot recover missing content. Restart to apply. | 26.10.02 (APKM) |  |
| Native backup interval settings | Adds a backup interval choice in Zeldris Patches. Native is the default; existing backup requirements apply. | 26.10.02 (APKM) |  |
| Prefer original photo quality | Enables original photo quality by default. Upload limits and video are unaffected. | 26.08.01, 26.10.02 (APKM) |  |
| Remove AD_ID permission | Removes Zalo's advertising ID permissions. Messaging is unaffected. | 26.08.01, 26.10.02 (APKM) |  |
| Remove media backup age limit | Includes media of any age in Drive backup and restore. Drive retention and excluded media still apply. | 26.08.01, 26.10.02 (APKM) |  |
| Suppress outbound seen status | Stops sending read receipts while preserving delivery acknowledgements. | 26.08.01, 26.10.02 (APKM) |  |
| Suppress outbound typing status | Stops sending typing indicators. Incoming typing status is unaffected. | 26.08.01, 26.10.02 (APKM) |  |
| microG Drive support | Uses microG-RE for Google Drive account selection and sign-in. Requires app.revanced.android.gms and the app.revanced account type. | 26.08.01, 26.10.02 (APKM) |  |

</details>

<details>
<summary>📦 Threads • 6 patches</summary>

**🎯 Supported versions:**

| 434.0.0.41.74 (APKS) | 445.0.0.46.83 (APKS) | 449.0.0.54.82 (APKS) | 453.0.0.56.79 (APKS) | 453.0.0.56.79 (APKM) |
| :---: | :---: | :---: | :---: | :---: |
|  |  |  |  | Only arm64-v8a has been validated; ABI is not restricted by compatibility metadata. |

| 💊&nbsp;Patch | 📜&nbsp;Description | 🎯&nbsp;Versions / file type | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| Change app name | Changes the app name shown in the launcher. | 434.0.0.41.74, 445.0.0.46.83, 449.0.0.54.82, 453.0.0.56.79 (APKS) | • App name |
| Change package name | Allows a renamed clone alongside Threads. Login, content providers or push may break. | 434.0.0.41.74, 445.0.0.46.83, 449.0.0.54.82, 453.0.0.56.79 (APKS) | • Package name |
| Hide ads | Removes sponsored posts from the Threads feed. Other surfaces are unaffected. | 434.0.0.41.74, 445.0.0.46.83, 449.0.0.54.82, 453.0.0.56.79 (APKS) |  |
| Hide suggested accounts | Removes suggested-account units from the Threads feed. Other suggestion surfaces are unchanged. | 453.0.0.56.79 (APKM) |  |
| Open links externally | Opens web links externally when possible; otherwise Threads handles them normally. | 434.0.0.41.74, 445.0.0.46.83, 449.0.0.54.82, 453.0.0.56.79 (APKS) |  |
| Remove AD_ID permission | Removes advertising ID permissions. Meta's own analytics are unaffected. | 434.0.0.41.74, 445.0.0.46.83, 449.0.0.54.82, 453.0.0.56.79 (APKS) |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Set up the toolchain using the [development guide](docs/development.md).
- Run `./gradlew :patches:buildAndroid --no-daemon`. The bundle is in `patches/build/libs/`.
- Apply it with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop). See [testing](docs/testing.md) for validation.

For Zalo Drive setup, see the [microG-RE guide](docs/microg.md). For a custom launcher icon, see the [example and instructions](docs/custom-icon.md).

[Report a bug or request a feature](https://github.com/zeldrisho/morphe-patches/issues/new/choose).

## 📜 License

Zeldris Patches are licensed under the [GNU General Public License v3.0](LICENSE).
