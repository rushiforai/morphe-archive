# ACCEPTANCE TEST PLAN

A test is PASS only when executed against the real code or a meaningful test double. Static text presence is not a functional PASS.

## 1. Media resolver tests

| Case | Input | Expected result |
|---|---|---|
| M-01 | Single image model | type=image; image actions only |
| M-02 | Single video model | type=video; video actions only |
| M-03 | Reel with cover + video | type=reel; current download and cover actions |
| M-04 | Reel without cover | Reel download remains available; cover disabled/hidden with explanation |
| M-05 | Carousel with 4 loaded children | count=4; menu says Download all 4 items |
| M-06 | Carousel with 10 loaded children | count=10; menu says Download all 10 items |
| M-07 | Carousel current index 1/10 | index=1, total=10; count not inferred from text alone |
| M-08 | Null/unknown child | no crash; report unavailable item and continue eligible children |
| M-09 | Immutable/Pando representation | adapter resolves safely for supported target base |
| M-10 | Unsupported representation | capability unavailable; no ClassCastException crash |
| M-11 | Duplicate URL/ID | deterministic skip/dedupe rule |
| M-12 | Expired URL/network failure | retry/error state; no false success |

## 2. Overlay interaction tests

| Case | Action | Expected result |
|---|---|---|
| O-01 | Tap Home direct download | downloads only current feed item |
| O-02 | Tap Home settings icon | opens Home context action sheet |
| O-03 | Tap Reel direct download | downloads current Reel, not next/previous item |
| O-04 | Swipe vertically while overlay visible | Reel scrolling still works |
| O-05 | Tap Reel settings | opens Reel-specific options |
| O-06 | Tap Story settings | opens Story action sheet without advancing story |
| O-07 | Tap Story Hidden Mentions | opens current story mentions dialog |
| O-08 | Story has zero mentions | empty state; no fabricated users |
| O-09 | Story has mention metadata | correct account rows/handles/avatars |
| O-10 | Carousel direct action | downloads current slide |
| O-11 | Carousel settings | opens carousel-specific menu |
| O-12 | Carousel Download All N | queue contains all actual accessible children in correct order |
| O-13 | Disable overlay in Settings | selected overlay hidden; other native UI unaffected |

## 3. Action menu tests

Test every menu row with: enabled, disabled, loading, success, failure and cancellation states as applicable.

Required actions: current download, cover download, all carousel downloads, audio extraction, copy clean link, copy author username, view/edit/copy caption, save caption, translate caption, copy hashtags, OCR, open by phone apps, share/repost current item and batch export/share. Do not expose unsupported actions as working.

## 4. Settings and persistence tests

- Toggle each preference; leave screen; reopen; state remains.
- Force stop/relaunch; persisted state restored.
- Import malformed config; app rejects without partial corruption.
- Import valid config; preview and atomic apply.
- Export config; file parses and contains expected schema/version.
- Reset configs; confirmation shown and defaults restored.
- Search each known setting by title and alias; correct route opens.
- Hide Home/Reels/Story overlay; settings state respected immediately and after restart.

## 5. UI/dialog/accessibility tests

- Dialog open, close button, back, outside tap and swipe dismiss.
- Back closes nested/topmost sheet only.
- Blur supported; fallback works when blur is unsupported.
- Reduce Motion disables nonessential motion.
- Minimum 48dp action target.
- Text scale 1.0x, 1.3x, 1.5x; no clipping/overlap.
- Screen width small/normal/large; no side overflow.
- Status/nav bars and gesture navigation insets respected.
- Screen reader identifies icon-only buttons and selected states.

## 6. Updater and translator tests

- Update available, latest version, malformed metadata, unavailable network, download interruption, checksum mismatch, signature mismatch, unsupported ABI and package install denial.
- Translator language persists, translated result displayed, empty text handled, network/provider error handled, copy translated text works.
- OCR: text detected, no text, unreadable image, permission denied and cancellation.

## 7. Release gate

Release is blocked if any P0/P1 crash, fake action, count mismatch, data loss, permission regression, broken patch, missing drawable or fresh-build failure remains. Device test must identify device/API/base version and attach real screenshots/logs. If no physical device exists, label emulator-only verification accurately.
