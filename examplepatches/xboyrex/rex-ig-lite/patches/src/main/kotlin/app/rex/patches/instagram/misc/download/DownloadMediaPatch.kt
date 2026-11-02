/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.download

import app.rex.patches.instagram.entity.decoder.decoderEntity
import app.rex.patches.instagram.entity.dialogbox.instagramDialogBoxEntity
import app.rex.patches.instagram.entity.mediadata.mediaDataEntity
import app.rex.patches.instagram.entity.originalSoundDataIntf.originalSoundDataIntfEntity
import app.rex.patches.instagram.entity.trackDataIntf.trackDataIntfEntity
import app.rex.patches.instagram.entity.videoData.videoDataEntity
import app.rex.patches.instagram.misc.directMessage.saveAllMessages.saveAllMessagesPatch
import app.rex.patches.instagram.misc.hookFlags.hookFlagsPatch
import app.rex.patches.instagram.misc.overflowMenuButton.posts.addOverflowMenuButtonAttributes
import app.rex.patches.instagram.misc.overflowMenuButton.posts.debugOverflowButton.debugOverflowMenuButtonPatch
import app.rex.patches.instagram.misc.overflowMenuButton.posts.hookOverflowMenuButton
import app.rex.patches.instagram.misc.overflowMenuButton.reels.hookReelOverflowMenuButton
import app.rex.patches.instagram.misc.reels.disableReelsScrollingPatch
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.misc.stories.handleStoryButtonPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.DOWNLOAD_DESCRIPTOR
import app.rex.patches.instagram.utils.addFlags
import app.rex.patches.instagram.utils.enableSettings
import app.rex.patches.shared.parameterRegisterStart
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val downloadMediaPatch =
    bytecodePatch(
        name = "Download media",
        description = "Adds ability to download posts, reels, stories and highlights",
    ) {
        dependsOn(
            settingsPatch,
            instagramDialogBoxEntity,
            mediaDataEntity,
            videoDataEntity,
            originalSoundDataIntfEntity,
            trackDataIntfEntity,
            decoderEntity,
            handleStoryButtonPatch,
            hookFlagsPatch,
            saveAllMessagesPatch,
            hookOverflowMenuButton,
            debugOverflowMenuButtonPatch,
            hookReelOverflowMenuButton,
            // Unnamed, so it is not selectable: adds the download button to feed posts.
            feedDownloadButtonPatch,
            disableReelsScrollingPatch,
        )
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {

            addOverflowMenuButtonAttributes("REX_DOWNLOAD", "downloadOverflowButton")

            // DM media downloader.
            GetDirectThreadMediaSaverModuleNameFingerprint.apply {
                matchAll(1..1)
                val appActivityField = classDef.fields.singleOrNull {
                    it.type == "Landroid/app/Activity;" && !AccessFlags.STATIC.isSet(it.accessFlags)
                } ?: throw PatchException("Expected one DM saver activity field")
                val saveMethod = classDef.methods.singleOrNull { candidate ->
                    candidate.returnType == "V" && AccessFlags.STATIC.isSet(candidate.accessFlags) &&
                        candidate.parameterTypes.size == 5 && candidate.parameterTypes[1] == classDef.type &&
                        candidate.parameterTypes.last() == "Z" && candidate.instructions.any {
                            it.getReference<StringReference>()?.string == "android.permission.WRITE_EXTERNAL_STORAGE"
                        }
                } ?: throw PatchException("Expected one DM media save entry point")
                saveMethod.apply {
                    if (parameterRegisterStart(this) < 2) {
                        throw PatchException("DM media saver needs two local registers")
                    }
                    addInstructionsWithLabels(
                        0,
                        """
                        move-object/from16 v0, p1
                        iget-object v0, v0, $appActivityField
                        move-object/from16 v1, p2
                        invoke-static {v0, v1}, $DOWNLOAD_DESCRIPTOR/MessageUtils;->messageDownloadCheck(Landroid/content/Context;Ljava/lang/Object;)Z
                        move-result v1
                        if-nez v1, :rex
                        return-void
                        """.trimIndent(),
                        ExternalLabel("rex", getInstruction(0)),
                    )
                }
            }

            enableSettings("downloadMedia")
            addFlags("simpleOverflowMenuFlags")
        }
    }
