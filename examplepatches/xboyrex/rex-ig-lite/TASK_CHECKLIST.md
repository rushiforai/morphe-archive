# InstaRex v3.16.0 — Master Implementation & Audit Remediation Checklist

- [x] **P1-01**: Synchronized `patches-bundle.json` and `patches-list.json` from `3.13.0` to `3.16.0` (`patches-3.16.0.mpp`).
- [x] **P1-02**: Split `UpdateChecker.java` & `RexAboutView.java` into two honest update pathways: `Check Patch Bundle Update (.mpp)` (works on all Morphe-patched installs) and `Check Signed APK Update (OTA)`.
- [x] **P2-01**: Fixed `UpdateChecker.isCloneBuild(Context)` duplicated `.xboyrex` condition to check `com.instarex.android`, `com.instagram.androie`, `com.instagram.android.clone`, `.xboyrex`, `.instarex`, and `.clone`.
- [x] **P2-02 & P2-03**: Added `MediaData.AudioState { YES, NO, UNKNOWN }` and `MediaContextResolver.SurfaceType.UNKNOWN` so unknown media objects or audio exceptions never produce false positives.
- [x] **P2-04**: Increased `SettingsActivity` bottom list inset padding to `76dp + bottomInset` so the Android gesture navigation handle never overlaps the bottom preference row (`22975.png`).
- [x] **P2-05**: Updated `RexFeatureRegistry.java` to report truthful `"STATIC_VERIFIED"` verification states instead of hardcoded `"PASS"`.
- [x] **Screenshot Parity (`23083.png`)**: Root `InstaRex Settings` screen with visible left back button, centered `InstaRex Settings` title, right language icon, `38sp` two-tone `InstaRex` hero banner, `Made with ♥ by xboyrex` subtitle, `View Blocked Profiles Secretly` row, and `Info` category header above `About InstaRex`.
- [x] **Screenshot Parity (`22919.png`)**: Calligraphic two-tone `InstaRex` wordmark drawable on the Home top-left logo view (`ActionBarPatch.hookLogoView`), with tap -> `Quick Access` and long-press -> `InstaRex Settings`.
- [x] **Screenshot Parity (`22916.png`)**: Home Feed UFI bar places the Hexagon (`⬡`) button on the left cluster right after Share (`row_feed_button_share`) and the Download (`↓`) button on the right cluster right before Save (`row_feed_button_save`).
- [x] **Screenshot Parity (`22914.png` & `22915.png`)**: Profile top header Hexagon button and Reels right-column Hexagon + Download buttons with fast haptic feedback.
- [x] **Screenshot Parity (`22878.png`)**: `Feed and Stories` subpage with all 27 feed, story, mention, and 60fps upload controls + inline `DIRECT ENABLE / DISABLE TOGGLES` cards inside Post, Reel, Carousel, and Story bottom sheets.
- [x] **Screenshot Parity (`23076.png`)**: DM `Chat Toolkit` popup (`Mark as Read`, `Deleted Messages`, `Send Audio`, `Video to Audio`, `Hide this chat`, and `Always Mark as Read` live switch).
- [x] **Screenshot Parity (`22870.png`)**: `Select Language` radio dialog with `Cancel` and `Translators` buttons + 4-tier fault-tolerant Translation Engine (`translate.googleapis.com`, `clients5.google.com`, `api.mymemory.translated.net`, `lingva.ml`).
- [x] **Screenshot Parity (`23086.png`)**: `Recommended flags` screen pre-populated with curated default Story and Plus flags out of the box.
