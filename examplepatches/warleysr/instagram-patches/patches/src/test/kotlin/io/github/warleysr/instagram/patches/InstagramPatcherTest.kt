package io.github.warleysr.instagram.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import java.io.File
import kotlin.test.Test
import kotlin.test.assertNull
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.flow.toList

class InstagramPatcherTest {
    @Test
    fun testPatchInstagram() = runBlocking {
        val apkPath = System.getenv("INSTAGRAM_APK_PATH") ?: """C:\Users\safe\Downloads\Instagram-v452.1.0.53.64-Piko-v3.11.0-dev.4.apk"""
        val apkFile = File(apkPath)
        if (!apkFile.exists()) {
            println("Test APK not found at ${apkFile.absolutePath}, skipping test.")
            return@runBlocking
        }

        val tempDir = File("build/tmp/patcher-test")
        tempDir.mkdirs()
        val config = PatcherConfig(
            apkFile = apkFile,
            temporaryFilesPath = tempDir
        )
        Patcher(config).use { patcher ->
            patcher += setOf(
                carouselAutoScrollPatch,
                keepScreenOnWhilePlayingPatch,
                hookOverflowMenuButton,
                includeButtonsInOverflowMenuArrayPatch,
                hookOverflowMenuButtonOnClickPatch
            )
            val results = patcher().toList()
            for (res in results) {
                println("PATCH_RESULT: name='${res.patch.name}' success=${res.exception == null} error='${res.exception?.message}'")
                assertNull(res.exception, "Patch failed: ${res.patch.name} - ${res.exception?.message}")
            }
        }
    }
}
