# Remaining work

This roadmap is scoped to Zalo Android APK patching for version `26.08.01`
(version code `260801903`). APKs, smali, logs, screenshots, and generated
analysis files remain local under the ignored `analysis/` directory. Verified
findings and incident history are kept in [Zalo notes](zalo-notes.md).

## 1. Validate media behavior

- Test the expiry bypass with restored large media in chat and My Cloud.
- Compare behavior when the local file exists but the remote URL is no longer
  usable.
- Test backup/restore and determine whether restored media remains usable after
  its message is removed.
- Trace original-media download limits and determine whether they are server,
  remote-configuration, or client enforced.
- Do not broaden media retention into filesystem cleanup until a safe
  file-ownership boundary is proven.

## 2. Validate promotional filtering

- Test the existing `SOCIAL_STORY` / `ZALO_VIDEO` filter against story/video
  promotions, one-to-one and group messages, friend requests, Official Account
  conversations, calls, and `chat_download`.
- Preserve chat, group activity, friend requests, calls, alerts, and other
  transactional notifications.
- Do not broaden filtering without a version-stable, positively identified
  predicate.

## 3. Validate Web/Desktop behavior

- Test QR login and approval from an authenticated Android phone.
- Test read state, delivery acknowledgements, message history, and media scope
  across Android, Web, and Desktop.
- Test session revocation through **Account and security → Logged-in devices**.
- Treat server-enforced session limits and authorization as out of scope unless
  a client-side enforcement point is proven.

## 4. Update the MicroG-RE download source

- Replace the temporary `zeldrisho/MicroG-RE` releases URL when a stable tagged
  upstream release or official project page containing the OAuth SHA-1
  normalization fix is available.
- Verify release provenance, checksum, and installation flow before changing the
  extension URL.
- Until then, leave the current source unchanged.

## Acceptance evidence

Use a throwaway account and record sanitized results for media expiry and
restore, notification regression, QR login, session revocation, and
bidirectional read-state synchronization. Before release, repeat build,
original-APKM repatch, installation, and device validation with the published
`.mpp`. Record the tested APK hash, patch bundle hash, enabled patches, device,
Android version, and signing certificate fingerprint outside this repository.
