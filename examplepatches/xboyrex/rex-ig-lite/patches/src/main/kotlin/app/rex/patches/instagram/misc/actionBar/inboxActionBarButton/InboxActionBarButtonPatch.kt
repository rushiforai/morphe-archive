/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.actionBar.inboxActionBarButton

import app.rex.patches.instagram.utils.Constants.ACTIONBAR_DESCRIPTOR
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

object InboxActionBarBuilderFingerprint : Fingerprint(
    strings = listOf("PrebindActionBar"),
    filters = listOf(checkCast("Lcom/instagram/igds/components/actionbar/IgdsActionBar;")),
)

val inboxActionBarButtonPatch =
    patch(
        description = "This patch is adds support for adding buttons on Inbox action bar.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        
        execute {
            runCatching {

            InboxActionBarBuilderFingerprint.let {
                val castIndex = it.instructionMatches.first().index
                val viewGroupRegister = it.instructionMatches.first().getInstruction<OneRegisterInstruction>().registerA
                it.method.addInstructions(
                    castIndex + 1,
                    """
                    invoke-static {v$viewGroupRegister}, $ACTIONBAR_DESCRIPTOR->inboxActionBarButton(Landroid/view/ViewGroup;)V
                    """.trimIndent(),
                )
            }
        
            }
        }
    }
