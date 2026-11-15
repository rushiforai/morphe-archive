/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.actionBar.userProfileActionBarButton

import app.rex.patches.instagram.entity.decoder.USER_MODEL_CLASS_NAME
import app.rex.patches.instagram.entity.decoder.decoderEntity
import app.rex.patches.instagram.utils.Constants.ACTIONBAR_DESCRIPTOR
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.USER_DETAIL_VIEW_MODEL_CLASS
import app.rex.patches.instagram.utils.Constants.USER_SESSION_CLASS
import app.rex.patches.instagram.utils.addFlags
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ACTIVITY_CLASS = "Landroid/app/Activity;"
private const val IG_LINEAR_LAYOUT_CLASS = "Lcom/instagram/common/ui/base/IgLinearLayout;"

internal object ProfileHeaderRelatedFingerprint : Fingerprint(
    strings = listOf("profile_user_id", "click_point", "user_profile_header"),
    returnType = "V",
    parameters = listOf("L", "L", "L"),
)

internal object ProfileActionBarBuilderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        ACTIVITY_CLASS,
        "Landroid/content/Context;",
        USER_SESSION_CLASS,
        IG_LINEAR_LAYOUT_CLASS,
        IG_LINEAR_LAYOUT_CLASS,
        "L",
        "Ljava/util/List;",
        "Lkotlin/jvm/functions/Function1;",
    ),
    filters = listOf(
        methodCall(smali = "Landroid/view/ViewGroup;->removeAllViews()V"),
        methodCall(smali = "Landroid/view/ViewGroup;->removeAllViews()V", location = MatchAfterImmediately()),
        methodCall(smali = "Ljava/util/List;->iterator()Ljava/util/Iterator;", location = MatchAfterImmediately()),
    ),
)

internal object ProfileActionIconFactoryFingerprint : Fingerprint(
    classFingerprint = ProfileActionBarBuilderFingerprint,
    returnType = "Landroid/widget/ImageView;",
    parameters = listOf("Landroid/content/Context;", USER_SESSION_CLASS, "L", "L"),
    filters = listOf(
        fieldAccess(type = "I", opcode = Opcode.IGET),
        opcode(Opcode.RETURN_OBJECT),
    ),
)

private const val BUILDER_ACTIVITY_PARAMETER = 0
private const val BUILDER_USER_SESSION_PARAMETER = 2
private const val BUILDER_LAYOUT_PARAMETER = 4
private const val BUILDER_ACTION_BAR_RELATED_PARAMETER = 5

