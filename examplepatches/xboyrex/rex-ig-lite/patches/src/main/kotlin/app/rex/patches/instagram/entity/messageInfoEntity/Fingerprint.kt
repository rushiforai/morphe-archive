/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.messageInfoEntity

import app.rex.patches.instagram.utils.Constants.ENTITY_CLASS
import app.morphe.patcher.Fingerprint

internal const val EXTENSION_CLASS_DESCRIPTOR = "$ENTITY_CLASS/MessageInfo;"

internal object GetAudioMediaExtension : Fingerprint(
    name = "getAudioMedia",
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
)

internal object StellaDirectMessagingServiceAudioRelatedFingerprint : Fingerprint(
    strings = listOf("prepare audio source link"),
)
