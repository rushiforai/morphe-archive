package io.github.warleysr.nsfwblocker.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import java.io.File
import kotlin.io.path.createTempDirectory

class Reddit2026_42_0_PatchTest {
    @Test
    fun testPatchReddit2026_42_0() {
        val apk = File("""C:\Users\safe\StudioProjects\reddit-nsfw-blocker\base.apk""")
        assumeTrue(apk.exists(), "Base APK must exist to run integration patch test")

        val workspace = createTempDirectory("nsfw-test-42").toFile()
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