val userProfileActionBarButtonPatch =
    patch(
        description = "This patch is adds support for adding buttons on user profile action bar.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(decoderEntity)

        execute {
            runCatching {
            runCatching { addFlags("profileActionBarFlags") }

            runCatching {
                ProfileActionIconFactoryFingerprint.let {
                    val drawableRead = it.instructionMatches.first().getInstruction<TwoRegisterInstruction>()
                    val modelRegister = drawableRead.registerB
                    val drawableField = it.instructionMatches.first().fieldReference
                    val returnIndex = it.instructionMatches.last().index
                    val viewRegister = it.instructionMatches.last().getInstruction<OneRegisterInstruction>().registerA
                    val registers = it.method.getFreeRegisterProvider(returnIndex, 2, modelRegister, viewRegister)
                    val viewCopy = registers.getFreeRegister()
                    val drawableCopy = registers.getFreeRegister()
                    it.method.addInstructionsAtControlFlowLabel(
                        returnIndex,
                        """
                        move-object/from16 v$viewCopy, v$modelRegister
                        iget v$drawableCopy, v$viewCopy, $drawableField
                        move-object/from16 v$viewCopy, v$viewRegister
                        invoke-static {v$viewCopy, v$drawableCopy}, $ACTIONBAR_DESCRIPTOR->hideProfileCreateButton(Landroid/view/View;I)V
                        """.trimIndent(),
                    )
                }
            }

            runCatching {
                val builderOrig = ProfileActionBarBuilderFingerprint.originalMethod
                val actionBarRelatedClass = classDefBy(
                    builderOrig.parameterTypes[BUILDER_ACTION_BAR_RELATED_PARAMETER].toString(),
                )
                val profileHeaderFieldInActionBarRelatedClass =
                    actionBarRelatedClass.fields.firstOrNull { field ->
                        classDefByOrNull(field.type)?.fields?.any { it.type == USER_DETAIL_VIEW_MODEL_CLASS } == true
                    } ?: run {
                        val headerClass = ProfileHeaderRelatedFingerprint.matchAllOrNull()
                            ?.map { it.originalClassDef }
                            ?.distinctBy { it.type }
                            ?.firstOrNull { candidate -> actionBarRelatedClass.fields.any { it.type == candidate.type } }
                            ?: return@runCatching
                        actionBarRelatedClass.fields.first { it.type == headerClass.type }
                    }

                val profileHeaderClass = classDefBy(profileHeaderFieldInActionBarRelatedClass.type)
                val userDetailViewModelFieldInProfileHeaderRelatedClass =
                    profileHeaderClass.fields.firstOrNull { it.type == USER_DETAIL_VIEW_MODEL_CLASS }
                        ?: return@runCatching

                val viewModelClass = classDefBy(USER_DETAIL_VIEW_MODEL_CLASS)
                val userDataFieldInUserDetailClass =
                    viewModelClass.fields.firstOrNull { it.type == USER_MODEL_CLASS_NAME }

                val userIdGetterOnViewModel = if (userDataFieldInUserDetailClass == null) {
                    viewModelClass.methods.asSequence()
                        .filter { AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.map(CharSequence::toString) == listOf(USER_DETAIL_VIEW_MODEL_CLASS) }
                        .flatMap { m ->
                            val insns = m.implementation?.instructions?.toList().orEmpty()
                            insns.indices.mapNotNull { idx ->
                                if (insns[idx].getReference<StringReference>()?.string == "INVALID_USER_ID") {
                                    insns.getOrNull(idx - 2)?.getReference<MethodReference>()?.takeIf {
                                        it.definingClass == USER_DETAIL_VIEW_MODEL_CLASS &&
                                            it.returnType == "Ljava/lang/String;" &&
                                            it.parameterTypes.isEmpty()
                                    }
                                } else null
                            }
                        }.firstOrNull()
                } else null

                ProfileActionBarBuilderFingerprint.method.apply {
                    val activityRegister = p0Register + BUILDER_ACTIVITY_PARAMETER
                    val userSessionRegister = p0Register + BUILDER_USER_SESSION_PARAMETER
                    val layoutRegister = p0Register + BUILDER_LAYOUT_PARAMETER
                    val actionBarRelatedRegister = p0Register + BUILDER_ACTION_BAR_RELATED_PARAMETER
                    val injectionIndex = ProfileActionBarBuilderFingerprint.instructionMatches.last().index
                    val resumeInstruction = getInstruction(injectionIndex)
                    val freeRegisterProvider =
                        getFreeRegisterProvider(
                            index = injectionIndex,
                            numberOfFreeRegistersNeeded = 4,
                            activityRegister,
                            layoutRegister,
                            userSessionRegister,
                            actionBarRelatedRegister,
                        )
                    val userObjectRegister = freeRegisterProvider.getFreeRegister()
                    val userSessionCopyRegister = freeRegisterProvider.getFreeRegister()
                    val layoutCopyRegister = freeRegisterProvider.getFreeRegister()
                    val activityCopyRegister = freeRegisterProvider.getFreeRegister()

                    val resolveUserSmali = when {
                        userDataFieldInUserDetailClass != null ->
                            "iget-object v$userObjectRegister, v$userObjectRegister, $userDataFieldInUserDetailClass"
                        userIdGetterOnViewModel != null ->
                            "invoke-virtual {v$userObjectRegister}, $userIdGetterOnViewModel\nmove-result-object v$userObjectRegister"
                        else -> ""
                    }

                    val code =
                        """
                        move-object/from16 v$userObjectRegister, v$actionBarRelatedRegister
                        if-eqz v$userObjectRegister, :rex
                        iget-object v$userObjectRegister, v$userObjectRegister, $profileHeaderFieldInActionBarRelatedClass
                        if-eqz v$userObjectRegister, :rex
                        iget-object v$userObjectRegister, v$userObjectRegister, $userDetailViewModelFieldInProfileHeaderRelatedClass
                        if-eqz v$userObjectRegister, :rex
                        $resolveUserSmali
                        move-object/from16 v$userSessionCopyRegister, v$userSessionRegister
                        move-object/from16 v$layoutCopyRegister, v$layoutRegister
                        move-object/from16 v$activityCopyRegister, v$activityRegister
                        invoke-static {v$activityCopyRegister, v$layoutCopyRegister, v$userSessionCopyRegister, v$userObjectRegister}, $ACTIONBAR_DESCRIPTOR->userProfileActionBarButton(${ACTIVITY_CLASS}Landroid/view/ViewGroup;${USER_SESSION_CLASS}Ljava/lang/Object;)V
                        """.trimIndent()

                    addInstructionsWithLabels(
                        injectionIndex,
                        code,
                        ExternalLabel("rex", resumeInstruction),
                    )
                }
            }
        
            }
        }
    }
