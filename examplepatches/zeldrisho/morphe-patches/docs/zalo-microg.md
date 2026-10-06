# Zalo Google Drive and MicroG-RE

Compatibility is pinned to Zalo **26.08.01** (`260801903`). The integration
routes Zalo's existing Drive account flow through MicroG-RE; it does not
establish Google OAuth authorization, server-side retention, or support for every
provider/device combination.

## Patches and current status

Two patches have separate roles:

- **Enable Google Drive photo backup** forces Zalo's existing media-backup
  feature flag on and bypasses its local Drive-account eligibility check, so
  the option can appear for accounts Zalo would otherwise treat as ineligible.
  Eligible accounts may already see the option without this patch. It is opt-in
  (`default = false`), so select it only if you need this override.
- **microG Drive support** routes account selection/token binding through
  MicroG-RE, checks for the provider, refreshes Drive state after account
  selection, and adds manifest package visibility. It links to the official
  [Morphe MicroG page](https://morphe.software/microg).

Initial OAuth and photo-restore flow, plus a complete backup/restore cycle, were
device-validated for the pinned Zalo version under the original package identity.
The renamed `com.zing.zalo.morphe` clone has now also been device-validated through
both Drive token calls. The clone keeps its real package identity across IPC;
MicroG receives the original Zalo package and certificate identities through
manifest metadata. This does not guarantee compatibility with other provider
releases, Android versions, or every media type. Follow
[validation](validation.md) for release qualification.

## Installation and troubleshooting

1. Use the pinned Zalo target and a current bundle. Zalo may show Google Drive
   backup automatically for eligible accounts. Select **Enable Google Drive
   photo backup** only if you need to force the option on and bypass Zalo's
   local eligibility check; it is optional. Apply **microG Drive support**
   separately when using MicroG-RE for the provider flow.
2. Install compatible MicroG-RE with package `app.revanced.android.gms` and
   account type `app.revanced`. Other package names/forks are not equivalent.
3. Before replacing a provider, record account state and export or explicitly
   accept loss of provider-local data; do not blindly uninstall it.
4. In Zalo's text-message backup/restore screen, test account selection and both
   backup and restore, including media/message association. A visible account or
   successful picker alone does not prove OAuth authorization or data recovery.

| Symptom | Check / boundary |
| --- | --- |
| Google Drive backup option is missing | Zalo may show it only for eligible accounts; select **Enable Google Drive photo backup** to force its feature flag on and bypass the local eligibility check. This does not grant Google authorization. |
| Install prompt although provider is installed | Exact package name, enabled state, and manifest package visibility. |
| Picker has no account | MicroG account registration and `app.revanced` account type; this does not prove Drive authorization. |
| Account appears, then Drive sign-in says “No connection” | Check that the clone package and MicroG identity metadata are intact; the pinned clone flow has been device-validated, but provider/OAuth changes may still cause failures. |
| Account selected but request rejected for another reason | OAuth/provider backend; treat attestation rejection as **BLOCKED**, not a client patch failure. |
| Photos/media missing after restore | Separate account, server retention/indexing, download, and message association; this patch cannot recover absent remote data. |

Avoid paid-state spoofing and HTTP mutation. Keep tokens, account contents, APKs,
keys, and raw logs private. For provider regressions, consult the MicroG-RE
project. Do not infer Zalo Drive compatibility from unrelated provider reports.
