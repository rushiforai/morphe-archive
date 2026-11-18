# Broken Features Root Cause Analysis Report

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

## Detailed Root-Cause Breakdown
1. **Recommended Flags `Enable All` Permanent Blur (`23487.png`)**:
   - **Cause**: Calling `activity.recreate()` immediately before `RexDialogs.showConfirmDialog(...)` destroyed the dialog's window token while `decor.setRenderEffect(...)` remained latched on the window decor view.
   - **Fix**: Replaced `activity.recreate()` with `SettingsActivity.refreshCurrentScreen(context)` (`rebuildScreenPreservingScroll()`), removed root `decorView` `RenderEffect` mutation in `RexDialogs.attachBlurBehind`, and added both an immediate `Restart Now` modal and a persistent bottom `Restart Required — Restart Now` bar.
2. **Developer Options Crash & RTL Flip (`23473.png`)**:
   - **Cause**: Launching `TransparentModalActivity` with an early `return-void` in `ModalActivity.onCreate` left Instagram's internal fields uninitialized; `IgStr.resolveSelectedLocale()` read `Settings.TRANSLATOR_LANGUAGE`.
   - **Fix**: Attached SAF fragments directly to the caller `Activity` (`EXTRA_INLINE_HOST = true`) and separated `IgStr.KEY_APP_UI_LANGUAGE` (`rex_app_ui_language`) from `Settings.TRANSLATOR_LANGUAGE`.
3. **Missing Action Buttons on Own Profile / Creator Insights Posts (`23482.png` vs `23483.png`)**:
   - **Cause**: `FeedDownloadButtonPatch.kt` forced `VIEW` UFI variant on every feed module (`contextual_feed`, `profile`, `insights`), where only the Litho UFI component binds the action row below `"View insights / Boost post"`.
   - **Fix**: Restricted `pinMainFeedToViewUfi` to `feed_timeline` so Profile/Insights posts use `FeedDownloadLithoHook` and display all action icons.
4. **Missing Left Icons in Story `About this story` Sheet (`23486.png`)**:
   - **Cause**: `StoryButton.addButtons` injected plain `String` labels into the `CharSequence[]` menu array.
   - **Fix**: Built `SpannableString` labels with a custom `ReplacementSpan` rendering 22dp `RexIcon` drawables (`settings`, `heart`, `at-sign`, `sparkles`, `download`, `list-checks`) with a 16dp gap (`38dp` total advance).
5. **Reels Bottom Bar Not Floating (`23488.png` vs `23454.png`)**:
   - **Cause**: `GLASS_TAB_BAR_REELS_BEHIND` defaulted to `FALSE` in `suite/instagram/settings/Settings.java`.
   - **Fix**: Defaulted `GLASS_TAB_BAR`, `GLASS_TAB_BAR_FLOAT`, and `GLASS_TAB_BAR_REELS_BEHIND` to `TRUE`.
