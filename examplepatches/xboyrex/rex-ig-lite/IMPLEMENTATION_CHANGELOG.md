# InstaRex (Rex IG Lite v3.16.0) — Implementation Changelog

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)
- **Release Version**: `v3.16.0`
- **Icon System**: [Tabler Icons](https://tablericons.com/) (`186` semantic icons, `253` mapped preference/route keys, `477` SVGs, `348` Android VectorDrawables)

## Summary of Changes in v3.16.0

1. **Story Viewer 3-Button Toolbar (`DownloadUtils.addStoryDownloadButton` + `StoryButton.java`)**:
   - Injected 3 Tabler icon buttons into `toolbar_buttons_container`: **Direct Story Download (`download`)**, **Hidden Mentions (`at-sign` / `@`)**, and **Story Settings / Options (`settings`)**.
   - Fixed `StoryButton.java` (`AUD-STORY-001`) by replacing static cached flags with live runtime checks and wiring `RexDialogs.showStoryOptionsSheet` and `RexDialogs.showSurfaceQuickSettingsDialog(context, "STORY")`.
2. **Reels Vertical UFI Dual Buttons (`ReelDownload.java` + `ReelDownloadButtonPatch.kt`)**:
   - Added `ReelDownload.isOptionsEnabled()` and `ReelDownload.registerOptions(component)` and updated `ReelDownloadButtonPatch.kt` to clone `ClipsSaveButtonComponent` for both **Direct Download** and **InstaRex Reels Settings / Options** without increasing register usage.
3. **Home Feed & Carousel Independent Dual Buttons (`DownloadUtils.addFeedDownloadButton`)**:
   - Decoupled `isFeedDownloadButtonEnabled()` and `isFeedOptionsButtonEnabled()` (`Disable Feed 'Download' Icon` and `Disable Feed 'InstaRex Options' Icon`), and wired long-press on the Feed Hexagon button to `Feed & Carousel Quick Settings`.
4. **Long-Press Search Tab to Open Profile (`ActionBarPatch.bindSearchTabIfPresent`)**:
   - Wired `Settings.LONG_PRESS_SEARCH_OPEN_PROFILE` to `search_tab` so copying any `@username` or `instagram.com/<username>` URL and holding the Search tab opens that profile immediately.
5. **6 Curated Multi-Theme Color Modes (`InstagramPreferenceStyle.java`)**:
   - Added `Rex Cyan AMOLED`, `Prime Crimson Rose`, `Royal Violet Glass`, `Emerald Matrix Pro`, `Sunset Amber Gold`, and `Monochrome Titanium` selectable from **UI Tweaks** and **Quick Access**.
6. **Sanitized `INSTAREX_PRO_CONFIG_V6.json` (3,796 MobileConfig Flags)**:
   - Cleaned all 7 foreign strings/watermarks from `SABRAHCADAVER_V6.json`, bundled `INSTAREX_PRO_CONFIG_V6.json` in `assets/configs/` and `res/raw/instarex_pro_config_v6.json`, and added 1-tap Apply & Export actions in Developer Options, Quick Access, and Backup & Restore.
