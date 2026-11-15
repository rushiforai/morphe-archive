/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.originalSoundDataIntf

import app.rex.utils.changeFirstString
import app.morphe.patcher.patch.patch

val originalSoundDataIntfEntity =
    patch(
        description = "This patch is used for decoding obfuscated code of Original sound data interface",
    ) {
        execute {
            runCatching {
            OriginalSoundMapperFingerprint.instructionMatches.let {
                GetAudioIdExtension.changeFirstString(it[1].methodReference.name)
                GetUserDataExtension.changeFirstString(it[3].methodReference.name)
                GetAudioNameExtension.changeFirstString(it[6].methodReference.name)
                GetAudioUrlExtension.changeFirstString(it[8].methodReference.name)
            }
        
            }
        }
    }
