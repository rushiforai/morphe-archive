# Recommended Flags Audit

- **Bundled Source**: `patches/src/main/resources/instagram/settings/raw/rex_recommended_flags_v3.json`
- **Total Records**: 66 (59 Boolean, 7 Long, 9 Grouped Comma-Separated IDs)
- **Inline Control**: `RecommendedFlagPreference.java` (immediate Switch + `Reset` chip to `FlagState.DEFAULT`)
- **Hook Chain**: `RecommendedFlags.getFlags()` -> `RecommendedFlagPreference` / `EditTextPref` -> `FlagsSharedPref` -> `HookFlags.load()` -> `DeveloperOptionsItem`
