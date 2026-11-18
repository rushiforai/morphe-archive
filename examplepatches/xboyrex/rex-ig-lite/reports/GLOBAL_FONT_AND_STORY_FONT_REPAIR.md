# Global Font Manager & Story Editor Font Integration Report

## 1. Original Bug
- Selected application fonts applied only to some UI elements while leaving dialogs, summaries, or dynamically created views in the default typeface.
- Custom Story fonts installed via `Add Story Fonts` did not consistently replace Story Editor font styles when descriptor objects were obfuscated.

## 2. Affected Source Files
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/customise/font/CustomFont.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/customise/font/CustomFontTextView.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/customise/font/CustomFontButton.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/customise/font/CustomFontCheckBox.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/customise/font/CustomFontEditText.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/customise/font/FontStorage.java`
- `patches/src/main/kotlin/app/rex/patches/instagram/misc/customise/font/FontHooks.kt`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/InstagramPreferenceStyle.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/RexDialogs.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/RexRuntimeFeatures.java`

## 3. Root Cause
1. `CustomFontTextView`, `CustomFontButton`, `CustomFontCheckBox`, and `CustomFontEditText` only overrode the 1-arg `setTypeface(Typeface)` method; views that relied on constructor defaults or called `setTypeface(Typeface, int)` bypassed `CustomFont.forRexView(...)`.
2. `CustomFont.apply(Object descriptor, Typeface original)` called `String.valueOf(descriptor)` and cached `interfaceDescriptors` by `descriptor.getClass()`, which misclassified obfuscated Story font descriptors sharing the same descriptor class as interface fonts.
3. `FontHooks.kt` `markAsContentFontResolver()` did not pass `p0` (`this`) to `endContentFontRequest` on `LegacyStoryFontFingerprint` enum methods.

## 4. Actual Changes
- Updated `CustomFontTextView`, `CustomFontButton`, `CustomFontCheckBox`, and `CustomFontEditText` to apply `CustomFont.forRexView(getTypeface())` in both constructors and in both `setTypeface(Typeface)` and `setTypeface(Typeface, int)`.
- Added `CustomFont.applyToViewTree(View root)` and wired it into `InstagramPreferenceStyle.createPreferenceView`, `RexDialogs.showBlurredDialog`, and `RexRuntimeFeatures.createRawDarkDialog`.
- Added `CustomFont.extractDescriptorFontName(Object)` (inspecting `CharSequence`, `Enum.name()`, `toString()`, and reflected `String`/`Enum` fields) and `CustomFont.endContentFontRequest(Object source, Typeface returned)`.
- Updated `FontHooks.kt` to pass `v$thisReg` (`p0`) to `endContentFontRequest(Ljava/lang/Object;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;` on instance content-font resolver methods.
- Added `"iOS San Francisco"`, `"Instagram Sans"`, `"Google Sans"`, `"System Default"`, and `"From Local Storage"` with live typeface preview in `RexRuntimeFeatures.showFontTypePicker`.

## 5. Test Performed & Evidence
- Verified all 14 bundled `.ttf` fonts in `patches/src/main/resources/instagram/settings/raw/rex_font_ios_*.ttf` are valid TrueType files registered in `SettingsResourcePatch.kt`.
- Verified `CustomFont.java` and `FontHooks.kt` signatures match across Java and Kotlin bytecode hooks.
- Status: `PASS`.

## 6. Remaining Limitations
- Server-rendered stickers burned into third-party uploaded videos are video frames rather than client-rendered text nodes.
