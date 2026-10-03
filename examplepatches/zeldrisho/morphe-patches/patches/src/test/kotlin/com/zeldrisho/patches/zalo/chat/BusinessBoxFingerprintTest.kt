package com.zeldrisho.patches.zalo.chat

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class BusinessBoxFingerprintTest {
    @get:Rule val temporary = TemporaryFolder()

    /** Creates an isolated Zalo patch context for class-scoped fingerprint matching. */
    private fun context(): BytecodePatchContext {
        val config = PatcherConfig(apkFile = temporary.newFile(), temporaryFilesPath = temporary.newFolder())
        val metadata = PackageMetadata::class.java.constructors.single().newInstance(
            "com.zing.zalo",
            "26.08.01",
            "260801903",
            null,
        )
        return BytecodePatchContext::class.java
            .getConstructor(PatcherConfig::class.java, PackageMetadata::class.java)
            .newInstance(config, metadata)
    }

    /** Wraps one synthetic method in a public class with the supplied descriptor. */
    private fun classDef(type: String, method: ImmutableMethod) = ImmutableClassDef(
        type,
        AccessFlags.PUBLIC.value,
        "Ljava/lang/Object;",
        emptyList(),
        null,
        emptySet(),
        emptyList(),
        listOf(method),
    )

    /** Builds a business-box insertion candidate with a configurable enum field name. */
    private fun insertionMethod(fieldName: String) = ImmutableMethod(
        "Lje0/u;",
        "G",
        listOf(
            "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;",
            "Ljava/util/ArrayList;",
            "I",
            "Z",
            "I",
            "Lje0/p;",
        ).map { com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(it, emptySet(), null) },
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            2,
            listOf(
                ImmutableInstruction21c(
                    Opcode.SGET_OBJECT,
                    0,
                    ImmutableFieldReference("Lsx/a;", fieldName, "Lsx/a;"),
                ),
                ImmutableInstruction35c(
                    Opcode.INVOKE_DIRECT,
                    2,
                    0,
                    1,
                    0,
                    0,
                    0,
                    ImmutableMethodReference(
                        "Lq00/a;",
                        "<init>",
                        listOf(
                            "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;",
                            "Ljava/lang/String;",
                        ),
                        "V",
                    ),
                ),
            ),
            emptyList(),
            emptyList(),
        ),
    )

    /** Builds a periodic business-box branch with a configurable category literal. */
    private fun periodicMethod(category: String) = ImmutableMethod(
        "Lof1/o;",
        "a",
        emptyList(),
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            2,
            listOf(
                ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 1, ImmutableTypeReference("Lq00/a;")),
                ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1),
                ImmutableInstruction21c(
                    Opcode.CHECK_CAST,
                    0,
                    ImmutableTypeReference("Lq00/a;"),
                ),
                ImmutableInstruction21c(
                    Opcode.CONST_STRING,
                    1,
                    ImmutableStringReference(category),
                ),
            ),
            emptyList(),
            emptyList(),
        ),
    )

    /** Verifies a matching insertion shape and rejects a different business-box enum field. */
    @Test
    fun insertionFingerprintRequiresBothBusinessMarkerAndConstructor() {
        with(context()) {
            BusinessBoxListInsertionFingerprint.clearMatch()
            assertEquals(
                "G",
                BusinessBoxListInsertionFingerprint.matchAll(
                    classDef("Lje0/u;", insertionMethod("BizBox")),
                    1..1,
                ).single().originalMethod.name,
            )
            BusinessBoxListInsertionFingerprint.clearMatch()
            assertTrue(
                BusinessBoxListInsertionFingerprint.matchAll(
                    classDef("Lje0/u;", insertionMethod("OtherBox")),
                    0..1,
                ).isEmpty(),
            )
        }
    }

    /** Verifies the business category matches while an ordinary-thread category is rejected. */
    @Test
    fun periodicFingerprintRequiresBusinessCategoryLiteral() {
        with(context()) {
            BusinessBoxPeriodicBranchFingerprint.clearMatch()
            assertEquals(
                "a",
                BusinessBoxPeriodicBranchFingerprint.matchAll(
                    classDef("Lof1/o;", periodicMethod("business_box_thread")),
                    1..1,
                ).single().originalMethod.name,
            )
            BusinessBoxPeriodicBranchFingerprint.clearMatch()
            assertTrue(
                BusinessBoxPeriodicBranchFingerprint.matchAll(
                    classDef("Lof1/o;", periodicMethod("ordinary_thread")),
                    0..1,
                ).isEmpty(),
            )
        }
    }
}
