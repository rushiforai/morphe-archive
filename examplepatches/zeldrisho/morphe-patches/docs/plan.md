# Remaining work

This roadmap is scoped to Zalo Android APK patching for version `26.08.01`
(version code `260801903`). APKs, smali, logs, screenshots, and generated
analysis files remain local under the ignored `analysis/` directory.

## 1. Investigate media behavior

- Trace original-media download limits and identify whether they are server,
  remote-configuration, or client enforced.
- Distinguish large-file expiry, media reuse expiry, message retention, and
  local cache eviction.
- Investigate orphaned media after backup/restore without guessing file
  ownership.
- Validate the expiry bypass with restored large media in chat and My Cloud,
  including cases where the local file is present but the remote URL is no
  longer usable.
- Do not implement quality overrides or filesystem cleanup until their own
  stable client-side control point and ownership boundary are proven.
- Record durable findings in [Zalo behavior notes](zalo-behavior.md).

## 2. Evaluate broader promotional filtering

- Determine whether any broader service-thread or promotional predicate can be
  isolated without hiding legitimate Official Account conversations.
- Preserve chat, group activity, friend requests, calls, alerts, and other
  transactional notifications.
- Keep the existing narrow `SOCIAL_STORY` / `ZALO_VIDEO` notification filter
  unchanged unless a version-stable, positively identified predicate is found.
- Reject the candidate if it depends only on shared message-list infrastructure
  or an unstable obfuscated type.

## 3. Document Web/Desktop relationships

- Document QR login and approval from an authenticated Android phone.
- Determine whether Web/Desktop creates separate sessions and how logged-in
  device limits and revocation are enforced.
- Test read-state, delivery acknowledgements, message history, and media scope
  across Android, Web, and Desktop.
- Treat server-enforced limits as out of scope unless a client-side enforcement
  point is proven.
- Keep verified conclusions and official references in
  [Zalo behavior notes](zalo-behavior.md).

## 4. Update the MicroG-RE download source

- Replace the temporary `zeldrisho/MicroG-RE` releases URL when a stable tagged
  upstream release or official project page containing the OAuth SHA-1
  normalization fix is available.
- Verify release provenance, checksum, and installation flow before changing
  the extension URL.
- Until then, leave the current source unchanged rather than switching to an
  unverified release.

## Acceptance evidence

Use a throwaway account and record sanitized results for media expiry and
restore, notification regression, QR login, session revocation, and bidirectional
read-state synchronization. Do not promote a patch from static analysis alone;
record the tested APK hash, patch bundle, device, Android version, and signing
certificate fingerprint outside this repository.
