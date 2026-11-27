# Watchtime Tracker patches

A patch for YouTube, for use with [Morphe](https://morphe.software), that lets the
[Watchtime Tracker](https://github.com/xD33m/Watch_Statistics_Extension) Android app count the YouTube Shorts you
watch. Android does not report Shorts to other apps, so without this patch the app cannot see them.

The patched YouTube tells the Watchtime Tracker app, on your phone, which Short is playing and when it stops. That is
all it passes: the Short's video id and "playing" or "stopped". Nothing leaves your phone, and nothing is sent at all
if the Watchtime Tracker app is not installed or you turned the extra source off in its settings.

## Requirements

- The Watchtime Tracker app on the same phone, with notification access granted.
- YouTube patched with the official Morphe patches in the same run (keep their defaults; this patch uses their add-on
  support). Any YouTube version the official patches support works.

## Install

1. In Morphe Manager, add this repository as a patch source: tap the button below on your phone, or open
   **Sources → + → Remote** and enter `github.com/xD33m/watchtime-tracker-patches`.

   <a href="https://morphe.software/add-source?github=xD33m/watchtime-tracker-patches">
     <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
   </a>

2. Patch YouTube with the official patches and **Report Shorts to Watchtime Tracker** selected (it is on by default).
3. Install the patched YouTube. Watch a Short: the Watchtime Tracker app's Settings now show **Extra source**, and
   Shorts appear on its YouTube screen.

## Limits

- Root (mount) installs keep the original YouTube app and do not work.
- Cloned YouTube apps under another package name do not work.
- Only Shorts are reported. Regular videos are tracked by the app itself.

## Patches

<!-- PATCHES_START -->
> **[v1.0.0](https://github.com/xD33m/watchtime-tracker-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**1 patch** across **1 app**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**YouTube**](PATCHES.md#youtube-comgoogleandroidyoutube) | 1 | — | [`com.google.android.youtube`](https://play.google.com/store/apps/details?id=com.google.android.youtube) |
<!-- PATCHES_END -->

## License

GNU General Public License v3.0, with the additional terms in [NOTICE](NOTICE). `HostCheck.kt` is adapted from
[morphe-patches-yavot](https://github.com/MarcaDian/morphe-patches-yavot) (GPL-3.0).

## Building

JDK 21, the Android SDK (`ANDROID_HOME`), and a GitHub token with `read:packages` as `gpr.user` / `gpr.key` in
`~/.gradle/gradle.properties` (Morphe's packages are on GitHub Packages).

```sh
./gradlew buildAndroid                               # patches/build/libs/patches-*.mpp
./gradlew :extensions:extension:testDebugUnitTest    # unit tests of the Shorts detection
```

Releases are made only by `release.yml` from Conventional Commits (`feat:`, `fix:`) on `main` and, as pre-releases, on
`dev`.
