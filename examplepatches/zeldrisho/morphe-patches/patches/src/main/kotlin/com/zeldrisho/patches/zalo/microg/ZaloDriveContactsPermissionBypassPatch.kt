package com.zeldrisho.patches.zalo.microg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

private const val CONTACT_PERMISSION_REQUEST_CODE = 0x96
private const val HEX_RADIX = 16
private const val MANAGE_GOOGLE_ACCOUNT_VIEW =
    "Lcom/zing/zalo/ui/backuprestore/drive/ManageGoogleAccountView;"
private const val MEDIA_RESTORE_VIEW =
    "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountMediaRestoreView;"
private const val GOOGLE_ACCOUNT_BASE_VIEW =
    "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountBaseView;"
private const val MEDIA_RESTORE_ACCOUNT_CLICK = "Lzb1/l;"
private const val CONTACT_RESULT_METHOD = "h5"
private const val MEDIA_RESTORE_ACCOUNT_LOOKUP_METHOD = "F6"
private const val MEDIA_RESTORE_ACCOUNT_CLICK_METHOD = "run"
private const val ACCOUNT_RESULT_METHOD = "A6"
private const val BACKUP_PERMISSION_FLOW = 0x3
private val CONTACT_RESULT_PARAMETERS = listOf("I", "[Ljava/lang/String;", "[I")

/**
 * Uses the patched Android account picker instead of enumerating accounts behind a permission gate.
 *
 * @throws IllegalStateException if [method] is not F6(String) returning void.
 */
internal fun bypassMediaRestoreAccountLookup(method: MutableMethod) {
    check(
        method.name == MEDIA_RESTORE_ACCOUNT_LOOKUP_METHOD &&
            method.parameterTypes == listOf("Ljava/lang/String;") && method.returnType == "V",
    ) {
        "Zalo Drive Contacts bypass: unexpected account lookup shape ${method.name}${method.parameterTypes}"
    }

    method.addInstructionsWithLabels(
        0,
        """
            invoke-virtual { p0, p1 }, Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountBaseView;->x6(Ljava/lang/String;)V
            return-void
        """.trimIndent(),
    )
}

/**
 * Routes the restore Sign In button directly to F6, avoiding READ_CONTACTS/GET_ACCOUNTS requests.
 * Other click modes continue through the existing body.
 *
 * @throws IllegalStateException if [method] is not run() returning void.
 */
internal fun bypassMediaRestoreSignInPermissionGate(method: MutableMethod) {
    check(method.name == MEDIA_RESTORE_ACCOUNT_CLICK_METHOD && method.parameterTypes.isEmpty() && method.returnType == "V") {
        "Zalo Drive Contacts bypass: unexpected account click handler shape ${method.name}${method.parameterTypes}"
    }

    method.addInstructionsWithLabels(
        0,
        """
            iget v0, p0, $MEDIA_RESTORE_ACCOUNT_CLICK->a:I
            if-nez v0, :other_click_existing
            iget-object v0, p0, $MEDIA_RESTORE_ACCOUNT_CLICK->b:$MEDIA_RESTORE_VIEW
            iget-object v1, v0, $MEDIA_RESTORE_VIEW->h1:Ljava/lang/String;
            invoke-virtual { v0, v1 }, $MEDIA_RESTORE_VIEW->F6(Ljava/lang/String;)V
            return-void
            :other_click_existing
            nop
        """.trimIndent(),
    )
}

/** Recognizes the pinned Contacts gate Lxo1/b1;->c0(Z)Z; null never matches. */
private fun isContactsPermissionGate(reference: MethodReference?): Boolean = when {
    reference == null -> false
    reference.definingClass != "Lxo1/b1;" -> false
    reference.name != "c0" -> false
    !hasBooleanSignature(reference) -> false
    else -> true
}

/** Returns whether the referenced method accepts one boolean and returns a boolean. */
private fun hasBooleanSignature(reference: MethodReference): Boolean = reference.parameterTypes == listOf("Z") && reference.returnType == "Z"

/**
 * Lets the selected Drive account continue through OAuth; Contacts access is unrelated to this result.
 * Replaces the Contacts gate result with true in [method].
 *
 * @throws IllegalStateException if [method] is not A6(String) returning void, has no implementation,
 * or does not contain exactly one Contacts gate followed by a move-result instruction.
 */
