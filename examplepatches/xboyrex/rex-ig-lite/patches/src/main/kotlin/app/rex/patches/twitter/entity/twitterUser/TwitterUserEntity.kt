/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.entity.twitterUser

import app.rex.utils.changeFirstString
import app.rex.utils.fieldExtractor
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode

val twitterUserEntity =
    bytecodePatch(
        description = "For Twitter user entity reflection",
    ) {
        execute {

//            val intList = listOf(STRING_LIST[1], STRING_LIST[2], STRING_LIST[3], STRING_LIST[4])
//            val intFingerprints =
//                listOf(
//                    GetFastFollowersCountExtension,
//                    GetStatusCountExtension,
//                    GetMediaCountExtension,
//                    GetLikesCountExtension,
//                )

//            val longList = listOf(STRING_LIST[6], STRING_LIST[7])
//            val longFingerprints =
//                listOf(
//                    ,
//                    ,
//                )

            val fingerprintList =
                listOf(
                    GetFastFollowersCountExtension,
                    GetStatusCountExtension,
                    GetMediaCountExtension,
                    GetLikesCountExtension,
                    GetArticleCountExtension,
                    GetLastUpdatedAtExtension,
                )

            TwitterUserToStringFingerprint.apply {
                val stringMatches = stringMatches
                method.apply {
                    STRING_LIST.forEach { str ->
                        val strListIndex = STRING_LIST.indexOf(str)
                        val strIndex = stringMatches.first { it.string == str }.index
                        val valueInstruction = getInstruction(strIndex + 2)
                        val fieldName = valueInstruction.fieldExtractor().name
                        fingerprintList[strListIndex].changeFirstString(fieldName)
                    }
                }
            }
        }
    }
