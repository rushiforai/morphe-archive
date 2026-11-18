# Recommended Flags Enable All & Restart Flow Fix Report (`23487.png`)

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

## Problem Statement
In `23487.png`, tapping `Enable All Recommended Flags` left the `Recommended Flags` screen permanently blurred with no dialog or `Restart Now` button visible.

## Root Cause & Fix
1. **No Premature `activity.recreate()`**: `ButtonPref.java` and `RecommendedFlags.java` now invoke `SettingsActivity.refreshCurrentScreen(context)` (`rebuildScreenPreservingScroll()`) so all `RecommendedFlagPreference` badges update to `ON` in-place while the Activity stays alive to host the `Restart Required` confirmation modal.
2. **Safe Window Blur**: `RexDialogs.attachBlurBehind` no longer mutates `host.getWindow().getDecorView().setRenderEffect(...)`, eliminating any possibility of a stuck blur on the Activity window.
3. **Persistent Bottom Restart Banner + Explicit Action Row**: Added both a persistent bottom `Restart Required — Restart Now` bar in `SettingsActivity.java` and an explicit `Restart InstaRex Now` row in `Recommended Flags` and `Initial Features`.
