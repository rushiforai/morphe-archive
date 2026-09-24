# 🧩 Morphe patches by virzak

A personal [Morphe](https://github.com/MorpheApp) patch source. Add it once and it shows up
in Morphe alongside the built-in patches; each app it supports appears as its own section on
the patch screen.

It currently ships patches for **RuTube**. A Morphe source can carry more than one app, so
others may be added here over time - if you have already added the source, new apps arrive
with the next update, nothing to re-add.

## ➕ Add it to Morphe

One tap (opens Morphe and asks you to confirm):

**https://morphe.software/add-source?github=virzak/morphe-patches&name=virzak%20patches**

Or add it by hand: in Morphe, **Sources** (bottom of the home screen) -> **+** -> **Remote**,
then paste:

```
github.com/virzak/morphe-patches
```

Morphe keeps a repository source updated on its own, and picks up new releases as they land.

> [!NOTE]
> Only add patch sources you trust. A source decides what ends up inside your patched apps.
> Everything here is open - read the patch code in [`patches/`](patches/) and build it
> yourself (below) if you would rather not take the release on faith.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/virzak/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 RuTube&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 31.14.2-rustore |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom branding icon](#custom-branding-icon) | Adds a badge to the launcher icon so the patched app is distinguishable from an unpatched install. |  |
| [Disable ads](#disable-ads) | Prevents the ad SDK from starting, which stops banner ads and pre-roll video ads. |  |
| [Enable background playback](#enable-background-playback) | Allows playback to continue when the app is not in the foreground, which is otherwise only available with a paid subscription. |  |
| [Lift download restrictions](#lift-download-restrictions) | Allows downloading videos the app otherwise refuses, either because the uploader disabled downloads or because the video is longer than six hours. |  |
| [Unlock subscription features](#unlock-subscription-features) | Reports the account as subscribed to the app itself, which enables features gated behind a paid subscription such as background playback. Anything the server enforces is unaffected. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches `.mpp` file is in `patches/build/libs/patches-*.mpp`
- Load the `.mpp` in Morphe (Sources -> + -> Local) or apply it with
  [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop) like any other bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more.

## 📜 License

Licensed under the [GNU General Public License v3.0](LICENSE).
