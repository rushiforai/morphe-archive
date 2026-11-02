/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.fab

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.Constants.PREF_DESCRIPTOR
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode

private object HideFABFingerprint : Fingerprint(
    filters =
        listOf(
            string("android_compose_fab_menu_enabled"),
        ),
)

@Suppress("unused")
val hideFABPatch =
    bytecodePatch(
        name = "Hide FAB",
        description = "Adds an option to hide Floating action button",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch)

        execute {
            val method = HideFABFingerprint.method
            val instructions = method.instructions
            val constObj = instructions.last { it.opcode == Opcode.CONST_4 }

            method.addInstructionsWithLabels(
                0,
                """
                invoke-static {}, $PREF_DESCRIPTOR;->hideFAB()Z
                move-result v0
                if-nez v0, :cond_1212
                """.trimIndent(),
                ExternalLabel("cond_1212", constObj),
            )
            enableSettings("hideFAB")
        }
    }
