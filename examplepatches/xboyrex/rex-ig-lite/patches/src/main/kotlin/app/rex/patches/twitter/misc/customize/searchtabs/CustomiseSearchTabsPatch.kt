/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.customize.searchtabs

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.Constants.CUSTOMISE_DESCRIPTOR
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private object CustomiseSearchTabsPatchFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    strings =
        listOf(
            "search_features_media_tab_enabled",
            "search_features_lists_search_enabled",
        ),
)

@Suppress("unused")
val customiseSearchTabsPatch =
    bytecodePatch(
        name = "Customize search tab items",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch)

        execute {

            val method = CustomiseSearchTabsPatchFingerprint.method
            val instructions = method.instructions

            val returnObj_loc = instructions.last { it.opcode == Opcode.RETURN_OBJECT }.location.index

            val r0 = (method.getInstruction(returnObj_loc) as OneRegisterInstruction).registerA

            method.addInstructions(
                returnObj_loc,
                """
                invoke-static {v$r0}, $CUSTOMISE_DESCRIPTOR;->searchTabs(Ljava/util/List;)Ljava/util/List;
                move-result-object v$r0
                """.trimIndent(),
            )
            enableSettings("searchTabCustomisation")
        }
    }
