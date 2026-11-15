/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.videoData

import app.rex.utils.changeFirstString
import app.morphe.patcher.patch.patch

val videoDataEntity =
    patch(
        description = "This patch is used for decoding obfuscated code of Video data",
    ) {
        execute {
            runCatching {
            VideoVersionMapperFingerprint.instructionMatches.let {
                VideoHeightExtensionFingerprint.changeFirstString(it[1].methodReference.name)
                VideoCodecExtensionFingerprint.changeFirstString(it[3].methodReference.name)
                VideoUrlExtensionFingerprint.changeFirstString(it[5].methodReference.name)
                VideoWidthExtensionFingerprint.changeFirstString(it[7].methodReference.name)
            }
        
            }
        }
    }
