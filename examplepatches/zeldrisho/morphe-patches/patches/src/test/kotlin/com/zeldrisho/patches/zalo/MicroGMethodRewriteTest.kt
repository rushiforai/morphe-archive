package com.zeldrisho.patches.zalo

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.zeldrisho.patches.testing.syntheticMutableMethod
import com.zeldrisho.patches.zalo.microg.MICROG_ACCOUNT_TYPE
import com.zeldrisho.patches.zalo.microg.MICROG_PACKAGE
import com.zeldrisho.patches.zalo.microg.MicroGMethodReplacementCounts
import com.zeldrisho.patches.zalo.microg.SYNC_GOOGLE_ACCOUNT_BASE_VIEW
import com.zeldrisho.patches.zalo.microg.ZALO_LAUNCHER_CLASS
import com.zeldrisho.patches.zalo.microg.rewriteMicroGClass
import com.zeldrisho.patches.zalo.microg.rewriteMicroGClasses
import com.zeldrisho.patches.zalo.microg.rewriteMicroGMethod
import com.zeldrisho.patches.zalo.microg.validateMicroGReplacementCounts
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class MicroGMethodRewriteTest {
    /** Builds a public synthetic void method with configurable parameters, registers, and instructions. */
    private fun immutableMethod(
        owner: String,
        name: String,
        parameters: List<String> = emptyList(),
        registers: Int = 3,
        instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    ) = ImmutableMethod(
        owner,
        name,
        parameters.map { ImmutableMethodParameter(it, emptySet(), null) },
        "V",
        AccessFlags.PUBLIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(registers, instructions, emptyList(), emptyList()),
    )

    /** Collects string-reference values from a mutable method implementation in instruction order. */
    private fun strings(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) = method.implementation!!.instructions.mapNotNull { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
    }

    /** Wraps the supplied synthetic methods in a public class extending Object. */
    private fun classDef(owner: String, vararg methods: ImmutableMethod) = ImmutableClassDef(
        owner,
        AccessFlags.PUBLIC.value,
        "Ljava/lang/Object;",
        emptyList(),
        null,
        emptySet(),
        emptyList(),
        methods.toList(),
    )

    /** Checks microG binding and account-type substitutions while preserving unrelated strings. */
    @Test
    fun replacesServiceBindingAndAccountTypeLiteralsWithPackageSpecificValues() {
        val source = immutableMethod(
            "Lo9/a;",
            "bind",
            instructions = listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 1, ImmutableStringReference("com.google.android.gms")),
                ImmutableInstruction21c(Opcode.CONST_STRING, 2, ImmutableStringReference("com.google")),
                ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("unrelated")),
            ),
        )
        val mutable = source.toMutable()
        val counts = rewriteMicroGMethod("Lo9/a;", source, mutable, "com.google.android.gms" to MICROG_PACKAGE)
        assertEquals(MicroGMethodReplacementCounts(binding = 1, accountType = 1), counts)
        assertEquals(listOf(MICROG_PACKAGE, MICROG_ACCOUNT_TYPE, "unrelated"), strings(mutable))
    }

    /** Checks account-key substitution and zero replacement counts for an unrelated bodyless method. */
    @Test
    fun rewritesActivityResultAccountKeyAndIgnoresBodylessMethods() {
        val source = immutableMethod(
            SYNC_GOOGLE_ACCOUNT_BASE_VIEW,
            "onActivityResult",
            instructions = listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 2, ImmutableStringReference("authAccount")),
                ImmutableInstruction21c(Opcode.CONST_STRING, 1, ImmutableStringReference("untouched")),
            ),
        )
        val mutable = source.toMutable()
        val counts = rewriteMicroGMethod(
            SYNC_GOOGLE_ACCOUNT_BASE_VIEW,
            source,
            mutable,
            "com.google" to MICROG_ACCOUNT_TYPE,
        )
        assertEquals(MicroGMethodReplacementCounts(), counts)
        assertTrue(strings(mutable).contains("untouched"))
        assertTrue(strings(mutable).none { it == "authAccount" })

        val abstractMethod = syntheticMutableMethod(registerCount = 0, instructions = null)
        assertEquals(
            MicroGMethodReplacementCounts(),
            rewriteMicroGMethod("Lother/Class;", abstractMethod, abstractMethod, "x" to "y"),
        )
    }

    /** Checks launcher injection, rejection of insufficient scratch registers, and guarded picker code. */
    @Test
    fun launcherGuardAndPickerPathsAreExercised() {
        val launcher = immutableMethod(
            ZALO_LAUNCHER_CLASS,
            "onCreate",
            listOf("Landroid/os/Bundle;"),
            registers = 3,
            instructions = emptyList(),
        )
        val launcherMutable = launcher.toMutable()
        val launchCounts = rewriteMicroGMethod(
            ZALO_LAUNCHER_CLASS,
            launcher,
            launcherMutable,
            "" to "",
        )
        assertEquals(1, launchCounts.launchCheck)
        assertTrue(launcherMutable.implementation!!.instructions.any { it.opcode == Opcode.INVOKE_STATIC })

        val noScratch = immutableMethod(
            ZALO_LAUNCHER_CLASS,
            "onCreate",
            listOf("Landroid/os/Bundle;"),
            registers = 2,
            instructions = emptyList(),
        )
        assertFailsWith<IllegalStateException> {
            rewriteMicroGMethod(ZALO_LAUNCHER_CLASS, noScratch, noScratch.toMutable(), "" to "")
        }

        val picker = immutableMethod(
            SYNC_GOOGLE_ACCOUNT_BASE_VIEW,
            "x6",
            listOf("Ljava/lang/String;"),
            registers = 2,
            instructions = emptyList(),
        )
        val pickerMutable = picker.toMutable()
        val pickerCounts = rewriteMicroGMethod(
            SYNC_GOOGLE_ACCOUNT_BASE_VIEW,
            picker,
            pickerMutable,
            "com.google" to MICROG_ACCOUNT_TYPE,
        )
        assertEquals(1, pickerCounts.accountPicker)
        assertTrue(pickerMutable.implementation!!.instructions.any { it.opcode == Opcode.IF_EQZ })
    }

    /** Checks accepted microG totals and each required count when it is below the minimum. */
    @Test
    fun validatesAllOrchestrationCountBoundaries() {
        validateMicroGReplacementCounts(1, 1, 2, 1, 1)
        val cases = listOf(
            listOf(0, 1, 2, 1, 1),
            listOf(1, 0, 2, 1, 1),
            listOf(1, 1, 1, 1, 1),
            listOf(1, 1, 2, 0, 1),
            listOf(1, 1, 2, 1, 0),
        )
        cases.forEach { values ->
            assertFailsWith<IllegalStateException> {
                validateMicroGReplacementCounts(values[0], values[1], values[2], values[3], values[4])
            }
        }
    }

    /** Checks per-class count aggregation and skipping of unrelated classes. */
    @Test
    fun classDispatcherHandlesSupportedAndUnrelatedClassesAndAggregatesMethodCounts() {
        val owner = "Lcom/zing/zalo/ui/backuprestore/drive/ManageGoogleAccountView;"
        val first = immutableMethod(
            owner,
            "readFirst",
            instructions = listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 1, ImmutableStringReference("com.google")),
            ),
        )
        val second = immutableMethod(
            owner,
            "readSecond",
            instructions = listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 2, ImmutableStringReference("com.google")),
            ),
        )
        val counts = rewriteMicroGClass(
            owner,
            listOf(first to first.toMutable(), second to second.toMutable()),
        )
        assertEquals(2, counts.accountType)

        val unrelated = immutableMethod("Ltest/Unrelated;", "noop", instructions = emptyList())
        assertEquals(
            MicroGMethodReplacementCounts(),
            rewriteMicroGClass("Ltest/Unrelated;", listOf(unrelated to unrelated.toMutable())),
        )
    }

    /** Exercises all counted microG rewrites across synthetic classes and checks the final totals. */
    @Test
    @Suppress("LongMethod")
    fun classOrchestrationRunsSyntheticBindingPickerRefreshAndLauncherPaths() {
        val binding = immutableMethod(
            "Lo9/a;",
            "bind",
            instructions = listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 1, ImmutableStringReference("com.google.android.gms")),
                ImmutableInstruction21c(Opcode.CONST_STRING, 2, ImmutableStringReference("com.google")),
            ),
        )
        val accountType = immutableMethod(
            "Lcom/zing/zalo/ui/backuprestore/drive/ManageGoogleAccountView;",
            "readType",
            instructions = listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 1, ImmutableStringReference("com.google")),
            ),
        )
        val syncType = "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountBaseView;"
        val pickerOne = immutableMethod(syncType, "x6", listOf("Ljava/lang/String;"), 2, emptyList())
        val pickerTwo = immutableMethod(
            "Lcom/zing/zalo/ui/backuprestore/drive/ManageGoogleAccountView;",
            "I6",
            listOf("Ljava/lang/String;"),
            2,
            emptyList(),
        )
        val refresh = immutableMethod(
            syncType,
            "onActivityResult",
            instructions = listOf(
                ImmutableInstruction35c(
                    Opcode.INVOKE_VIRTUAL,
                    2,
                    0,
                    1,
                    0,
                    0,
                    0,
                    ImmutableMethodReference("Ltest/View;", "A6", listOf("Ljava/lang/String;"), "V"),
                ),
                ImmutableInstruction21c(Opcode.CONST_STRING, 2, ImmutableStringReference("authAccount")),
            ),
        )
        val launcher = immutableMethod(
            ZALO_LAUNCHER_CLASS,
            "onCreate",
            listOf("Landroid/os/Bundle;"),
            3,
            emptyList(),
        )
        val classes = listOf(
            classDef("Lo9/a;", binding),
            classDef("Lcom/zing/zalo/ui/backuprestore/drive/ManageGoogleAccountView;", accountType, pickerTwo),
            classDef(syncType, pickerOne, refresh),
            classDef(ZALO_LAUNCHER_CLASS, launcher),
            classDef("Lunrelated/Class;", immutableMethod("Lunrelated/Class;", "noop", instructions = emptyList())),
        )

        val mutableClasses = classes.associate { classDef: ClassDef -> classDef to classDef.toMutable() }
        val counts = rewriteMicroGClasses(classes) { mutableClasses.getValue(it) }
        assertEquals(MicroGMethodReplacementCounts(1, 2, 2, 1, 1), counts)
        assertEquals(
            listOf(MICROG_PACKAGE, MICROG_ACCOUNT_TYPE),
            strings(mutableClasses.getValue(classes.first()).methods.first()),
        )
    }

    /** Verifies that method rewriting replaces the refresh invoke with a counted static call. */
    @Test
    fun accountRefreshInvokeIsRewrittenByMethodOrchestration() {
        val source = immutableMethod(
            SYNC_GOOGLE_ACCOUNT_BASE_VIEW,
            "onActivityResult",
            instructions = listOf(
                ImmutableInstruction35c(
                    Opcode.INVOKE_VIRTUAL,
                    2,
                    1,
                    2,
                    0,
                    0,
                    0,
                    ImmutableMethodReference(
                        "Ltest/AccountView;",
                        "A6",
                        listOf("Ljava/lang/String;"),
                        "V",
                    ),
                ),
            ),
        )
        val mutable = source.toMutable()
        val counts = rewriteMicroGMethod(
            SYNC_GOOGLE_ACCOUNT_BASE_VIEW,
            source,
            mutable,
            "com.google" to MICROG_ACCOUNT_TYPE,
        )
        assertEquals(1, counts.accountRefresh)
        assertEquals(Opcode.INVOKE_STATIC, mutable.implementation!!.instructions.first().opcode)
    }
}
