# 🧩 ezykam-patches

Patches for CP ezyKam+, handcrafted by vibes, assembled by AI, and reviewed by
absolutely nobody (as God intended). If it works, it's a feature. If it breaks,
it's a learning experience.

## How to use these patches

Click here to add these patches to Morphe:
https://morphe.software/add-source?github=vipulog/ezykam-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/vipulog/ezykam-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 CP ezyKam+&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 4.1.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add 4x playback speed](#add-4x-playback-speed) | Adds 4x fast-forward speed option to camera SD card playback. |  |
| [Fix playback freeze at clip boundaries](#fix-playback-freeze-at-clip-boundaries) | Fixes SD card playback freezing at clip ends by auto-advancing to consecutive fragments. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using
  [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop) like any other
  patch bundle.

See the
[Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for
more information.

## 📜 License

These Patches are licensed under the [GNU General Public License v3.0](LICENSE)