internal fun bypassAccountResultContactsGate(method: MutableMethod) {
    check(
        method.name == ACCOUNT_RESULT_METHOD &&
            method.parameterTypes == listOf("Ljava/lang/String;") && method.returnType == "V",
    ) {
        "Zalo Drive Contacts bypass: unexpected account result shape ${method.name}${method.parameterTypes}"
    }

    val instructions = method.implementation?.instructions?.toList()
        ?: error("Zalo Drive Contacts bypass: $ACCOUNT_RESULT_METHOD has no implementation")
    val gateCalls = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (isContactsPermissionGate(reference)) index else null
    }
    check(gateCalls.size == 1) {
        "Zalo Drive Contacts bypass: expected one Contacts gate in $ACCOUNT_RESULT_METHOD; found ${gateCalls.size}"
    }

    val callIndex = gateCalls.single()
    val result = instructions.getOrNull(callIndex + 1) as? OneRegisterInstruction
    check(instructions.getOrNull(callIndex + 1)?.opcode == Opcode.MOVE_RESULT && result != null) {
        "Zalo Drive Contacts bypass: Contacts gate is not followed by move-result"
    }
    val resultRegister = result.registerA
    method.replaceInstruction(callIndex, "const/16 v$resultRegister, 0x1")
    method.replaceInstruction(callIndex + 1, "nop")
}

/**
 * Continues the selected Drive flow after Zalo's Contacts-permission callback, regardless of grant.
 * Only request code 0x96 is intercepted; other requests continue through the existing body.
 *
 * @param classType DEX descriptor of the media-restore or account-management view, selecting its continuation.
 * @throws IllegalStateException if [classType] is unsupported or [method] is not h5(int, String[], int[]).
 */
internal fun bypassDriveContactsPermissionGate(classType: String, method: MutableMethod) {
    check(method.name == CONTACT_RESULT_METHOD && method.parameterTypes == CONTACT_RESULT_PARAMETERS) {
        "Zalo Drive Contacts bypass: unexpected permission callback shape ${method.name}${method.parameterTypes}"
    }

    val continuation = when (classType) {
        MEDIA_RESTORE_VIEW -> """
            iget-object v0, p0, $MEDIA_RESTORE_VIEW->h1:Ljava/lang/String;
            invoke-virtual { p0, v0 }, $MEDIA_RESTORE_VIEW->F6(Ljava/lang/String;)V
            return-void
        """.trimIndent()

        MANAGE_GOOGLE_ACCOUNT_VIEW -> """
            iget v0, p0, $MANAGE_GOOGLE_ACCOUNT_VIEW->v1:I
            const/4 v1, 0x${BACKUP_PERMISSION_FLOW.toString(16)}
            if-ne v0, v1, :manage_backup
            iget-object v0, p0, $MANAGE_GOOGLE_ACCOUNT_VIEW->u1:Ljava/lang/String;
            invoke-virtual { p0, v0 }, $MANAGE_GOOGLE_ACCOUNT_VIEW->I6(Ljava/lang/String;)V
            return-void
            :manage_backup
            iget-object v0, p0, $MANAGE_GOOGLE_ACCOUNT_VIEW->u1:Ljava/lang/String;
            invoke-virtual { p0, v0 }, $MANAGE_GOOGLE_ACCOUNT_VIEW->K6(Ljava/lang/String;)V
            return-void
        """.trimIndent()

        else -> error("Zalo Drive Contacts bypass: unexpected class $classType")
    }

    method.addInstructionsWithLabels(
        0,
        """
            const/16 v0, 0x${CONTACT_PERMISSION_REQUEST_CODE.toString(HEX_RADIX)}
            if-ne p1, v0, :contacts_continue_existing
            $continuation
            :contacts_continue_existing
            nop
        """.trimIndent(),
    )
}

/**
 * Avoids Zalo's Contacts/account-list permission request in Drive photo restore by using Android's
 * account picker. It does not grant Contacts access; Android still enforces READ_CONTACTS.
 */
