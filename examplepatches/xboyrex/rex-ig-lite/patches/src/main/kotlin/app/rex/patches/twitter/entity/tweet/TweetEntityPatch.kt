/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.entity.tweet

import app.rex.patches.twitter.entity.tweetInfo.TweetInfoObjectFingerprint
import app.rex.utils.changeFirstString
import app.rex.utils.changeStringAt
import app.rex.utils.extensionToClassName
import app.rex.utils.fieldExtractor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val tweetEntityPatch =
    bytecodePatch(
        description = "For tweet entity reflection",
    ) {
        execute {
            val (profileNameMethod, userNameMethod) =
                with(TweetNamesFingerprint) {
                    Pair(
                        instructionMatches[0].instruction.getReference<MethodReference>()!!,
                        instructionMatches[2].instruction.getReference<MethodReference>()!!,
                    )
                }

            TweetUsernameFingerprint.changeFirstString(userNameMethod.name)
            TweetProfileNameFingerprint.changeFirstString(profileNameMethod.name)

            val tweetObjectMethods = TweetObjectFingerprint.classDef.methods

            val getTextObjectFromTweetObjectMethodName =
                tweetObjectMethods
                    .first {
                        it.returnType ==
                            GetTextFromTextObjectFingerprint.classDef.type
                    }.name
            TweetShortTextFingerprint.changeFirstString(getTextObjectFromTweetObjectMethodName)

            val getTweetUserIdMethod =
                tweetObjectMethods
                    .first { it.returnType == "J" }
                    .name
            TweetUserIdFingerprint.changeFirstString(getTweetUserIdMethod)

            val getMediaObjectMethod =
                tweetObjectMethods.firstOrNull { methodDef ->
                    methodDef.implementation
                        ?.instructions
                        ?.map { it.opcode }
                        ?.toList() ==
                        listOf(
                            Opcode.IGET_OBJECT,
                            Opcode.IGET_OBJECT,
                            Opcode.IGET_OBJECT,
                            Opcode.IGET_OBJECT,
                            Opcode.RETURN_OBJECT,
                        )
                } ?: throw PatchException("getMediaObject not found")
            TweetExtMediaEntitiesListFingerprint.changeFirstString(getMediaObjectMethod.name)

            val extMediaListField =
                TweetMediaEntityClassFingerprint.classDef.fields
                    .first { it.type.contains("List") }
                    .name
            TweetExtMediaEntitiesListFingerprint.changeStringAt(1, extMediaListField)

            val getNoteTweetMethod =
                tweetObjectMethods
                    .firstOrNull { it.returnType.contains("notetweet") }
                    ?.name
                    ?: throw PatchException("getNoteTweetMethod not found")
            TweetLongTextFingerprint.changeFirstString(getNoteTweetMethod)

            val longTextField =
                LongTweetObjectFingerprint.classDef.fields
                    .first { it.type == "Ljava/lang/String;" }
                    .name
            TweetLongTextFingerprint.changeStringAt(1, longTextField)

            TweetInfoObjectFingerprint.apply {
                val langStrIndex = stringMatches[1].index
                method.apply {
                    val className = extensionToClassName(getInstruction(langStrIndex + 1).fieldExtractor().definingClass)
                    val infoField =
                        TweetObjectFingerprint.classDef.fields
                            .first {
                                it.type == className
                            }.name

                    TweetInfoFingerprint.changeFirstString(infoField)
                }
            }
        }
    }
