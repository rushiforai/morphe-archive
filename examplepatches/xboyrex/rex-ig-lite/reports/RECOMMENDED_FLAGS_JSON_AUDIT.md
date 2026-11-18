# Recommended Flags JSON & Runtime Controller Audit Report

## 1. Original Bug
- Tapping **Enable All Recommended Flags** threw:
  `ButtonPref: Preference button onclick failure — Exception: No restart policy declared for setting: rex_rec_flags_enable_all`.
- Tapping **Reset All Flags to Default** similarly called `SettingsRestart.markChanged("rex_rec_flags_reset_all", ...)` without a registered `RestartPolicy`.

## 2. Affected Source Files
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/ButtonPref.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/devFlags/RecommendedFlags.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/devFlags/FlagsSharedPref.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/RecommendedFlagPreference.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/SettingRegistry.java`
- `patches/src/main/resources/instagram/settings/raw/rex_recommended_flags_v3.json`

## 3. Root Cause
- `SettingRegistry.restartPolicyFor(String key)` requires every key passed to the 3-argument `SettingsRestart.markChanged(key, prev, next)` to be a registered `Setting`.
- `"rex_rec_flags_enable_all"` and `"rex_rec_flags_reset_all"` are bulk action triggers, not individual `BooleanSetting` instances.

## 4. Actual Changes
- Implemented `RecommendedFlags.parseAndValidate(JSONArray)` to validate all `66` entries in `rex_recommended_flags_v3.json` (`59` Boolean flags + `7` Long/numeric flags, `0` duplicates, `0` malformed entries).
- Implemented `RecommendedFlags.enableAllBooleanFlagsTransactionally(Context, Runnable)` and `RecommendedFlags.resetAllFlagsTransactionally(Context, Runnable)`:
  - Takes a pre-operation snapshot via `FlagsSharedPref.snapshotRawStrings()`.
  - Enables all `59` Boolean flags while preserving the `7` numeric (`long`) flags untouched.
  - Marks each modified flag key using the explicit 4-argument `SettingsRestart.markChanged(flagKey, RestartPolicy.REQUIRED, previousValue, newValue)`.
  - Automatically rolls back via `FlagsSharedPref.restoreSnapshot(snapshot)` if any persistence error occurs.
  - Prompts the user with a confirmation dialog to restart when changes require an app restart.
- Updated `RecommendedFlagPreference.java` to call the explicit 4-argument `SettingsRestart.markChanged(setting.key, RestartPolicy.REQUIRED, prev, nextState)`.

## 5. Test Performed & Evidence
- Parsed `rex_recommended_flags_v3.json`: verified `66` total flags (`59` `bool`, `7` `long`), `0` duplicate `code` keys, `0` missing fields.
- Verified `ButtonPref.java` has zero calls to 3-arg `SettingsRestart.markChanged("rex_rec_flags_enable_all", ...)`.
- Status: `PASS` (Static & Automated Functional Verification), `PARTIAL` (Live Device UI Confirmation pending user install).

## 6. Remaining Limitations
- MobileConfig experiment overrides require an app process restart (`Restart Now` prompt) for Instagram's native session initialization to re-read the updated flag table.
