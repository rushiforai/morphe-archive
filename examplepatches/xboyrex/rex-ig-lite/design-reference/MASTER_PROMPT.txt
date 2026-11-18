# REX IG LITE — GEMINI ANTIGRAVITY MASTER IMPLEMENTATION SPECIFICATION

**Project:** Rex IG Lite  
**Developer identity:** by xboyrex  
**Reference set:** `Screenshots/` — 28 original screenshots supplied by the user  
**Task mode:** Repository audit → implementation plan → code changes → tests → build → device verification  
**Priority:** Correct functionality first, then cohesive UI/UX and animations.  

---

## 0. NON-NEGOTIABLE EXECUTION RULES

You are operating as a senior Android reverse-engineering/compatibility engineer, Android UI engineer, test engineer and product designer. Treat this as an implementation task, not a mockup exercise.

1. Read this entire file, `SCREENSHOT_REFERENCE_CATALOG.md`, `TASK_CHECKLIST.md`, `ACCEPTANCE_TEST_PLAN.md`, and `DESIGN_TOKENS.json` before editing.
2. Inspect the actual repository, build scripts, manifests, patch framework, source sets, resource system, current package/version support and CI workflows. Do not assume the project is Compose, XML Views, or a particular Gradle setup until confirmed.
3. Use the supplied screenshots as **behaviour and layout references**, not as permission to copy InstaPrime branding, premium gates, proprietary assets, or upstream identity. Product identity must remain **Rex IG Lite / by xboyrex**.
4. Do not stop after planning, SVG copying, or a static preview. Integrate changes into the real app and test them.
5. Do not use source-text grep as proof of runtime behaviour. Do not report PASS unless the corresponding test actually ran and its evidence exists.
6. Never hide an exception merely by suppressing its toast. Fix the root cause, log safe diagnostics, and show a user-readable error.
7. No fake buttons, empty callbacks, dummy switches, hardcoded fake media counts, fabricated URLs, fabricated update status, or success messages before an operation succeeds.
8. Preserve all existing working patch behaviour, preference keys, route IDs, callback semantics, persistence and supported app compatibility. If a key must change, provide migration and tests.
9. Do not remove unique functionality during deduplication. Produce a duplicate-feature matrix and get a deterministic merge decision from source evidence.
10. Do not implement premium/paywalled items, crown-gated options, or paid-only UI. Keep the requested feature set free. Remove premium upsell rows and crown markers from Rex's user-facing settings, but do not strip third-party legal notices or licences.
11. Use only content/metadata exposed to the currently loaded Instagram item and normal app permissions. Do not bypass access controls, private-account restrictions, DRM, authentication, or platform security. Repost/share must use Android Sharesheet or supported Instagram/WhatsApp intents and must not impersonate the original creator.
12. Make incremental changes on a dedicated Git branch/worktree. Keep a clean diff, commit logical stages, and do not overwrite user changes.
13. If Piko IG Lite / Piko Main source archives or repositories are not present in the workspace, mark the merge as **BLOCKED: SOURCE REQUIRED**. Do not claim a merge was performed. Build a merge adapter/plan only after inspecting both sources.
14. If network access, dependency resolution, Instagram version, signing keys, or a device/emulator is unavailable, report the exact blocker. Never fabricate build or install results.

## 1. PRIMARY GOAL

Deliver one professional, consistent, fully functional Rex IG Lite experience with:

- Complete custom settings/menu redesign.
- Semantic Tabler outline icons beside **every actionable option** where a leading icon improves recognition.
- Centralized icon registry; fully replace legacy hand-drawn/random/glyph icon systems.
- Context-aware tools for Home Feed, Reels, Stories, single image/video posts and carousels.
- Automatic media-type and carousel-item detection from the actual loaded model.
- Direct action buttons plus a contextual Settings/More button on each supported surface.
- Functional download, cover download, audio extraction where technically available, caption/hashtag/link/user copy, OCR, translation, saved items and supported repost/share actions.
- Reliable dialogs, sheets, blur fallback, transitions, accessibility and dismissal behaviour.
- Working updater, changelog, language and translator flows.
- A clean, minimal Rex About screen with only current project-owned information.
- Regression tests for all existing and newly added features.

