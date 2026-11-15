/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.actionBar.mainFeedActionBarButton

import app.rex.patches.instagram.utils.Constants.ACTIONBAR_DESCRIPTOR
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.USER_SESSION_CLASS
import app.rex.patches.instagram.utils.addFlags
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.registersUsed
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

object BindMainFeedActionBarFingerprint : Fingerprint(
    filters = listOf(string("BindMainFeedActionBar")),
    returnType = "Ljava/lang/Object;",
)

private object HomeActionModelFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("share", "news", "quick_snap", "manage_feeds"),
)

val hideHomeActionButtonsPatch = patch {
    execute {
            runCatching {
        runCatching {
            val method = HomeActionModelFingerprint.methodOrNull ?: return@runCatching
            val callIndex = method.instructions.withIndex().firstOrNull { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.parameterTypes?.map(CharSequence::toString) ==
                    listOf(USER_SESSION_CLASS, "I") &&
                    reference.returnType == "Ljava/lang/String;"
            }?.index ?: return@runCatching
            val result = method.getInstruction(callIndex + 1)
            if (result.opcode != Opcode.MOVE_RESULT_OBJECT || result.registersUsed.size != 1) {
                return@runCatching
            }
            val register = result.registersUsed.single()
            val next = method.getInstruction(callIndex + 2)
            val filter = """
                invoke-static/range {v$register .. v$register}, $ACTIONBAR_DESCRIPTOR->filterHomeAction(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$register
                """.trimIndent()
            if ((next.opcode == Opcode.IF_EQZ || next.opcode == Opcode.IF_NEZ) &&
                next.registersUsed == listOf(register)
            ) {
                method.addInstructions(callIndex + 2, filter)
            } else {
                val append = next.getReference<MethodReference>()
                val loop = method.getInstruction(callIndex + 3) as? BuilderOffsetInstruction
                val loopTarget = loop?.target?.location?.index
                val loopHead = loopTarget?.let { method.getInstruction(it) }
                val hasNext = loopHead?.getReference<MethodReference>()
                if (next.opcode != Opcode.INVOKE_VIRTUAL ||
                    append?.definingClass != "Ljava/util/AbstractCollection;" || append.name != "add" ||
                    append.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/Object;") ||
                    append.returnType != "Z" || next.registersUsed.size != 2 ||
                    next.registersUsed[1] != register || next.registersUsed[0] == register ||
                    loop?.opcode != Opcode.GOTO || loopTarget == null || loopTarget >= callIndex ||
                    loopHead?.opcode != Opcode.INVOKE_INTERFACE || loopHead.registersUsed.size != 1 ||
                    hasNext?.definingClass != "Ljava/util/Iterator;" || hasNext.name != "hasNext" ||
                    hasNext.parameterTypes.isNotEmpty() || hasNext.returnType != "Z"
                ) return@runCatching
                method.addInstructionsWithLabels(
                    callIndex + 2,
                    "$filter\nif-eqz v$register, :next_action",
                    ExternalLabel("next_action", loop),
                )
            }
        }
    
            }
        }
}

