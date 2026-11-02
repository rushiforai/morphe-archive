/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.links.validateLinks

import app.rex.patches.instagram.misc.extension.sharedExtensionPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.LINKS_DESCRIPTOR
import app.rex.utils.changeFirstString
import app.rex.utils.fieldExtractor
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode

val validateLinksPatch =
    bytecodePatch(
        description = "Fixes app crashing issue while opening links from a different app",
    ) {

        dependsOn(sharedExtensionPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            // The following handles the signature check while sharing a link externally and opening a link.
            UriTrustingMethodFingerprint.classDef.methods
                .first {
                    it.returnType == "Z" && it.parameters.size == 2 &&
                        it.parameterTypes.last() == "Z"
                }.apply {
                    addInstructionsWithLabels(
                        0,
                        """
                        invoke-static {p1}, ${LINKS_DESCRIPTOR}->signatureCheck(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :rex
                        return v0
                        """.trimIndent(),
                        ExternalLabel("rex", getInstruction(0)),
                    )
                }

            AppIdentityToStringFingerprint.method.apply {
                val strIndex = AppIdentityToStringFingerprint.stringMatches[1].index

                val firstIGetObject = getInstruction(indexOfFirstInstruction(strIndex, Opcode.IGET_OBJECT))
                SignatureCheckExtensionFingerprint.changeFirstString(firstIGetObject.fieldExtractor().name)
            }
        }
    }