## 2. REQUIRED FIRST PHASE — SOURCE AUDIT

Before coding, enumerate:

- All Gradle modules and plugin versions.
- Main app/source modules and patch modules.
- UI implementation framework and custom view/popup implementations.
- Existing icon systems (including any Canvas-based icon renderer), drawable/vector resources and menu registries.
- All settings keys, defaults, listeners, feature hooks and persistence locations.
- All media menu entry points and click handlers for Feed, Reel, Story, single post, carousel, profile and comment.
- Current Instagram media model types, adapters, reflection usage and download functions.
- Manifest components, provider authorities, permissions, intents and storage flows.
- Current translator/OCR/updater implementations and their dependencies.
- Existing tests, CI build workflows and release packaging.
- Duplicate or conflicting feature names and duplicate setting keys.

Deliver `AUDIT_BEFORE_IMPLEMENTATION.md` with evidence: file paths, symbol names, relevant line numbers, actual behaviour, risk and recommended fix. Record missing sources separately. Do not modify code until this baseline audit and implementation plan are written.

## 3. SCREENSHOT REFERENCE CONTRACT

All 28 files in `Screenshots/` must be reviewed. The catalogue records visible text and functional intent. Use original pixel dimensions/aspect ratios as visual references. Do not reproduce the screenshot's InstaPrime brand, author name, premium rows, crown icons or exact proprietary copy. Translate the intended function into Rex wording and Rex styling.

The screenshot references include:
- Main settings and navigation categories.
- Ghost Mode and anti-delete/secret-view controls.
- Notification filtering by message type and keywords.
- Privacy: ads, analytics, screen privacy and hidden chats.
- Gesture controls.
- Long-press/context actions and saved bio/caption.
- Focus Mode.
- Downloads preferences.
- Developer configuration import/export/reset.
- About/community/OTA/changelog.
- Media context menus for image, video, Reel, Story and carousel.
- Carousel counts and bulk repost/share operations.
- Language selection and hidden-mentions dialog.

## 4. VISUAL DESIGN SYSTEM

Use the design tokens from `DESIGN_TOKENS.json`. The recommended direction is premium AMOLED with controlled cool-cyan/teal identity, neutral charcoal surfaces, restrained blue primary actions and red destructive actions. Do not use the old random accent mix or excessively bright full-surface gradients.

### 4.1 Branding and settings landing page

- Product name exactly: **Rex IG Lite**.
- Developer line: **by xboyrex**.
- Version/build channel read dynamically from app metadata; never hardcode a stale version.
- Use a locally bundled Rex app mark/wordmark (do not use Instagram logo as the Rex brand mark).
- Header should have balanced safe-area spacing, optional language action, title, developer line, version/channel and search.
- Main categories should be grouped logically, with consistent icon alignment, titles, summaries and chevrons.
- All cards/rows must fit narrow screens, large font settings and display cutouts. No clipped last row or gesture bar overlap.
- Search must actually filter settings by title, summary and supported aliases; selecting a result navigates to the real option.

### 4.2 Settings categories and reference labels

Implement or map the following reference feature groups. Existing Rex features take precedence; do not create a duplicate if already present. Keep every free feature accessible and remove crown/premium upsell items.

**Main category labels from screenshot:** Ghost Mode; Notification; Privacy; Gestures; Feed and Stories; UI Tweaks; Focus Mode; Miscellaneous; Downloads; Developer Options; About InstaPrime (Rex equivalent: About Rex IG Lite).