val mainFeedActionBarButtonPatch =
    patch(
        description = "This patch is adds support for adding buttons on main feed action bar.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            runCatching {
            runCatching { addFlags("mainFeedActionBarFlags") }

            runCatching {
                val actionBar = "Linstagram/features/feed/mainfeed/actionbar/MainFeedActionBar;"
                val actionBarClass = runCatching { mutableClassDefBy(actionBar) }.getOrNull()
                val candidates = mutableListOf<com.android.tools.smali.dexlib2.iface.Method>()
                BindMainFeedActionBarFingerprint.methodOrNull?.let { candidates += it }

                if (actionBarClass != null) {
                    for (m in actionBarClass.methods) {
                        if (m !in candidates) candidates += m
                    }
                }

                val containerTypes = setOf(
                    "Landroid/widget/LinearLayout;",
                    "Landroid/view/ViewGroup;",
                    "Lcom/instagram/common/ui/base/IgLinearLayout;",
                )

                val containers = candidates.mapNotNull { candidate ->
                    val mutableMethod = if (candidate is app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
                        candidate
                    } else {
                        actionBarClass?.methods?.firstOrNull {
                            it.name == candidate.name &&
                                it.parameterTypes == candidate.parameterTypes &&
                                it.returnType == candidate.returnType
                        }
                    } ?: return@mapNotNull null

                    val code = mutableMethod.instructions.toList()
                    val hitIndex = (0 until (code.size - 2).coerceAtLeast(0)).firstOrNull { index ->
                        val read = code[index]
                        val field = read.getReference<FieldReference>()
                        val visibility = code[index + 2].getReference<MethodReference>()
                        val branch = code[index + 1].opcode
                        read.opcode == Opcode.IGET_OBJECT &&
                            field?.definingClass == actionBar && field.type in containerTypes &&
                            (branch == Opcode.IF_EQZ || branch == Opcode.IF_NEZ) &&
                            visibility?.name == "setVisibility" && visibility.parameterTypes == listOf("I") &&
                            visibility.returnType == "V" &&
                            code[index + 2].registersUsed.firstOrNull() == read.registersUsed.firstOrNull()
                    }
                    if (hitIndex != null) mutableMethod to hitIndex else null
                }

                val match = containers.firstOrNull()
                if (match != null) {
                    val (method, index) = match
                    val layoutRegister = method.getInstruction(index).registersUsed.first()
                    method.addInstruction(
                        index + 1,
                        "invoke-static/range {v$layoutRegister .. v$layoutRegister}, " +
                            "$ACTIONBAR_DESCRIPTOR->mainFeedActionBarButton(Landroid/view/ViewGroup;)V",
                    )
                } else if (actionBarClass != null) {
                    // Fallback for 453+: hook where MainFeedActionBar stores its LinearLayout action container in <init>
                    for (m in actionBarClass.methods.filter { it.name == "<init>" }) {
                        val code = m.instructions.toList()
                        val storeIdx = code.indices.firstOrNull { idx ->
                            code[idx].opcode == Opcode.IPUT_OBJECT &&
                                code[idx].getReference<FieldReference>()?.let {
                                    it.definingClass == actionBar && it.type in containerTypes
                                } == true
                        }
                        if (storeIdx != null) {
                            val reg = (code[storeIdx] as OneRegisterInstruction).registerA
                            m.addInstruction(
                                storeIdx + 1,
                                "invoke-static/range {v$reg .. v$reg}, " +
                                    "$ACTIONBAR_DESCRIPTOR->mainFeedActionBarButton(Landroid/view/ViewGroup;)V",
                            )
                            break
                        }
                    }
                }
            }

            // Also hook MergedFeedsActionBar logo & ActionBarTitleViewSwitcher in 453+ so long-pressing logo opens settings
            runCatching {
                val mergedBar = "Lcom/instagram/homecoming/feeds/mergedfeed/actionbar/MergedFeedsActionBar;"
                val mergedClass = runCatching { mutableClassDefBy(mergedBar) }.getOrNull()
                mergedClass?.methods?.forEach { m ->
                    val code = m.instructions.toList()
                    code.indices.reversed().forEach { idx ->
                        val field = code[idx].getReference<FieldReference>()
                        if (code[idx].opcode == Opcode.IPUT_OBJECT &&
                            field?.definingClass == mergedBar &&
                            field.type == "Lcom/instagram/common/ui/base/IgSimpleImageView;"
                        ) {
                            val reg = (code[idx] as OneRegisterInstruction).registerA
                            m.addInstruction(
                                idx + 1,
                                "invoke-static/range {v$reg .. v$reg}, $ACTIONBAR_DESCRIPTOR->hookLogoView(Landroid/view/View;)V",
                            )
                        }
                    }
                }
            }
        
            }
        }
    }
