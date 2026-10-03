package com.zeldrisho.patches.zalo.media

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals

/** Opt-in end-to-end callback qualification against the pinned Zalo base DEX. */
class SendOriginalMediaPatchCallbackApkTest {
    @get:Rule val temporary = TemporaryFolder()

    /**
     * Runs the original-media callback and checks the selected-quality replacement opcodes.
     *
     * Requires ZALO_TEST_APK; skips when the pinned base APK is not supplied.
     */
    @Test
    fun fullCallbackMatchesAndTransformsPinnedTarget() {
        val path = System.getenv("ZALO_TEST_APK")
        assumeTrue("Set ZALO_TEST_APK to the pinned Zalo base APK", !path.isNullOrBlank())
        val config = PatcherConfig(
            apkFile = File(path!!),
            temporaryFilesPath = temporary.newFolder(),
        )
        val metadata = PackageMetadata::class.java.constructors.single().newInstance(
            "com.zing.zalo",
            "26.08.01",
            "260801903",
            null,
        )
        val context = BytecodePatchContext::class.java
            .getConstructor(PatcherConfig::class.java, PackageMetadata::class.java)
            .newInstance(config, metadata)
        try {
            BytecodePatchContext::class.java
                .getMethod("decodeDexFiles\$morphe_patcher")
                .invoke(context)
            sendZaloOriginalMediaPatch.execute(context)
            with(context) {
                assertEquals(
                    listOf(Opcode.CONST_4, Opcode.RETURN),
                    SelectedMediaQuality.method.implementation!!.instructions.take(2).map { it.opcode },
                )
            }
        } finally {
            context.close()
        }
    }
}
