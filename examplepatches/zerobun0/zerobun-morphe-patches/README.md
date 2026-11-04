# Zerobun Morphe patches

Small, standalone Morphe patches. Apply **alongside** [Piko](https://github.com/crimera/piko), not instead of it.

## ❓ About

**Follower tracker (Instagram):** captures follower/following lists as you scroll them and sends them to a self-hosted tracker that records who joined and left, and when. It makes no extra Instagram requests.

The approach (the follow-list row binder and the User-model getters) was learned from Piko (GPLv3); this is an independent implementation in its own package so both can be applied together.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/zerobun0/zerobun-morphe-patches

<a href="https://morphe.software/add-source?github=zerobun0/zerobun-morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.3](https://github.com/zerobun0/zerobun-morphe-patches/releases/tag/v1.2.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Instagram&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.instagram.android`

**🎯 Supported versions:**

| 452.1.0.53.64 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Follower tracker](#follower-tracker) | Captures follower and following lists as you scroll them and sends them to your self-hosted tracker, which records who joined and who left, and when. Uses only the requests the app already makes. Apply alongside Piko. | • Tracker URL<br>• Tracker token<br>• Batch size<br>• Scroll lists automatically |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
