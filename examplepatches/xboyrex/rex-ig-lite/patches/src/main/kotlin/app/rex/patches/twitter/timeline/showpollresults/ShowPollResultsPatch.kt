/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.timeline.showpollresults

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.Constants.PREF_DESCRIPTOR
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

private object JsonCardInstanceDataFingerprint : Fingerprint(
    definingClass = "JsonCardInstanceData\$\$JsonObjectMapper;",
    name = "parseField",
    filters =
        listOf(
            string("binding_values"),
        ),
)

@Suppress("unused")
val showPollResultsPatch =
    bytecodePatch(
        name = "Show poll results",
        description = "Adds an option to show poll results without voting",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch)

        execute {
            val method = JsonCardInstanceDataFingerprint.method

            val loc =
                method.instructions
                    .first { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                    .location.index

            val pollDescriptor =
                "invoke-static {p2}, $PREF_DESCRIPTOR;->polls(Ljava/util/Map;)Ljava/util/Map;"

            method.addInstructions(
                loc + 1,
                """
                $pollDescriptor
                move-result-object p2
                """.trimIndent(),
            )

            enableSettings("enableShowPollResults")
        }
    }
