# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=windwanderer/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.10.0](https://github.com/windwanderer/morphe-patches/releases/tag/v1.10.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 MetService&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2.35.1 | 2.35.0 | 2.34.1 | 2.33.0 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [MetService Premium](#metservice-premium) | Enable ad-free state. |  |
| [MetService Remove Splash Delay](#metservice-remove-splash-delay) | Remove the 2-second splash delay. |  |

</details>

<details open>
<summary>📦 Stellarium&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.16.8 | 1.16.7 | 1.16.5 | 1.16.3 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Stellarium Extended Catalog](#stellarium-extended-catalog) | Import a locally downloaded extended catalog ZIP instead of waiting for a Play Asset Delivery download that a sideloaded install can never receive. Nothing is downloaded and nothing is requested at launch; without a ZIP the app is unchanged. Enabled by default; turn it off in Expert mode if you do not want the ZIP entry. |  |
| [Stellarium Extended Catalog (ZIP support)](#stellarium-extended-catalog-zip-support) | Adds the "open with" and share-sheet entries that let Stellarium receive a locally downloaded extended catalog ZIP. Used by Stellarium Extended Catalog. |  |
| [Stellarium Premium](#stellarium-premium) | Unlock Stellarium Plus by patching the native license checks, and skip the Play data pack request a sideloaded install cannot satisfy (arm64-v8a and armeabi-v7a). |  |

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
