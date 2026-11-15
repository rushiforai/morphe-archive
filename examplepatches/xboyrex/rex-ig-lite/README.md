<div align="center">

# ⚡ `xboyrex` (`rex-ig-lite`) — v3.13.0

**Unified Liquid Glass Instagram & X (Twitter) Morphe Patch Suite**  
*Engineered by **ㅤᏞᴀᴢʏㅤᎷꫝʏᴀɴк まやんく** (`@xboyrex`)*

[![Add to Morphe](assets/add-to-morphe.svg)](https://morphe.software/add-source?github=xboyrex/rex-ig-lite)

[![Telegram Channel](https://img.shields.io/badge/Telegram-MayankDroid7-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/MayankDroid7)
[![Telegram Group](https://img.shields.io/badge/Telegram-OnyxHub7-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/OnyxHub7)
[![YouTube](https://img.shields.io/badge/YouTube-MayankDroid-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/@mayankdroid?si=slX8DDU0dpLSIYyY)
[![YouTube 2](https://img.shields.io/badge/YouTube-OnyxDroid89-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/@onyxdroid89?si=9gxpZfa3bpI9PKku)
[![Instagram](https://img.shields.io/badge/Instagram-@mayank.zx7-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/mayank.zx7)
[![GitHub](https://img.shields.io/badge/GitHub-@xboyrex-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/xboyrex)

</div>

---

## 🚀 One-Click Setup in Morphe Manager (`v2.5.0+`)

### Method 1 — Direct Universal Deep Link (Recommended)
Tap the **`Add to Morphe`** button above or open this link on your Android device:
- **[`https://morphe.software/add-source?github=xboyrex/rex-ig-lite`](https://morphe.software/add-source?github=xboyrex/rex-ig-lite)**

### Method 2 — Remote Bundle URL (`Sources` → `+`)
Copy and paste either of these into **Morphe Manager → Sources → `+` → Source URL**:
```text
xboyrex/rex-ig-lite
```
or the direct JSON bundle URL:
```text
https://raw.githubusercontent.com/xboyrex/rex-ig-lite/main/patches-bundle.json
```

### Method 3 — Local `.mpp` Bundle File (`Sources` → `+` → `Select patch source files`)
Download **`patches-3.13.0.mpp`** from **[GitHub Releases](https://github.com/xboyrex/rex-ig-lite/releases/tag/v3.13.0)** (compiled with `:patches:buildAndroid` so `classes.dex` and all `.mpe` extensions are embedded inside) and select it in Morphe Manager.

---

## ✨ Key Highlights & Architecture (`v3.13.0`)

| Feature Area | Implementation Details |
| :--- | :--- |
| **🎨 Two-Tone `xboyrex` Liquid Glass Dashboard** | Pure AMOLED `#050708` background with `#121619` charcoal surface cards, `22dp` rounded corners, two-tone **`xboy`** (`#FFFFFF`) + **`rex`** (`#88C2CE`) Hero Header, subtitle `Made with ⚡ By ㅤᏞᴀᴢʏㅤᎷꫝʏᴀɴк まやんく`, live instant Search bar, and top-right `文A` 46-language translator icon. |
| **🌸 SakuraTunes-Style `About` Screen (`RexAboutView.java`)** | Frosted Dark Teal Hero Card (`#1A282B`) with dual scalloped **Sakura Music Flower (`#FF6B9E`)** + **Matte-Black Instagram Camera (`#0C0E10`)** badges side-by-side, `v3.13.0+xboyrex` & `UNIVERSAL` pills, Developer Card (`#111517`) with anime avatar, 2×2 Social Pill Grid (`Telegram`, `xboyrex`, `Instagram`, `YouTube`), `♥ Star xboyrex on GitHub` CTA (`#88C2CE`), and `COMMUNITY & INFO` cards. |
| **🌫️ Real-Time Gaussian Background Blur (`RexDialogs.java`)** | Hardware-accelerated `RenderEffect.createBlurEffect(26f, 26f, Shader.TileMode.CLAMP)` on the host Activity decor view + `WindowManager.LayoutParams.FLAG_BLUR_BEHIND` (`blurBehindRadius = 42`) on every dialog, bottom sheet, post/reel/story download menu, and profile popup. |
| **📥 Redmi / HyperOS Zero-Prompt Direct Download (`StorageUtils.java`)** | Saves directly to `MediaStore.Downloads.EXTERNAL_CONTENT_URI` (`Download/xboyrex/<subfolder>`) on Android 10+ (API 29+) without triggering MIUI/HyperOS SAF folder picker loops when no custom SAF URI is configured. |
| **🛡️ Resilient Multi-Version Bytecode Engine (`453.0.0.57.79` & `452.1.0.53.64`)** | Supports Instagram `453.0.0.57.79` (`385914517`), `452.1.0.53.64` (`385811006`), `454.0.0.54.77`, and `455.0.0.51.72` with dual-shape resolvers and per-hook `runCatching` guards so patching never aborts on minor version shifts. |
| **🔓 100% Unlocked (`Zero Premium Locks`)** | All features, themes, ghost modes, batch downloads, and developer flags are 100% unlocked out of the box with zero crown (`👑`) icons or paywalls. |

---

## 📱 Instagram Patches (`88` Patches)

| # & Patch Name | Description | Status |
| :--- | :--- | :--- |
| **1. `<init>`** | Instagram bytecode & runtime patch | ✅ Default |
| **2. `Add settings`** | Adds settings to control preferences are patching | ✅ Default |
| **3. `Ask before a call`** | Asks for confirmation before starting an audio or video call in Direct Messages. | ✅ Default |
| **4. `Ask before a follow`** | Asks for confirmation before following or requesting to follow an account. | ✅ Default |
| **5. `Ask before a like`** | Asks for confirmation before liking or unliking a post, reel, or comment. | ✅ Default |
| **6. `Change like animation`** | Change the animation to one from existing Rings like animations | ✅ Default |
| **7. `Clone`** | Changes the package name and the app name. This allows you to install the patched app alongside the original Instagram app. | ⚙️ Optional |
| **8. `Copy comment`** | Adds buttons to copy comments and their authors' usernames on posts and reels. | ✅ Default |
| **9. `Custom font`** | Adds an option to replace the app font with a font file from the device storage. | ✅ Default |
| **10. `Custom sharing domain`** | Allows for using custom domains when sharing posts, reels and stories. | ✅ Default |
| **11. `Customise story ring size`** | Instagram bytecode & runtime patch | ✅ Default |
| **12. `Customise story timestamp`** | Customise the timestamp that shows when the story was posted | ✅ Default |
| **13. `Customize navigation bar`** | Choose which tabs appear in the bottom navigation bar and reorder them | ✅ Default |
| **14. `Disable Play Store updates`** | Disables Play Store updates by setting the version code to the maximum allowed. This patch may cause unexpected issues with some apps and does not work if the app is installed by root mounting | ✅ Default |
| **15. `Disable Reels scrolling`** | Disables the endless scrolling behavior in Instagram Reels, preventing swiping to the next Reel. Note: On a clean install, the 'Tip' animation may appear but will stop on its own after a few seconds. | ✅ Default |
| **16. `Disable ads`** | Instagram bytecode & runtime patch | ✅ Default |
| **17. `Disable comments`** | Disables comments and hides comment buttons on posts, reels and stories | ✅ Default |
| **18. `Disable disappearing messages swipe`** | Prevents swiping up in a chat from enabling disappearing messages | ✅ Default |
| **19. `Disable discover people`** | Hides suggested accounts | ✅ Default |
| **20. `Disable double tap like`** | Disable double tap like on post, reel, comment and message | ✅ Default |
| **21. `Disable explore`** | Instagram bytecode & runtime patch | ✅ Default |
| **22. `Disable highlights`** | Instagram bytecode & runtime patch | ✅ Default |
| **23. `Disable screenshot detection`** | Disables screenshots detection in DM | ✅ Default |
| **24. `Disable stories`** | Instagram bytecode & runtime patch | ✅ Default |
| **25. `Disable story flipping`** | Disable automatic flipping/moving to next story | ✅ Default |
| **26. `Disable swipe to create`** | Prevents opening the creation screen by swiping right on the home tab. | ✅ Default |
| **27. `Disable typing status`** | Instagram bytecode & runtime patch | ✅ Default |
| **28. `Disable video autoplay`** | Instagram bytecode & runtime patch | ✅ Default |
| **29. `Download media`** | Adds ability to download posts, reels, stories and highlights | ✅ Default |
| **30. `Download voice message`** | Enables ability to download voice messages | ✅ Default |
| **31. `External downloader`** | Adds support to share post links directly to external downloader | ✅ Default |
| **32. `Filter stories`** | Filter stories to hide based on different categories | ✅ Default |
| **33. `Focus Lock`** | Commitment mode for cutting down on Instagram. Pick what to block (Reels, Explore) and a duration; once locked those protections are forced on and cannot be switched off. Reels shared with you still open. Unlocking early requires a 24 hour cooling-off period, and resetting or importing settings is blocked while locked. | ✅ Default |
| **34. `Force SDR display`** | Reroutes Instagram's window colour-mode changes so the app can be pinned to SDR, keeping the dark UI's blacks deep instead of the washed-out look HDR forces. | ✅ Default |
| **35. `Friendship status indicator`** | Adds a follows you back status label on the profile page and shows a detailed friendship status breakdown on click | ✅ Default |
| **36. `Hidden Home in Back history`** | Leaves the app on Back from the first tab shown when the Home icon is hidden, instead of walking back onto the hidden feed. | ✅ Default |
| **37. `Hidden chats`** | Adds an option to the chat menu that moves the chat to a private inbox, opened by tapping the messages button several times. | ✅ Default |
| **38. `Hide Meta AI`** | Removes Meta AI and Muse from the share sheet, quick-promotion cards and the "About this reel" summary with its Ask Meta AI box; its feed units (Vibes, Meta AI chats, Imagine) are dropped by the feed item filter. Gated on the Meta AI and Muse toggle. | ✅ Default |
| **39. `Hide Reels follow button`** | Removes the follow button from Reels. | ✅ Default |
| **40. `Hide feed posts`** | Hides posts from the home feed | ✅ Default |
| **41. `Hide group creation button on sharesheet`** | Instagram bytecode & runtime patch | ✅ Default |
| **42. `Hide hidden requests`** | Hides the hidden requests (spam) button in the message requests page | ✅ Default |
| **43. `Hide like buttons`** | Hides like buttons on posts, reels and stories | ✅ Default |
| **44. `Hide notes tray`** | Hides notes tray in DM section | ✅ Default |
| **45. `Hide reels and stories ad pods`** | Stops Instagram's ad injection engine from inserting ad pods into Reels, Stories, and Explore. | ✅ Default |
| **46. `Hide reshare button`** | Hides the reshare button from both posts and reels. | ✅ Default |
| **47. `Hide save buttons`** | Hides save buttons on posts and reels | ✅ Default |
| **48. `Hide share button`** | Hides the share button on posts, reels and stories | ✅ Default |
| **49. `Hide stories tray`** | Hides stories tray from main feed. | ✅ Default |
| **50. `Hide story follow button`** | Hides the follow button at the top of stories. | ✅ Default |
| **51. `Hide suggested content`** | Hides suggested stories, reels, threads (Suggested posts will still be shown). | ✅ Default |
| **52. `Improve image viewing`** | Fetches max resolution images from server. | ✅ Default |
| **53. `Inbox lock`** | Asks for your fingerprint, face or screen lock before the inbox is shown. | ✅ Default |
| **54. `Install-packages permission`** | Declares REQUEST_INSTALL_PACKAGES so the update dialog can download and install a new release directly instead of opening the browser. | ✅ Default |
| **55. `Limit feed to following profiles`** | Filters the home feed to display only content from profiles you follow. | ✅ Default |
| **56. `Liquid Glass UI & Navigation`** | Enables Liquid Glass floating navigation bar, rounded post corners, and real-time Gaussian blur dialogs. | ✅ Default |
| **57. `Long press to zoom`** | Allows pressing and holding a feed photo or video to zoom or open xboyrex options. | ✅ Default |
| **58. `Loop story`** | Replay the current story when it ends | ✅ Default |
| **59. `Make ephemeral media permanent`** | Changes unexpired view once, view twice media to permanent view. | ✅ Default |
| **60. `Mark as read after reply`** | Adds an option to mark chats as read after replying while viewing DMs anonymously. | ✅ Default |
| **61. `Mark chat as read manually`** | Adds option to mark a thread aka message as read manually | ✅ Default |
| **62. `More options on post`** | Adds an overflow menu button to get more options on post/reels, like copy description, copy username etc | ✅ Default |
| **63. `More options on profile`** | Adds a new button to handle user related data like copy handle, download profile picture etc | ✅ Default |
| **64. `Open links externally`** | Changes links to always open in your external browser, instead of the in-app browser. | ✅ Default |
| **65. `Pinch to zoom on Reels`** | Allows two-finger pinch-to-zoom on playing Reels. | ✅ Default |
| **66. `Popup hiding`** | Drops Instagram's popups ("Couldn't refresh feed"), which a blocked surface raises on every failed request. Gated on the Instagram popups toggle. | ✅ Default |
| **67. `Preserve post caption`** | Saves caption edits directly to the current post draft before opening music or story options. | ✅ Default |
| **68. `Private screen dimmer & notification filter`** | Adds runtime privacy screen dimmer overlay with adjustable opacity and keyword/type notification filtering. | ✅ Default |
| **69. `Recommended flags`** | Developer flags suggested by the community | ✅ Default |
| **70. `Remove empty bottom space`** | Removes empty space below bottom navigation bar | ✅ Default |
| **71. `Restart relay`** | Declares the one-shot activity xboyrex runs in its own process to bring Instagram back after the cache-clear restart. | ✅ Default |
| **72. `Restore trust on re-signed builds`** | Lets Instagram's own checks of who signed the app pass on a patched build, so login and local trust checks keep working. | ✅ Default |
| **73. `Resume Reels after scrolling`** | Resumes videos from where you left off when you scroll back to them in Reels | ✅ Default |
| **74. `Sanitize share links`** | Instagram bytecode & runtime patch | ✅ Default |
| **75. `Save Instants`** | Captures view-once Instants as you view them so you can re-view and download them later. | ✅ Default |
| **76. `Save deleted messages`** | Captures incoming DMs locally as they arrive from the server and marks them when the sender deletes them. | ✅ Default |
| **77. `Save media comment`** | Adds a button to save media comments on posts and reels. | ✅ Default |
| **78. `Signature check bypass`** | Forces Instagram's signing-certificate trust checks to always pass, so a re-signed APK is treated as an official Meta build and deep links route to their content instead of falling back to the home feed. | ✅ Default |
| **79. `Start videos, reels and stories with sound`** | Adds runtime controls to start feed videos, reels, and stories with audio enabled. | ✅ Default |
| **80. `Story like history`** | Keeps a local history of the stories you liked in the last 24 hours and shows it in a native grid, opened from the story menu or xboyrex settings. | ✅ Default |
| **81. `Story mention indicator`** | Shows an interactive '@N mentions' pill in the story header when the story mentions someone, with 5 customizable pill styles and 3 popup styles. | ✅ Default |
| **82. `Theme`** | Adds Material You and AMOLED controls to xboyrex Settings on Android 12 and later. On Android 8–11, it applies a fixed Material You-style theme or an optional AMOLED theme. | ✅ Default |
| **83. `Unlock developer options`** | Unlocks developer option by long pressing home icon | ✅ Default |
| **84. `View DMs anonymously`** | Instagram bytecode & runtime patch | ✅ Default |
| **85. `View Instants anonymously`** | Stops Instagram from marking Instants (QuickSnaps) you watch as seen. | ✅ Default |
| **86. `View live anonymously`** | Instagram bytecode & runtime patch | ✅ Default |
| **87. `View stories anonymously`** | Instagram bytecode & runtime patch | ✅ Default |
| **88. `View story mentions`** | Add option to view visible and hidden story mentions. | ✅ Default |

---

## 🐦 X / Twitter Patches (`74` Patches)

| # & Patch Name | Description | Status |
| :--- | :--- | :--- |
| **1. `Add ability to copy media link`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **2. `Block redirecting to X Lite`** | Blocks redirecting to the new X Android UI on launch | ✅ Default |
| **3. `Block update screen`** | Blocks the 'This app is out of date' update screen from being shown on launch | ✅ Default |
| **4. `Bring back twitter`** | Bring back old twitter logo and name | ⚙️ Optional |
| **5. `Change app icon`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **6. `Clear tracking params`** | Removes tracking parameters when sharing links | ✅ Default |
| **7. `Control video auto scroll`** | Control video auto scroll in immersive view | ✅ Default |
| **8. `Custom download folder`** | Change the download directory for video downloads | ✅ Default |
| **9. `Custom emoji font`** | Customise emoji font style | ✅ Default |
| **10. `Custom font`** | Customise font style | ✅ Default |
| **11. `Custom share menu`** | Overrides existing share menu and adds a new one | ✅ Default |
| **12. `Custom sharing domain`** | Allows for using domains like fxtwitter when sharing tweets/posts. | ✅ Default |
| **13. `Customise post font size`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **14. `Customize Inline action Bar items`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **15. `Customize Navigation Bar items`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **16. `Customize default reply sorting`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **17. `Customize explore tabs`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **18. `Customize notification tabs`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **19. `Customize profile tabs`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **20. `Customize search suggestions`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **21. `Customize search tab items`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **22. `Customize side bar items`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **23. `Customize timeline top bar`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **24. `Delete from database`** | Delete entries from database(cache) | ✅ Default |
| **25. `Disable auto timeline scroll on launch`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **26. `Disable chirp font`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **27. `Download patch`** | Unlocks the ability to download videos and gifs from Twitter/X | ✅ Default |
| **28. `Dynamic color`** | Replaces the default Twitter Blue with the user's Material You palette. | ⚙️ Optional |
| **29. `Enable PiP mode automatically`** | Enables PiP mode when you close the app | ✅ Default |
| **30. `Enable Undo Posts`** | Enables ability to undo posts before posting | ✅ Default |
| **31. `Enable debug menu for posts`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **32. `Enable force HD videos`** | Videos will be played in highest quality always | ✅ Default |
| **33. `Export all activities`** | Makes all app activities exportable. | ⚙️ Optional |
| **34. `Force enable translate`** | Get translate option for all posts | ✅ Default |
| **35. `Handle custom twitter links`** | Adds support for opening custom twitter links such as vxtwitter, fxtwitter, and fixupx within the app. These will have to be manually enabled under the "Open by default" section in the app info! | ✅ Default |
| **36. `Hide Banner`** | Hide new post banner | ✅ Default |
| **37. `Hide Community Notes`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **38. `Hide FAB`** | Adds an option to hide Floating action button | ✅ Default |
| **39. `Hide FAB Menu Buttons`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **40. `Hide Live Threads`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **41. `Hide Recommended Users`** | Hide recommended users that pops up when you follow someone | ✅ Default |
| **42. `Hide badges from navigation bar icons`** | Hides notification nudges & counts from navigation bar icons | ✅ Default |
| **43. `Hide bookmark icon in timeline`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **44. `Hide community badges`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **45. `Hide followed by context`** | Hides followed by context under profile | ✅ Default |
| **46. `Hide hidden replies`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **47. `Hide immersive player`** | Removes swipe up for more videos in video player | ✅ Default |
| **48. `Hide nudge button`** | Hides follow/subscribe/follow back buttons on posts | ✅ Default |
| **49. `Hide post metrics`** | Hides like, reposts etc counts. | ✅ Default |
| **50. `Hide promote button`** | Hides promote button under self posts | ✅ Default |
| **51. `Hide recommendation items`** | Adds options to hide recommendation items such as "Who to follow" and "Today's news" in timeline, search, and replies. | ✅ Default |
| **52. `Hook feature flag`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **53. `Import/Export login token`** | Adds an feature to export and import the token of accounts. This is useful when logging in on your second device or when re-installing rex. | ✅ Default |
| **54. `Legacy share links`** | Brings back username on post share links. Works post 11.4x.xx | ✅ Default |
| **55. `Log server response`** | Log json responses received from server | ✅ Default |
| **56. `More information on profile`** | Adds more details on the profile page | ✅ Default |
| **57. `Native downloader`** | Requires X 11.0.0-release.0 or higher. | ✅ Default |
| **58. `Native reader mode`** | Requires X 11.0.0-release.0 or higher. | ✅ Default |
| **59. `Native translator`** | Requires X 11.0.0-release.0 or higher. | ✅ Default |
| **60. `No shortened URL`** | Get rid of t.co short urls. | ✅ Default |
| **61. `Pause search suggestions`** | Search suggestions will not be saved locally | ✅ Default |
| **62. `Remove Ads`** | Removed promoted posts, trends and google ads | ✅ Default |
| **63. `Remove premium upsell`** | Removes premium upsells | ✅ Default |
| **64. `Remove search suggestions`** | Hide/Remove search suggestion in explore section | ✅ Default |
| **65. `Remove view count`** | Removes the view count from the bottom of tweets | ✅ Default |
| **66. `Restore legacy follower lists`** | Restores the legacy follower and following list screen. | ✅ Default |
| **67. `Round off numbers`** | Enable or disable rounding off numbers | ✅ Default |
| **68. `Selectable Text`** | Makes bio and username selectable | ✅ Default |
| **69. `Share Tweet as Image`** | Share tweets as rendered image. Requires X 11.0.0-release.0 or higher. | ✅ Default |
| **70. `Show changelogs`** | Shows changelogs when new a patch is installed. | ✅ Default |
| **71. `Show poll results`** | Adds an option to show poll results without voting | ✅ Default |
| **72. `Show post source label`** | Source label will be shown only on public posts | ✅ Default |
| **73. `Show sensitive media`** | X / Twitter bytecode & runtime patch | ✅ Default |
| **74. `Support external downloader`** | X / Twitter bytecode & runtime patch | ✅ Default |

---

## 🛠️ Building Locally & CI/CD Pipeline

The Morphe Android Patcher requires `classes.dex` inside the `.mpp` archive. Always run **`:patches:buildAndroid`** after generating the patch list:

```bash
./gradlew build :patches:generatePatchesList --no-daemon
./gradlew :patches:buildAndroid --rerun-tasks --no-daemon
```

The compiled Android DEX bundle is output to:
```text
patches/build/libs/patches-3.13.0.mpp
```

---

## 👤 Developer & Community Links

- **Developer**: **ㅤᏞᴀᴢʏㅤᎷꫝʏᴀɴк まやんく** (`Roshan Kumar Gupta` / `@xboyrex`)
- **GitHub**: [`https://github.com/xboyrex`](https://github.com/xboyrex)
- **Repository**: [`https://github.com/xboyrex/rex-ig-lite`](https://github.com/xboyrex/rex-ig-lite)
- **Telegram Channel**: [`https://t.me/MayankDroid7`](https://t.me/MayankDroid7)
- **Telegram Group**: [`https://t.me/OnyxHub7`](https://t.me/OnyxHub7)
- **Instagram**: [`https://www.instagram.com/mayank.zx7`](https://www.instagram.com/mayank.zx7)
- **YouTube**: [`@mayankdroid`](https://youtube.com/@mayankdroid?si=slX8DDU0dpLSIYyY) · [`@onyxdroid89`](https://youtube.com/@onyxdroid89?si=9gxpZfa3bpI9PKku)
