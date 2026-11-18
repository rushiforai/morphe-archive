# Reels Floating Bottom Navigation Bar Report (`23488.png` vs `23454.png`)

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

## Problem Statement
In `23488.png`, the bottom navigation bar in the Reels tab sat on a flat black strip at the bottom of the screen instead of floating as a rounded pill over the Reel video like the Home feed (`23454.png`).

## Technical Fix
- Updated `extensions/instagram/src/main/java/app/morphe/extension/suite/instagram/settings/Settings.java` so `GLASS_TAB_BAR` (`xboyrex_glass_tab_bar`), `GLASS_TAB_BAR_FLOAT` (`xboyrex_glass_tab_bar_float`), and `GLASS_TAB_BAR_REELS_BEHIND` (`xboyrex_glass_tab_bar_reels_behind`) all default to `TRUE`.
- Updated `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/Settings.java` (`LIQUID_GLASS_NAV`) and `ActionBarPatch.java` so enabling `Frosted Glass Bottom Navigation` automatically synchronizes `GLASS_TAB_BAR`, `GLASS_TAB_BAR_FLOAT`, and `GLASS_TAB_BAR_REELS_BEHIND`.
