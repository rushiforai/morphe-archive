package io.github.warleysr.nsfwblocker.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import java.io.File
import kotlin.io.path.createTempDirectory

class Reddit2026_44_0_PatchTest {
    @Test
    fun testPatchReddit2026_44_0() {
        val apk = File("""C:\Users\safe\Downloads\Reddit-v2026.44.0-Morphe_Patches-v2.0.0-dev.1.apk""")
        assumeTrue(apk.exists(), "Reference APK must exist to run integration patch test")

        val workspace = createTempDirectory("nsfw-test-44").toFile()
        Patcher(PatcherConfig(apk, workspace)).use { patcher ->
            patcher += setOf(blockNsfwContentPatch)
            runBlocking {
                patcher().collect { result ->
                    println("Patch result for ${result.patch.name}: exception=${result.exception}")
                    result.exception?.let { throw it }
                }
            }
        }
    }
}
