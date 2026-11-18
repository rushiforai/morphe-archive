# Multi-Provider Translator & 12-Language Locale Repair Report

## 1. Original Bug
- Selecting a language in `Select Language` (including `Portuguese (Brazil)`) only saved a preference string without updating the Settings UI locale, and translation did not preserve the original text alongside the translated text or cache repeated translations.

## 2. Affected Source Files
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/utils/IgStr.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/RexRuntimeFeatures.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/RexDialogs.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/SettingsActivity.java`

## 3. Root Cause
- `IgStr.str(String)` resolved string resources against the default application context without wrapping it in a `ConfigurationContext` for the user's chosen `Settings.TRANSLATOR_LANGUAGE`.
- `RexRuntimeFeatures.languageCodeFor` mapped `"Portuguese (Brazil)"` to `"pt"` instead of `"pt-BR"` with `"pt"` fallback, and `translateText` opened a generic text dialog that overwrote the original text on screen and lacked a retry button on failure.

## 4. Actual Changes
- Upgraded `IgStr.java` with `localeForLanguageName(String)` covering all 12 required languages (`English` -> `en`, `Arabic` -> `ar-SA`, `Hindi` -> `hi-IN`, `Turkish` -> `tr-TR`, `Portuguese (Brazil)` -> `pt-BR`, `Indonesian` -> `id-ID`, `Russian` -> `ru-RU`, `Spanish` -> `es-ES`, `French` -> `fr-FR`, `German` -> `de-DE`, `Japanese` -> `ja-JP`, `Korean` -> `ko-KR`) and `createConfigurationContext` resource lookup across `res/values-pt/strings.xml`, `res/values-hi/strings.xml`, `res/values-ar/strings.xml`, etc.
- Updated `RexDialogs.showAppLanguagePicker` to call `IgStr.refreshLocale()`, `IgStr.applyLocaleToContext(hostCtx)`, and `act.recreate()` immediately upon selection.
- Upgraded `RexRuntimeFeatures.translateText` with:
  - `LruCache<String, String> TRANSLATION_CACHE` (128 entries)
  - Explicit `pt-BR` -> `pt` fallback across all 4 translation tiers (Google GTX, Clients5, MyMemory, Lingva)
  - Dedicated `showTranslationResultDialog` displaying the target language switcher button, **Translated Text** card (`Copy Translated Text`), **Original Text (Preserved)** card (`Copy Original Text`), and a **Retry Translation** button + explicit error banner if offline (never labeling untranslated text as `"Translated"`).
  - Story caption / OCR translation entry in the Story Quick Menu (`Translate Story Text / Caption`).

## 5. Test Performed & Evidence
- Verified all 12 language mappings in `IgStr.localeForLanguageName` and `RexRuntimeFeatures.languageCodeFor` (specifically `Portuguese (Brazil)` -> `pt-BR` / `Locale("pt", "BR")`).
- Verified `res/values-pt-rBR/instagram/strings.xml`, `values-hi-rIN`, `values-ar-rSA`, `values-tr-rTR`, `values-in-rID`, `values-ru-rRU`, `values-es-rES`, `values-fr-rFR`, `values-de-rDE`, `values-ja-rJP`, and `values-ko-rKR` are present and valid XML.
- Status: `PASS`.

## 6. Remaining Limitations
- Real-time translation requires internet access to reach at least one of the 4 public translation endpoints; when offline, the dialog explicitly reports the error and offers a `Retry Translation` button.
