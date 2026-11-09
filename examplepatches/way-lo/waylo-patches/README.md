# way-lo Patches

Personal patches for Android apps, for use with [Morphe](https://morphe.software).
These are independent patches by way-lo, not part of or endorsed by the Morphe project.

## How to use these patches

Add this repo as a patch source in Morphe Manager: `https://github.com/way-lo/waylo-patches`
(or use the one-click link <https://morphe.software/add-source?github=way-lo/waylo-patches>).

Or patch locally with a built `.mpp` file, see [Building locally](#-building-locally).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/way-lo/waylo-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Podcast Addict&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.bambuna.podcastaddict`

**🎯 Supported versions:**

| 2026.14 | 2026.7 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Swipe to add/remove on new episodes](#swipe-to-add-remove-on-new-episodes) | On the New episodes screen, swipe an episode left or right to add it to the playlist, or to remove it if it is already there. |  |
| [Swipe to add/remove on recent episodes](#swipe-to-add-remove-on-recent-episodes) | On the Recent episodes screen, swipe an episode left or right to add it to the playlist, or to remove it if it is already there. |  |
| [Swipe to remove from playlist](#swipe-to-remove-from-playlist) | Swipe an episode left or right in the Playlist to remove it from the playlist. Swiping between the Playlist tabs no longer works, tapping the tab titles does. |  |

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
