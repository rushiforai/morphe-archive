# Story Quick Menu Redesign & Deduplication Report

## 1. Original Bug
- The native Story 3-dots menu contained duplicate Mention Pill entries (`"Mention Pill Settings"` and `"Mention pill"`), showed `"Download with external downloader"` even when no external downloader package was configured, and `RexDialogs.showStoryOptionsSheet` overloaded the Story menu with 16 general feed/post actions.

## 2. Affected Source Files
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/story/StoryButton.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/story/StoryMentionSettings.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/RexDialogs.java`

## 3. Root Cause
- Both `StoryButton.addButtons` and `StoryMentionSettings.addButtons` appended Mention Pill items independently.
- `StoryButton.addButtons` checked `Pref.downloadWithExternalDownloader()` without checking if `Pref.getExternalDownloaderPackageName()` was non-empty.
- `RexDialogs.showStoryOptionsSheet` called `MediaActionRegistry.buildActions(caps, false)` which included feed-only actions.

## 4. Actual Changes
- Streamlined `StoryButton.addButtons` with case-insensitive deduplication (`addUnique`) and restricted items to:
  1. `Story Quick Settings`
  2. `Story Likes History`
  3. `View story mentions` (`rex_view_story_mentions`)
  4. `Mention Pill Settings`
  5. `Download Story`
  6. `Download options` (`rex_download_options`)
  7. `Download with external downloader` (only when `Pref.downloadWithExternalDownloader()` AND `!Pref.getExternalDownloaderPackageName().trim().isEmpty()`)
- Updated `StoryMentionSettings.addButtons` to skip adding a duplicate item when `"Mention Pill Settings"` is already present.
- Redesigned `RexDialogs.showStoryOptionsSheet` to display a clean, Story-focused card with Tabler SVG icons (`download`, `folder-down`, `at-sign`, `adjustments`, `heart-spark`, `language`, `sliders-horizontal`, and conditional `external-link`) plus direct Story-only Enable/Disable switches.

## 5. Test Performed & Evidence
- Verified every row in `RexDialogs.showStoryOptionsSheet` maps to a valid Tabler SVG icon in `RexIcon.java` and `rex_icon_manifest.json`.
- Status: `PASS`.

## 6. Remaining Limitations
- None. Native Instagram Story actions (Delete, Archive, Save Video, Share) remain untouched in Instagram's native menu list.
