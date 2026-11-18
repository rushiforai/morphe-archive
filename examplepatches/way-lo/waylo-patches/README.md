# way-lo Patches

Personal patches for Android apps, for use with [Morphe](https://morphe.software).
These are independent patches by way-lo, not part of or endorsed by the Morphe project.

## How to use these patches

Add this repo as a patch source in Morphe Manager: `https://github.com/way-lo/waylo-patches`
(or use the one-click link <https://morphe.software/add-source?github=way-lo/waylo-patches>).

Or patch locally with a built `.mpp` file, see [Building locally](#-building-locally).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.1](https://github.com/way-lo/waylo-patches/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Google News&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.google.android.apps.magazines`

**🎯 Supported versions:**

| 5.163.0.947799485 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable CustomTabs](#enable-customtabs) | Enables CustomTabs to open articles in your default browser. |  |
| [GmsCore support](#gmscore-support) | Allows Google News to sign in via MicroG (GmsCore) instead of Google Play Services when installed under a renamed package. |  |

</details>

<details open>
<summary>📦 Podcast Addict&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.bambuna.podcastaddict`

**🎯 Supported versions:**

| 2026.14.1 | 2026.14 | 2026.7 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Swipe to add/remove on new episodes](#swipe-to-add-remove-on-new-episodes) | On the New episodes screen, swipe an episode left or right to add it to the playlist, or to remove it if it is already there. |  |
| [Swipe to add/remove on recent episodes](#swipe-to-add-remove-on-recent-episodes) | On the Recent episodes screen, swipe an episode left or right to add it to the playlist, or to remove it if it is already there. |  |
| [Swipe to remove from playlist](#swipe-to-remove-from-playlist) | Swipe an episode left or right in the Playlist to remove it from the playlist. Swiping between the Playlist tabs no longer works, tapping the tab titles does. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change package name](#change-package-name) | Appends ".morphe" to the package name by default. Changing the package name of the app can lead to unexpected issues. | • Package name<br>• Update permissions<br>• Update providers |

</details>

<!-- PATCHES_END -->

## Podcast Addict: Playlist swipe to remove

- Drag a row left or right: it follows your finger and fades. Release past about a third of the
  screen width to remove the episode, or release earlier and it snaps back.
- It uses the app's own "Remove from Playlist" code, the same as the long press menu.
- Only clearly horizontal drags count, so vertical scrolling and drag-to-reorder with the handle on the
  left still work.
- **Swiping between the tabs (Audio / Video / Custom) no longer works on the Playlist screen.**
  Tapping the tab titles still works. The tab pager would otherwise take every horizontal drag.
- Playlist types for which the long press menu has no "Remove from Playlist" ignore the swipe too.
- Developed and tested on Podcast Addict `2026.7` (build 21719). Later versions are marked
  experimental because the patch only uses stable anchors (see below), but it has not been tried on them.
- Works with a premium-unlocked modded APK as long as the code structure is the stock one.

### How it works

| Piece | Where | What it does |
|-------|-------|--------------|
| `PlaylistSwipeToRemove` | [extension](extensions/extension/src/main/java/app/waylo/extension/podcastaddict/PlaylistSwipeToRemove.java) | The swipe gesture: detection, row animation, removal call. Plain Java, merged into the app. |
| `PlaylistRemoveHost` | [extension](extensions/extension/src/main/java/app/waylo/extension/podcastaddict/PlaylistRemoveHost.java) | Interface the patch adds to the Playlist's list remove-listener class. It marks which list is the Playlist and does the removal. |
| Patch | [PlaylistSwipeToRemovePatch.kt](patches/src/main/kotlin/app/waylo/patches/podcastaddict/PlaylistSwipeToRemovePatch.kt) | Hooks `DragSortListView.onInterceptTouchEvent` / `onTouchEvent` / `setRemoveListener`, the Playlist adapter's `getView`, and adds `swipeRemoveAt(int)` to the remove-listener class. |
| Fingerprints | [Fingerprints.kt](patches/src/main/kotlin/app/waylo/patches/podcastaddict/Fingerprints.kt) | Finds the obfuscated classes through names that are not obfuscated: the library class name, framework method names, and the strings `"PlayListAdapter"`, `"dequeueEpisode(PlaylistFragment, "` and `"playlistType"`. |

If a later Podcast Addict version stops patching, the error names the fingerprint that no longer matches.
Compare it with the app's decompiled code, the strings above are the usual first thing to look for.

## Google News

Ported from [docbt/patched-up](https://github.com/docbt/patched-up) so Google News can be patched in one pass
from this source. Developed against Google News `5.163.0.947799485`.

| Patch | What it does |
|-------|--------------|
| **GmsCore support** | Signs in through [MicroG RE](https://github.com/MorpheApp/MicroG-RE) instead of Google Play Services. Rewrites the app's `com.google.*` GMS actions, permissions and authorities to `app.revanced.*`, adds the MicroG spoofing metadata, and bypasses the Play Services availability checks. |
| **Enable CustomTabs** | Opens articles in your default browser through CustomTabs instead of the in-app WebView. |
| **Change package name** | Pulled in by both patches above so the app installs next to the stock one (adds `.morphe` by default). Off by default for every other app. |

### Changes from patched-up

- **Sign-in fix.** GmsCore support also adds `<package android:name="app.revanced.android.gms"/>` to the
  manifest `<queries>`. On Android 11 and later, package visibility otherwise hides MicroG from the app: it
  cannot resolve MicroG's `auth.accounts` provider, sees no accounts, and sign-in ends in
  **"This account already exists on your device"**
  ([patched-up issue #34](https://github.com/docbt/patched-up/issues/34)).
- "Change package name" is opt-in for apps that do not depend on it.

### Version notes

- **Enable CustomTabs is the fragile one.** It finds its targets by obfuscated class names (`Laeah`, `Ladzz`,
  ...) that change with almost every Google News release, so expect it to fail on a new version until its
  fingerprints are updated. If it does, untick it and patch with GmsCore support alone.
- GmsCore support finds its targets by strings, so it usually survives new versions.
- Do not combine these with the patched-up source on the same APK. The patches are the same and would apply twice.

## 🛠️ Building locally

Needs Java 21 and a GitHub token that can read packages (Morphe's libraries are hosted on GitHub Packages,
which requires a token even for public packages).

1. Create a token with the `read:packages` scope: <https://github.com/settings/tokens/new?scopes=read:packages&description=Morphe>
2. Put it in `~/.gradle/gradle.properties`:
   ```properties
   gpr.user = your_github_username
   gpr.key = ghp_xxxxxxxxxxxxxxxxxxxx
   ```
3. Run `./gradlew buildAndroid`
4. The bundle is `patches/build/libs/patches-*.mpp`. Use it in Morphe like any other local patch bundle.

### Building on GitHub (no local setup)

The **Build .mpp** workflow (Actions tab, "Run workflow") builds the bundle and attaches it to the run as an
artifact, from any branch. The **Release** workflow is Morphe's template release pipeline: pushes to `dev`
and `main` with `feat:` / `fix:` commits create (pre-)releases, which is also what Morphe Manager sources use.

## 🧑‍💻 Development notes

- Follow the template's flow: work on `dev`, use `feat:` / `fix:` / `chore:` commit messages, merge `dev`
  into `main` (no squash) for a stable release. Do not hand-edit `patches-list.json`, `patches-bundle.json`
  or `CHANGELOG.md`, the release workflow updates them.
- To add a patch for another app, add a package under `patches/src/main/kotlin/app/waylo/patches/<app>/`
  with a `Fingerprints.kt` and a patch file, plus any extension code under
  `extensions/extension/src/main/java/app/waylo/extension/<app>/`.
- See the [patcher documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/1_patcher_intro.md).

## 📜 License

way-lo Patches are licensed under the [GNU General Public License v3.0](LICENSE), with the additional
terms in the [NOTICE](NOTICE). This project is based on the Morphe patches template.
