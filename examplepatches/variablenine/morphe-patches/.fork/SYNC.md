# Upstream sync manifest

This repository is a personal fork of [MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches).
It has **no shared git history** with upstream (it was created from a tree copy), so syncing is done by
**overlaying the new upstream tree and re-applying the fork delta**, not by `git merge`.

This file is the authoritative procedure. It is written for an automated agent session; a human can follow
it too.

## State markers (update on every sync)

- **Upstream baseline:** stable tag `v1.37.0` (commit `ac3a2416f982`)
- **Last synced upstream release:** v1.37.0 (2026-07-26)

## What is fork-local

### 1. The delta patch — `.fork/upstream-delta.patch`

18 files, re-applied onto each new upstream tree. Semantics (for manual re-application when the
patch no longer applies cleanly):

**Feature: Hide brainrot comments (YouTube)**

| File | Change |
|---|---|
| `extensions/youtube/.../patches/components/BrainrotDetector.java` | **New file.** De-obfuscating meme-lexicon density scorer. |
| `extensions/youtube/.../patches/components/BrainrotCommentFilter.java` | **New file.** `Filter` subclass; path callbacks on `comment_thread.eml` (expanded list) + `comments_entry_point_teaser`/`comments_entry_point_simplebox` (collapsed preview); calls `detector.shouldHideAnySegment(asciiStrings.getStrings())` (per-segment, to avoid buffer-noise dilution); gated by `Settings.HIDE_BRAINROT_COMMENTS`. |
| `extensions/youtube/src/test/.../components/BrainrotDetectorSelfTest.java` | **New file.** Plain-javac self-test; must print `27 passed, 0 failed`. |
| `extensions/youtube/.../settings/Settings.java` | Add `HIDE_BRAINROT_COMMENTS = new BooleanSetting("morphe_hide_brainrot_comments", TRUE)` next to the other comment settings. (Also carries the Cat lock setting below.) |
| `patches/.../youtube/layout/hide/general/HideLayoutComponentsPatch.kt` | (a) const `BRAINROT_COMMENT_FILTER` = extension class descriptor; (b) `SwitchPreference("morphe_hide_brainrot_comments", summary = true)` in the `morphe_comments_screen` preference screen; (c) `addLithoFilter(BRAINROT_COMMENT_FILTER)` next to the other `addLithoFilter` calls. |
| `patches/src/main/resources/addresources/values/youtube/strings.xml` | Add `morphe_hide_brainrot_comments_*` and `morphe_cat_lock_button_*` strings. |

**Feature: Cat lock (YouTube)** — a player button that locks the screen (transparent full-window overlay swallowing all touches) so a pet can watch; unlocked by the alternating-opposite-sides tap gesture.

| File | Change |
|---|---|
| `extensions/youtube/.../patches/catlock/AlternatingTapUnlock.java` | **New file.** Pure unlock-gesture recognizer (alternating L/R fast taps). |
| `extensions/youtube/.../patches/catlock/CatLockOverlay.java` | **New file.** Full-window transparent overlay on the Activity decor view; consumes touches; unlock via `AlternatingTapUnlock`; keep-screen-on + fading hint. |
| `extensions/youtube/.../videoplayer/CatLockButton.java` | **New file.** Top player-control button (mirrors `ExternalDownloadButton` — keep it mirroring whatever that file currently does); constructs `LegacyPlayerControlButton` passing `Settings.CAT_LOCK_BUTTON` itself (not `::get`), `onClick` calls `CatLockOverlay.engage(view)`. Holds no button reference and exposes no visibility injection points. |
| `extensions/youtube/src/test/.../catlock/AlternatingTapUnlockSelfTest.java` | **New file.** Plain-javac self-test; must print `11 passed, 0 failed`. |
| `patches/.../youtube/interaction/catlock/CatLockPatch.kt` | **New file.** Mirrors `DownloadsPatch`: `SwitchPreference("morphe_cat_lock_button")`, `copyResources("catlock", ...)`, `addTopControl("catlock", ...)`, `initializeTopControl(CatLockButton)`. Only the initialize hook — the button derives its own visibility from the setting (upstream removed `injectVisibilityCheckCall` in v1.36.0). |
| `extensions/youtube/.../settings/Settings.java` | Add `CAT_LOCK_BUTTON = new BooleanSetting("morphe_cat_lock_button", FALSE, true)` among the overlay buttons. (Same file as brainrot above.) |
| `patches/src/main/resources/catlock/host/layout/youtube_controls_layout.xml` | **New file.** Top-controls button, anchored `toStartOf @id/morphe_external_download_button`. |
| `patches/src/main/resources/catlock/drawable/morphe_yt_cat_lock_button{,_bold}.xml` | **New files.** Cat-face vector icon. |
| `extensions/youtube/.../swipecontrols/SwipeControlsHostActivity.kt` | In `dispatchTouchEvent`, short-circuit swipe controls while `CatLockOverlay.isLocked()` (swipe controls act at the Activity level, ahead of the overlay view, so brightness/volume swipes must be suppressed while locked). Import `CatLockOverlay`. |

