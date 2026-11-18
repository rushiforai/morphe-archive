# INSTAREX (REX IG LITE v3.16.0) — PIKO IG LITE & PIKO MAIN FEATURE MERGE & DEDUPLICATION MATRIX (`FEATURE_MERGE_MATRIX.md`)

## 1. Source Repositories Audited
1. **InstaRex / Rex IG Lite**: `/working_dir/c_15cecc76b42f1ce2/work/rex-ig-lite` ([`https://github.com/xboyrex/rex-ig-lite`](https://github.com/xboyrex/rex-ig-lite))
2. **Upstream Piko IG Lite**: `/working_dir/c_15cecc76b42f1ce2/work/piko_ig_lite/piko-ig-lite-main` ([`https://github.com/crimera/piko-ig-lite`](https://github.com/crimera/piko-ig-lite))
3. **Upstream Piko Main**: `/working_dir/c_15cecc76b42f1ce2/work/piko_main/piko-main` ([`https://github.com/crimera/piko`](https://github.com/crimera/piko))

---

## 2. Cross-Repository Patch & Feature Consolidation Summary
- **Total Named Patches in Manifest (`patches-list.json`)**: `161` (`86` Instagram-only, `74` X-only, `1` shared).
- **Total Instagram `Settings.java` Constants**: `139` (`100%` wired to downstream runtime hooks outside `Pref.java` and `ScreenBuilder.java`).
- **Crown / Paywall / Premium Gates**: `0` (All features are 100% free and un-gated; `Premium`, `View Blocked Profiles Secretly`, `Mark as Seen after Reply` crown gate, and `Creative Fonts for DMs` crown gate from the InstaPrime screenshots are excluded per `MASTER_PROMPT.md` Rule 10).

| Feature Domain | Piko Main (`crimera/piko`) | Piko IG Lite (`crimera/piko-ig-lite`) | InstaRex (`xboyrex/rex-ig-lite` v3.16.0) | Merge & Deduplication Decision |
| :--- | :--- | :--- | :--- | :--- |
| **Media Downloads & Carousel Engine** | Basic feed/reel/story download (`DownloadUtils.java`) | Compact download sheet (`DownloadSelectionSheet.java`) | Unified `MediaContextResolver` + `MediaActionRegistry` + `DownloadSelectionSheet` + Pando/Obfuscated `ImageInfo` & 4-stage `CarouselMedia` adapter | **Merged & Upgraded**: Preserved both compact Direct Download sheet and full 4-group Post/Reel/Carousel/Story Options menu with single-modal ownership. |
| **Ghost Mode Suite (12 Controls)** | Story/DM/Live/Typing/Screenshot stealth | Added `ghost_instants`, `hide_view_once_seen`, `listen_voice_note_secretly` | All 12 individual Ghost Mode switches + bottom `Enable/Disable All Ghost Modes` bulk card + `RexMessageDb` Anti-Delete Messages + `LastActive` exact timestamp | **Merged**: Preserved every distinct hook (`VisualSeen`, `ViewOnceMark`, `EphemeralMediaPatch`, `InstantsDownloadHook`, `TypingStatus`, `LiveSeen`, `ScreenshotBlock`). |
| **Story Hidden Mentions & Mention Pill** | `ViewStoryMentionsPatch` (`PeopleCellDialogBox`) | `StoryMentionIcon` + `StoryMentionPopup` + `StoryMentionSettings` | Both `StoryMentionIcon` header pill (`@N mentions`) and Story Options `Hidden Mentions (0)` / `Hidden Mentions (N)` dialog | **Merged**: Unified empty state (`Hidden Mentions (0) — No hidden mentions found for this story.`) and populated state (`Hidden Mentions (N)`). |
| **Distraction Free & Focus Lock** | Basic feed/reel/story hiders | Added timed `FocusLock` (`FocusLockDurationPreference`, `FocusLockTargets`) | Individual section hiders (`Hide Stories`, `Hide Feeds`, `Hide Reels`, `Hide Explore`, `Hide Comments`) + timed Focus Lock | **Merged**: Kept individual reversible visibility toggles separate from timed Focus Lock. |
| **Translator, OCR & Text Studio** | External link copy | Basic caption copy | Built-in multi-language Translator (`translateText`), Cover/Image OCR (`extractOcrFromMedia`), Interactive Bio/Caption/Comment Studio (`showTextStudioDialog`), and `RexVault` Saved Bios/Captions/Profiles | **Upgraded**: All 4 tools integrated with semantic Tabler icons and local persistence. |
| **In-App OTA Updater & Release Sync** | None | `UpdateChecker.java` | `UpdateChecker.java` (`PackageInstaller` session + SHA-256 cert check) + release-first `.github/workflows/build.yml` & `release.yml` | **Merged & Fixed**: Added `Check Update (OTA)` row in `RexAboutView` and fixed CI release-first `patches-bundle.json` ordering. |
