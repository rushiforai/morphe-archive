/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.profileinfo

import app.rex.patches.instagram.entity.decoder.USER_MODEL_CLASS_NAME
import app.rex.patches.instagram.entity.decoder.decoderEntity
import app.rex.patches.instagram.utils.Constants.USER_DETAIL_VIEW_MODEL_CLASS
import app.rex.patches.instagram.utils.Constants.USER_SESSION_CLASS
import app.rex.utils.changeFirstString
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val profileInfoEntity =
    patch(
        description = "Used to decode profile info",
    ) {
        dependsOn(decoderEntity)

        execute {
            runCatching {
            runCatching {
                ProfileUserInfoViewBinderFingerprint.originalMethod.apply {
                    classDefBy(parameterTypes[1].toString()).apply {
                        runCatching {
                            val profileRelatedDetailsClass = ProfileRelatedDetailsFingerprint.originalClassDef
                            val profileRelatedDetailsFieldName = fields.lastOrNull { it.type == profileRelatedDetailsClass.type }?.name
                            if (profileRelatedDetailsFieldName != null) {
                                GetProfileRelatedDetailsExtensionFingerprint.changeFirstString(profileRelatedDetailsFieldName)
                            }
                            val isSelfProfileFieldName = profileRelatedDetailsClass.fields.lastOrNull { it.type == "Z" }?.name
                            if (isSelfProfileFieldName != null) {
                                IsSelfProfileExtensionFingerprint.changeFirstString(isSelfProfileFieldName)
                            }
                        }

                        runCatching {
                            val userDetailViewModelFieldName = fields.lastOrNull { it.type == USER_DETAIL_VIEW_MODEL_CLASS }?.name
                            if (userDetailViewModelFieldName != null) {
                                GetUserDetailViewModelExtensionFingerprint.changeFirstString(userDetailViewModelFieldName)
                            }
                        }

                        runCatching {
                            val viewModel = classDefBy(USER_DETAIL_VIEW_MODEL_CLASS)
                            viewModel.instanceFields.firstOrNull { it.type == USER_SESSION_CLASS }?.let { session ->
                                GetProfileSessionExtensionFingerprint.changeFirstString(session.name)
                            }
                            val userFields = viewModel.fields.filter {
                                it.type == USER_MODEL_CLASS_NAME && !AccessFlags.STATIC.isSet(it.accessFlags)
                            }
                            userFields.firstOrNull()?.let { userField ->
                                GetUserDataExtensionFingerprint.changeFirstString(userField.name)
                            }
                        }
                    }
                }
            }
        
            }
        }
    }
