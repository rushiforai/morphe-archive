# TASK CHECKLIST — GEMINI ANTIGRAVITY EXECUTION

Use this as the agent's task board. Tick only after evidence is attached.

## A. Intake and baseline
- [ ] Confirm repo root and current branch; create safe working branch/worktree.
- [ ] Confirm complete source tree and build entry point.
- [ ] Confirm Android app architecture (Views/Compose/custom framework) from source.
- [ ] Confirm supported Instagram base version(s), target SDK and ABI(s).
- [ ] Inventory every module, patch, settings key, icon, menu and click handler.
- [ ] Inspect all 28 files in `Screenshots/` and cross-check `SCREENSHOT_REFERENCE_CATALOG.md`.
- [ ] Produce `AUDIT_BEFORE_IMPLEMENTATION.md` with file paths and line evidence.
- [ ] Identify source/test/build/dependency blockers.

## B. P0 media crash and carousel correctness
- [ ] Reproduce Reels download error.
- [ ] Reproduce post-option error.
- [ ] Trace `ImageInfoImpl.A31[]` path.
- [ ] Trace `ImmutablePandoImageInfo.A31[]` path.
- [ ] Build version-aware media model adapter; no blind cast to one internal type.
- [ ] Implement `MediaContext` and capability resolver.
- [ ] Resolve item type: Story/Reel/image/video/carousel/unknown.
- [ ] Resolve complete carousel child count and current index from model.
- [ ] Fix `(0)` count when source model contains carousel items.
- [ ] Verify 4-item and 10-item menu labels dynamically.
- [ ] Add null/partial/unavailable media fallback.
- [ ] Add batch download queue, per-item progress, cancel, retry and summary.
- [ ] Add safe user errors and non-sensitive diagnostic logging.

## C. Contextual controls
- [ ] Home Feed: direct-download control.
- [ ] Home Feed: separate settings/more control.
- [ ] Reels: direct-download control for current Reel.
- [ ] Reels: separate settings/more control.
- [ ] Stories: story settings control.
- [ ] Stories: separate Hidden Mentions control.
- [ ] Hidden Mentions: empty state and populated state.
- [ ] Carousel: direct current-item download control.
- [ ] Carousel: settings/more control.
- [ ] Carousel: Download All N Items.
- [ ] Overlay positions do not obstruct native Instagram controls or gestures.
- [ ] Per-surface controls are configurable and can be hidden.

## D. Context menus / functionality
- [ ] Download current media.
- [ ] Download cover/thumbnail.
- [ ] Download all carousel items.
- [ ] Download audio only when valid audio source is exposed.
- [ ] Copy clean link.
- [ ] Copy author username.
- [ ] View/edit local caption copy.
- [ ] Copy caption.
- [ ] Save caption.
- [ ] Translate caption.
- [ ] Copy hashtags.
- [ ] OCR current/cover image.
- [ ] Open via Android Sharesheet/available apps.
- [ ] Repost/share current item to IG Post/Story where supported.
- [ ] WhatsApp Story share when target app exists.
- [ ] Batch export/share for carousel when direct multi-repost is not supported.
- [ ] Every menu item has icon, enabled/disabled state, handler and result feedback.

## E. Settings and UI redesign
- [ ] Rex IG Lite header, `by xboyrex`, dynamic version.
- [ ] Search works and navigates to actual setting.
- [ ] Main category icons and navigation work.
- [ ] Ghost Mode options reviewed and wired.
- [ ] Notification type/keyword filters work.
- [ ] Privacy options and dependencies work.
- [ ] Gesture controls work.
- [ ] Focus Mode controls work.
- [ ] UI Tweaks and toolbar icon visibility controls work.
- [ ] Downloads path/username folders/notifications/skip duplicates work.
- [ ] Developer import/export/reset validated.
- [ ] About has only Rex-owned identity/verified links and legal notices.
- [ ] Premium/crown-gated features removed from shipped UI.
- [ ] Duplicate-feature matrix completed; no unique feature removed.
- [ ] All visible settings have semantic Tabler icons.
- [ ] No legacy/random/emoji icon remains without documented exception.

## F. Dialogs, motion and accessibility
- [ ] Central reusable dialog/bottom-sheet system.
- [ ] Blur supported-device implementation.
- [ ] Dim-scrim fallback for unsupported devices.
- [ ] Open/close animation.
- [ ] Toggle and icon state animation.
- [ ] Reduce Motion respected.
- [ ] Back closes topmost sheet first.
- [ ] Outside tap/swipe dismissal tested per sheet type.
- [ ] No overlapping modal stack or clipped controls.
- [ ] Touch targets >=48dp.
- [ ] Screen readers and icon-only controls have correct labels.

## G. Translator/OCR/saved content/updater
- [ ] Language selector has real supported languages.
- [ ] Translator actually translates and persists target language.
- [ ] OCR works on selected/current supported image.
- [ ] Saved Bio/Caption list works.
- [ ] Copy, edit local copy, share, search, delete work.
- [ ] Download path and queue work.
- [ ] Updater reads verified project release metadata.
- [ ] Version comparison, checksum, install flow and failure states work.
- [ ] Changelog loads actual release notes.

## H. Piko integration (blocked until sources provided)
- [ ] Piko IG Lite source opened and audited.
- [ ] Piko Main source opened and audited.
- [ ] Feature matrix built across Rex/Piko IG Lite/Piko Main.
- [ ] Duplicate features identified by semantic behaviour, not just matching labels.
- [ ] Unique features preserved.
- [ ] Conflicts resolved with migration/tests.
- [ ] Patch IDs, fingerprints, dependencies and compatibility checked.
- [ ] Merge tests/builds pass.
- [ ] If sources absent, mark BLOCKED; no false claim.

## I. Verification and delivery
- [ ] Unit tests run.
- [ ] Patch tests run.
- [ ] UI tests run.
- [ ] Fresh compile/build run.
- [ ] APK installed and launched on real device/emulator.
- [ ] Actual screenshots captured for every required surface.
- [ ] Before/after comparisons created.
- [ ] `TEST_REPORT.md` lists PASS/FAIL/BLOCKED/NOT TESTED separately.
- [ ] Build artifact names, hashes and logs recorded.
- [ ] `KNOWN_LIMITATIONS.md` created.
- [ ] Final change summary and rollback point provided.
