# Zalo Google Drive and MicroG-RE

Compatibility is pinned to Zalo **26.08.01** (`260801903`). The integration
routes Zalo's existing Drive account flow through MicroG-RE; it does not
establish Google OAuth authorization, server-side retention, or support for every
provider/device combination.

## Patches and current status

Two patches have separate roles:

- **Enable Google Drive photo backup** exposes Zalo's existing photo-backup
  option. It is opt-in (`default = false`) while its startup-verifier issue is
  investigated.
- **microG Drive support** routes account selection/token binding through
  MicroG-RE, checks for the provider, refreshes Drive state after account
  selection, and adds manifest package visibility. It links to the official
  [Morphe MicroG page](https://morphe.software/microg).

Initial OAuth and photo-restore flow, plus a complete backup/restore cycle, were
device-validated for the pinned Zalo version. That evidence does not guarantee
current provider releases, other Android versions, renamed packages, or every
media type. Follow [validation](validation.md) for release qualification.

## Open recognition report

[Repository issue #11](https://github.com/zeldrisho/morphe-patches/issues/11) is
**open** (last updated 2026-09-18). The reporter said Zalo prompted for MicroG
although it was installed; the install button also opened the wrong project page.
The report lacks version code, Morphe version, and diagnostic logs. A suggested
MicroG nightly did not resolve the reporter's problem; the maintainer then asked
them to try the latest patch bundle and reinstall the nightly, with no later
confirmation in the issue.

Bundle 1.6.0 includes fixes for Android package visibility and the download URL,
but the issue remains open: do not present those code changes as proof that the
recognition failure is resolved. To reproduce or report it, include Zalo version
and code, bundle and Morphe versions, MicroG-RE version/package/enabled state,
Android version/ABI, and bounded redacted logs.

## Installation and troubleshooting

1. Use the pinned Zalo target and a current bundle. Enable **Enable Google Drive
   photo backup** only when accepting its opt-in status; apply **microG Drive
   support** for the provider flow.
2. Install compatible MicroG-RE with package `app.revanced.android.gms` and
   account type `app.revanced`. Other package names/forks are not equivalent.
3. Before replacing a provider, record account state and export or explicitly
   accept loss of provider-local data; do not blindly uninstall it.
4. In Zalo's text-message backup/restore screen, test account selection and both
   backup and restore, including media/message association. A visible account or
   successful picker alone does not prove OAuth authorization or data recovery.

| Symptom | Check / boundary |
| --- | --- |
| Install prompt although provider is installed | Exact package name, enabled state, manifest package visibility; issue #11 remains open. |
| Picker has no account | MicroG account registration and `app.revanced` account type; this does not prove Drive authorization. |
| Account selected but request rejected | OAuth/provider backend; treat attestation rejection as **BLOCKED**, not a client patch failure. |
| Photos/media missing after restore | Separate account, server retention/indexing, download, and message association; this patch cannot recover absent remote data. |

Avoid paid-state spoofing and HTTP mutation. Keep tokens, account contents, APKs,
keys, and raw logs private. Provider regressions belong in the
[MicroG-RE issue tracker](https://github.com/MorpheApp/MicroG-RE/issues). The
upstream [issue #276](https://github.com/MorpheApp/MicroG-RE/issues/276) is about
photos missing from Google Photos after MicroG-RE upgrade, not a confirmed Zalo
Drive defect; do not use it as evidence for this integration.
