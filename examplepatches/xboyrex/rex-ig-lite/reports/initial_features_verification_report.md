# Initial Features — Runtime & Static Verification Report

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

## Verification Results
- **Catalogue Integrity**: Verified **72** unique entries (`init_001` through `init_072`) in both `assets/configs/initial_features_catalogue.json` and `patches/src/main/resources/instagram/settings/raw/rex_initial_features_catalogue.json`.
- **Resource Registration**: Verified `rex_initial_features_catalogue.json` is registered in `SettingsResourcePatch.kt` under `ResourceGroup("raw", ...)`.
- **UI & Search Integration**: Verified `Constants.REX_FRAGMENT_INITIAL_FEATURES` is accessible from Root Settings (`Initial Features`) and `Developer Options` (`Initial Features (72 Experimental Flags)`), with live search, category filter, status filter, 10 presets, JSON export/import, sub-flag dialog, and `Restart InstaRex Now`.
