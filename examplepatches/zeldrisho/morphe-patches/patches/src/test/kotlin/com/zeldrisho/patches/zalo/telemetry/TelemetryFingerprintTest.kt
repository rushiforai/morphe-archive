package com.zeldrisho.patches.zalo.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

class TelemetryFingerprintTest {
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

    private data class DaoTarget(
        val fingerprint: Fingerprint,
        val owner: String,
        val methodName: String,
        val result: String,
        val parameters: List<String>,
        val sink: String,
        val flags: Int,
    )

    private val daoTargets by lazy {
        listOf(
            DaoTarget(telemetryFingerprints[0], "Lpj/i;", "c", "I", listOf("Lpj/j;"), "f", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value),
            DaoTarget(telemetryFingerprints[1], "Lpj/g;", "F", "V", listOf("Lpj/h;"), "f", AccessFlags.PUBLIC.value),
            DaoTarget(telemetryFingerprints[2], "Lpj/k;", "b", "V", listOf("Lpj/l;"), "i", AccessFlags.PUBLIC.value),
            DaoTarget(
                telemetryFingerprints[3],
                "Lpj/c;",
                "b",
                "I",
                listOf("Ljava/util/ArrayList;"),
                "g",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            ),
        )
    }

    /** Builds a telemetry DAO candidate with the target signature and a configurable sink call. */
    private fun daoClass(target: DaoTarget, sink: String): ImmutableClassDef {
        val parameters = target.parameters.map { ImmutableMethodParameter(it, emptySet(), null) }
        val method = ImmutableMethod(
            target.owner,
            target.methodName,
            parameters,
            target.result,
            target.flags,
            emptySet(),
            emptySet(),
            ImmutableMethodImplementation(
                2,
                listOf(
                    ImmutableInstruction35c(
                        Opcode.INVOKE_VIRTUAL,
                        1,
                        0,
                        0,
                        0,
                        0,
                        0,
                        ImmutableMethodReference("Lu5/d;", sink, emptyList(), "V"),
                    ),
                ),
                emptyList(),
                emptyList(),
            ),
        )
        return ImmutableClassDef(
            target.owner,
            AccessFlags.PUBLIC.value,
            "Ljava/lang/Object;",
            emptyList(),
            null,
            emptySet(),
            emptyList(),
            listOf(method),
        )
    }

    /** Verifies each telemetry DAO matches its expected sink and rejects a substituted sink. */
    @Test
    fun analyticsDaoFingerprintsMatchTheirExpectedSinkAndRejectOneConstraintNearMiss() {
        with(context()) {
            daoTargets.forEach { target ->
                target.fingerprint.clearMatch()
                assertEquals(
                    target.methodName,
                    target.fingerprint.matchAll(daoClass(target, target.sink), 1..1)
                        .single().originalMethod.name,
                )

                target.fingerprint.clearMatch()
                assertNull(target.fingerprint.matchOrNull(daoClass(target, "notTheSink")))
            }
        }
    }

    /** Runs the telemetry callback against ZALO_TEST_APK, skipping when the input is unset. */
    @Test
    fun telemetryPatchCallbackRunsAgainstPinnedZaloDex() {
        val path = System.getenv("ZALO_TEST_APK")
        assumeTrue("Set ZALO_TEST_APK to the pinned Zalo base APK", !path.isNullOrBlank())
        val config = PatcherConfig(apkFile = File(path!!), temporaryFilesPath = temporary.newFolder())
        val metadata = PackageMetadata::class.java.constructors.single().newInstance(
            "com.zing.zalo",
            "26.08.01",
            "260801903",
            null,
        )
        val patchContext = BytecodePatchContext::class.java
            .getConstructor(PatcherConfig::class.java, PackageMetadata::class.java)
            .newInstance(config, metadata)
        try {
            BytecodePatchContext::class.java
                .getMethod("decodeDexFiles\$morphe_patcher")
                .invoke(patchContext)
            disableZaloTelemetryPatch.execute(patchContext)
        } finally {
            patchContext.close()
        }
    }
}
