/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.mediadata

import app.rex.patches.instagram.entity.decoder.MEDIAEXT_CLASS_NAME
import app.rex.patches.instagram.entity.decoder.decoderEntity
import app.rex.patches.instagram.entity.originalSoundDataIntf.originalSoundDataIntfEntity
import app.rex.patches.instagram.entity.trackDataIntf.trackDataIntfEntity
import app.rex.patches.instagram.entity.userdata.userDataEntity
import app.rex.patches.instagram.entity.videoData.videoDataEntity
import app.rex.utils.changeFirstString
import app.rex.utils.changeString
import app.rex.utils.changeStringAt
import app.rex.utils.classNameToExtension
import app.morphe.patcher.patch.patch

val mediaDataEntity =
    patch(
        description = "This patch is used for decoding obfuscated code of the media data",
    ) {
        dependsOn(decoderEntity, userDataEntity, videoDataEntity, originalSoundDataIntfEntity, trackDataIntfEntity)
        execute {
            runCatching {
                GetHelperClassExtensionFingerprint.changeFirstString(classNameToExtension(MEDIAEXT_CLASS_NAME))
            }

            // Extracting get original sound info data using media and user session.
            runCatching {
                GetOriginalSoundDataIntfExtensionFingerprint.changeFirstString(
                    GetOriginalSoundDataIntfFromMediaFingerprint.originalMethod.name,
                )
            }

            // Extracting get user data using media and user session.
            runCatching {
                GetUserDataWithUserSessionExtensionFingerprint.changeFirstString(
                    GetUserDataFromMediaFingerprint.originalMethod.name,
                )
            }

            // Extracting image variants list.
            runCatching {
                GetImageVariantsExtensionFingerprint.changeStringAt(
                    1,
                    ImageInfoCandidatesMapperFingerprint.instructionMatches.first().methodReference.name,
                )
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

            // Extracting the get mention set method used media helper class.
            runCatching {
                GetMentionSetExtensionFingerprint.changeFirstString(ReelsMentionGetterFingerprint.originalMethod.name)
                GetMentionSetExtensionFingerprint.changeStringAt(
                    1,
                    InstagramMainActivityNotificationRelatedFingerprint.instructionMatches[1].methodReference.name,
                )
            }

            runCatching {
                VideoVersionsGetterFingerprint.let {
                    GetVideoVariantsV1ExtensionFingerprint.changeFirstString(it.originalMethod.name)
                    GetMoreExtendedDataExtensionFingerprint.changeFirstString(it.instructionMatches[1].fieldReference.name)
                    GetVideoVariantsV2ExtensionFingerprint.changeFirstString(it.instructionMatches[2].fieldReference.name)
                }
            }

            // DASH manifest and audio flag, for downloads above the progressive 720p.
            runCatching {
                GetVideoDashManifestExtensionFingerprint.changeFirstString(VideoDashManifestGetterFingerprint.originalMethod.name)
                HasAudioTrackExtensionFingerprint.changeFirstString(HasAudioGetterFingerprint.originalMethod.name)
            }

            // Extracting method is video used in media class.
            runCatching {
                IsVideoExtensionFingerprint.changeFirstString(
                    MediaIsVideoFingerprint.instructionMatches.first().methodReference.name,
                )
            }

            // Extraction of the media list.
            runCatching {
                GetMediaListExtensionFingerprint.changeFirstString(
                    EditMediaInfoFragmentMediaSizeFingerprint.instructionMatches.first().methodReference.name,
                )
            }

            // Extraction of media pkid from media class.
            runCatching {
                GetMediaPkIdExtensionFingerprint.changeFirstString(
                    FanClubContentPreviewInteractorImplFingerprint.instructionMatches.last().methodReference.name,
                )
            }

            runCatching {
                GetTakenAtSecondsExtensionFingerprint.changeFirstString(TakenAtGetterFingerprint.originalMethod.name)
            }

            // Extraction of user data used in extended media class.
            runCatching {
                GetUserDataWithoutUserSessionExtensionFingerprint.changeFirstString(MediaGetUserFingerprint.originalMethod.name)
            }

            // Extraction of description.
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

            // Both metadata interfaces expose MusicInfo without requiring a user session.
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

            // Message audio (voice notes): media -> audio interface -> url.
            runCatching {
                AudioIntfMapperFingerprint.instructionMatches.last().methodReference.let {
                    GetMessageAudioUrlExtensionFingerprint.changeStringAt(1, it.name)
                    GetMessageAudioUrlExtensionFingerprint.changeFirstString(
                        messageAudioGetterFingerprint(it.definingClass).originalMethod.name,
                    )
                }
            }

            runCatching {
                ExtMediaDictImageInfoMapperFingerprint.instructionMatches[1].fieldReference.let {
                    GetImageVariantsExtensionFingerprint.changeFirstString(it.name)
                    GetAdditionalImageCandidatesExtensionFingerprint.changeFirstString(it.name)
                }
            }

            runCatching {
                GetPostTypeKeyExtensionFingerprint.changeFirstString(
                    ProductInfoMapperFingerprint.instructionMatches.last().fieldReference.name,
                )
            }
        }
    }
