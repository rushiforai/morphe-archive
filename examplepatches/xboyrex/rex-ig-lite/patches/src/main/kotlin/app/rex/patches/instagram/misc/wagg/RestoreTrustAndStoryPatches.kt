/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.rex.patches.instagram.misc.wagg

import app.morphe.patcher.patch.mutableClassDefBy

import app.morphe.patcher.patch.document

import app.morphe.patcher.patch.patch

import app.rex.patches.instagram.misc.extension.sharedExtensionPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val PACKAGE_INFO = "Landroid/content/pm/PackageInfo;"
private const val SIGNATURE_HELPER = "Lapp/morphe/extension/instagram/patches/signature/InstagramSignature;"
private const val STORY_LIKE_ACTIVITY = "app.morphe.extension.instagram.patches.story.StoryLikeHistoryActivity"
private const val STORY_LIKE_EXT = "Lapp/morphe/extension/instagram/patches/story/StoryLikeHistoryActivity;"
private const val STORY_LIKE_RECORDER = "Lapp/morphe/extension/instagram/patches/story/StoryLikeHistoryRecorder;"
private const val STORY_MENTION_EXT = "Lapp/morphe/extension/instagram/patches/story/StoryMentionIcon;"
private const val STORY_MENTION_SETTINGS = "Lapp/morphe/extension/instagram/patches/story/StoryMentionSettings;"
private const val REEL_ITEM_CLASS = "Lcom/instagram/model/reels/ReelItem;"
private const val MEDIA_DICT_CLASS = "Lcom/instagram/feed/media/LiveTreeMediaDict;"
private const val USER_DICT_CLASS = "Lcom/instagram/user/model/LiveTreeUserDict;"

internal object PackageSignersFingerprint : Fingerprint(
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/pm/SigningInfo;",
            name = "getApkContentsSigners",
        ),
        methodCall(
            definingClass = "Landroid/content/pm/SigningInfo;",
            name = "getSigningCertificateHistory",
        ),
        fieldAccess(
            definingClass = "Landroid/content/pm/PackageInfo;",
            name = "signatures",
        ),
    ),
)

@Suppress("unused")
val restoreTrustPatch = patch(
    name = "Restore trust on re-signed builds",
    description = "Lets Instagram's own checks of who signed the app pass on a patched build, so login and local trust checks keep working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)
    dependsOn(sharedExtensionPatch)

    execute {
            runCatching {
        runCatching {
            val method = PackageSignersFingerprint.method
            val owner = mutableClassDefBy(method.definingClass)
            val packageInfoFields = owner.fields.filter { it.type.toString() == PACKAGE_INFO }
            if (packageInfoFields.size != 1) return@runCatching
            val packageInfo = packageInfoFields.single().name
            val signers = method.returnType.toString()
            val constructor = mutableClassDefBy(signers).methods.singleOrNull {
                it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;", "Z", "Z")
            } ?: return@runCatching

            method.addInstructionsWithLabels(
                0,
                """
                move-object/from16 v0, p0
                iget-object v0, v0, ${method.definingClass}->$packageInfo:$PACKAGE_INFO
                invoke-static { v0 }, $SIGNATURE_HELPER->originalSigners(Landroid/content/pm/PackageInfo;)Ljava/util/List;
                move-result-object v1
                if-eqz v1, :restore_trust_original
                new-instance v0, $signers
                const/4 v2, 0x0
                invoke-direct { v0, v1, v2, v2 }, $signers-><init>(Ljava/util/List;ZZ)V
                return-object v0
                """.trimIndent(),
                ExternalLabel("restore_trust_original", method.getInstruction(0)),
            )
        }
    
            }
        }
}

internal val storyLikeHistoryManifestPatch = patch(
    description = "Adds the story like history activity to the Android manifest.",
) {
    finalize {
            runCatching {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? Element ?: continue
                if (activity.getAttribute("android:name") == STORY_LIKE_ACTIVITY) return@use
            }
            val application = document.getElementsByTagName("application").item(0) as Element
            application.appendChild(
                document.createElement("activity").apply {
                    setAttribute("android:name", STORY_LIKE_ACTIVITY)
                    setAttribute("android:exported", "false")
                    setAttribute("android:theme", "@android:style/Theme.Black.NoTitleBar")
                },
            )
        }
    
            }
        }
}

internal val storyMenuBuilders = listOf(
    Fingerprint(definingClass = "LX/0YmS;", name = "A0r"),
    Fingerprint(definingClass = "LX/0YmS;", name = "A0s"),
    Fingerprint(definingClass = "LX/0YmS;", name = "A0t"),
)

internal object StoryOptionsClickFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("explore_viewer", "friendships/mute_friend_reel/%s/", "[INTERNAL] Pause Playback"),
    custom = { method, _ -> method.parameterTypes.lastOrNull() == "Ljava/lang/CharSequence;" },
)

