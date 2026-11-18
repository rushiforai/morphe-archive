# MEDIA ACTION MATRIX — CONTEXTUAL TOOLBAR & SHEETS

This matrix turns the user requirements and screenshots into deterministic surface behaviour. “Direct” means a one-tap primary action. “Settings” opens the relevant contextual sheet. Both controls must be configurable and must not obstruct Instagram-native controls.

| Surface | Direct control | Settings control | Context-only actions |
|---|---|---|---|
| Home feed post | Download current post/media | Home post actions | OCR, cover, caption, hashtags, clean link, username, translate, save, sharesheet/repost when supported |
| Reel | Download current Reel | Reel actions/settings | Download cover, extract audio if exposed, OCR selected cover/frame, caption, hashtags, link, username, translate, save, open externally, share/repost |
| Story | Download current Story media | Story actions/settings | Hidden Mentions shortcut, copy available link, OCR current frame if user invokes it, available metadata actions; no invented hidden data |
| Carousel | Download current slide | Carousel actions/settings | Download all N items, download cover, current/all share/export, captions, hashtags, translate, OCR, open/share |
| Profile | No always-on download unless valid media context | Profile tools | Copy bio, view picture, save bio, translate bio, copy username/user ID, follow indicator if data available, save profile |
| Comment | None unless explicit action | Comment context menu | Copy comment, translate, save locally, copy author/username when data exists |

## Story controls

- Place a compact settings/gear action at a safe top corner that does not collide with Instagram's close/menu/progress controls.
- Place a distinct Hidden Mentions icon/control (e.g. `at-sign`/`users`) at a separately configurable safe location.
- Hidden Mentions dialog shows a dynamic count and account rows only from the currently loaded story metadata. Empty state text: `No hidden mentions found for this story.` Include explicit Close action. If source model lacks the data, report unavailable rather than fabricating an empty list or scraping remote/private data.

## Reel controls

- One direct download icon (download-arrow) for the currently visible Reel.
- One settings/more icon that opens the Reel-specific sheet.
- Update media context on every Reel page bind/recycle/scroll; never retain the previous Reel ID after fast swipes.
- Avoid overlapping Like, Comment, Remix, Share, Save, audio, caption and bottom navigation.

## Feed controls

- One direct download icon and one settings/more icon for the active post.
- Bind to the exact post view-holder/model; recycle cleanup must remove stale click targets and observers.
- If the post is an ad/unsupported/removed/private context or media URL is unavailable, hide/disable the action with honest explanation.

## Carousel controls

- Direct action downloads the currently selected slide.
- Settings sheet includes `Download current item`, `Download all N items`, `Download cover` (if available), current-item share, batch export/share, OCR and caption actions.
- `N` is `children.size` from the resolved carousel model after safe normalization. Do not parse the `1/N` page indicator as the sole source. Reconcile model count with UI page indicator; log mismatch for diagnostics. Handle partial loading as `Loading x of N` and do not show `(0)` for a populated carousel.
- Batch operations preserve original order and per-item MIME/extension. Show per-item progress and retry; do not represent a failed partial batch as total success.

## Long menus and native menu coexistence

- Context menu is scrollable. The initial high-frequency actions appear first: Download current, Download all (carousel only), Copy link, Copy caption, More options.
- Secondary actions may be grouped under sections, but no requested action may be silently omitted.
- Do not duplicate native actions that already perform the exact same operation unless the Rex action adds real extra value. If duplicate, choose one canonical entry or provide a clearly distinct Rex enhancement.
- Every row has one semantic Tabler icon, title, accessible label, action callback, enabled state and feedback state.
