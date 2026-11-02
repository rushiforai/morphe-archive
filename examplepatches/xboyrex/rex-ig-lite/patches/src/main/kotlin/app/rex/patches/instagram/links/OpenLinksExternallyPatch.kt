/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.links

import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode

internal object InAppBrowserFunctionFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("Tracking.ARG_CLICK_SOURCE", "TrackingInfo.ARG_MODULE_NAME"),
)

@Suppress("unused")
val openLinksExternallyPatch =
    bytecodePatch(
        name = "Open links externally",
        description = "Changes links to always open in your external browser, instead of the in-app browser.",
        default = true,
    ) {

        dependsOn(settingsPatch)

        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {

            InAppBrowserFunctionFingerprint.let {
                val stringMatchIndex = it.stringMatches[0].index

                it.method.apply {
                    // Search after the putString call, since a Bundle can be moved between the key and the call.
                    val putStringIndex = indexOfFirstInstructionOrThrow(stringMatchIndex, Opcode.INVOKE_VIRTUAL)
                    val urlResultObjIndex =
                        indexOfFirstInstructionOrThrow(
                            putStringIndex,
                            Opcode.MOVE_OBJECT_FROM16,
                        )

                    val urlRegister = getInstruction(urlResultObjIndex).registersUsed[0]
                    val freeRegister = findFreeRegister(urlResultObjIndex + 1)

                    addInstructionsWithLabels(
                        urlResultObjIndex + 1,
                        """
                        invoke-static/range { v$urlRegister .. v$urlRegister }, ${Constants.LINKS_DESCRIPTOR}->openExternally(Ljava/lang/String;)Z
                        move-result v$freeRegister
                        if-eqz v$freeRegister, :rex
                        return v$freeRegister
                    """,
                        ExternalLabel("rex", instructions[urlResultObjIndex + 1]),
                    )

                    enableSettings("openLinksExternally")
                }
            }
        }
    }
