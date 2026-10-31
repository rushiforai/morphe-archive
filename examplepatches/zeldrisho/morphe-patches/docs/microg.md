# Zalo Google Drive and microG-RE

The patch advertises compatibility with Zalo **26.08.01** (`260801903`) and **26.10.02** (`261002903`), arm64-v8a. The device-validation observations below apply to 26.08.01; they do not establish device validation for 26.10.02. The integration routes Zalo's existing Drive account flow through microG-RE; it does not establish Google OAuth authorization, server-side retention, or support for every provider and device combination.

## Patches and scope

- **Enable Google Drive photo backup** is optional. It enables Zalo's existing media-backup feature flag and bypasses the local Drive-account eligibility check. Eligible accounts may already see the option without it.
- **microG Drive support** routes account selection and token binding through microG-RE, checks for the provider, refreshes Drive state after account selection, and adds manifest package visibility. See the [Morphe microG page](https://morphe.software/microg).

For 26.08.01, the original package was previously device-validated through initial OAuth, photo restore, and a complete backup/restore cycle. The renamed `com.zing.zalo.morphe` clone was also validated through both Drive token calls. The clone retains its actual package identity across IPC; manifest metadata supplies the original Zalo identity to microG. These observations do not guarantee compatibility with other provider releases, Android versions, or every media type; revalidate the current bundle using [testing](testing.md).

## Use and troubleshooting

1. Use a compatible Zalo target and a current bundle. Select **Enable Google Drive photo backup** only if the local eligibility override is needed; select **microG Drive support** separately for the provider flow.
2. Install compatible microG-RE with package `app.revanced.android.gms` and account type `app.revanced`. Other packages or forks are not equivalent.
3. Before replacing a provider, record account state and export or explicitly accept loss of provider-local data. Do not uninstall it without approval.
4. In Zalo's backup/restore screen, check account selection and both backup and restore, including media/message association. A visible account or successful picker does not prove OAuth authorization or data recovery.

| Symptom | Check or limitation |
| --- | --- |
| Drive backup option missing | Check eligibility and the optional photo-backup override; it does not grant Google authorization. |
| Provider install prompt despite installation | Check exact package name, enabled state, and manifest package visibility. |
| Picker has no account | Check microG account registration and the `app.revanced` account type. |
| Clone sign-in says “No connection” | Check clone package and microG identity metadata; provider or OAuth changes may still cause failures. |
| Account selected but request rejected | Investigate OAuth/provider backend; treat attestation rejection as blocked, not proof of a client patch failure. |
| Media missing after restore | Separate account, server retention/indexing, download, and message association; the patch cannot recover absent remote data. |

Keep tokens, account contents, APKs, keys, and raw logs private. Do not infer Zalo Drive compatibility from unrelated provider reports.
