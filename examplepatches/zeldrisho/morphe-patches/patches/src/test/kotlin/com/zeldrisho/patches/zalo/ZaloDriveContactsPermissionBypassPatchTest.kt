package com.zeldrisho.patches.zalo

import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.zeldrisho.patches.zalo.microg.bypassAccountResultContactsGate
import com.zeldrisho.patches.zalo.microg.bypassDriveContactsPermissionGate
import com.zeldrisho.patches.zalo.microg.bypassMediaRestoreAccountLookup
import com.zeldrisho.patches.zalo.microg.bypassMediaRestoreSignInPermissionGate
import com.zeldrisho.patches.zalo.microg.zaloDriveContactsPermissionBypassPatch
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import kotlin.test.Test
import kotlin.test.assertTrue

private const val MANAGE_ACCOUNT_VIEW =
    "Lcom/zing/zalo/ui/backuprestore/drive/ManageGoogleAccountView;"
private const val MEDIA_RESTORE_VIEW =
    "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountMediaRestoreView;"

class ZaloDriveContactsPermissionBypassPatchTest {
    @get:Rule val temporary = TemporaryFolder()

    @Test
    @Suppress("LongMethod")
    fun patchExecutesAcrossAllSyntheticTargets() {
        val media = ImmutableClassDef(
            MEDIA_RESTORE_VIEW,
            AccessFlags.PUBLIC.value,
            "Ljava/lang/Object;",
            emptyList(),
            null,
            emptySet(),
            emptyList(),
            listOf(
                immutableMethod(MEDIA_RESTORE_VIEW, "F6", listOf("Ljava/lang/String;"), emptyList()),
                immutableMethod(MEDIA_RESTORE_VIEW, "h5", listOf("I", "[Ljava/lang/String;", "[I"), emptyList()),
            ),
        )
        val manager = ImmutableClassDef(
            MANAGE_ACCOUNT_VIEW,
            AccessFlags.PUBLIC.value,
            "Ljava/lang/Object;",
            emptyList(),
            null,
            emptySet(),
            emptyList(),
            listOf(immutableMethod(MANAGE_ACCOUNT_VIEW, "h5", listOf("I", "[Ljava/lang/String;", "[I"), emptyList())),
        )
        val click = ImmutableClassDef(
            "Lzb1/l;",
            AccessFlags.PUBLIC.value,
            "Ljava/lang/Object;",
            emptyList(),
            null,
            emptySet(),
            emptyList(),
            listOf(immutableMethod("Lzb1/l;", "run", emptyList(), emptyList())),
        )
        val base = ImmutableClassDef(
            "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountBaseView;",
            AccessFlags.PUBLIC.value,
            "Ljava/lang/Object;",
            emptyList(),
            null,
            emptySet(),
            emptyList(),
            listOf(
                immutableMethod(
                    "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountBaseView;",
                    "A6",
                    listOf("Ljava/lang/String;"),
                    listOf(
                        ImmutableInstruction35c(
                            Opcode.INVOKE_STATIC,
                            1,
                            1,
                            0,
                            0,
                            0,
                            0,
                            ImmutableMethodReference("Lxo1/b1;", "c0", listOf("Z"), "Z"),
                        ),
                        ImmutableInstruction11x(Opcode.MOVE_RESULT, 2),
                    ),
                ),
            ),
        )
        val config = PatcherConfig(apkFile = temporary.newFile(), temporaryFilesPath = temporary.newFolder())
        val metadata = BytecodePatchContext::class.java.classLoader
            .loadClass("app.morphe.patcher.PackageMetadata")
            .constructors.single().newInstance("com.zing.zalo", "26.08.01", "260801903", null)
        val context = BytecodePatchContext::class.java.constructors.single()
            .newInstance(config, metadata) as BytecodePatchContext
        val patchClassesType = BytecodePatchContext::class.java.classLoader
            .loadClass("app.morphe.patcher.util.PatchClasses")
        val patchClasses = patchClassesType.getConstructor(Set::class.java).newInstance(setOf(media, manager, click, base))
        BytecodePatchContext::class.java.getMethod(
            "setPatchClasses\$morphe_patcher",
            patchClassesType,
        ).invoke(context, patchClasses)

        zaloDriveContactsPermissionBypassPatch.execute(context)
    }

