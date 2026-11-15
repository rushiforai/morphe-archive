/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.links.misc

import app.rex.patches.instagram.links.interceptUriPatch
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val SUGGESTED_PROFILES = "$PATCHES_DESCRIPTOR/SuggestedProfiles;"

private fun Fingerprint.filterSuggestionFlags() {
    method.apply {
        instructionMatches.filter { it.instruction.opcode == Opcode.MOVE_RESULT }.asReversed().forEach {
            val register = getInstruction<OneRegisterInstruction>(it.index).registerA
            addInstructions(
                it.index + 1,
                """
                invoke-static/range {v$register .. v$register}, $SUGGESTED_PROFILES->showSuggestedUsers(Z)Z
                move-result v$register
                """,
            )
        }
    }
}

private fun MutableMethod.filterSuggestedSection(index: Int, register: Int) {
    addInstructions(index, """
        invoke-static/range {v$register .. v$register}, $SUGGESTED_PROFILES->filterSuggestedSection(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$register
    """.trimIndent())
}

@Suppress("unused")
val disableDiscoverPeoplePatch =
    patch(
        name = "Disable discover people",
        description = "Hides suggested accounts",
    ) {
        dependsOn(settingsPatch, interceptUriPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            runCatching { enableSettings("disableDiscoverPeople") }
            runCatching {
            hideActivityFeedSuggestions()
            hideReelsSuggestions()

            MutualFollowersResponseFingerprint.let {
                val keyIndex = it.instructionMatches[1].index
                val register = it.instructionMatches[1].getInstruction<OneRegisterInstruction>().registerA
                it.method.filterSuggestedSection(keyIndex + 1, register)
            }

            FollowListSuggestionsFingerprint.filterSuggestionFlags()
            FollowRequestSuggestionsFingerprint.filterSuggestionFlags()

            FriendingCenterResponseParserFingerprint.let {
                val index = it.instructionMatches.first().index
                val register = it.instructionMatches.first().instruction.registersUsed.first()
                it.method.filterSuggestedSection(index, register)
            }

                        }
        }
    }
