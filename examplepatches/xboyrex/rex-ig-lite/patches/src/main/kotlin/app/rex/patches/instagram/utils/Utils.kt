/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.utils

import app.rex.patches.instagram.misc.settings.HookFlagsLoadFingerprint
import app.rex.patches.instagram.misc.settings.SettingsStatusLoadFingerprint
import app.rex.patches.instagram.utils.Constants.LOAD_FLAGS_DESCRIPTOR
import app.rex.patches.instagram.utils.Constants.SSTS_DESCRIPTOR
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

fun enableSettings(functionName: String) {
    SettingsStatusLoadFingerprint.method.addInstruction(
        0,
        SSTS_DESCRIPTOR.format(functionName),
    )
}

fun addFlags(functionName: String) {
    HookFlagsLoadFingerprint.method.addInstruction(
        0,
        LOAD_FLAGS_DESCRIPTOR.format(functionName),
    )
}

/**
 * Type referenced by a matched instruction such as a check-cast or new-instance.
 */
internal val Match.InstructionMatch.typeReference: String
    get() = instruction.getReference<TypeReference>()!!.type
