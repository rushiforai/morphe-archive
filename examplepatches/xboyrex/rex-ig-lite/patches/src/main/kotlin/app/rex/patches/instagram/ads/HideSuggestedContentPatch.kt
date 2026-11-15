/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.ads

import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.addFlags
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal object FeedItemParseFromJsonFingerprint : Fingerprint(
    name = "unsafeParseFromJson",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    strings =
        listOf(
            "clips_netego",
            "stories_netego",
            "bloks_netego",
            "suggested_igd_channels",
            "suggested_top_accounts",
            "suggested_users",
        ),
    filters = listOf(
        methodCall(returnType = "Ljava/lang/String;"),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        methodCall(smali = "Ljava/lang/String;->hashCode()I", location = MatchAfterImmediately()),
    ),
)

@Suppress("unused")
val hideSuggestedContentPatch =
    patch(
        name = "Hide suggested content",
        description = "Hides suggested stories, reels, threads (Suggested posts will still be shown).",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(settingsPatch)
        execute {
            runCatching { enableSettings("hideSuggestedContent") }
            runCatching { addFlags("suggestedContentFlags") }
            runCatching {

            FeedItemParseFromJsonFingerprint.let {
                val keyIndex = it.instructionMatches[1].index
                val keyRegister = it.instructionMatches[1].getInstruction<OneRegisterInstruction>().registerA
                it.method.addInstructions(keyIndex + 1, Constants.JSONPARSER_CHECK_DESCRIPTOR.format(keyRegister, keyRegister))
            }

                                    }
        }
    }
