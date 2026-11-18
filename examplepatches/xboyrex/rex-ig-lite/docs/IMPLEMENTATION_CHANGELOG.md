# INSTAREX (REX IG LITE v3.15.0) — IMPLEMENTATION CHANGELOG (`IMPLEMENTATION_CHANGELOG.md`)

## Version `3.15.0` (2026-11-17)
### 1. Product Identity & Brand Architecture (`InstaRex`)
- Updated primary settings landing page header, About screen, Quick Access menu, and release metadata to **InstaRex** (`Rex IG Lite • by xboyrex`) per explicit user directive (`Name InstaRex rkhna`).
- Replaced the Instagram icon in `RexAboutView.java` with the Rex-owned `hexagon` monogram (`RexIconRegistry.getIconDrawable(context, "hexagon", REX_CYAN, 28)`) in compliance with `DESIGN_TOKENS.json`.
- Added in-app **Check Update (OTA)** action in `RexAboutView.java` wired directly to `UpdateChecker.checkNow(context)`.

### 2. P0 Media Variant, Pando & Carousel Engine Repairs
- **`Fingerprint.kt` & `MediaDataEntity.kt`**:
  - Added `ResolveImageInfoObjectExtensionFingerprint` and `CarouselMediaGetterFingerprint`.
  - Fixed `GetImageVariantsExtensionFingerprint.changeFirstString(candidatesMethodName)` to patch index `0` instead of out-of-bounds index `1`.
  - Routed `ExtMediaDictImageInfoMapperFingerprint` exclusively to `ResolveImageInfoObjectExtensionFingerprint` so `ImageData.getImageVariants()` is never overwritten with `"A31"` (fixing `ImageInfoImpl.A31[]` and `ImmutablePandoImageInfo.A31[]`).
- **`Entity.java`, `ImageData.java`, `VideoData.java`, `MediaData.java`**:
  - Added full superclass and interface hierarchy method/field resolution (`findMethod`, `invokeCompatibleMethod`, `extractFieldByType`).
  - Added Pando candidate list extraction (`extractCandidatesFromImageInfo`), 4-stage carousel list resolution (`getCarouselMedia()`), and multi-source MP3 audio URL resolution (`resolveAudioDownloadUrl()`).

### 3. Context-Aware Media Action System (`MediaContextResolver` & `MediaActionRegistry`)
- Implemented dynamic carousel labels (`Download Current Post (Slide X of N)`, `Download Cover Photo`, `Download all N Posts`, `Select Items to Download (N)`).
- Implemented batch carousel reposting (`Repost all N as Posts`, `Repost all N as Stories`, `Repost all N as WA Stories`) via `RexRuntimeFeatures.repostAllCarouselMedia()` using `Intent.ACTION_SEND_MULTIPLE`.
- Implemented context-aware OCR labels (`Image to Text (OCR)` on photo slides/posts vs `Cover Image to Text (OCR)` on videos/Reels) and `Open by Phone Apps`.
- Added Story intelligence actions (`Hidden Mentions` and `Story Media Information`) and updated `StoryMentionPopup.java` and `PeopleCellDialogBox.java` to render `Hidden Mentions (0)` (`No hidden mentions found for this story.`) and `Hidden Mentions (N)`.

### 4. Central `RexIconRegistry` & `RexFeatureRegistry`
- Created `RexIconRegistry.java` managing `186` semantic Tabler icons (`477` SVG master files, `348` Android VectorDrawables) and `241` mapped preference/route keys.
- Created `RexFeatureRegistry.java` cataloging all category routes and `139` `Settings.java` preferences with their screen locations, icon IDs, callbacks, patch dependencies, and test statuses.
