package app.zerobun.patches.instagram

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_INSTAGRAM = Compatibility(
        name = "Instagram",
        packageName = "com.instagram.android",
        // Instagram ships as a split APKM on APKMirror.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFC483C,
        targets = listOf(
            // The version this was developed and fingerprinted against (same as Piko's
            // pre-release line), so it can be applied in the same run as Piko.
            AppTarget(
                version = "452.1.0.53.64",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 385811006),
            ),
        ),
    )

    const val USER_SESSION_CLASS = "Lcom/instagram/common/session/UserSession;"
    const val FOLLOW_LIST_DATA_CLASS = "Lcom/instagram/follow/analytics/FollowListData;"
    const val USER_MODEL_CLASS = "Lcom/instagram/user/model/User;"

    const val EXTENSION_PACKAGE = "Lapp/zerobun/extension/followertrack"
}
