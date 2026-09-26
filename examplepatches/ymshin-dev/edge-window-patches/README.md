# Edge Window Patches

An experimental universal patch source for Android apps, compatible with Morphe.

Repository: <https://github.com/ymshin-dev/edge-window-patches>

## Patch

**Hide status bar and ignore display cutouts** changes every app-defined `Activity` window:

- Android 9 and newer: allows the window to extend into display cutout areas.
- Hides the status bar directly, without enabling Android's sticky immersive mode. The navigation bar remains visible.
- Android 11 and newer: removes status-bar and display-cutout insets before dispatching them from the Activity content root to app views.
- Reapplies the settings after resume, window-focus, and configuration changes, and when drawing detects that the app has shown the status bar again.

The patch is disabled by default. Enable it only for apps where the content should use the notch or punch-hole area.

**Adjust app font scale** overrides only the font scale in the patched app's Activity contexts. It leaves display density and density-based layout dimensions unchanged, so it can be combined with Samsung's screen-zoom/DPI setting to keep a denser feed while making text easier to read. Set the multiplier slider between `0.5×` and `2.0×`: `1.0×` keeps the current system font scale, while `1.2×` increases it by that input factor. Android 14 and newer scale fonts nonlinearly, so the slider value does not guarantee an identical physical-size change for every text style. The patch is disabled by default; enable it only for the app whose text should change.

## Add the source in Morphe

After the updated GitHub release is published, open **Sources → + → Remote** in Morphe Manager and enter:

```text
github.com/ymshin-dev/edge-window-patches
```

Patches are optional and must be selected in Expert mode. Apply **Adjust app font scale** only to the target app (for example, YouTube).

## Limits

The inset filter reaches view layouts that use the normal window-inset dispatch path. An app can still add padding itself or read root window insets directly, which may leave the player below the punch-hole. Removing top insets can also move interactive controls close to the camera. Below Android 11, the patch can allow the window into the cutout but does not filter inset dispatch; below Android 9, it can hide the status bar but there is no display-cutout window API.

## Build

Build the Morphe patch bundle with:

```sh
./gradlew buildAndroid
```

The `.mpp` file is written to `patches/build/libs/`. Morphe's patcher artifacts are served through GitHub Packages; builds need a token with `read:packages` access configured as `gpr.user` and `gpr.key` in your Gradle user properties.

For GitHub Actions releases, add a `GPR_KEY` repository secret with a GitHub token that can read packages. `GPR_USER` is optional and defaults to the workflow actor. Keep package tokens out of committed files.

The cutout patch changes Android window policy and inset dispatch but has not been validated against a target APK or Galaxy device. The font-scale patch relies on app text being laid out with Android's font-scaling support; text rendered with fixed pixel sizes may not change. It has not been validated against a target APK or Galaxy device.

## Patch catalog

<!-- PATCHES_START EXPANDED -->
> **[v1.1.1](https://github.com/ymshin-dev/edge-window-patches/releases/tag/v1.1.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Adjust app font scale](#adjust-app-font-scale) | Scales text in this app without changing display density or layout sizing. | • Font scale multiplier |
| [Hide status bar and ignore display cutouts](#hide-status-bar-and-ignore-display-cutouts) | Hides the status bar and removes top status-bar and cutout insets from app content. |  |

</details>

<!-- PATCHES_END -->