**Fork infrastructure (not tied to a feature)**

| File | Change |
|---|---|
| `patches/build.gradle.kts` | `group = "app.variablenine"`; personalized `about {}` block (name "variablenine Patches", fork notice, source URL). |
| `.github/workflows/release.yml` | Add `issues: write` and `pull-requests: write` to job permissions. **Remove** the Morphe-only tail steps (`Generate website deploy token` → `Trigger website deploy` → `Wait/Setup Python/Send FCM push`): they dispatch to `MorpheApp/morphe-website` and push FCM to Morphe's app users via secrets this fork lacks, so they only ever fail on a published release and email the owner. Keep them removed on every sync. Also renames the Attest `subject-name` to "variablenine Patches". |
| `.github/workflows/open_pull_request.yml` | Add workflow-level `permissions: contents: read, pull-requests: write`. |

### 2. Fork-owned files — restore after overlay (never take upstream's version)

- `README.md` (personal-fork README; the `PATCHES_START/END` section is regenerated by release.yml)
- `CHANGELOG.md`, `gradle.properties`, `patches-list.json`, `patches-bundle.json` (owned by THIS repo's semantic-release)
- `.fork/**` (this manifest and the delta patch)
- **Deleted:** `patches-bundle.png` (Morphe logo; must stay deleted — GPLv3 §7 branding restriction)
- **Deleted:** `.github/workflows/crowdin_pull.yml` and `.github/workflows/crowdin_push.yml` (upstream translation-sync jobs that require Morphe's Crowdin secrets; in this fork they only fail and email the owner — keep them deleted on every sync)

## Sync procedure

1. Clone upstream: `git clone https://github.com/MorpheApp/morphe-patches.git` (plain git over HTTPS —
   do NOT use GitHub API tools on the upstream repo; this session's GitHub tooling is scoped to the fork).
2. Determine the latest **stable** tag `vX.Y.Z` (semver tags, no prerelease suffix). Decide staleness in
   the UPSTREAM clone: sync only if the baseline/last-synced commit above is an **ancestor** of the tag's
   commit. If the tag is an ancestor of the marker (older than what we ship), stop — nothing to do.
3. In the fork, branch from `dev`, then overlay the upstream tree **with git plumbing — never with
   `rm`**. `git read-tree -u --reset` makes the working tree exactly match the upstream tag (adding,
   overwriting and deleting files as needed, including renames) and cannot touch `.git`:

   ```sh
   git fetch https://github.com/MorpheApp/morphe-patches.git refs/tags/vX.Y.Z
   git read-tree -u --reset FETCH_HEAD                     # worktree == upstream tree
   git checkout HEAD -- README.md CHANGELOG.md gradle.properties \
       patches-list.json patches-bundle.json .fork          # restore fork-owned files
   git rm -q -f --ignore-unmatch patches-bundle.png \
       .github/workflows/crowdin_pull.yml .github/workflows/crowdin_push.yml
   ```

   Do **not** hand-roll this as "delete everything, then copy the tree in": that is how `.git` gets
   destroyed, and a manual copy loop also mishandles upstream renames.
4. Apply the delta: `git apply -3 .fork/upstream-delta.patch`; on failure `git apply --reject` and repair
   the `.rej` hunks manually using the semantics table above (upstream may have refactored the touched
   files). **Regenerate `.fork/upstream-delta.patch`** against the new tree afterwards so the next sync
   starts clean.
5. Verify locally: run the self-tests with plain `javac`/`java` (BrainrotDetectorSelfTest 27/27, AlternatingTapUnlockSelfTest 11/11).
6. Update the state markers in this file. Commit everything as
   `bump: Sync upstream Morphe patches vX.Y.Z` (the `bump:` type produces a patch release), push to `dev`.
   If the push to `dev` is rejected with 403 / a branch restriction, see **Automation (routine) setup**
   below — commit first regardless, then fall back to a `claude/`-prefixed branch + PR into `dev`.
7. CI is the compatibility gate: the `Build pull request` workflow must compile the bundle
   (`./gradlew :patches:buildAndroid`). If it fails, diagnose and fix; do not proceed while red.
   **A clean delta apply and passing self-tests do NOT imply the bundle builds** — upstream refactors
   APIs the fork's extension code calls. (v1.36.0 reworked `LegacyPlayerControlButton`: the constructor
   started taking a `BooleanSetting`/`PlayerControlButtonStatus`, `setVisibility*` overloads were removed,
   and `injectVisibilityCheckCall` disappeared from `LegacyPlayerControlsPatch` — `CatLockButton` and
   `CatLockPatch` had to be adapted.) When CI is red, read the job logs and diff the fork's usage against
   upstream's own equivalent code in the new tree (e.g. `ExternalDownloadButton`, `DownloadsPatch`).
8. When CI is green: mark the auto-opened `dev → main` PR ready and **merge it (merge commit, never
   squash)**. The Release workflow on `main` then publishes the new bundle automatically.
9. If the delta cannot be re-applied confidently or CI cannot be made green, STOP: leave the `dev → main`
   PR as draft with a comment explaining exactly what upstream changed and where the sync is stuck.

## Automation (routine) setup

The sync runs unattended as a claude.ai **Routine** ("Daily Morphe upstream sync", daily 09:00 UTC),
which fires a fresh cloud session each time. Two things must be configured on the *routine itself*
at [claude.ai/code/routines](https://claude.ai/code/routines) → edit routine — **not** on the cloud
environment (the environment dialog only controls network access, env vars, and the setup script,
and has no repository settings at all):

1. **Repositories** — `variablenine/morphe-patches` must be attached, otherwise the session has no
   push credentials. Note the fork is *public*, so `git clone`/`fetch` succeed even with no repo
   attached; only the push reveals the problem. A routine created through the CLI/MCP
   (`create_trigger`) has no repositories field, so it starts with none attached.
2. **Permissions → Allow unrestricted branch pushes** — without this a routine may only push to
   `claude/`-prefixed branches, and this procedure pushes to `dev`.

If (2) is unavailable or off, the sync still completes via the documented fallback: commit locally,
push to `claude/sync-vX.Y.Z`, and open a PR into `dev` (then the normal `dev → main` flow follows).
Prefer fixing the setting over relying on the fallback, since the fallback adds a second PR per sync.

An interactive session started from the repo already has push access, so a stuck automated sync can
always be finished by hand from a normal session — that is how the v1.36.0 sync landed.

## Hard rules

- **Stable only.** Only ever sync to an upstream **stable** release: a semver tag `vX.Y.Z` with
  no suffix. NEVER sync to a `-dev`, `-rc`, `-beta`, `-alpha`, or any other prerelease tag, and
  never to an untagged `dev`-branch commit. (The initial fork baseline `v1.35.0-dev.3` is the one
  historical exception — from the first sync onward the baseline must always be a stable tag.)
- **Never delete the repository.** Do not run `rm -rf` on `.git`, on the repo root, or on any glob that
  could expand to include them. The overlay in step 3 is done with `git read-tree`/`git rm`, so no
  recursive delete is ever needed. If `.git` is missing or damaged, STOP and report it — do not
  `git init` a replacement or re-clone over the working copy; the fix is a fresh clone in a new
  directory, and any uncommitted sync work should be re-derived rather than guessed at.
- Never force-push `main` or rewrite semantic-release commits/tags.
- Never reintroduce Morphe branding (logo files, "Morphe" as the bundle name).
- `chore:` commits do not trigger releases; use `bump:` for syncs so a release is cut.
