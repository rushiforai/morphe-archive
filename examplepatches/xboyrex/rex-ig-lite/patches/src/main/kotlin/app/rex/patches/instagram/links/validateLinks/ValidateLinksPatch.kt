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
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel

val validateLinksPatch =
    patch(
        description = "Fixes app crashing issue while opening links from a different app",
    ) {

        dependsOn(sharedExtensionPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            runCatching {
            // The following handles the signature check while sharing a link externally and opening a link.
            UriTrustingCheckFingerprint.method.apply {
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

            SignatureCheckExtensionFingerprint.changeFirstString(
                AppIdentityToStringFingerprint.instructionMatches.last().fieldReference.name,
            )
        
            }
        }
    }
