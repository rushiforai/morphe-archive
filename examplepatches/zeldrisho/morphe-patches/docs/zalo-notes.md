# Zalo notes

These notes preserve verified Zalo behavior and the Zalo 1.3.0 patching
incident. APKs, smali, logs, screenshots, and generated analysis files remain
local under the ignored `analysis/zalo-26.08.01/` directory.

## Media findings

- The client exposes `BIG_FILE_EXPIRED` and `BIG_FILE_NOT_EXPIRED` states for
  My Cloud files.
- The `vk0/g.n` classifier compares message age with the configured large-file
  lifetime and can return `BIG_FILE_EXPIRED`. This is a server/configuration
  feature, not proof of local file deletion.
- `large_file_expire_time`, `large_file_size`, and
  `show_large_file_status` are remote-configuration inputs. Separate
  `media_expired_time` and `REUSE_CHAT_{PHOTO,VIDEO,FILE}_EXPIRED_TIME` values
  affect media reuse/download behavior.
- The **Keep expired media accessible** patch changes only the classifier result
  to `BIG_FILE_NOT_EXPIRED`. It cannot restore missing files or bypass server
  authorization for a new download.
- Zalo's `sync_media_ext_info` cleanup removes stale metadata rows whose cloud
  IDs have no matching `cloud_media` row. No safe filesystem ownership boundary
  has been established; do not broaden this into file deletion.
- Fallback values observed in configuration are `large_file_size = 0x6400000`
  (100 MiB) and `large_file_expire_time = 0x93a80` seconds (7 days). These are
  large-file defaults, not universal media-retention limits.
- JPEG quality/size settings and message-retention values must not be treated
  as proof of original-media limits or local cleanup behavior.

## Notifications

The existing **Filter promo notifications** patch suppresses the
`SOCIAL_STORY` and `ZALO_VIDEO` channels. It intentionally leaves
`ACTIVITY_UPDATES`, `USER_INTERACTIONS`, and `ALERT` untouched because those
channels include ordinary chat/group activity, friend requests, and urgent
system notifications.

Official Account conversations and ordinary chat items share message-list
infrastructure. No broader stable promotional predicate has been established.

## Web/Desktop and sessions

Official Zalo help confirms QR login approved from an authenticated phone and
session management through **Account and security → Logged-in devices**. This
does not establish the wire protocol, retention guarantees, session limits, or
read-state behavior. Those remain device-validation questions and are not patch
targets without a uniquely identified client-side gate.

## Zalo 1.3.0 fingerprint incident

### Failure

Manual patching of the original APKMirror Zalo `26.08.01` APKM with Manager
`1.30.0` and Patcher `1.13.0` failed with:

```text
Failed to match the fingerprint:
com.zeldrisho.patches.zalo.media.MediaExpiryStatus
```

The failure was not caused by Android 16, device resources, or the split APKM.

### Causes

1. The target method was:

   ```smali
   .method public static final n(Lo00/q;Lo00/e2;)Lvk0/a;
   ```

   The fingerprint declared only `PUBLIC` and `STATIC`. Patcher access flags
   are exact, so the missing `FINAL` flag prevented matching.

2. The patch selected `BIG_FILE_EXPIRED` with
   `instruction.toString()`. Instruction string output is not a stable way to
   inspect a referenced field. The fix uses typed `ReferenceInstruction` and
   `FieldReference` matching.

3. Earlier local checks proved compilation but did not apply the generated
   `.mpp` to the complete original APKM with the same Manager/Patcher path.
   Build success therefore did not prove APK compatibility.

4. A media-only APK exited at startup because it omitted the separate native
   startup-tamper bypass. This was unrelated to the media patch. The complete
   nine-patch build, including that bypass, launched successfully.

### Correction and prevention

- Added `AccessFlags.FINAL` to `MediaExpiryStatus`.
- Replaced `toString()` selection with typed field-reference matching.
- Added a pinned-APK fingerprint regression test.
- Rebuilt and applied the bundle to the original APKMirror APKM.
- Verified isolated patch application and the complete nine-patch build.

For future fingerprints:

- Verify the complete smali method header and all access flags.
- Use dexlib reference interfaces instead of instruction string output.
- Test against the exact pinned base APK.
- Apply the generated bundle to the original downloaded APKM.
- Test startup with required integrity/tamper patches enabled.
- Test the complete enabled patch set before publishing.
