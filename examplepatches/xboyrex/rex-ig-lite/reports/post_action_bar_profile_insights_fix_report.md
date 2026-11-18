# Post Action Bar on Own Profile & Creator Insights Fix Report (`23482.png` vs `23483.png`)

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

## Problem Statement
In `23482.png`, opening an own-profile post with Creator Insights (`250 · View insights` and `Boost post`) hid the entire post UFI action row (Like, Comment, Repost, Share, InstaRex Options, Download, Bookmark), whereas standard Home feed posts (`23483.png`) displayed all actions.

## Technical Fix
In `patches/src/main/kotlin/app/rex/patches/instagram/misc/download/FeedDownloadButtonPatch.kt`, `pinMainFeedToViewUfi` previously overwrote the UFI enum return value with `viewVariantField` unconditionally across all modules. On `contextual_feed` / `profile` / `insights` posts that include the Creator Insights bar, Instagram only mounts the Litho UFI row (`FeedDownloadLithoHook.kt`). By checking `MAIN_FEED_MODULE` (`"feed_timeline"`) before forcing `viewVariantField`, own-profile and Creator Insights posts render the full UFI row along with the InstaRex Options and Download icons.
