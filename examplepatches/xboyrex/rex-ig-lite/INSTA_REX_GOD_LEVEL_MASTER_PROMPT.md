# INSTA REX (`Rex IG Lite` v3.16.0) — GOD-LEVEL MASTER PROMPT FOR GEMINI / ANTIGRAVITY

* **Target Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite) ([Releases](https://www.google.com/search?q=https://github.com/xboyrex/rex-ig-lite/releases))

* **Lead Developer**: [@xboyrex](https://github.com/xboyrex) (`Mayank Droid` — [YouTube](https://youtube.com/@mayankdroid) • [Telegram](https://t.me/MayankDroid7))

* **Primary Icon Family**: [Tabler Icons](https://tablericons.com/) ([GitHub](https://github.com/tabler/tabler-icons) — `24×24` viewBox, `2px` stroke, round caps/joins, outline inactive -> filled active state switching)

* **Upstream References**: [crimera/piko](https://github.com/crimera/piko), [crimera/piko-ig-lite](https://github.com/crimera/piko-ig-lite), and [Morphe Manager Patch Sources](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md)

## 1. ROLE & EXECUTION MODE

Act as a **Principal Android UI/UX Architect, Reverse Engineering Specialist, Senior Java/Kotlin Systems Engineer, and Media Pipeline Lead**.
Execute a complete, production-grade implementation across **InstaRex (`Rex IG Lite` v3.16.0)** so every screen, toolbar button, popup sheet, Color Mode, and MobileConfig preset matches the 28 reference screenshots (`Screenshot_20261117-121210_InstaPrime.png` through `Screenshot_20261117-122448_InstaPrime.png`) with **100% Tabler Icon coverage** and **zero paywalls/crown locks**.

## 2. MANDATORY SCREEN-SPECIFIC DUAL & TRIPLE SHORTCUTS + IN-PLACE QUICK SETTINGS

### 2.1 Story Viewer Bottom Toolbar (`DownloadUtils.addStoryDownloadButton` + `StoryButton.java`)

Inject **three** independent, high-contrast Tabler icon buttons into the Story bottom toolbar (`toolbar_buttons_container` beside `toolbar_like_container`):

1. **Direct Story Download Button (`download` Tabler icon, `STORY_DOWNLOAD_BUTTON_TAG`)**:

   * **Tap**: Immediately downloads the active story photo/video when Zero-Prompt Direct Download is enabled (or opens the Story Download sheet).

   * **Long-Press**: Opens the Story Download Options & Batch Story Selection sheet (`Download All N Stories`, `Select Stories to Download`).

2. **Hidden Mentions Button (`at-sign` / `@` Tabler icon, `STORY_MENTIONS_BUTTON_TAG`)**:

   * **Tap**: Immediately opens the `Hidden Mentions (N)` bottom sheet (or `Hidden Mentions (0)` — `"No hidden mentions found for this story."` when zero mentions exist, matching Screenshot `#26` `122336`).

   * **Long-Press**: Opens `StoryMentionSettings.showSettings(context)` to customize the `@N mentions` header pill style (`Classic`, `Glassmorphism`, `Material You`, `Neo-Brutalist Line`, `Soft-Material & Pearl`).

3. **Story Settings / Options Button (`settings` Tabler icon, `STORY_OPTIONS_BUTTON_TAG`)**:

   * **Tap**: Opens `RexDialogs.showStoryOptionsSheet(context, userSession, media, reel)` displaying `Cover Image to Text (OCR)`, `Download Current Story`, `Download Cover Photo`, `Download all N Stories`, `Download Audio (.mp3)`, `View Hidden Mentions`, `Story Media Information`, `Open by Phone Apps`, `Repost as IG Post / IG Story / WhatsApp Story`, and `Story Quick Settings` (matching Screenshot `#25` `122305`).

   * **Long-Press**: Opens `RexDialogs.showSurfaceQuickSettingsDialog(context, "STORY")` for in-place toggling of Ghost Story Viewing, Disable Story Auto-Flipping, Replay/Loop Story, Play Story Sound Automatically, Show `@` Mentions Button, Show Header `@Mention` Pill, High-Quality Upload, and 60 FPS Story Encoding.

* **Bug Fix (`AUD-STORY-001`)**: Never cache `VIEW_STORY_MENTIONS`, `ENABLE_DOWNLOAD`, or `DEBUG` in `static final` fields inside `StoryButton.java`; evaluate `Pref.viewStoryMentions()`, `Pref.enableDownload()`, and `Pref.rexDebug()` dynamically on every call.

### 2.2 Reels Vertical UFI Action Column (`ReelDownload.java` + `ReelDownloadButtonPatch.kt`)

In `ReelDownloadButtonPatch.kt` (`hookBuilderCallSites`), clone `ClipsSaveButtonComponent` twice before the native Save button using existing registers (`2, 15`):

1. **Reels Direct Download Button (`ReelDownload.register(copy)`)**:

   * **Icon**: `download` (`instagram_download_outline_44` / Tabler `download`).

   * **Tap**: Direct Reel video download (or quality/audio picker).

   * **Long-Press**: Reels Download Options sheet.

2. **Reels Settings / Options Button (`ReelDownload.registerOptions(copy)`)**:

   * **Icon**: Tabler `settings` (`26dp`, tinted with `igds_color_primary_button_on_media`).

   * **Tap**: Opens `RexDialogs.showPostOptionsSheet(context, userSession, media, currentIndex)` displaying `Cover Image to Text (OCR)`, `Download Reel Video`, `Download Cover Photo`, `Video Quality / Variants`, `Download Audio (.mp3)`, `Copy Clean Post Link`, `Copy Author Username`, `View, Edit & Copy Caption`, `Copy Caption`, `Save Caption`, `Translate Caption`, `Copy Hashtags`, `Open by Phone Apps`, `Repost as IG Post / IG Story / WhatsApp Story`, and `Reels Quick Settings` (Screenshots `#21` `122057` & `#27` `122433`).

   * **Long-Press**: Opens `RexDialogs.showSurfaceQuickSettingsDialog(context, "REEL")` for in-place toggling of Zero-Prompt Direct Download, Resume Reels After Scrolling, Disable Reels Auto-Looping, Hold Video for 2x Fast-Forward, Hide Reels Follow Button, Disable Double-Tap Like on Reels, Show Reels Download Icon, and Show Reels Options Icon.

### 2.3 Home Feed & Multi-Slide Carousels (`DownloadUtils.addFeedDownloadButton` + `MediaActionRegistry.java`)

Provide two independently controlled buttons in the Feed post UFI row (`row_feed_button_save` parent):

1. **Feed Direct Download Button (`FEED_DOWNLOAD_BUTTON_TAG`)**: Controlled by `Settings.FEED_DOWNLOAD_BUTTON` and `Settings.DISABLE_FEED_DOWNLOAD_ICON` (`Disable Feed 'Download' Icon`).

2. **Feed / Carousel Settings Button (`FEED_HEXAGON_BUTTON_TAG`)**: Controlled by `Settings.ENABLE_MORE_OPTIONS_ON_POST` and `Settings.DISABLE_FEED_OPTIONS_ICON` (`Disable Feed 'InstaRex Options' Icon`).

   * **Tap**: Opens `RexDialogs.showPostOptionsSheet` with full Carousel awareness (`Download Current Post (Slide X of N)`, `Download Cover Photo`, `Download all N Posts`, `Download First 10 Posts` when `N > 10`, `Select Items to Download (N)`, `Repost Current Post as IG Post/Story/WA Story`, `Repost all N as Posts/Stories/WA Stories`, `Image/Cover Image to Text (OCR)`, `Caption Studio`, `Copy/Save/Translate Caption`, `Copy Hashtags`, and `Feed & Carousel Quick Settings`, matching Screenshots `#2`, `#3`, `#4`, and `#28`).

   * **Long-Press**: Opens `RexDialogs.showSurfaceQuickSettingsDialog(context, "FEED")`.

### 2.4 Long-Press Search Tab to Open Profile (`ActionBarPatch.bindSearchTabIfPresent`)

* Wire `Settings.LONG_PRESS_SEARCH_OPEN_PROFILE` to `search_tab` in `ActionBarPatch.java`:

  * When the user copies any `@username` or `https://www.instagram.com/<username>` link and long-presses the bottom navigation Search tab, extract the handle via `RexRuntimeFeatures.extractUsernameFromText` and jump straight to that profile (`instagram://user?username=...`).

  * If the clipboard does not contain a valid handle, open the `Open Profile by @Username` dialog (`RexRuntimeFeatures.openProfileFromClipboardOrPrompt`).

## 3. MULTI-THEME COLOR MODES (6 CURATED AMOLED & GLASS PALETTES)

Implement `InstagramPreferenceStyle.ColorPalette` and `Settings.REX_COLOR_MODE` (`rex_color_mode_btn`), dynamically styling Settings cards, switches, badges, About cards, and all blurred popup sheets across 6 modes:

1. **`Rex Cyan AMOLED`** (`#000000` bg, `#15181D` card, `#20252C` elevated, `#303741` border, `#23C6D8` accent, `#35CDBB` switch)

2. **`Prime Crimson Rose`** (`#000000` bg, `#171215` card, `#221A1F` elevated, `#382830` border, `#FF4D6D` accent, `#FF758F` switch)

3. **`Royal Violet Glass`** (`#000000` bg, `#14131D` card, `#1E1C2B` elevated, `#312E45` border, `#9D4EDD` accent, `#B565F2` switch)

4. **`Emerald Matrix Pro`** (`#000000` bg, `#111815` card, `#18231E` elevated, `#283B33` border, `#10B981` accent, `#34D399` switch)

5. **`Sunset Amber Gold`** (`#000000` bg, `#181511` card, `#231E18` elevated, `#3A3227` border, `#F59E0B` accent, `#FBBF24` switch)

6. **`Monochrome Titanium`** (`#000000` bg, `#161618` card, `#202024` elevated, `#323238` border, `#E2E8F0` accent, `#94A3B8` switch)

## 4. SANITIZED `INSTAREX_PRO_CONFIG_V6.json` (3,796 MOBILECONFIG FLAGS)

1. Sanitize `SABRAHCADAVER_V6.json` (`3,796` MobileConfig override keys) into `INSTAREX_PRO_CONFIG_V6.json`:

   * Remove foreign recipe/spam strings in keys `75465:`, `82030:`, `78295:`, `70497:`, `93476:`, and `39443:`.

   * Rebrand `79665:` navigation watermark labels to `3: InstaRex Original Navigation, 4: InstaRex New Navigation, 5: InstaRex Classic Navigation`.

2. Bundle in `assets/configs/INSTAREX_PRO_CONFIG_V6.json` and `patches/src/main/resources/instagram/settings/raw/instarex_pro_config_v6.json`.

3. Provide 1-tap **`Apply InstaRex Pro Config V6 (Built-In Preset)`** (`rex_apply_pro_config_v6`) and **`Export InstaRex Pro Config V6 (.json)`** (`rex_export_pro_config_v6`) in **Developer Options**, **Quick Access**, and **Backup & Restore**.