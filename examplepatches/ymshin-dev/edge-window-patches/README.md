# Edge Window Patches

An experimental universal patch source for Android apps, compatible with Morphe.

Repository: <https://github.com/ymshin-dev/edge-window-patches>

## Patch

**Hide status bar and ignore display cutouts** changes every app-defined `Activity` window:

- Android 9 and newer: allows the window to extend into display cutout areas.
- Hides the status bar directly, without enabling Android's sticky immersive mode. The navigation bar remains visible.
- Android 11 and newer: removes status-bar and display-cutout insets before dispatching them from the window root to app views.
- Reapplies the settings after resume, window-focus, and configuration changes, and when drawing detects that the app has shown the status bar again or re-fitted its window to the system bars.

The patch ships in two variants:

- **Hide status bar and ignore display cutouts** — listed for YouTube only. Enable it when patching YouTube.
- **Hide status bar and ignore display cutouts (universal)** — listed for any app. It relies on a browser-safe runtime helper that installs the top-inset filter at the window root, so Chromium-based browsers (Edge, Chrome, and similar) no longer shift their whole window below the cutout on the new tab page; a window that re-fits itself to the system bars is re-applied and re-laid out. Both variants share the same runtime helper, so the fix is included in both.

The patch is disabled by default. Enable only a variant of it for the app where the content should use the notch or punch-hole area. Do not enable more than one variant on the same app.

## Add the source in Morphe

After the updated GitHub release is published, open **Sources → + → Remote** in Morphe Manager and enter:

```text
github.com/ymshin-dev/edge-window-patches
```

Patches are optional and must be selected in Expert mode. Enable only one variant of the hide patch per app, and only for the app where the content should use the notch or punch-hole area.

## Limits

The inset filter reaches view layouts that use the normal window-inset dispatch path. An app can still add padding itself or read root window insets directly, which may leave the player below the punch-hole. A browser that reads display cutout information from the display object instead of window insets can also offset its page. Removing top insets can move interactive controls close to the camera. Below Android 11, the patch can allow the window into the cutout but does not filter inset dispatch; below Android 9, it can hide the status bar but there is no display-cutout window API.

## Build

Build the Morphe patch bundle with:

```sh
./gradlew buildAndroid
```

The `.mpp` file is written to `patches/build/libs/`. Morphe's patcher artifacts are served through GitHub Packages; builds need a token with `read:packages` access configured as `gpr.user` and `gpr.key` in your Gradle user properties.

For GitHub Actions releases, add a `GPR_KEY` repository secret with a GitHub token that can read packages. `GPR_USER` is optional and defaults to the workflow actor. Keep package tokens out of committed files.

The cutout patch changes Android window policy and inset dispatch but has not been validated against a target APK or Galaxy device.

## Patch catalog

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/ymshin-dev/edge-window-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide status bar and ignore display cutouts](#hide-status-bar-and-ignore-display-cutouts) | Hides the status bar and removes top status-bar and cutout insets from app content. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide status bar and ignore display cutouts (universal)](#hide-status-bar-and-ignore-display-cutouts-universal) | Hides the status bar and removes top status-bar and cutout insets from app content in any app. |  |

</details>

<!-- PATCHES_END -->
