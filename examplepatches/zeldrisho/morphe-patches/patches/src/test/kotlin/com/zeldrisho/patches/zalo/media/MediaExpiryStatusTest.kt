package com.zeldrisho.patches.zalo.media

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class MediaExpiryStatusTest {
    @get:Rule val temporary = TemporaryFolder()

    private fun context(): BytecodePatchContext {
        val config = PatcherConfig(
            apkFile = temporary.newFile("input.apk"),
            temporaryFilesPath = temporary.newFolder(),
        )
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

    @Test
    fun matchesPinnedZaloApk() {
        val path = System.getenv("ZALO_TEST_APK")
        assumeTrue("Set ZALO_TEST_APK to the pinned Zalo base APK", !path.isNullOrBlank())
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val clazz = container.dexEntryNames.asSequence()
            .map { container.getEntry(it)!!.dexFile.classes }
            .flatMap { it.asSequence() }
            .first { it.type == "Lvk0/g;" }

        with(context()) {
            MediaExpiryStatus.clearMatch()
            val matches = MediaExpiryStatus.matchAll(clazz, 1..1)
            assertEquals(1, matches.size)
            val method = matches.single().originalMethod
            assertEquals("n", method.name)
            assertTrue(method.accessFlags and 0x10 != 0, "target method must remain final")
        }
    }
}
