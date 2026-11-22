# Ben's Morphe Patches

A collection of Android app patches for use with [Morphe Manager](https://morphe.software). This repository brings the maintained patches together in one source, with room for more apps as the collection expands.

[**Add this source to Morphe**](https://morphe.software/add-source?github=xiliav/bens-morphe-patches)

Repository address: `https://github.com/xiliav/bens-morphe-patches`

## Install on your phone

1. Install or update [Morphe Manager](https://morphe.software).
2. Open the **Add this source to Morphe** link above and confirm, or open **Sources → + → Remote** and paste this repository's address.
3. Choose a supported app and select **Ben's Morphe Patches** as its patch source. In Expert mode, choose the patches you want to apply.
4. Select an original app package matching a supported version and file type listed below. For split packages such as APKM, use the complete bundle.
5. Patch, then install the result using Morphe's prompts. If Android reports a signing conflict with an existing installation, replacing it may require uninstalling it first; uninstalling can delete its local data.

For a manual import, download `patches-<version>.mpp` from [Releases](https://github.com/xiliav/bens-morphe-patches/releases) and add it through **Sources → + → Local**. Remote sources can update automatically; local imports must be updated manually.

If the repository address fails to load, try adding the [direct metadata URL](https://raw.githubusercontent.com/xiliav/bens-morphe-patches/main/patches-bundle.json) as a remote source.

## Supported apps and patches

The list below is generated from each release and includes the supported versions for every app in the collection. Compatibility and available features vary by app; check its entry before choosing an original package. New app versions may need updated patches.

<!-- PATCHES_START EXPANDED -->
> **[v1.1.3](https://github.com/xiliav/bens-morphe-patches/releases/tag/v1.1.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Citizen&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `sp0n.citizen`

**🎯 Supported versions:**

| 0.1319.0 | 0.1318.0 | 0.1307.0 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Unlocks local Citizen Plus/Protect features and hides paywalls. |  |

</details>

<details open>
<summary>📦 Transit&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.thetransitapp.droid`

**🎯 Supported versions:**

| 6.3.7 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Royale](#unlock-royale) | Enables Transit's local Royale membership checks. | • Google Maps API key (optional) |

</details>

<!-- PATCHES_END -->

## App-specific notes

Detailed installation notes, limitations, and credits belong with each app:

- [Citizen](docs/apps/citizen.md)
- [Transit](docs/apps/transit.md)

## Build and release

This project uses the official [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template) and its semantic-release workflow. It publishes the Android `.mpp` bundle, patch list, changelog, and Manager metadata together.

- Make changes on `dev` with `fix:` or `feat:` commit messages to create a prerelease. Enable **Pre-release patches** on this source in Manager to receive those builds.
- Merge `dev` into `main` without squashing to create a stable release. The **Release** workflow also supports manual dispatch.
- Do not edit generated `patches-list.json`, `patches-bundle.json`, or `CHANGELOG.md` by hand.
- For local builds, use Java 21 and run `./gradlew :patches:buildAndroid :patches:generatePatchesList`. The bundle appears under `patches/build/libs/`.
- GitHub Packages authentication may be required locally. Follow [Morphe's setup documentation](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/1_setup.md); never commit a token. Actions uses its built-in `GITHUB_TOKEN`.
- Release signing is optional and is not configured initially. Follow [Morphe's signing guide](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/2_signing.md) to add a persistent signing key. The private key is ignored by git.

Original app binaries, account information, and credentials are not part of this repository or its release assets.

## Attribution and license

This collection includes code adapted from [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches). App-specific credits are recorded in the notes above. Build and release infrastructure comes from [MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template).

Licensed under [GPL-3.0](LICENSE), with the notices in [NOTICE](NOTICE). This source is independently maintained and is not affiliated with the Morphe project or the developers of the apps it patches.
