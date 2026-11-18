# Root Cause Analysis — Build #39 & Runtime UI/UX Defects

## 1. GitHub Actions Build #39 Failure (`23243.png` — `RexDialogs.java:213-214`)
- **Symptom**: `:extensions:instagram:compileReleaseJavaWithJavac` failed with 6 syntax errors at `RexDialogs.java` lines 213–214.
- **Root Cause**: Inside `addStatusBadgeRow(...)`, the ternary expressions had a stray `Boolean` type keyword before `viewerUnconnected == null`.
- **Fix**: Replaced `Boolean viewerUnconnected == null` with `viewerUnconnected == null` on both lines and validated all 902 `.java` files using JDK 17 `JavacTask.parse()` (`0` syntax errors).

## 2. Recommended Flags Inline Switch Not Toggling & Ungrouped Layout (`23212.png`, `23213.png`, `23214.png`)
- **Root Cause A (`BaseSharedPref.java` Cross-File Bug)**: `BaseSharedPref.getString(StringSetting setting)` called `SharedPref.getStringPref(setting.key, setting.defaultValue)` (reading from `"rex_settings"`) instead of `this.getString(setting.key, setting.defaultValue)`. Meanwhile, `FlagsSharedPref.setStringPref(key, val)` wrote to `"rex_recommended_flags"` (`Constants.REC_FLAGS`). Consequently, `FlagsSharedPref.getStringPref(setting)` always read from the wrong `SharedPreferences` file and returned `"Default"`!
- **Root Cause B (`ListView` View Recycling in `RecommendedFlagPreference.java`)**: `onCreateView(ViewGroup)` stored `toggleSwitch`, `defaultChip`, and `stateBadge` on `this` and set `titleView.setText(getTitle())` only during initial inflation. When `PreferenceScreen`'s `ListView` recycled `convertView` across the 59 Boolean flags, `onBindView(View)` did not rebind the title, summary, switch, or click listeners to the bound `RecommendedFlagPreference` instance.
- **Root Cause C (Card Grouping in `ScreenBuilder.java` & `RecommendedFlagPreference.java`)**: `RecommendedFlagPreference` used a raw full-width `LinearLayout` instead of `InstagramPreferenceStyle.createPreferenceView(...)`, and Boolean/Long flags were not separated by `PreferenceCategory` headers.
- **Fix**: Fixed `BaseSharedPref.getString(StringSetting)` to call `getString(setting.key, setting.defaultValue)`, rewrote `RecommendedFlagPreference` on top of `InstagramPreferenceStyle.createPreferenceView` with tag-based `onBindView` rebinding, and added `PreferenceCategory` sections (`FLAG CONTROLS & PRESETS`, `BOOLEAN EXPERIMENT FLAGS`, `NUMERIC & QUALITY OVERRIDES`) in `ScreenBuilder.java`.

## 3. Double-Wrapped `MediaData` Reflection Crash (`23125.png`)
- **Symptom**: `NoSuchMethodException: app.morphe.extension.instagram.entity.MediaData.A9q[]` when opening Story Mentions.
- **Root Cause**: `ViewStoryMentionsPatch` passed an already-wrapped `MediaData` instance into `new MediaData(mediaObject)`, causing `Entity.getMethod("A9q")` to reflect on `MediaData.class` instead of Instagram's media model class.
- **Fix**: Added `Entity.unwrapEntityObject(Object)` and `MediaData.unwrapMediaCandidate(Object)` to unwrap `Entity`/`ReelItem` wrappers automatically.
