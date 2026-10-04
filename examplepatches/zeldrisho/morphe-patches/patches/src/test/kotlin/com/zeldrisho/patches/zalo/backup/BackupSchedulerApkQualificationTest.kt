package com.zeldrisho.patches.zalo.backup

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals

/** Opt-in validation that the scheduler fingerprint uniquely identifies the pinned APK method. */
class BackupSchedulerApkQualificationTest {
    @get:Rule val temporary = TemporaryFolder()

    /** Creates an isolated Zalo patch context for class-scoped fingerprint matching. */
    private fun context(): BytecodePatchContext {
        val config = PatcherConfig(apkFile = temporary.newFile("input.apk"), temporaryFilesPath = temporary.newFolder())
        val metadata = PackageMetadata::class.java.constructors.single().newInstance(
            "com.zing.zalo",
            "26.08.01",
            "260801903",
            null,
        )
        return BytecodePatchContext::class.java.getConstructor(PatcherConfig::class.java, PackageMetadata::class.java)
            .newInstance(config, metadata)
    }

    /** Checks the unique scheduler signature in ZALO_TEST_APK, skipping when the input is unset. */
    @Test
    fun matchesUniqueNativeSchedulerInPinnedApk() {
        val path = System.getenv("ZALO_TEST_APK")
        assumeTrue("Set ZALO_TEST_APK to the pinned Zalo base APK", !path.isNullOrBlank())
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val schedulerClass = container.dexEntryNames.asSequence()
            .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
            .single { it.type == "Lml/c;" }
        with(context()) {
            BackupScheduler.clearMatch()
            val match = BackupScheduler.matchAll(schedulerClass, 1..1).single()
            assertEquals("g", match.originalMethod.name)
            assertEquals(listOf("I"), match.originalMethod.parameterTypes)
            overrideBackupInterval(match.originalMethod.toMutable(), "6")
        }
    }
}
