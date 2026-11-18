# On-Device Verification Checklist (`Poco F7` / Android 14–16)

1. **Recommended Flags (`Developer Options -> Recommended flags`)**:
   - Verify Boolean flags render inside a rounded grouped card with leading Tabler SVG icons (`camera`, `video`, `sparkles`, `typography`, `sliders-horizontal`).
   - Tap the inline switch on `"Post a Stories directly to Highlights"` -> confirm it immediately toggles to `Enabled` (`#35CDBB` teal), persists across scrolling and re-opening the screen, and resets to `Default` when tapping `Reset`.
   - Scroll to `"NUMERIC & QUALITY OVERRIDES"` (`Webp gallery compression`, `Heic uploads compression`) -> confirm top and bottom corners of the card are cleanly rounded (`22dp`).
2. **Reels & Feed Controls**:
   - Confirm Reels `Download` (`⤓`) and `Rex Options` (`⬡`) sit above the Heart icon at matching optical size (`62%` inner icon bounds).
   - Confirm Feed `Hexagon` (`⬡`) sits to the right of the Share icon + counter (`18.5K`) without overlap.
3. **Stories, Mentions, Likes & Relationship Status**:
   - Confirm Story viewer shows the top-right cluster (`@N` mentions pill, `⤓` Download, `⚙` Settings) and tapping `@N` opens the Story Mentions sheet without `MediaData.A9q[]` errors.
   - Confirm liking a story records into `Story Likes` (`24h Activity` chart).
   - Confirm Profile -> `Relationship status` displays the 4 grouped AMOLED status cards with colored badges.