**Ghost Mode reference options:**
- Anti-Delete Messages — “View messages even after they are deleted or unsent.”
- Last Active Date & Time Format — show a full date/time instead of relative “Active 1hr ago”.
- Enable Ghost Mode — master enable/disable for eligible ghost controls.
- Mark as Seen after Reply (premium in reference; EXCLUDE from build unless already available as a free supported feature; no upsell UI).
- Mark as Seen (On Reaction).
- Secret View Story.
- Secret Read Messages.
- Secret Typing.
- Secret View Live Stream.
- Secret Screenshot.
- Listen Voice Note Secretly.
- Anti-Reply Image.
- Anti-View Once.
Every item must be validated against current Instagram base support. Explain unavailable/unsupported behaviour honestly; do not promise guaranteed invisibility.

**Notification reference options:**
- Filter By Message Type.
- Disable Filter Notifications.
- Filter Notifications (specific message types).
- Filter By Keywords.
- Disable Filter Notifications (Keywords).
- Filter Notifications (Keywords).
Support explicit keyword add/remove, case policy, persistence and a test preview. Do not silently suppress all notifications because of an empty/invalid configuration.

**Privacy reference options:**
- Disable Ads.
- Disable Analytics Tracker.
- Private Screen Mode (premium in reference; exclude premium-only gate; implement only if a legitimate free feature exists).
- Private Screen Opacity (dependent on Private Screen Mode).
- Hide 'Hidden Chats' Menu.
- Show Notification from Hidden Chats.
- Set Passcode Lock to Hide Chat.
- Show all Hidden Chats.
Use proper dependency enable/disable styling. Passcode must be stored using an appropriate secure mechanism; never plaintext in logs/preferences. Avoid claiming telemetry blocking if the target code path is not actually intercepted.

**Gestures reference options:**
- Disable Reels Scrolling.
- Disable Accidental Swipe-to-Refresh.
- Disable Double Tap to Like (Post).
- Disable Double Tap to Like (Comment).
- Disable Double Tap to Like (Reels).
- Disable Swipe-to-Navigate.
Each gesture preference must be wired to its correct gesture handler and must not break normal scrolling/accessibility.

**Focus Mode reference options:**
- Hide Stories Section.
- Hide Feeds Section.
- Hide Reels Section.
- Hide Explore Section.
- Hide all Comments.
Use reversible UI visibility controls. Do not delete or mutate account content.

**Long-press / Miscellaneous reference options:**
- Long-Press Search to Open Profile (username or profile URL, with or without @, only after validating the input).
- Show Follow Indicator (Mutual, Following, Follower) where the relevant relationship data is available.
- Disable Group Creation When Sharing (hide group-creation destination only in supported share UI; never block legitimate system sharing globally).
- Add Accounts without Limits — do not promise bypass of Instagram account limits; exclude or relabel as unsupported if no legitimate implementation exists.
- Remove “… more” from User's Bio (presentation-only truncation control).
- Change Translator Language.
- Change Split Video Duration (use a validated configurable duration and display its unit).
- Choose WhatsApp Type (WhatsApp / WhatsApp Business for share intents, only when installed).
- Disable Watch History (only where a real supported watch-history path exists).
- View Saved Bio.
- View Saved Caption.
- Chat background image and choose background image.
- Choose Emoji Type.
- Choose Font Type.
- Add Custom Story Fonts (validate font file formats/licences).
- App Startup Tab.
- Reorder Navigation Tabs.
- Optional navigation appearance customisation.
- Hide/show Follow Indicator on profile.
- Hide/show Profile Options icon.
- Hide/show Reel Download icon.
- Hide/show Rex Reel Options icon.
- Hide/show Home Options icon.
Make every option appear only where relevant and do not duplicate the same feature across unrelated categories.

**Downloads reference options:**
- Change Download Path.
- Split Download Media by Username.
- Show Notification on Download.
- Disable Storage Permission (reference label; do not disable or bypass required Android permissions—modern storage picker/MediaStore permissions must remain correct; relabel as a safe permission prompt preference only if technically valid).
- Disable Subfolders.
- Skip Downloaded Media.
- Clear Download List.
Use Storage Access Framework / MediaStore according to the app's supported Android versions. Handle permission denial, revoked URI grants, duplicate files, invalid names, insufficient storage, partial downloads and cancellation.

