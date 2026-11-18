/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.userdata

import app.rex.patches.instagram.entity.decoder.USER_MODEL_CLASS_NAME
import app.rex.patches.instagram.entity.decoder.decoderEntity
import app.rex.patches.instagram.entity.userfriendshipstatus.userFriendshipStatusEntity
import app.rex.utils.changeFirstString
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private fun findUserPandoStringGetter(fieldId: Int): String? =
    classDefByOrNull(USER_MODEL_CLASS_NAME)?.methods?.firstOrNull { method ->
        method.parameterTypes.isEmpty() &&
            method.returnType == "Ljava/lang/String;" &&
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.implementation?.instructions?.any { insn ->
                (insn is NarrowLiteralInstruction && insn.narrowLiteral == fieldId) ||
                    (insn is WideLiteralInstruction && insn.wideLiteral == fieldId.toLong())
            } == true
    }?.name

private fun replaceExtensionMethod(
    target: MutableMethod,
    registerCount: Int,
    smaliBody: String,
) {
    val replacement = MutableMethod(
        ImmutableMethod(
            target.definingClass,
            target.name,
            target.parameters,
            target.returnType,
            target.accessFlags,
            target.annotations,
            target.hiddenApiRestrictions,
            ImmutableMethodImplementation(registerCount, emptyList(), emptyList(), emptyList()),
        ),
    ).apply {
        addInstructions(0, smaliBody.trimIndent())
    }
    mutableClassDefBy(target.definingClass).methods.apply {
        remove(target)
        add(replacement)
    }
}

val userDataEntity =
    patch(
        description = "This patch is used for decoding obfuscated code of the user data",
    ) {
        dependsOn(decoderEntity, userFriendshipStatusEntity)

        execute {
            runCatching {
                runCatching {
                    val usernameGetter = UserNameLiveTreeUserDictFingerprint.matchOrNull()?.originalMethod?.name
                        ?: findUserPandoStringGetter(-265713450)
                    if (usernameGetter != null) {
                        GetUsernameExtensionFingerprint.changeFirstString(usernameGetter)
                    }
                }
                runCatching {
                    val userIdGetter = UserIdLiveTreeUserDictFingerprint.matchOrNull()?.instructionMatches?.lastOrNull()?.methodReference?.name
                        ?: findUserPandoStringGetter(0x7b27f5a8)
                    if (userIdGetter != null) {
                        GetUserIdExtensionFingerprint.changeFirstString(userIdGetter)
                    }
                }
                runCatching { GetFullNameExtensionFingerprint.changeFirstString(FullNameLiveTreeUserDictFingerprint.originalMethod.name) }
                runCatching { GetUserFriendshipStatusExtensionFingerprint.changeFirstString(FriendshipStatusLiveTreeUserDictFingerprint.originalMethod.name) }
                runCatching { GetBioExtensionFingerprint.changeFirstString(BiographyLiveTreeUserDictFingerprint.originalMethod.name) }
                runCatching { GetProfilePictureUrlExtensionFingerprint.changeFirstString(HDProfileInfoUserTreeDictFingerprint.originalMethod.name) }
                runCatching { GetLowResProfilePictureExtensionFingerprint.changeFirstString(LowResProfilePictureUserTreeDictFingerprint.originalMethod.name) }
                runCatching { IsVerifiedExtensionFingerprint.changeFirstString(IsVerifiedUserTreeDictFingerprint.originalMethod.name) }

                runCatching {
                    val request = ProfileUserRequestFingerprint.originalMethod
                    val repository = ProfileUserRequestFingerprint.originalClassDef.staticFields.single {
                        it.type == request.definingClass && AccessFlags.PUBLIC.isSet(it.accessFlags)
                    }
                    replaceExtensionMethod(
                        FetchProfileUserExtensionFingerprint.method,
                        3,
                        """
                        sget-object p0, $repository
                        invoke-virtual/range {p0 .. p2}, $request
                        move-result-object p0
                        return-object p0
                        """,
                    )
                }
            }
        }
    }