internal object StoryLikeToggleFingerprint : Fingerprint(
    definingClass = "LX/0ATY;",
    name = "FhI",
    returnType = "V",
    parameters = listOf("LX/04gU;", "Lcom/instagram/model/reels/ReelItem;", "LX/02z4;"),
)

internal object StoryLikeToggleNoOpFingerprint : Fingerprint(
    definingClass = "LX/0H13;",
    name = "FhI",
    returnType = "V",
    parameters = listOf("LX/04gU;", "Lcom/instagram/model/reels/ReelItem;", "LX/02z4;"),
)

internal object StoryLikeExecutorFingerprint : Fingerprint(
    definingClass = "LX/0AkV;",
    name = "FhG",
    returnType = "V",
    parameters = listOf("LX/04gU;", "LX/03sm;", "Lcom/instagram/model/reels/ReelItem;", "LX/02z4;"),
)

internal object StoryHeartToggleFingerprint : Fingerprint(
    definingClass = "LX/09TS;",
    name = "A0W",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val storyLikeHistoryPatch = patch(
    name = "Story like history",
    description = "Keeps a local history of the stories you liked in the last 24 hours and shows it in a native grid, opened from the story menu or xboyrex settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)
    dependsOn(sharedExtensionPatch, storyLikeHistoryManifestPatch)

    execute {
            runCatching {
        storyMenuBuilders.forEach { fingerprint ->
            runCatching {
                fingerprint.method.apply {
                    val returnIndex = implementation!!.instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
                    if (returnIndex >= 0) {
                        val arrayRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA
                        addInstructions(
                            returnIndex,
                            """
                            invoke-static {v$arrayRegister}, $STORY_LIKE_EXT->addButtons([Ljava/lang/CharSequence;)[Ljava/lang/CharSequence;
                            move-result-object v$arrayRegister
                            """.trimIndent(),
                        )
                    }
                }
            }
        }

        runCatching {
            StoryOptionsClickFingerprint.method.apply {
                val classDef = StoryOptionsClickFingerprint.classDef
                val activityField = classDef.fields.firstOrNull { it.type == "Landroid/app/Activity;" } ?: return@runCatching
                val textIndex = parameters.indexOfLast { it.type == "Ljava/lang/CharSequence;" }
                val helperIndex = parameters.indexOfLast { it.type == classDef.type }
                if (textIndex < 0 || helperIndex < 0) return@runCatching

                addInstructionsWithLabels(
                    0,
                    """
                    move-object/from16 v0, p$textIndex
                    move-object/from16 v1, p$helperIndex
                    iget-object v2, v1, $activityField
                    invoke-static {v0, v2}, $STORY_LIKE_EXT->buttonAction(Ljava/lang/CharSequence;Landroid/content/Context;)Z
                    move-result v0
                    if-eqz v0, :rex_story_like_history_original
                    return-void
                    """.trimIndent(),
                    ExternalLabel("rex_story_like_history_original", getInstruction(0)),
                )
            }
        }

        runCatching {
            StoryLikeToggleFingerprint.method.addInstructions(
                0,
                "invoke-static {p1, p2}, $STORY_LIKE_RECORDER->onLikeStateChanged(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        }
        runCatching {
            StoryLikeToggleNoOpFingerprint.method.addInstructions(
                0,
                "invoke-static {p1, p2}, $STORY_LIKE_RECORDER->onLikeStateChanged(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        }
        runCatching {
            StoryLikeExecutorFingerprint.method.addInstructions(
                0,
                """
                move-object/from16 v0, p1
                move-object/from16 v1, p3
                invoke-static {v0, v1}, $STORY_LIKE_RECORDER->onLikeStateChanged(Ljava/lang/Object;Ljava/lang/Object;)V
                """.trimIndent(),
            )
        }
        runCatching {
            StoryHeartToggleFingerprint.method.addInstructions(
                0,
                """
                move-object/from16 v0, p0
                invoke-static {v0}, $STORY_LIKE_RECORDER->onStoryToggle(Ljava/lang/Object;)V
                """.trimIndent(),
            )
        }
    
            }
        }
}

internal object CurrentActiveStoryItemFingerprint : Fingerprint(
    definingClass = "Linstagram/features/stories/fragment/ReelViewerFragment;",
    returnType = "V",
    strings = listOf("ReelViewerFragment.onCurrentActiveItemBound"),
    custom = { method, _ ->
        method.parameterTypes.size == 2 && method.parameterTypes[0] == REEL_ITEM_CLASS
    },
)

internal object ReelMentionsGetterFingerprint : Fingerprint(
    definingClass = MEDIA_DICT_CLASS,
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    strings = listOf("reel_mentions"),
)

internal object UsernameGetterFingerprint : Fingerprint(
    definingClass = USER_DICT_CLASS,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    custom = { method, _ -> method.readsLiveTreeStringWithoutLiteralKey() },
)

internal object StoryMenuItemsFingerprint : Fingerprint(
    returnType = "[Ljava/lang/CharSequence;",
    strings = listOf("[INTERNAL] Pause Playback"),
    custom = { method, _ -> method.parameterTypes.size == 1 },
)

internal object StoryMenuClickFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("explore_viewer", "friendships/mute_friend_reel/%s/", "[INTERNAL] Pause Playback"),
)

internal object FullNameGetterFingerprint : Fingerprint(
    definingClass = USER_DICT_CLASS,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("full_name"),
)

internal object ProfilePicGetterFingerprint : Fingerprint(
    definingClass = USER_DICT_CLASS,
    returnType = "Lcom/instagram/common/typedurl/ImageUrl;",
    parameters = listOf(),
    strings = listOf("profile_pic_url"),
)

internal object VerifiedGetterFingerprint : Fingerprint(
    definingClass = USER_DICT_CLASS,
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(),
    strings = listOf("is_verified"),
)

private fun Method.readsLiveTreeStringWithoutLiteralKey(): Boolean {
    val instructions = implementation?.instructions ?: return false
    var reads = false
    for (instruction in instructions) {
        when {
            instruction.opcode == Opcode.CONST_STRING ||
                instruction.opcode == Opcode.CONST_STRING_JUMBO -> return false
            instruction is ReferenceInstruction &&
                (instruction.reference as? MethodReference)?.name == "getOptionalStringValueNative" ->
                reads = true
        }
    }
    return reads
}

@Suppress("unused")
val storyMentionIconPatch = patch(
    name = "Story mention indicator",
    description = "Shows an interactive '@N mentions' pill in the story header when the story mentions someone, with 5 customizable pill styles and 3 popup styles.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)
    dependsOn(sharedExtensionPatch)

    execute {
            runCatching {
        val mentionsMethod = runCatching { ReelMentionsGetterFingerprint.method.name }.getOrDefault("")
        val usernameMethod = runCatching { UsernameGetterFingerprint.method.name }.getOrDefault("")
        val fullNameMethod = runCatching { FullNameGetterFingerprint.method.name }.getOrDefault("")
        val picUrlMethod = runCatching { ProfilePicGetterFingerprint.method.name }.getOrDefault("")
        val verifiedMethod = runCatching { VerifiedGetterFingerprint.method.name }.getOrDefault("")
        val methodNames = listOf(mentionsMethod, usernameMethod, fullNameMethod, picUrlMethod, verifiedMethod)
            .joinToString("|")

        runCatching {
            CurrentActiveStoryItemFingerprint.method.apply {
                val locals = implementation!!.registerCount - parameterTypes.size - 1
                if (locals >= 4) {
                    addInstructions(
                        0,
                        """
                        move-object/from16 v0, p0
                        move-object/from16 v1, p1
                        move-object/from16 v2, p2
                        const-string v3, "$methodNames"
                        invoke-static {v0, v1, v2, v3}, $STORY_MENTION_EXT->update(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
                        """.trimIndent(),
                    )
                }
            }
        }

        runCatching {
            StoryMenuItemsFingerprint.method.apply {
                val index = implementation!!.instructions.indexOfFirst { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                if (index >= 0) {
                    val listRegister = getInstruction<OneRegisterInstruction>(index).registerA
                    addInstructions(
                        index + 1,
                        """
                        invoke-static {v$listRegister}, $STORY_MENTION_SETTINGS->addButtons(Ljava/util/ArrayList;)Ljava/util/ArrayList;
                        move-result-object v$listRegister
                        """.trimIndent(),
                    )
                }
            }
        }

        runCatching {
            StoryMenuClickFingerprint.method.apply {
                val classDef = StoryMenuClickFingerprint.classDef
                val activityField = classDef.fields.firstOrNull { it.type == "Landroid/app/Activity;" } ?: return@runCatching
                val textIndex = parameters.indexOfLast { it.type == "Ljava/lang/CharSequence;" }
                val helperIndex = parameters.indexOfLast { it.type == classDef.type }
                if (textIndex < 0 || helperIndex < 0) return@runCatching

                addInstructionsWithLabels(
                    0,
                    """
                    move-object/from16 v0, p$textIndex
                    move-object/from16 v1, p$helperIndex
                    iget-object v2, v1, $activityField
                    invoke-static {v0, v2}, $STORY_MENTION_SETTINGS->buttonAction(Ljava/lang/CharSequence;Landroid/content/Context;)Z
                    move-result v0
                    if-eqz v0, :rex_story_menu_original
                    return-void
                    """.trimIndent(),
                    ExternalLabel("rex_story_menu_original", getInstruction(0)),
                )
            }
        }
    
            }
        }
}
