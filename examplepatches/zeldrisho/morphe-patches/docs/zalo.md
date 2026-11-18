# Zalo patch guidance

## Google Drive and microG-RE

**Enable Google Drive photo backup** targets Zalo 26.08.01 and 26.10.02 (arm64-v8a). **microG Drive support** and **Bypass Zalo Drive Contacts permission gate** additionally list Zalo 26.11.01 as experimental; backup and restore workflows are not verified for that target. The backup patch optionally overrides local eligibility, while microG support separately routes account selection and sign-in through microG-RE. Install a compatible provider with package `app.revanced.android.gms` and account type `app.revanced`; other forks are not equivalent. See the [Morphe microG page](https://morphe.software/microg).

Before replacing a provider, export or explicitly accept loss of provider-local data; do not uninstall it without approval. Check account selection, backup and restore, including media/message association. A selected account does not prove OAuth authorization or successful restore. The original 26.08.01 package was previously validated through OAuth, photo restore and a full backup/restore cycle; the clone was validated through both Drive token calls. These observations do not establish current 26.10.02 behavior or guarantee provider, server or device compatibility. See [testing](testing.md).

If the backup option is missing, check eligibility and the optional override. If the provider prompt or an empty picker appears, check its exact package, enabled state, package visibility and account type. For clone sign-in failures, check package identity and microG metadata. A rejected account request may be provider-, OAuth- or attestation-dependent; missing media may reflect server retention, download or message association. Keep accounts, tokens, keys and raw logs private.

## Custom launcher icon

In Morphe Desktop, enable **Change Zalo app icon** and set **PNG icon path** to the absolute path of a PNG file on the computer running Morphe. The PNG must be square, 48–512 pixels per side, non-interlaced and at most 1 MiB. Leave padding for the adaptive icon mask. The option is read during patching, not in the app; launchers may take time to refresh. Do not uninstall an existing app or clear its data to install an output, and check package and signing identity before updating.

Download the [example PNG](assets/example-launcher-icon.png) as a file. It is a 192 × 192 transparent image derived from the [Lawnicons Zalo SVG](https://github.com/LawnchairLauncher/lawnicons/blob/b1b123e6e872d03350a240d4d74f65813bfd0ccb/svgs/zalo.svg); the [original SVG](assets/lawnicons-zalo.svg) and [Apache 2.0 license](assets/LAWNICONS-LICENSE.txt) are included. The patch uses a white adaptive icon background.
