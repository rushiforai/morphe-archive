# Initial Features — Persistence & MobileConfig Synchronization Report

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)
- **Implementation**: `InitialFeaturesManager.java`, `FlagsSharedPref.java`, `RestorePrefFragment.java`

## Storage & Synchronization Pipeline
1. **SharedPreferences (`Constants.SHARED_PREF_NAME` & `Constants.REC_FLAGS`)**:
   - Every flag stores its override state under `rex_init_feat_<id>` and `rex_init_sub_<id>_<param>` inside `SharedPref`, plus mirrors numeric/boolean codes into `FlagsSharedPref` (`rex_recommended_flags_v3.xml`).
2. **MobileConfig Override Synchronization (`files/mobileconfig/mc_overrides.json`)**:
   - Whenever a flag, numeric value, enum option, or preset is changed, `InitialFeaturesManager.syncToMobileConfigOverrides()` atomically merges the active parameter key/value pairs into `files/mobileconfig/mc_overrides.json`.
3. **JSON Export & Import**:
   - Users can export their active `Initial Features` configuration to `Download/xboyrex/InstaRex_Initial_Features_Backup.json` and restore it via `RestorePrefFragment` (`rex_import_initial_features`).
