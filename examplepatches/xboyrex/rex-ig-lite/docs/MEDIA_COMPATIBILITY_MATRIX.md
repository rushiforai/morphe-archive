# INSTAREX (REX IG LITE v3.15.0) — MEDIA & VERSION COMPATIBILITY MATRIX (`MEDIA_COMPATIBILITY_MATRIX.md`)

## 1. Instagram Base Version Compatibility Matrix

| Instagram Base Version | `ImageInfoImpl` (Standard Model) | `ImmutablePandoImageInfo` (GraphQL / Pando) | `VideoVersion` & `ImmutablePandoVideoVersion` | `CarouselMedia` (`List<MediaData>`) | Audio Track (`OriginalSoundData` / `MusicInfo` / DASH) | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **`439.0.0.37.89`** | Supported (`getImageVariants`) | Supported (Hierarchy fallback) | Supported (`getVideoVersions`) | Supported (`CarouselMediaGetterFingerprint`) | Supported (`resolveAudioDownloadUrl`) | **PASS** |
| **`444.0.0.47.66`** | Supported (`getImageVariants`) | Supported (Hierarchy fallback) | Supported (`getVideoVersions`) | Supported (`CarouselMediaGetterFingerprint`) | Supported (`resolveAudioDownloadUrl`) | **PASS** |
| **`452.1.0.53.64`** | Supported (`ResolveImageInfoObject` + index `0`) | Supported (`extractCandidatesFromImageInfo`) | Supported (`VideoData` Pando fallback) | Supported (4-stage `getCarouselMedia()`) | Supported (`resolveAudioDownloadUrl`) | **PASS** |
| **`453.0.0.57.79`** | Supported (`ResolveImageInfoObject` + index `0`) | Supported (`extractCandidatesFromImageInfo`) | Supported (`VideoData` Pando fallback) | Supported (4-stage `getCarouselMedia()`) | Supported (`resolveAudioDownloadUrl`) | **PASS** |
| **`454.0.0.54.77`** | Supported (`ResolveImageInfoObject` + index `0`) | Supported (`extractCandidatesFromImageInfo`) | Supported (`VideoData` Pando fallback) | Supported (4-stage `getCarouselMedia()`) | Supported (`resolveAudioDownloadUrl`) | **PASS** |
| **`455.0.0.51.72`** | Supported (`ResolveImageInfoObject` + index `0`) | Supported (`extractCandidatesFromImageInfo`) | Supported (`VideoData` Pando fallback) | Supported (4-stage `getCarouselMedia()`) | Supported (`resolveAudioDownloadUrl`) | **PASS** |

---

## 2. Surface & Capability Action Matrix (`MediaContextResolver` + `MediaActionRegistry`)

| Surface Type | Direct Control | Context Menu — Download Group | Context Menu — Copy & Caption Group | Context Menu — Tools Group | Context Menu — Repost & Share Group |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **A. Single Image Post** | One-tap HD Image Download | `Download`, `Download Cover Photo` (if present), `Image Quality / Variants` (no MP3 audio shown) | `Copy Clean Post Link`, `Copy Author Username (@user)`, `View, Edit & Copy Caption`, `Copy Caption`, `Save Caption`, `Translate Caption`, `Copy Hashtags` (if present) | `Image to Text (OCR)`, `Open by Phone Apps` | `Repost as IG Post`, `Repost as IG Story`, `Repost as WhatsApp Story` |
| **B. Multi-Item Carousel (`1/N`)** | One-tap Current Slide Download | `Download Current Post (Slide X of N)`, `Download Cover Photo`, `Download all N Posts`, `Download First 10 Posts` (when `N > 10`), `Select Items to Download (N)`, Slide Variants, `Download Audio (.mp3)` (only if video slide has audio) | `Copy Clean Post Link`, `Copy Author Username (@user)`, `View, Edit & Copy Caption`, `Copy Caption`, `Save Caption`, `Translate Caption`, `Copy Hashtags` | `Image to Text (OCR)` (photo slide) / `Cover Image to Text (OCR)` (video slide), `Open by Phone Apps` | `Repost Current Post as IG Post`, `Repost Current Post as IG Story`, `Repost Current Post as WA Story`, `Repost all N as Posts`, `Repost all N as Stories`, `Repost all N as WA Stories` |
| **C. Single Video Post** | One-tap Video Download | `Download Video`, `Download Cover Photo`, `Video Quality / Variants`, `Cover Image Variants`, `Download Audio (.mp3)` | Full Copy & Caption group | `Cover Image to Text (OCR)`, `Open by Phone Apps` | `Repost as IG Post`, `Repost as IG Story`, `Repost as WhatsApp Story` |
| **D. Reel** | Discreet Direct Download button | `Download Reel Video`, `Download Cover Photo`, `Video Quality / Variants`, `Cover Image Variants`, `Download Audio (.mp3)` | Full Copy & Caption group | `Cover Image to Text (OCR)`, `Open by Phone Apps` | `Repost as IG Post`, `Repost as IG Story`, `Repost as WhatsApp Story` |
| **E / F. Story & Story with Mentions** | Story Download button + `@N mention` header pill | `Download Current Story (X/N)`, `Download all N Stories`, `Select Stories to Download (N)` | Full Copy & Caption group | `Image to Text (OCR)` / `Cover Image to Text (OCR)`, `Hidden Mentions` (`Hidden Mentions (0)` or `Hidden Mentions (N)`), `Story Media Information`, `Open by Phone Apps` | `Repost as IG Post`, `Repost as IG Story`, `Repost as WhatsApp Story` |
| **G. Profile Picture & Bio** | Profile Action Bar Hexagon button + Bio Long-Press | `Download Profile Picture (HD)`, `View Profile Picture` | `View, Edit & Copy Bio`, `Copy Bio`, `Save Bio`, `Translate Bio`, `Copy Username`, `Copy Full Name`, `Copy Profile Link`, `Copy User ID`, `Followers / Following`, `Add to Saved Profiles` | `Share Profile Link` | Native Android Sharesheet |
