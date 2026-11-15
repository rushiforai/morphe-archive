/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.messageInfoEntity

import app.rex.patches.instagram.utils.Constants.ENTITY_CLASS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val EXTENSION_CLASS_DESCRIPTOR = "$ENTITY_CLASS/MessageInfo;"

internal object GetAudioMediaExtension : Fingerprint(
    name = "getAudioMedia",
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
)

internal object StellaDirectMessagingServiceAudioRelatedFingerprint : Fingerprint(
    filters = listOf(
        string("prepare audio source link"),
        // Voice media of the message.
        fieldAccess(opcode = Opcode.IGET_OBJECT),
    ),
)
