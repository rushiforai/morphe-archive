# Quetta Privacy Patches

Morphe patches that remove analytics, crash reporting and vendor tracking endpoints from
Quetta Browser (`net.quetta.browser`), harden its network security config, and drop
`QUERY_ALL_PACKAGES`.

Apply with [Morphe Manager](https://github.com/MorpheApp/morphe-manager) or any Morphe patcher.
The input must be a single APK; merge Quetta's split bundle first (APKEditor `m`).

Patches declare compatibility with Quetta Browser 2.2.0 and refuse to run on other packages.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/weird-aftertaste/quetta-privacy-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;16 patches total
<details open>
<summary>📦 Quetta Browser&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Package name:** `net.quetta.browser`

**🎯 Supported versions:**

| 2.2.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable update and push endpoints](#disable-update-and-push-endpoints) | Points the component update and push registration hosts at a non-resolvable domain. Component and ad-block list updates stop, and push notifications do not arrive. |  |
| [Harden network security config](#harden-network-security-config) | Disables cleartext traffic in base and domain configurations and drops trust in user-installed CAs. |  |
| [Remove QUERY_ALL_PACKAGES](#remove-query-all-packages) | Drops android.permission.QUERY_ALL_PACKAGES from the manifest. May degrade installed-app detection. |  |
| [Strip analytics endpoints](#strip-analytics-endpoints) | Points usage reporting, crash reporting and telemetry beacon hosts at a non-resolvable domain, so they cannot be uploaded. |  |
| [Strip analytics endpoints from native libraries](#strip-analytics-endpoints-from-native-libraries) | Rewrites analytics and crash reporting hosts in lib*.so, which bytecode patches cannot reach. |  |
| [Strip update and push endpoints from native libraries](#strip-update-and-push-endpoints-from-native-libraries) | Rewrites update and push hosts in lib*.so, which bytecode patches cannot reach. |  |
| [Strip vendor endpoints from native libraries](#strip-vendor-endpoints-from-native-libraries) | Rewrites Quetta vendor endpoints in lib*.so, which bytecode patches cannot reach. |  |
| [Strip vendor tracking endpoints](#strip-vendor-tracking-endpoints) | Points the favicon proxy, start page, video sniffing and share link hosts at a non-resolvable domain. Site icons and start page suggestions stop loading. |  |

</details>

<details open>
<summary>📦 Quetta Browser (official APK)&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Package name:** `net.quetta.browser.official`

**🎯 Supported versions:**

| 2.0.9 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable update and push endpoints](#disable-update-and-push-endpoints) | Points the component update and push registration hosts at a non-resolvable domain. Component and ad-block list updates stop, and push notifications do not arrive. |  |
| [Harden network security config](#harden-network-security-config) | Disables cleartext traffic in base and domain configurations and drops trust in user-installed CAs. |  |
| [Remove QUERY_ALL_PACKAGES](#remove-query-all-packages) | Drops android.permission.QUERY_ALL_PACKAGES from the manifest. May degrade installed-app detection. |  |
| [Strip analytics endpoints](#strip-analytics-endpoints) | Points usage reporting, crash reporting and telemetry beacon hosts at a non-resolvable domain, so they cannot be uploaded. |  |
| [Strip analytics endpoints from native libraries](#strip-analytics-endpoints-from-native-libraries) | Rewrites analytics and crash reporting hosts in lib*.so, which bytecode patches cannot reach. |  |
| [Strip update and push endpoints from native libraries](#strip-update-and-push-endpoints-from-native-libraries) | Rewrites update and push hosts in lib*.so, which bytecode patches cannot reach. |  |
| [Strip vendor endpoints from native libraries](#strip-vendor-endpoints-from-native-libraries) | Rewrites Quetta vendor endpoints in lib*.so, which bytecode patches cannot reach. |  |
| [Strip vendor tracking endpoints](#strip-vendor-tracking-endpoints) | Points the favicon proxy, start page, video sniffing and share link hosts at a non-resolvable domain. Site icons and start page suggestions stop loading. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Building locally

- `./gradlew buildAndroid`
- The bundle is written to `patches/build/libs/patches-*.mpp`
- Apply it with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) or the CLI in `../morphe-apply`
