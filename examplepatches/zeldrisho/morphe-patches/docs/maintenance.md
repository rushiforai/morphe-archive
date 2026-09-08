# Maintenance — durable project decisions

Distilled from the Threads fix (issue #5) and the 2026-09-07 tech-debt pass.
Nothing feature-specific lives here — this is how the repo is operated.

## Release home is this repo
- Ship from `zeldrisho/morphe-patches` (`dev` → release → backmerge, see
  `docs/release.md`). `scripts/repatch.sh` defaults `GITHUB_REPO` here.
- Don't split work across sibling patch repos; porting patches between repos
  duplicates fingerprint maintenance with no benefit.

## Release history must retain published tags
- Before retrying a release that reports `tag already exists`, check whether
  the published tag is an ancestor of the release branch. Rewritten history
  can leave a tag unreachable and make semantic-release calculate an existing
  version again.
- A failed release can already have pushed its generated commit. Fetch and
  inspect remote state before retrying; do not delete/repoint published tags
  or force-push release history. Any ancestry repair needs explicit review.
- Verify publication and alert resolution directly; a green workflow or an
  empty default-branch alert listing does not prove a PR alert is fixed.
  For a supplied CodeQL alert, inspect its specific ID and PR instance state.
- If fetch/prune or branch inspection times out, report cleanup as unverified.
  Do not infer merge status from stale refs or force-delete branches.

## Device QA evidence has limits
- Record the exact input version/code, explicitly selected bundle (`MPP`),
  enabled patches, package ID, device, and signing setup. Multiple local
  bundles can exist; do not assume a helper selected the newest one.
- Tie device results to the installed APK hash and verified signing certificate.
  Without input/bundle/options provenance, a passing installed build does not
  validate the current bundle or its exact default-on configuration. Offline
  helper tests verify orchestration, not real APK signing or device behavior.
- Existing-session behavior, fresh login, and renamed-package login are
  separate checks. Coexistence with a patched app does not establish
  coexistence with stock-signed upstream.
- Missing ad labels do not prove ad content was removed. Combine changing
  feed content and visual checks with before/after crash-buffer inspection;
  a few clean scrolls are a smoke test, not comprehensive coverage.
- Preserve user sessions. Ask before logout, clearing data, or replacing an
  installed app signed with another key. Let the user enter credentials.
- UI dumps and logs can contain account/feed data. Keep them outside the
  repository; temporary files may disappear and are not durable evidence.
- If the device locks or becomes inaccessible, pause UI actions immediately,
  tell the user, and resume only after checking the current screen. Keep the
  user informed during interactive QA rather than waiting for another prompt.
- For user-demonstrated navigation, capture only with consent and a bounded
  duration; do not inject taps during the demonstration. Stop capture before
  credential entry. Learn visible controls, not just fixed touch coordinates.
- Test surfaces the app actually exposes; do not import another app's feature
  terminology or invent ad surfaces. Confirm video playback with changing
  frames/progress, separately from ad-removal evidence.
- A silent log tag proves nothing if the tested implementation emits no logs.
  Inspect instrumentation before treating logcat output as execution evidence.

## Keep plans small
- `docs/plan.md` contains only remaining actionable work, not completed checks
  or session transcripts. Keep recurring procedures in the QA checklist and
  durable cross-feature lessons here; retain sanitized release evidence in the
  release/PR record rather than creating feature-specific session documents.

## Respect the local toolchain
- Use tools already on `PATH`. `ANDROID_HOME` identifies the SDK for builds,
  independently of executable lookup; do not re-export it when SDK discovery
  is already configured. If a tool is missing, ask before installing it.
- Check the installed CLI's help when flags fail. Morphe Desktop 1.15.0 has
  no `options-create -t` or `patch --purge`; patch temporary files are purged
  by default. Keep errors visible when diagnosing helper failures.
- Inspect keystore aliases rather than guessing capitalization; keytool-made
  stores may contain lowercase `morphe`. Test keys must stay out of Git and
  cannot update an existing installation signed with another key.

## The extension `.mpe` is a build artifact, not a source file
- `extendWith("extensions/extension.mpe")` resolves relative to the patch
  working dir (repo root), but the extension module only emits
  `extensions/extension/build/morphe/extensions/extension.mpe`.
- `:patches:copyExtensionMpe` bridges the gap automatically and
  `:patches:verifyExtensionMpe` fail-fasts when the dex is missing
  (`extendWith` is a load-time reference, so the bundle builds fine without
  it — the failure would otherwise surface on-device). `buildAndroid`
  depends on both; CI runs the verify step explicitly. The repo-root copy
  stays git-ignored.
- Never commit `extensions/extension.mpe` or `analysis/` (see
  `scripts/clean-analysis.sh`).

## Risky patches default off
- A patch that can break core flows (login, providers, push) ships
  `default = false` and earns opt-in status with a WARNING in its description.
  Precedent: Change package name (renaming breaks package+cert-bound SSO).
- `PatchesListShapeTest` guards the default, so a regression fails CI.

## Version drift is routine, not an incident
- Pin exact `AppTarget` versions plus the tested `versionCode`
  (`Constants.TESTED_VERSION_CODE`) — same version *name* from different
  mirrors can carry different version *codes* (APKMirror vs APKPure).
- `FingerprintSurfaceTest` pins the obfuscated surface so the next app update
  fails loudly with a re-hunt pointer instead of silently dead patches.
- Per-update routine lives in `docs/qa-checklist.md` §4 (recon → re-hunt →
  device pass → update pin). Worst case for a missed drift is ads returning,
  never a broken feed — keep it that way (reflection wrapped, no-ops on mismatch).
