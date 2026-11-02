/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.timeline.hideCommunityBadge

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.Constants.PREF_DESCRIPTOR
import app.rex.patches.twitter.utils.enableSettings
import app.rex.utils.extractDescriptors
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c

private object CommModelFingerprint : Fingerprint(
    strings =
        listOf(
            "actionResults",
            "role",
        ),
)

@Suppress("unused")
val hideCommunityBadge =
    bytecodePatch(
        name = "Hide community badges",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch)

        execute {
            val method = CommModelFingerprint.method
            val instructions = method.instructions

            val iputObj = instructions.last { it.opcode == Opcode.IPUT_OBJECT }
            val iputObjIns = iputObj as Instruction22c
            val ref = iputObjIns.reference.extractDescriptors()[1]
            val reg = iputObjIns.registerA
            val index = iputObj.location.index

            method.addInstructionsWithLabels(
                index,
                """
                sget-boolean v0, $PREF_DESCRIPTOR;->HIDE_COMM_BADGE:Z
                if-eqz v0, :rex
                    sget-object v$reg, $ref->NON_MEMBER:$ref  
                """.trimIndent(),
                ExternalLabel("rex", iputObj),
            )
            enableSettings("hideCommBadge")
        }
    }
