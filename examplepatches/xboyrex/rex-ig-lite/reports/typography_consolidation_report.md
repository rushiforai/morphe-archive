# 3-System Typography & Emoji Consolidation Report

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

## Architecture
Consolidated all scattered font and emoji preferences in `ScreenBuilder.java`, `FontStorage.java`, `CustomFont.java`, and `RexRuntimeFeatures.java` into three orthogonal, conflict-free systems:
1. **System 1 — App Font (`Settings.ENABLE_APP_FONT`, `Settings.CHOOSE_FONT_TYPE`, `Settings.USE_SYSTEM_FONT`)**:
   - Supports `Original Font`, `System Default`, `iOS San Francisco`, `Instagram Sans`, `Google Sans`, bundled iOS fonts, and custom `.ttf`/`.otf` import (`custom_font.ttf`) without replacing icon fonts or Story fonts.
2. **System 2 — Story Fonts (`Settings.ENABLE_STORY_FONTS`, `Settings.STORY_FONT_SOURCE`)**:
   - Supports `Default Story Fonts`, `XBOYREX Story Font Pack` (14 curated fonts with individual live typeface preview, per-font checkboxes, `Select All`, and `Deselect All` via `RexRuntimeFeatures.showXboyrexStoryFontPackBrowser`), and `Custom Story Font File(s)` (`.ttf`/`.otf`/`.zip`).
3. **System 3 — Emoji Replacement (`Settings.ENABLE_EMOJI_FONT`, `Settings.CHOOSE_EMOJI_TYPE`)**:
   - Supports `Original Emoji`, `iOS 26.4`, `iOS 18.4`, `iOS 17.4`, `iOS 14.5`, `Facebook`, `Joy Pixel`, `Samsung`, and `From Local Storage` (`custom_emoji.ttf`) with `FontStorage.hasValidEmojiGlyphs(Typeface)` (`Paint.hasGlyph`) validation.
