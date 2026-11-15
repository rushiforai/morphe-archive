/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
*/

package app.rex.patches.instagram.misc.extension.hooks

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patches.all.misc.extension.ExtensionHook
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

internal val instagramInitHook =
    ExtensionHook(
        fingerprint =
            Fingerprint(
                definingClass = "Lcom/instagram/app/InstagramAppShell;",
                name = "onCreate",
            ),
        insertIndexResolver = { method ->
            method.indexOfFirstInstructionOrThrow(Opcode.INVOKE_SUPER) + 1
        },
        contextRegisterResolver = { method ->
            "v${method.getInstruction<FiveRegisterInstruction>(
                method.indexOfFirstInstructionOrThrow(Opcode.INVOKE_SUPER)).registerC}"
        },
    )