    private fun immutableMethod(owner: String, name: String, parameters: List<String>, instructions: List<Instruction>) = ImmutableMethod(
        owner,
        name,
        parameters.map { ImmutableMethodParameter(it, emptySet(), null) },
        "V",
        AccessFlags.PUBLIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(8, instructions, emptyList(), emptyList()),
    )

    @Test
    fun mediaRestoreContinuesAfterPermissionCallback() {
        val method = syntheticMethod(MEDIA_RESTORE_VIEW, "h5", listOf("I", "[Ljava/lang/String;", "[I"), 12)
        bypassDriveContactsPermissionGate(MEDIA_RESTORE_VIEW, method)

        val instructions = method.implementation!!.instructions.toList()
        assertTrue(instructions.none { it.opcode == Opcode.ARRAY_LENGTH })
        assertTrue(instructions.none { it.opcode == Opcode.AGET })
        assertTrue(instructions.any { it.opcode == Opcode.RETURN_VOID })
        assertTrue(methodReferences(method).any { it.definingClass == MEDIA_RESTORE_VIEW && it.name == "F6" })
    }

    @Test
    fun accountLookupUsesSystemAccountPickerInsteadOfEnumeratingAccounts() {
        val method = syntheticMethod(MEDIA_RESTORE_VIEW, "F6", listOf("Ljava/lang/String;"), 5)
        bypassMediaRestoreAccountLookup(method)

        val references = methodReferences(method)
        assertTrue(
            references.any {
                it.definingClass == "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountBaseView;" &&
                    it.name == "x6" && it.parameterTypes == listOf("Ljava/lang/String;")
            },
        )
        assertTrue(references.none { it.definingClass == "Landroid/accounts/AccountManager;" && it.name == "getAccountsByType" })
        assertTrue(method.implementation!!.instructions.any { it.opcode == Opcode.RETURN_VOID })
    }

    @Test
    fun mediaRestoreSignInSkipsPermissionRequestAndCallsAccountLookup() {
        val method = syntheticMethod("Lzb1/l;", "run", emptyList(), 6)
        bypassMediaRestoreSignInPermissionGate(method)

        val instructions = method.implementation!!.instructions.toList()
        assertTrue(instructions.any { it.opcode == Opcode.IF_NEZ })
        assertTrue(methodReferences(method).any { it.definingClass == MEDIA_RESTORE_VIEW && it.name == "F6" })
        assertTrue(instructions.any { it.opcode == Opcode.RETURN_VOID })
    }

    @Test
    fun selectedAccountContinuesToOauthWithoutContactsGate() {
        val gateReference = ImmutableMethodReference("Lxo1/b1;", "c0", listOf("Z"), "Z")
        val method = syntheticMethod(
            "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountBaseView;",
            "A6",
            listOf("Ljava/lang/String;"),
            6,
            listOf(
                ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 1, 0, 0, 0, 0, gateReference),
                ImmutableInstruction11x(Opcode.MOVE_RESULT, 2),
            ),
        )
        bypassAccountResultContactsGate(method)

        val instructions = method.implementation!!.instructions.toList()
        assertTrue(instructions.map { it.opcode } == listOf(Opcode.CONST_16, Opcode.NOP))
        assertTrue(methodReferences(method).none { it.definingClass == "Lxo1/b1;" && it.name == "c0" })
    }

    @Test
    fun manageAccountContinuesCurrentBackupOrRestoreModeWithoutPermissionGate() {
        val method = syntheticMethod(MANAGE_ACCOUNT_VIEW, "h5", listOf("I", "[Ljava/lang/String;", "[I"), 6)
        bypassDriveContactsPermissionGate(MANAGE_ACCOUNT_VIEW, method)

        val methods = methodReferences(method).map { it.name }
        assertTrue("I6" in methods)
        assertTrue("K6" in methods)
    }

    private fun methodReferences(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) = method.implementation!!.instructions.mapNotNull { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
    }

    private fun syntheticMethod(
        owner: String,
        name: String,
        parameters: List<String>,
        registerCount: Int,
        instructions: List<Instruction> = emptyList(),
    ) = ImmutableMethod(
        owner,
        name,
        parameters.map { ImmutableMethodParameter(it, emptySet(), null) },
        "V",
        AccessFlags.PUBLIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(registerCount, instructions, emptyList(), emptyList()),
    ).toMutable()
}