**Developer Options reference options:**
- Import Developer Configs.
- Export Developer Configs.
- Disable Developer Options.
- Reset Developer Configs.
Include schema/version validation, preview, confirmation, atomic writes, backup and clear errors. Do not import arbitrary executable code.

**About / update reference options:**
- Official Website (use only actual Rex-owned configured destination).
- WhatsApp Channel.
- Telegram Channel.
- Telegram Group.
- YouTube Channel.
- Support Developer.
- Contributors.
- Supporters.
- Check Update.
- Changelog.
Keep About minimal and Rex-owned. Remove InstaPrime/Sakura/Morphe promotional branding, copied links, upstream names and unrelated banners. Keep required third-party open-source licence acknowledgements in a separate Legal/Open Source Notices screen. Do not invent social URLs; only use verified project-owned links from repository configuration.

## 5. CONTEXT-AWARE MEDIA CONTROLS — CORE FEATURE

Create a central `MediaContextResolver` (name can follow project conventions) and a typed `MediaContext` model. It must identify the currently visible item and classify it into:
- Story.
- Reel / short video.
- Single image post.
- Single video post.
- Carousel post (image/video/mixed when supported).
- Profile/avatar/media where relevant.
- Unknown/unsupported (show safe fallback, no crash).

Do not infer type only from screen label or media URL extension. Use the actual loaded Instagram model and a version-aware adapter layer. Resolve the active item, owner, media ID/URL, caption, cover, audio information, carousel child list, current carousel index, total child count and capabilities. Null/unknown fields must be explicit and safe.

### 5.1 Placement and controls

**Home Feed:** add a discreet Rex direct-download affordance and a separate Rex Settings/More control on supported feed post rows. Do not overlap Like, Comment, Share, Bookmark, author header, caption, accessibility focus or system gestures. Controls must be hideable/repositionable in Rex settings. Direct download uses the currently visible post; settings opens contextual actions.

**Reels:** add a discreet direct-download control for the current Reel and a separate settings/more control. The control should remain stable during vertical scrolling, not intercept swipe gestures, not overlap Instagram's right-side action rail, and support tap targets of at least 48dp. Add a user setting to enable/disable each overlay. Download current Reel should be one-tap; settings opens the full Reel action sheet.

**Stories:** add one settings control and a separate Hidden Mentions shortcut/button. The settings control opens story-specific actions and configuration; the Hidden Mentions button opens a list/dialog for mentions actually available in the currently loaded story metadata. If no mention data exists, show “No mentions found for this story” with a close action. Respect story progress/tap zones, reply controls, accessibility and safe areas. Do not cover the story owner/progress bars or reply input.

**Carousel:** add a direct action for current slide/post and a separate settings/more control. Resolve the complete carousel child list from the model. Show dynamic labels such as `Download all 4 items` or `Download all 10 items` based on actual child count, not a hardcoded value and not the visible `1/10` text alone. Support current item download and all-item download. Add progress, per-item status, cancel, retry failed items and completion summary. Preserve item order and proper extensions. If count is not fully loaded, show “Loading carousel items…” or partial-count state, never `(0)` when the visible model clearly has slides.

### 5.2 Smart media detection and actions

Build deterministic local context detection—not a marketing “AI” label. A small classifier/capability resolver should examine model type and available metadata. Produce a capability list per media type so unsupported actions do not appear or are disabled with an explanation.

