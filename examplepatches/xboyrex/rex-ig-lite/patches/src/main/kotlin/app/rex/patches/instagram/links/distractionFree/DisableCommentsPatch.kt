/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.links.distractionFree

import app.rex.patches.instagram.links.interceptUriPatch
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PREF_CALL_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.rex.patches.instagram.utils.hideFeedUfiStates
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val HIDE_COMMENT_BUTTONS = "$PREF_CALL_DESCRIPTOR->hideCommentButtons()Z"

private object ReelsCommentStateFingerprint : Fingerprint(
    returnType = "L",
    filters = listOf(
        string("android_purge_26_q3_UfiUseCase_getCommentButtonAndCount"),
        string("ReelsCommentButton"),
        methodCall(location = MatchAfterImmediately()),
        // Hidden comment state, a static instance of its own class.
        fieldAccess(opcode = Opcode.SGET_OBJECT, location = MatchAfterImmediately()),
        // Button, button-with-count and hidden paths all join here.
        opcode(Opcode.CONST_4, location = MatchAfterImmediately()),
    ),
)

@Suppress("unused")
val disableCommentsPatch =
    patch(
        name = "Disable comments",
        description = "Disables comments and hides comment buttons on posts, reels and stories",
    ) {
        dependsOn(settingsPatch, interceptUriPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            runCatching {
            hideFeedUfiStates(
                HIDE_COMMENT_BUTTONS,
                ", isCommentsEnabled=",
                ", shouldShowCommentCountInUfi=",
            )

            val reelsMatch = ReelsCommentStateFingerprint.match()
            val reelsMethod = reelsMatch.method
            val hiddenField = reelsMatch.instructionMatches[3].fieldReference
            val stateRegister = reelsMatch.instructionMatches[3].getInstruction<OneRegisterInstruction>().registerA
            val mergeIndex = reelsMatch.instructionMatches[4].index
            val scratch = reelsMatch.instructionMatches[4].getInstruction<OneRegisterInstruction>().registerA
            // Button, button-with-count and hidden paths all join here. Retarget their
            // branches to the hook, then let Instagram initialize the scratch register.
            reelsMethod.addInstructionsAtControlFlowLabel(
                mergeIndex,
                """
                $HIDE_COMMENT_BUTTONS
                move-result v$scratch
                if-eqz v$scratch, :rex_comments_original
                sget-object v$stateRegister, $hiddenField
                :rex_comments_original
                nop
                """.trimIndent(),
            )

            hideStoryComments(HIDE_COMMENT_BUTTONS)
            enableSettings("disableComments")
        
            }
        }
    }
