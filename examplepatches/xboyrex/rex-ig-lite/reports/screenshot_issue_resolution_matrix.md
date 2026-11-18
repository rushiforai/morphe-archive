# Screenshot Issue Resolution Matrix

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

| Screenshot | Observed Symptom | Root Cause File(s) | Fix Status |
|---|---|---|:---:|
| `23482.png` | Post under `Posts` (`View insights` / `Boost post`) missing Like, Comment, Repost, Share, InstaRex, Download, Save row | `FeedDownloadButtonPatch.kt` (`pinMainFeedToViewUfi`) | **FIXED** |
| `23483.png` | Home feed post shows full action bar including InstaRex hexagon and Download icon | Reference baseline (`feed_timeline` + `FeedDownloadLithoHook.kt`) | **VERIFIED** |
| `23488.png` | Reels bottom navigation bar sits on a solid black strip instead of floating | `suite/instagram/settings/Settings.java` (`GLASS_TAB_BAR_REELS_BEHIND`) | **FIXED** |
| `23454.png` | Home feed floating glass pill bar reference | `GlassTabBar.java`, `ActionBarPatch.java` | **MATCHED IN REELS** |
| `23486.png` | Story 3-dot `About this story` custom rows lack left icons | `StoryButton.java` (`createIconMenuLabel`) | **FIXED** |
| `23487.png` | Tapping `Enable All Recommended Flags` permanently blurs screen and hides Restart button | `RecommendedFlags.java`, `RexDialogs.java`, `SettingsActivity.java` | **FIXED** |
| `23480.png` | InstaRex launcher icon appears as a tiny red circle inside a white circle on Poco Launcher | `rex_ic_launcher_round.xml`, `rex_ic_launcher_instarex.xml` | **FIXED** |
| `23479.png` | Play Store shows `Instagram` update prompt when installed as `com.instagram.android` | `ClonePatch.kt` (`default = true`, `com.xboyrex.instarex`) | **FIXED** |
| `23469.png` | Story Mentions sheet (`Mentioned in this Story`) | `StoryMentionPopup.java`, `ViewStoryMentionsPatch.java` | **HARDENED & VERIFIED** |
| `23473.png` | `Developer Options` crash (`crash_report_2026-11-18_10-51-04.txt`) & RTL row alignment | `ActivityHook.java`, `SettingRegistry.java`, `IgStr.java`, `DeveloperOptions.java` | **FIXED** |
