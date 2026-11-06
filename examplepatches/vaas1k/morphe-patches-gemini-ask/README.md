# Gemini Ask Patches

Morphe add-on bundle for YouTube.

## ❓ About

Adds a Gemini button to the YouTube player. A tap sends the video link to the Gemini app.
The Download button and the rest of the official Morphe patches stay as they are.

This is an add-on for the official [Morphe Patches](https://github.com/MorpheApp/morphe-patches): select both bundles in one patch run.
It hooks only the official add-on API, so it does not need a rebuild for new YouTube versions.
The button can be turned off with the "Gemini button" switch in Morphe settings, next to the download button switch.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/vaas1k/morphe-patches-gemini-ask

<a href="https://morphe.software/add-source?github=vaas1k/morphe-patches-gemini-ask">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/vaas1k/morphe-patches-gemini-ask/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.google.android.youtube`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Gemini Ask](#gemini-ask) | Adds a Gemini button to the player that sends the video link to the Gemini app. Apply together with the official Morphe patches. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Gemini Ask Patches are licensed under the [GNU General Public License v3.0](LICENSE)
