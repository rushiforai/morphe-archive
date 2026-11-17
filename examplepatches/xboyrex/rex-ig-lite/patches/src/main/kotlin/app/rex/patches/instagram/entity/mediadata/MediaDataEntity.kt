/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.mediadata

import app.rex.patches.instagram.entity.decoder.MEDIAEXT_CLASS_NAME
import app.rex.patches.instagram.entity.decoder.MEDIA_CLASS_NAME
import app.rex.patches.instagram.entity.decoder.decoderEntity
import app.rex.patches.instagram.entity.originalSoundDataIntf.originalSoundDataIntfEntity
import app.rex.patches.instagram.entity.trackDataIntf.trackDataIntfEntity
import app.rex.patches.instagram.entity.userdata.userDataEntity
import app.rex.patches.instagram.entity.videoData.videoDataEntity
import app.rex.utils.changeFirstString
import app.rex.utils.changeString
import app.rex.utils.changeStringAt
import app.rex.utils.classNameToExtension
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private fun resolveMediaVideoPredicate453(
    validator: ClassDef,
    media: ClassDef,
): String? {
    val candidates = validator.methods.flatMap { method ->
        val instructions = method.implementation?.instructions?.toList().orEmpty()
        val offsets = instructions.runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        instructions.indices.mapNotNull { index ->
            val call = instructions[index]
            if (call.opcode != Opcode.INVOKE_VIRTUAL && call.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return@mapNotNull null
            val reference = call.getReference<MethodReference>() ?: return@mapNotNull null
            if (reference.definingClass != MEDIA_CLASS_NAME || reference.parameterTypes.isNotEmpty() || reference.returnType != "Z") {
                return@mapNotNull null
            }
            val result = instructions.getOrNull(index + 1) ?: return@mapNotNull null
            val branch = instructions.getOrNull(index + 2) ?: return@mapNotNull null
            if (result.opcode != Opcode.MOVE_RESULT || branch.opcode != Opcode.IF_EQZ) return@mapNotNull null
            if ((result as OneRegisterInstruction).registerA != (branch as OneRegisterInstruction).registerA) return@mapNotNull null
            val targetOffset = offsets[index + 2] + (branch as OffsetInstruction).codeOffset
            val targetIndex = offsets.indexOf(targetOffset)
            if (targetIndex <= index + 3 || targetIndex >= instructions.size) return@mapNotNull null
            val fallthrough = instructions.subList(index + 3, targetIndex)
            val producerIndex = fallthrough.indexOfFirst { instruction ->
                instruction.opcode.setsResult() &&
                    instruction.getReference<MethodReference>()?.returnType == "Lcom/instagram/model/mediasize/VideoUrlImpl;"
            }
            if (producerIndex < 0) return@mapNotNull null
            if (fallthrough.getOrNull(producerIndex + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) return@mapNotNull null
            if (fallthrough.take(producerIndex + 1).any { it is OffsetInstruction || !it.opcode.canContinue() }) return@mapNotNull null
            reference.name
        }
    }.distinct()
    val name = candidates.singleOrNull() ?: return null
    val exists = media.methods.any {
        it.name == name && it.parameterTypes.isEmpty() && it.returnType == "Z" &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    return if (exists) name else null
}

private fun findMediaLazyGetterName(mediaClass: ClassDef, key: String, returnType: String): String? =
    mediaClass.methods.firstOrNull { method ->
        method.parameterTypes.isEmpty() &&
            method.returnType == returnType &&
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.implementation?.instructions?.any { it.getReference<StringReference>()?.string == key } == true
    }?.name

val mediaDataEntity =
    patch(
        description = "This patch is used for decoding obfuscated code of the media data",
    ) {
        dependsOn(decoderEntity, userDataEntity, videoDataEntity, originalSoundDataIntfEntity, trackDataIntfEntity)
        execute {
            runCatching {
                GetHelperClassExtensionFingerprint.changeFirstString(classNameToExtension(MEDIAEXT_CLASS_NAME))
            }

            runCatching {
                GetOriginalSoundDataIntfExtensionFingerprint.changeFirstString(
                    GetOriginalSoundDataIntfFromMediaFingerprint.originalMethod.name,
                )
            }

            runCatching {
                GetUserDataWithUserSessionExtensionFingerprint.changeFirstString(
                    GetUserDataFromMediaFingerprint.originalMethod.name,
                )
            }

            // BUG-DL-001 & BUG-DL-002 fix:
            // getImageVariants() only contains a single string literal ("methodName" at index 0) because
            // resolveImageInfoObject() was extracted into its own helper method. Patch index 0 directly.
            runCatching {
                val candidatesMethodName =
                    ImageInfoCandidatesMapperFingerprint.matchOrNull()?.instructionMatches?.firstOrNull()?.methodReference?.name
                        ?: classDefByOrNull(MEDIA_CLASS_NAME)?.methods
                            ?.flatMap { it.implementation?.instructions?.toList().orEmpty() }
                            ?.mapNotNull { it.getReference<MethodReference>() }
                            ?.firstOrNull {
                                it.definingClass == "Lcom/instagram/model/mediasize/ImageInfo;" &&
                                    it.parameterTypes.isEmpty() &&
                                    it.returnType == "Ljava/util/List;"
                            }?.name
                        ?: classDefByOrNull("Lcom/instagram/model/mediasize/ImageInfo;")?.methods
                            ?.firstOrNull {
                                it.parameterTypes.isEmpty() &&
                                    it.returnType == "Ljava/util/List;"
                            }?.name
                if (candidatesMethodName != null) {
                    GetImageVariantsExtensionFingerprint.changeFirstString(candidatesMethodName)
                }
            }

            runCatching {
                val mediaClass = classDefByOrNull(MEDIA_CLASS_NAME)
                val imageInfoGetter = mediaClass?.let {
                    findMediaLazyGetterName(it, "image_versions2", "Lcom/instagram/model/mediasize/ImageInfo;")
                }
                if (imageInfoGetter != null) {
                    GetImageInfoByMethodExtensionFingerprint.changeFirstString(imageInfoGetter)
                }
            }

            // Patch resolveImageInfoObject()'s fallback field name ("fieldName") instead of overwriting
            // getImageVariants()'s candidate method or getAdditionalImageCandidates()'s ImageInfo class descriptor!
            runCatching {
                ExtMediaDictImageInfoMapperFingerprint.matchOrNull()?.instructionMatches?.getOrNull(1)?.fieldReference?.let {
                    ResolveImageInfoObjectExtensionFingerprint.changeFirstString(it.name)
                }
            }

            runCatching {
                GetAdditionalImageCandidatesExtensionFingerprint.changeString(
                    "additionalMethod",
                    ImageInfoAdditionalCandidatesMapperFingerprint.instructionMatches[0].methodReference.name,
                )
                GetAdditionalImageCandidatesExtensionFingerprint.changeString(
                    "firstFrameMethod",
                    AdditionalImageCandidatesMapperFingerprint.instructionMatches[0].methodReference.name,
                )
                GetAdditionalImageCandidatesExtensionFingerprint.changeString(
                    "igtvFrameMethod",
                    AdditionalImageCandidatesMapperFingerprint.instructionMatches[2].methodReference.name,
                )
                GetAdditionalImageCandidatesExtensionFingerprint.changeString(
                    "smartFrameMethod",
                    AdditionalImageCandidatesMapperFingerprint.instructionMatches[4].methodReference.name,
                )
            }

            runCatching {
                GetMentionSetExtensionFingerprint.changeFirstString(ReelsMentionGetterFingerprint.originalMethod.name)
                GetMentionSetExtensionFingerprint.changeStringAt(
                    1,
                    InstagramMainActivityNotificationRelatedFingerprint.instructionMatches[1].methodReference.name,
                )
            }

            runCatching {
                val vMatch = VideoVersionsGetterFingerprint.matchOrNull()
                if (vMatch != null) {
                    GetVideoVariantsV1ExtensionFingerprint.changeFirstString(vMatch.originalMethod.name)
                    GetMoreExtendedDataExtensionFingerprint.changeFirstString(vMatch.instructionMatches[1].fieldReference.name)
                    GetVideoVariantsV2ExtensionFingerprint.changeFirstString(vMatch.instructionMatches[2].fieldReference.name)
                } else {
                    val mediaClass = classDefByOrNull(MEDIA_CLASS_NAME)
                    val videoVersionsGetter = mediaClass?.let {
                        findMediaLazyGetterName(it, "video_versions", "Ljava/util/List;")
                    }
                    if (videoVersionsGetter != null) {
                        GetVideoVariantsV1ExtensionFingerprint.changeFirstString(videoVersionsGetter)
                    }
                }
            }

            runCatching {
                val dashGetter = VideoDashManifestGetterFingerprint.matchOrNull()?.originalMethod?.name
                    ?: classDefByOrNull(MEDIA_CLASS_NAME)?.let { findMediaLazyGetterName(it, "video_dash_manifest", "Ljava/lang/String;") }
                if (dashGetter != null) {
                    GetVideoDashManifestExtensionFingerprint.changeFirstString(dashGetter)
                }
                val hasAudioGetter = HasAudioGetterFingerprint.matchOrNull()?.originalMethod?.name
                    ?: classDefByOrNull(MEDIA_CLASS_NAME)?.let { findMediaLazyGetterName(it, "has_audio", "Ljava/lang/Boolean;") }
                if (hasAudioGetter != null) {
                    HasAudioTrackExtensionFingerprint.changeFirstString(hasAudioGetter)
                }
            }

            runCatching {
                val isVideoName =
                    MediaIsVideoFingerprint.matchOrNull()?.instructionMatches?.firstOrNull()?.methodReference?.name
                        ?: run {
                            val validator = classDefByOrNull("Lcom/instagram/creation/riff/mediautil/RiffRemoteMediaHelper;")
                            val media = classDefByOrNull(MEDIA_CLASS_NAME)
                            if (validator != null && media != null) resolveMediaVideoPredicate453(validator, media) else null
                        }
                if (isVideoName != null) {
                    IsVideoExtensionFingerprint.changeFirstString(isVideoName)
                }
            }

            // BUG-CAROUSEL-001 fix:
            // Prioritize the exact "carousel_media" lazy getter on Media before EditMediaInfoFragmentMediaSizeFingerprint,
            // which lacks a string filter and can match an unrelated List-returning method on Media.
            runCatching {
                val mediaClass = classDefByOrNull(MEDIA_CLASS_NAME)
                val mediaListName =
                    CarouselMediaGetterFingerprint.matchOrNull()?.originalMethod?.name
                        ?: mediaClass?.let { findMediaLazyGetterName(it, "carousel_media", "Ljava/util/List;") }
                        ?: EditMediaInfoFragmentMediaSizeFingerprint.matchOrNull()?.instructionMatches?.firstOrNull()?.methodReference?.name
                if (mediaListName != null) {
                    GetMediaListExtensionFingerprint.changeFirstString(mediaListName)
                }
            }

            runCatching {
                GetMediaPkIdExtensionFingerprint.changeFirstString(
                    FanClubContentPreviewInteractorImplFingerprint.instructionMatches.last().methodReference.name,
                )
            }

            runCatching {
                GetTakenAtSecondsExtensionFingerprint.changeFirstString(TakenAtGetterFingerprint.originalMethod.name)
            }

            runCatching {
                GetUserDataWithoutUserSessionExtensionFingerprint.changeFirstString(MediaGetUserFingerprint.originalMethod.name)
            }

            runCatching {
                CommentToStringFingerprint.let {
                    GetDescriptionTextExtensionFingerprint.changeStringAt(1, it.instructionMatches.first().fieldReference.name)
                    GetDescriptionTextExtensionFingerprint.changeFirstString(
                        mediaCommentGetterFingerprint(
                            it.originalClassDef.type,
                            MediaCaptionGetterFingerprint.originalMethod,
                        ).originalMethod.name,
                    )
                }
            }

            runCatching {
                listOf("clips", "music").forEach { kind ->
                    val key = "${kind}_metadata"
                    val metadataGetter = mediaMetadataGetterFingerprint(key).originalMethod
                    GetTrackDataIntfExtensionFingerprint.changeString("${kind}Metadata", metadataGetter.name)
                    GetTrackDataIntfExtensionFingerprint.changeString(
                        if (kind == "clips") "clipsMusicInfo" else "musicInfo",
                        musicInfoGetterFingerprint(metadataGetter.returnType).originalMethod.name,
                    )
                }
            }

            runCatching {
                AudioIntfMapperFingerprint.instructionMatches.last().methodReference.let {
                    GetMessageAudioUrlExtensionFingerprint.changeStringAt(1, it.name)
                    GetMessageAudioUrlExtensionFingerprint.changeFirstString(
                        messageAudioGetterFingerprint(it.definingClass).originalMethod.name,
                    )
                }
            }

            runCatching {
                GetPostTypeKeyExtensionFingerprint.changeFirstString(
                    ProductInfoMapperFingerprint.instructionMatches.last().fieldReference.name,
                )
            }
        }
    }
