# Maintenance — durable project decisions

Index only. Canonical procedures live in the linked docs; this file records
decisions, not duplicate instructions.

- Release home, branching, recovery, and generated-file ownership:
  [release process](release.md).
- Environment and installs: [toolchain setup](toolchain.md). Use tools already
  on `PATH`; if a tool is missing, ask before installing it.
- Module layout and extension artifact wiring: [architecture](architecture.md).
- Fingerprint and patch authoring rules, including version pinning and risky
  patches: [fingerprint guide](fingerprint-guide.md),
  [patch development](patch-development.md#file-layout).
- Repeatable device QA and per-update routine:
  [QA checklist](qa-checklist.md). Record input/bundle/options provenance with
  every device result; a passing build without provenance does not validate the
  current bundle.
- Incident context: [lessons learned](lessons-learned.md).
- `docs/plan.md` contains only remaining actionable work, not completed checks
  or session transcripts. Keep recurring procedures in the QA checklist and
  durable cross-feature lessons here; retain sanitized release evidence in the
  release/PR record rather than creating feature-specific session documents.

## Standing rules

- Check the installed Morphe Desktop CLI's help when flags fail. Temporary patch
  files are purged by default; keep errors visible when diagnosing helper failures.
- Inspect keystore aliases rather than guessing capitalization; keytool-made
  stores may contain lowercase `morphe`. Test keys must stay out of Git and
  cannot update an existing installation signed with another key.
- Pin exact `AppTarget` versions plus the tested `versionCode`
  (`Constants.TESTED_VERSION_CODE`) — a version *name* alone does not identify
  the APK variant. Use only APKMirror originals and record the download URL,
  ABI/variant, and input hash; see [toolchain setup](toolchain.md#6-original-apk-source).
- `FingerprintSurfaceTest` pins the repo-side contract (compatibility target,
  tested versionCode, register-helper behavior) so drift in our own sources fails
  loudly. It does not inspect a downloaded APK; APK-side drift is caught by
  re-running the [QA checklist](qa-checklist.md#version-bump-new-threads-release).
- Worst case for a missed drift is ads returning, never a broken feed — keep it
  that way (reflection wrapped, no-ops on mismatch).
- No settings UI: patches stay stateless and always-on/off via Morphe toggles.
  Piko-style settings infra (`settingsPatch`, pref store, in-app UI) is
  out of scope — skipped 2026-09-07, not deferred.
