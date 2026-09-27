package com.zeldrisho.patches.zalo.microg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal data class MicroGMethodReplacementCounts(
    val binding: Int = 0,
    val accountType: Int = 0,
    val accountPicker: Int = 0,
    val accountRefresh: Int = 0,
    val launchCheck: Int = 0,
)

/** Applies one method's applicable microG rewrites and reports their counts. */
internal fun rewriteMicroGMethodBody(
    classType: String,
    method: Method,
    mutableMethod: MutableMethod,
    replacement: Pair<String, String>,
): MicroGMethodReplacementCounts {
    val launchCheck = addLauncherProviderCheck(classType, method, mutableMethod)
    val picker = isAccountPickerMethod(classType, method)
    if (picker) replaceWithAccountPicker(mutableMethod)
    val implementation = method.implementation
    val rewritten = if (!picker && implementation != null) {
        rewriteMicroGInstructions(classType, method, mutableMethod, replacement, implementation.instructions)
    } else {
        MicroGMethodReplacementCounts()
    }
    return MicroGMethodReplacementCounts(
        rewritten.binding,
        rewritten.accountType,
        if (picker) 1 else 0,
        rewritten.accountRefresh,
        launchCheck,
    )
}

/**
 * Prepends a provider check to the launcher onCreate(Bundle) method and returns 1, or 0 otherwise.
 *
 * Requires a local scratch register; the injected check does not branch on its result.
 */
private fun addLauncherProviderCheck(classType: String, method: Method, mutableMethod: MutableMethod): Int {
    if (classType != ZALO_LAUNCHER_CLASS || method.name != "onCreate" ||
        method.parameterTypes != listOf("Landroid/os/Bundle;")
    ) {
        return 0
    }
    requireProviderCheckScratch(mutableMethod.implementation!!.registerCount)
    mutableMethod.addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            invoke-static { v0 }, $MICROG_EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)Z
            move-result v0
        """.trimIndent(),
    )
    return 1
}

/** Recognizes the two supported account-picker methods by owner, name, and parameter types. */
private fun isAccountPickerMethod(classType: String, method: Method): Boolean = (
    classType == SYNC_GOOGLE_ACCOUNT_BASE_VIEW && method.name == "x6" &&
        method.parameterTypes == listOf("Ljava/lang/String;")
    ) ||
    (
        classType == "Lcom/zing/zalo/ui/backuprestore/drive/ManageGoogleAccountView;" &&
            method.name == "I6" && method.parameterTypes == listOf("Ljava/lang/String;")
        )

/** Rewrites eligible instructions at their original indexes and totals the counted replacements. */
private fun rewriteMicroGInstructions(
    classType: String,
    method: Method,
    mutableMethod: MutableMethod,
    replacement: Pair<String, String>,
    instructions: Iterable<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
): MicroGMethodReplacementCounts {
    var binding = 0
    var accountType = 0
    var accountRefresh = 0
    instructions.forEachIndexed { index, instruction ->
        val count = rewriteMicroGInstruction(classType, method, mutableMethod, replacement, index, instruction)
        binding += count.binding
        accountType += count.accountType
        accountRefresh += count.accountRefresh
    }
    return MicroGMethodReplacementCounts(binding, accountType, accountRefresh = accountRefresh)
}

/**
 * Rewrites an eligible refresh call, account-result key, or provider/account-type string in place.
 *
 * Returns counts for binding, account-type, and refresh replacements; key substitutions are uncounted.
 */
private fun rewriteMicroGInstruction(
    classType: String,
    method: Method,
    mutableMethod: MutableMethod,
    replacement: Pair<String, String>,
    index: Int,
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): MicroGMethodReplacementCounts {
    var binding = 0
    var accountType = 0
    var accountRefresh = 0
    val methodReference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
    if (isAccountRefreshCall(classType, method.name, methodReference)) {
        mutableMethod.replaceInstruction(index, accountRefreshInvocation(instruction))
        accountRefresh = 1
    } else if (instruction.opcode == Opcode.CONST_STRING) {
        val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
        if (reference != null) {
            val register = (instruction as OneRegisterInstruction).registerA
            if (classType == SYNC_GOOGLE_ACCOUNT_BASE_VIEW && method.name == "onActivityResult" &&
                reference.string == "authAccount"
            ) {
                mutableMethod.replaceInstruction(
                    index,
                    "sget-object v$register, Landroid/accounts/AccountManager;->KEY_ACCOUNT_NAME:Ljava/lang/String;",
                )
            }
            val isAccountTypeLiteral = reference.string == "com.google" && classType == "Lo9/a;"
            if (reference.string == replacement.first || isAccountTypeLiteral) {
                val replacementValue = if (isAccountTypeLiteral) MICROG_ACCOUNT_TYPE else replacement.second
                mutableMethod.replaceInstruction(index, "const-string v$register, \"$replacementValue\"")
                if (classType == "Lo9/a;" && !isAccountTypeLiteral) binding++ else accountType++
            }
        }
    }
    return MicroGMethodReplacementCounts(binding, accountType, accountRefresh = accountRefresh)
}
