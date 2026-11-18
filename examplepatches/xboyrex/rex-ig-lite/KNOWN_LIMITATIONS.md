# INSTAREX (REX IG LITE v3.16.0) — KNOWN LIMITATIONS & ENVIRONMENT CONSTRAINTS (`KNOWN_LIMITATIONS.md`)

1. **Headless VM Sandbox Network & Device Isolation**:
   - The local verification VM has no outbound internet access and no attached Android device/emulator. Therefore, full Gradle artifact resolution (`./gradlew build`) and `patches-3.16.0.mpp` packaging execute automatically in GitHub Actions upon running `bash push_to_github.sh` in Termux.
2. **Instagram Private-Account & Server-Side Access Controls**:
   - Per `MASTER_PROMPT.md` Rule 11, InstaRex only reads media URLs, carousel children, and story mentions exposed to the currently authenticated user session by Instagram's client models (`MediaData`, `ImageInfo`, `VideoVersion`, `ReelItem`). It does not bypass server-side private account restrictions or DRM.
3. **Batch Carousel Reposting on Android**:
   - Instagram's native external share receiver supports `Intent.ACTION_SEND_MULTIPLE` for multi-item feed/story sharing depending on the installed Instagram/WhatsApp version. When a target app rejects multi-stream intents, `RexRuntimeFeatures.repostAllCarouselMedia` saves all `N` carousel items to `Pictures/InstaRex_Share` in MediaStore and opens the Android system Sharesheet chooser so no items are lost.
4. **Excluded Paywalled / Unsupported Reference Items**:
   - Per `MASTER_PROMPT.md` Rule 10 & Section 4.2, paywalled/crown-marked items (`Premium`, `View Blocked Profiles Secretly`) and server-enforced account limit bypasses (`Add Accounts without Limits`) shown in reference screenshots are intentionally excluded rather than shipped as fake or non-functional toggles.
