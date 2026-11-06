package io.github.warleysr.instagram.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi.ARM64_V8A

object Constants {
    val COMPATIBILITY_INSTAGRAM =
        Compatibility(
            name = "Instagram",
            packageName = "com.instagram.android",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFC483C,
            targets =
                listOf(
                    AppTarget(
                        version = "439.0.0.37.89",
                        versionCodes =
                            mapOf(
                                ARM64_V8A to 384510827,
                            ),
                    ),
                    AppTarget(
                        version = "447.0.0.55.81",
                    ),
                    AppTarget(
                        version = "452.1.0.53.64",
                    ),
                ),
        )

    const val EXTENSION_PATH = "extensions/instagram.mpe"

    // Extension classes
    const val EXTENSION_PACKAGE = "Lio/github/warleysr/instagram/extension"
    const val EXTENSION_PATCHES = "$EXTENSION_PACKAGE/patches"
    const val KEEP_SCREEN_ON_EXTENSION_CLASS = "$EXTENSION_PATCHES/KeepScreenOnPatch;"
    const val CAROUSEL_AUTO_SCROLL_EXTENSION_CLASS = "$EXTENSION_PATCHES/CarouselAutoScrollPatch;"
    const val FEED_BUTTON_EXTENSION_CLASS = "$EXTENSION_PATCHES/FeedButton;"

    // Target Instagram classes
    const val HERO_PLAYER_SETTING_CLASS = "Lcom/facebook/video/heroplayer/setting/HeroPlayerSetting;"
    const val REBOUND_VIEW_PAGER_CLASS = "Lcom/instagram/common/ui/widget/reboundviewpager/ReboundViewPager;"
    const val MEDIA_OPTIONS_CLASS = "Lcom/instagram/feed/media/mediaoption/MediaOption\$Option;"
}
