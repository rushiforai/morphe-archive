/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.trackDataIntf

import app.rex.utils.changeFirstString
import app.morphe.patcher.patch.patch

val trackDataIntfEntity =
    patch(
        description = "This patch is used for decoding obfuscated code of track data interface",
    ) {
        execute {
            runCatching {
            GetTrackDataExtension.changeFirstString(TrackDataFromMusicInfoMethodFingerprint.originalMethod.name)
            GetMappingsExtension.changeFirstString(
                AudioFilterInfoTreeUpdaterFingerprint.instructionMatches.first().methodReference.name,
            )
        
            }
        }
    }