@Suppress("unused")
val zaloDriveContactsPermissionBypassPatch = bytecodePatch(
    name = "Bypass Zalo Drive Contacts permission gate",
    description = "Uses Android's account picker for Drive photo restore without requesting Contacts/account-list " +
        "permission. Contacts remain protected by Android and are not read by this bypass.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val targetTypes = setOf(MANAGE_GOOGLE_ACCOUNT_VIEW, MEDIA_RESTORE_VIEW)
        val replacementCounts = targetTypes.associateWith { 0 }.toMutableMap()
        var accountLookupCount = 0
        var accountClickCount = 0
        var accountResultCount = 0

        classDefForEach { classDef ->
            if (classDef.type == MEDIA_RESTORE_ACCOUNT_CLICK) {
                val clickHandler = classDef.methods.singleOrNull { method ->
                    method.name == MEDIA_RESTORE_ACCOUNT_CLICK_METHOD && method.parameterTypes.isEmpty() &&
                        method.returnType == "V" && method.implementation != null
                } ?: error("Zalo Drive Contacts bypass: expected one run method in ${classDef.type}")
                val mutableClass = mutableClassDefBy(classDef)
                val mutableMethod = mutableClass.methods.single { method ->
                    method.name == clickHandler.name && method.parameterTypes == clickHandler.parameterTypes &&
                        method.returnType == clickHandler.returnType
                }
                bypassMediaRestoreSignInPermissionGate(mutableMethod)
                accountClickCount++
                return@classDefForEach
            }
            if (classDef.type == GOOGLE_ACCOUNT_BASE_VIEW) {
                val accountResult = classDef.methods.singleOrNull { method ->
                    method.name == ACCOUNT_RESULT_METHOD && method.parameterTypes == listOf("Ljava/lang/String;") &&
                        method.returnType == "V" && method.implementation != null
                } ?: error("Zalo Drive Contacts bypass: expected one A6 account result in ${classDef.type}")
                val mutableClass = mutableClassDefBy(classDef)
                val mutableMethod = mutableClass.methods.single { method ->
                    method.name == accountResult.name && method.parameterTypes == accountResult.parameterTypes &&
                        method.returnType == accountResult.returnType
                }
                bypassAccountResultContactsGate(mutableMethod)
                accountResultCount++
                return@classDefForEach
            }
            if (classDef.type !in targetTypes) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            if (classDef.type == MEDIA_RESTORE_VIEW) {
                val accountLookup = classDef.methods.singleOrNull { method ->
                    method.name == MEDIA_RESTORE_ACCOUNT_LOOKUP_METHOD &&
                        method.parameterTypes == listOf("Ljava/lang/String;") &&
                        method.returnType == "V" && method.implementation != null
                } ?: error("Zalo Drive Contacts bypass: expected one F6 account lookup in ${classDef.type}")
                val mutableLookup = mutableClass.methods.single { method ->
                    method.name == accountLookup.name && method.parameterTypes == accountLookup.parameterTypes &&
                        method.returnType == accountLookup.returnType
                }
                bypassMediaRestoreAccountLookup(mutableLookup)
                accountLookupCount++
            }

            val callback = classDef.methods.singleOrNull { method ->
                method.name == CONTACT_RESULT_METHOD && method.parameterTypes == CONTACT_RESULT_PARAMETERS &&
                    method.returnType == "V" && method.implementation != null
            } ?: error("Zalo Drive Contacts bypass: expected one $CONTACT_RESULT_METHOD callback in ${classDef.type}")
            val mutableCallback = mutableClass.methods.single { method ->
                method.name == callback.name && method.parameterTypes == callback.parameterTypes &&
                    method.returnType == callback.returnType
            }
            bypassDriveContactsPermissionGate(classDef.type, mutableCallback)
            replacementCounts[classDef.type] = replacementCounts.getValue(classDef.type) + 1
        }

        check(
            replacementCounts.values.all { it == 1 } && accountLookupCount == 1 && accountClickCount == 1 &&
                accountResultCount == 1,
        ) {
            "Zalo Drive Contacts bypass: expected one callback per target, one account lookup, one click handler, " +
                "and one account result; found $replacementCounts, lookup=$accountLookupCount, " +
                "click=$accountClickCount, result=$accountResultCount"
        }
    }
}
