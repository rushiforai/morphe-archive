# Hidden Story Mentions & Profile Picture Repair Report

## 1. Original Bug
- Story Mentions popup (`RexDialogs.showStoryMentionsSheet`) displayed user initials inside circles instead of loading actual profile pictures.
- Story header Hidden Mention indicator (`18 · Hidden Mentions`) did not appear when `CUSTOMISE_STORY_TIMESTAMP` was set to `"default"` or when `StoryMentionIcon` encountered Pando/array mention models (`MediaData.A9q[]`).

## 2. Affected Source Files
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/entity/UserData.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/entity/MediaData.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/story/StoryMentionIcon.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/story/StoryMentionPopup.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/download/DownloadUtils.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/RexDialogs.java`

## 3. Root Cause
1. `RexDialogs.showStoryMentionsSheet` constructed `avatarCircle` with only a `TextView` (`avInit`) and never created an `ImageView` or requested the user's avatar URL.
2. `UserData.getProfilePictureUrl()` only queried `HDProfileInfoUserTreeDictFingerprint` (`hd_profile_pic_url_info`), which is often absent on lightweight Story mention user nodes that only carry `profile_pic_url` (`getLowResProfilePicture()`).
3. `DownloadUtils.addStoryDownloadButton` removed `mentionsBtn` from `topCluster`, leaving no header indicator when `CUSTOMISE_STORY_TIMESTAMP` was `"default"`.

## 4. Actual Changes
- Upgraded `UserData.getProfilePictureUrl()` with a 3-tier resolution chain:
  1. `HDProfileInfoUserTreeDictFingerprint` (`Bvt` -> `getUrl()`)
  2. `getLowResProfilePicture()` (`mediaName` -> `ImageUrl.getUrl()`)
  3. Reflective scan across `User` and `LiveTreeUserDict` for any 0-arg `ImageUrl` / `ProfilePicUrlInfo` getter.
- Exposed `StoryMentionPopup.loadAvatarInto(String url, ImageView target, View fallbackInitialView)` with a 48-entry `LruCache<String, Bitmap>`, background thread pool download, `target.setTag(cleanUrl)` recycled-view guard, and automatic hiding of `fallbackInitialView` once the bitmap decodes.
- Updated `RexDialogs.showStoryMentionsSheet` to embed a circular `ImageView` inside `avatarCircle` and call `StoryMentionPopup.loadAvatarInto(picUrl, avatarImg, avInit)`.
- Updated `StoryMentionIcon.java` and `DownloadUtils.bindStoryHeaderHiddenMentionTap` to display `N · Hidden Mentions` (`1 · Hidden Mention`) bound to the currently active Story and clear stale state when switching stories.

## 5. Test Performed & Evidence
- Verified `MediaData.getMentionSet()` handles `Iterable<?>`, `List<?>`, and `Object[]` (`MediaData.A9q[]` via `java.lang.reflect.Array`), deduplicating by username/userId.
- Verified `StoryMentionPopup.loadAvatarInto` binds `target.setTag(cleanUrl)` and falls back to initial only when `url` is empty or unreachable.
- Status: `PASS` (Static & Call-Graph Audit), `PARTIAL` (Live Device Story Viewer test pending user install).

## 6. Remaining Limitations
- Profile picture loading requires network connectivity if the avatar is not yet in `StoryMentionPopup.AVATARS` LruCache; offline stories gracefully display the deterministic initial badge.