**Common post/Reel actions (where applicable):**
- Download Current Media.
- Download Cover Photo / Thumbnail.
- Download Audio (MP3) only when a valid audio stream is exposed and extraction is supported.
- Copy Clean Post Link.
- Copy Author Username.
- View, Edit & Copy Caption (edit local copy/draft only; do not imply remote editing of someone else's caption).
- Copy Caption.
- Save Caption.
- Translate Caption.
- Copy Hashtags.
- Image to Text (OCR) / Cover Image to Text (OCR).
- Open with Phone Apps (Android Sharesheet/intent chooser).
- Repost as Instagram Post.
- Repost as Instagram Story.
- Repost as WhatsApp Story (if WhatsApp exists; optional WhatsApp Business selection).

**Carousel-only actions:**
- Download Current Item.
- Download Cover Photo (when cover exists).
- Download All N Items.
- Repost Current Item as Post/Story/WhatsApp Story where supported.
- Repost All N as Posts/Stories/WhatsApp Stories only if Android/target app supports a safe share flow; otherwise expose a batch export/share queue, not a fake one-click repost.

**Reel/video-only actions:**
- Download video.
- Download cover.
- Extract audio only when source/decoder supports it.
- Open externally.
- OCR visible cover/frame if user selects a frame or available cover.

**Image-only actions:**
- Download original/available image.
- Image variants only when variants are actually provided by model.
- OCR.
- Copy link/caption/hashtags.
- Share/open externally.

### 5.3 Reference action labels from screenshots

Use Rex wording, but preserve these functional intents:
- `Image to Text (OCR)` / `Cover Image to Text (OCR)`
- `Download` / `Download Current Post` / `Download Current Media`
- `Download Cover Photo`
- `Download Audio (.mp3)`
- `Download all N Posts` / `Download all N Items`
- `Copy Clean Post Link`
- `Copy Author Username (@username)`
- `Open by Phone Apps`
- `Repost as IG Post`
- `Repost as IG Story`
- `Repost as WhatsApp Story`
- `Repost Current Post as IG Post`
- `Repost Current Post as IG Story`
- `Repost Current Post as WA Story`
- `Repost all N as Posts`
- `Repost all N as Stories`
- `Repost all N as WA Stories`
- `Copy Caption`
- `View, Edit & Copy Caption`
- `Save Caption`
- `Translate Caption`
- `Copy Hashtags`

All labels must be generated from media context. Do not show `Download all N` for non-carousel content or audio for an image without audio.

## 6. FIX KNOWN MEDIA/CRASH ISSUES FIRST

Previous runtime screenshots exposed errors resembling:
- `DownloadUtils: Error at downloadDialogBox` involving `com.instagram.model.mediasize.ImageInfoImpl.A31[]`.
- `RexDialogs: handlePostOptionClick error` involving `com.instagram.model.mediasize.ImmutablePandoImageInfo.A31[]`.
- Carousel UI indicator showing `1/10` while action menu reports `Download All Carousel Posts (0)`.

Treat these as high-priority compatibility defects. Do not hardcode the internal class `A31` or assume a single Java field type. Inspect the exact target base version and current model classes. Build a compatibility adapter that safely handles supported representations (typed objects, arrays, lists, immutable/pando wrappers) only where confirmed by source/runtime inspection. Use a version-specific adapter registry and capability checks. Avoid unsafe generic reflection that silently casts.

Required tests:
- Single image.
- Single video.
- Reel with valid cover and video.
- Reel with absent cover.
- Carousel 1/4, 1/10, mixed media if supported.
- Carousel with one child unavailable.
- Empty/null/unresolved media model.
- Model from every supported base version.
- Duplicate download and retry.
- Storage denied / low storage / cancelled.
- No network / expired media URL.

User-facing errors must be concise, e.g. “Couldn't read this media item. Update compatibility data or try again.” Internal logs should contain safe class/type, base version, operation and root cause without personal tokens, credentials, private URLs or account secrets.

## 7. ICON SYSTEM — COMPLETE REPLACEMENT

Use the supplied Tabler `outline.zip` as the default source and `filled.zip` only for selected states/appropriate semantic variants. Audit the packs and select only used assets. Preserve SVG masters and licence. Convert to validated Android vector resources according to the actual UI framework. Do not add all 6,545 SVGs to runtime resources blindly.

Create one centralized semantic icon registry. Every visible actionable setting/menu item gets an appropriate leading icon unless the screenshot component is a visual preview (e.g. Mention Pill sample chips). Keep icon family, optical size, stroke, viewBox and tint consistent. Remove legacy Canvas icon renderer/random vector/glyph assets after all usages are migrated and verify no references remain. Brand SVGs must be official/licensed assets.

Icon tokens: 24dp standard, 20dp compact, 18dp trailing, 2px master stroke, round caps/joins. Vector resources should be tintable. Decorative icons need no spoken label; interactive icon-only controls require accessible content descriptions/tooltips.

## 8. POPUPS, BLUR, OPEN/CLOSE AND MOTION

Use one reusable modal/sheet system; no unrelated popup implementations per feature.
- Context action menus: anchored bottom sheet or adaptive modal, scrollable when content is long, safe-area aware.
- Settings dialogs: grouped sections with icon-led rows, concise subtitles and obvious Close/back behaviour.
- Blur: native blur on supported Android versions/devices, with graceful dim-scrim/translucent surface fallback. Do not require blur to use the dialog.
- Opening: subtle fade + scale or slide (160–240ms).
- Closing: matching reverse motion (120–200ms).
- Toggle: state/knob animation (150–220ms).
- Icon state transition: short crossfade/trim/scale where meaningful; no constant spinning or distracting looping.
- Respect system Reduce Motion / animator duration scale.
- Back closes the topmost modal first. Outside tap and swipe-to-dismiss should follow dialog type; destructive/in-progress operations require confirmation or controlled cancellation.
- Avoid stacking multiple modal windows. Restore focus to the invoking control on dismiss.
- Minimum 48dp touch target and clear pressed/disabled/loading states.

## 9. TRANSLATOR, OCR, SAVED CONTENT AND UTILITIES

**Translator:** real language picker, persist selected target language, detect source language only if supported, show translated result, loading/error/empty states, copy translated output. No fake translation. Reuse an existing provider/dependency if present; otherwise propose an explicit provider/implementation and report any API/network requirement. Do not hardcode credentials.

**OCR:** process the selected/current available image or user-selected Reel frame; explain image permission/selection, handle no-text result, show editable copy result, Copy All and Close. Do not run OCR on unrelated private content in the background.

**Saved Copies:** save captions, bios, hashtags and copied text locally with type, timestamp and source link when available. Provide search, edit local copy, copy, share and delete with confirmation. Do not write edits back to another person's Instagram profile.

**Long video splitter:** validated configurable duration (default read from existing preference), preserve audio sync, sequential file naming, progress, cancel, retry, storage checks. Do not silently alter source media.

**Download manager:** destination selector, optional username subfolders, duplicate skip, notification preference, queue, progress, cancellation, retry and clear list. Keep user-granted folder permission persistent where allowed.

## 10. SETTINGS, ABOUT AND UPDATER

Settings must have searchable sections, clear dependencies, real stored state, sensible defaults and migration. Remove duplicate labels/duplicate switches only after verifying semantic equivalence. If two options have different hooks, they are not duplicates even if names sound similar. Report duplicate candidates and decisions.

About screen should be minimal and branded only for Rex IG Lite:
- Rex logo/wordmark.
- Rex IG Lite name.
- by xboyrex.
- Dynamic version/build/base.
- Verified project repository and project-owned support/community links only.
- Check for Updates.
- Changelog.
- Open Source Notices / Legal.
No InstaPrime branding, no Sakura Music branding, no Morphe promotional header and no upstream marketing. Preserve required licence acknowledgements separately.

Updater must be real:
- Read release metadata from verified repository/config.
- Compare semantic versions correctly.
- Show release notes and asset/ABI compatibility.
- Download with progress, pause/resume if supported, checksum verification, storage checks and cancellation.
- Delegate installation to Android package installer; respect unknown-source permission and signature checks.
- Show clear “already up to date”, “update available”, “download failed”, “signature mismatch” and “incompatible package” states.
- Never claim update success before package installation.
- No hardcoded or invented URL.

## 11. COLOUR AND COMPONENT TOKENS

Use `DESIGN_TOKENS.json` as the source of truth. Initial recommendation:
- Background: #05070A / optional true AMOLED black #000000 mode.
- Surface: #11161D.
- Elevated surface: #1A222B.
- Border: #293441.
- Primary text: #F4F7FA.
- Secondary text: #9AA7B5.
- Brand cyan: #16B8D4.
- Active teal: #39C9B5.
- Primary blue: #398BE8.
- Destructive: #EF6675.
- Success: #43B985.
- Warning: #E4B65D.
Use restrained cyan/blue accents. Avoid making all icons cyan; default icons use primary text and selected/active states use accent. Ensure WCAG-appropriate contrast where applicable.

Spacing scale: 4, 8, 12, 16, 20, 24, 32dp. Card radius 20–24dp; modal radius 24–28dp; divider 1dp; row tap target ≥48dp. Dynamic type/font scaling and narrow-screen layout must work.

## 12. TESTING AND QUALITY GATES

Before coding, write test matrix. After coding, run relevant tests and include exact commands/results.
- Unit tests for media classification, carousel counting, dedupe, filename, MIME and capability mapping.
- Tests for each menu entry and handler mapping.
- Preference persistence/restart tests.
- Dialog open/close/back/outside-tap tests.
- Accessibility and target-size checks.
- UI tests for Feed/Reel/Story/Carousel overlays.
- Download integration tests using controlled fixtures/test doubles where live Instagram is unavailable.
- Patch compatibility tests for every supported base version.
- Build every intended variant/flavor and inspect artifacts.
- Install/launch on at least one real device or emulator and capture screenshots at matching display size/density.

Create before/after screenshot comparisons for all screens. Use the provided screenshot set as baseline for functional hierarchy and layout—not pixel-copying proprietary branding. Ensure no overlap with Instagram native buttons, no cropped text, no off-screen dialog actions and no status/navigation inset defects.

## 13. DELIVERABLES REQUIRED

Create these files in repository/docs or audit output:
1. `AUDIT_BEFORE_IMPLEMENTATION.md`
2. `FEATURE_MERGE_MATRIX.md` (Piko only when both sources provided)
3. `MEDIA_COMPATIBILITY_MATRIX.md`
4. `ICON_MANIFEST.json`
5. `DESIGN_TOKENS.json`
6. `IMPLEMENTATION_CHANGELOG.md`
7. `TEST_REPORT.md` (separate static/unit/UI/device results; never combine into fake PASS)
8. `SCREENSHOT_COMPARISON/` before/after images
9. Build artifacts and hashes where build succeeded
10. `KNOWN_LIMITATIONS.md`

Final response must list changed files, implemented features, features deferred/blocked, test commands and real results, build status, device tested, screenshots and any remaining failures. Use exact labels: PASS, FAIL, BLOCKED, NOT TESTED. Do not call anything “100% working” without end-to-end proof.

## 14. EXECUTION ORDER

P0 — Reproduce crashes and media model failures; fix the root cause.  
P1 — Build typed media context/capability resolver and correct carousel count.  
P2 — Implement Feed/Reel/Story/Carousel direct controls and contextual settings sheets.  
P3 — Build the shared popup/dialog/blur/motion system.  
P4 — Replace all legacy icons with the Tabler registry and redesign Settings.  
P5 — Implement/repair translator, OCR, saved content, downloads, updater and About.  
P6 — Deduplicate options safely and preserve unique patches.  
P7 — Piko merge only after source archives are available and audited.  
P8 — Full regression, build, device test, screenshot compare and release report.

**Start now with audit and plan. Then execute the plan; do not stop at recommendations.**
