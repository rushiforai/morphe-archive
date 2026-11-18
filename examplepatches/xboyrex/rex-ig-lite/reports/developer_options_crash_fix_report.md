# Developer Options Crash & RTL Alignment Fix Report (`23473.png`)

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

## Problem Statement
In `23473.png`, opening or interacting with `Developer Options` generated `crash_report_2026-11-18_10-51-04.txt`, and several rows (`Unlock Developer Options`, `Import MetaConfig Overrides`, `Export Experiment List`) were right-aligned (RTL).

## Root Causes & Fixes
1. **Inline SAF Fragment Hosting (`ActivityHook.java`, `BackupPrefFragment.java`, `RestorePrefFragment.java`, `FolderPickerFragment.java`)**: Stopped launching `com.instagram.modal.TransparentModalActivity` (which crashed in Instagram `452.1.0.53.64` when `ModalActivity.onCreate` returned early) and instead attached the headless SAF picker fragments directly onto the active `Activity`'s `FragmentManager` (`EXTRA_INLINE_HOST = true`).
2. **Dynamic Setting Key Guard (`SettingRegistry.java`)**: Updated `SettingRegistry.restartPolicyFor(String key)` to return `RestartPolicy.NOT_REQUIRED` instead of throwing `NullPointerException` when unregistered dynamic keys (`init_*`, `rec_*`) are toggled.
3. **UI Locale vs Translator Language Separation (`IgStr.java`, `RexDialogs.java`)**: Separated `IgStr.KEY_APP_UI_LANGUAGE` (`rex_app_ui_language`) from `Settings.TRANSLATOR_LANGUAGE` so selecting `Arabic` as the caption translation target language never flips `Developer Options` or Settings cards into RTL.
