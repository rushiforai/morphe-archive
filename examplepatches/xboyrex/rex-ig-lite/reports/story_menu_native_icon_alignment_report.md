# Story Menu Native Icon Alignment Report (`23486.png`)

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

## Problem Statement
In `23486.png`, Instagram's native `About this story` sheet rendered left icons on `About this account` (`user-circle`) and `Manage your feed` (`sliders`), while InstaRex's custom actions (`Story Quick Settings`, `Story Likes History`, `View story mentions`, `Mention Pill Settings`, `Download Story`, `Download options`) appeared as plain un-iconed text.

## Technical Fix
Updated `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/story/StoryButton.java` (`createIconMenuLabel`) to wrap every custom Story menu title in a `SpannableString` prefixed by a custom `ReplacementSpan` that draws a 22dp `RexIcon` vector drawable (`settings`, `heart`, `at-sign`, `sparkles`, `download`, `list-checks`) with a 16dp text offset (`38dp` total advance), matching native IGDS bottom-sheet typography and icon alignment.
