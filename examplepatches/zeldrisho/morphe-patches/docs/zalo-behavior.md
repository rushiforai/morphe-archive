# Zalo behavior notes

This document records durable conclusions from the Zalo `26.08.01`
(version code `260801903`) investigation. It does not turn an unverified
server or storage behavior into a patch target.

## Investigation record

The local, ignored evidence for these conclusions is retained under
`analysis/zalo-26.08.01/notes/`:

- `recon.md` — artifact and package provenance
- `candidate-evidence.md` — candidate fingerprints and rejected ideas
- `batch2-evidence.md` — notification, media, and compatibility findings
- `dex-strings.tsv` — extracted string index
- `apktool.log` — local APK decoding log

APK, smali, logs, and screenshots remain local under the ignored `analysis/`
directory; only verified durable conclusions belong in this document.

## Media

- The analyzed base DEX contains JPEG quality and size configuration keys for
  normal, HD, original, screenshot, and panorama media.
- No confirmed time-based local-media eviction path was found. The discovered
  seven/30/60-day values belong to message-gap/retention behavior, not media
  cleanup.
- The My Cloud file UI exposes `BIG_FILE_EXPIRED` and
  `BIG_FILE_NOT_EXPIRED` states. `qy/a` parses the remote-config keys
  `large_file_expire_time`, `large_file_size`, and `show_large_file_status`
  into `xy/e`; `xy/e.c()` converts the configured expiry value to milliseconds
  for consumers such as `vk0/g`. This makes large-file expiry a
  server/configuration feature, not evidence of a local purge timer or a safe
  deletion boundary.
- Separate `media_expired_time` and `REUSE_CHAT_{PHOTO,VIDEO,FILE}_EXPIRED_TIME`
  keys exist for media reuse/download behavior. They are configuration inputs,
  not proof that already-restored local files may be deleted.
- Original-media download limits may be server- or configuration-enforced and
  remain uncommitted. Do not force quality/size values without proving that
  the compressor and upload/download consumers use the same settings.
- The client-side large-file status classifier (`vk0/g.n`) compares the message
  age with the configured large-file lifetime and returns `BIG_FILE_EXPIRED`.
  Chat and My Cloud views use that status to show the expired/subscription UI,
  even when the restored local file remains available. The **Keep expired media
  accessible** patch changes only this result to `BIG_FILE_NOT_EXPIRED`; it does
  not restore missing files or bypass server authorization for a new download.
- The app already performs a narrow metadata cleanup in `j30/d1`: it deletes
  `sync_media_ext_info` rows whose `noiseId` has no matching `cloud_media.cloudId`.
  This repairs stale metadata only; it does not establish ownership of files on
  disk and must not be broadened into filesystem deletion.
- Orphaned restored media therefore still has no confirmed ownership or safe
  cleanup boundary. No filesystem deletion patch is implemented; cleanup must
  not infer ownership from filenames, timestamps, or message rows alone.
- The fallback values in `qy/a` are `large_file_size = 0x6400000` (100 MiB)
  and `large_file_expire_time = 0x93a80` seconds (7 days). These are defaults
  for the large-file feature, not a universal original-media retention limit.

## Promotional filtering

The existing **Filter promo notifications** patch suppresses the
`SOCIAL_STORY` and `ZALO_VIDEO` notification channels. It intentionally leaves
`ACTIVITY_UPDATES`, `USER_INTERACTIONS`, and `ALERT` untouched because those
channels include chat/group activity, friend requests, and urgent system
notifications.

Broader service-thread or promotional filtering is not safe to implement from
the current evidence: Official Account conversations and ordinary chat items
share message-list infrastructure, and no uniquely identifying, version-stable
client predicate has been established. The existing **Hide Business Box** patch
remains the narrow UI-specific implementation.

## Web/Desktop and session relationships

Zalo's official help pages confirm that PC/Web QR login is approved from an
already-authenticated phone, optionally with biometric confirmation, and that
one account can be used on phone, tablet, and computer with conversations
synchronized across devices:

- [QR login](https://help.zalo.me/huong-dan/chuyen-muc/ban-be-va-danh-ba/su-dung-ma-qr-tren-zalo/)
- [Computer login/logout](https://help.zalo.me/huong-dan/chuyen-muc/moi-bat-dau/cach-dang-nhap-tai-khoan-zalo-tren-may-tinh-bang/)
- [Zalo platform overview](https://help.zalo.me/huong-dan/chuyen-muc/moi-bat-dau/zalo-la-ung-dung-gi/)
- [Zalo PC help archive](https://help.zalo.me/doc-tag/zalopc-zavi/) (device-management guidance)

The official guidance also exposes **Account and security → Logged-in devices**
for reviewing and signing out other sessions. This establishes supported
session management, but not the wire protocol or retention guarantees. No
Android client-side device-limit or session-cap predicate was identified in the
pinned DEX. Read-state and acknowledgement synchronization,
historical-message availability, session revocation, and media scope therefore
remain server/device-test questions.
They must not become patches without a uniquely identified client-side gate.

## Scope decision

This update focuses on media behavior, conservative promotional filtering, and
Web/Desktop relationships. MicroG source maintenance is explicitly deferred;
the download URL and provider patch are unchanged.

## Follow-up validation matrix

Use a throwaway account and record only sanitized outcomes:

1. Send normal, HD, original, large-file, and group media; compare the stored
   local file, the message row, and the remote download result after the server
   expiry window. Do not delete files during the test.
2. Restore a backup into a clean profile, compare message/media identifiers and
   paths before and after downloading, then test whether files remain usable
   after the message is removed. This distinguishes orphaning from ordinary
   cache behavior.
3. Log in to Web and PC by QR while Android is active; send/read messages from
   each client, revoke the desktop session from **Logged-in devices**, and
   verify whether read state and acknowledgements propagate in both directions.
4. For notifications, test the existing filter against story/video promos,
   one-to-one and group messages, friend requests, OA conversations, calls,
   and `chat_download`. Any failure in the latter categories blocks a broader
   filter.
