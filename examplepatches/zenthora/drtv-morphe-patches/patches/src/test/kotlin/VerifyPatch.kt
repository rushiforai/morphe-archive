package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking
import java.io.File

fun main() = runBlocking {
    val mppFile = File("build/libs/patches-1.0.0.mpp")
    val inputApk = File(System.getenv("DRTV_APK") ?: error("Set DRTV_APK to an unpatched dk.dr.tvplayer APK"))
    val outputApk = File(System.getenv("DRTV_OUT") ?: "drtv-morphe-patched.apk")
    val tempDir = File("/tmp/morphe-verify-drtv")

    println("Loading patches from: ${mppFile.absolutePath}")
    val patches = loadPatchesFromJar(setOf(mppFile))
    println("Loaded ${patches.size} patch(es): ${patches.map { it.name }}")

    inputApk.copyTo(outputApk, overwrite = true)

    Patcher(
        PatcherConfig(
            apkFile = outputApk,
            temporaryFilesPath = tempDir,
            validate = true,
        )
    ).use { patcher ->
        patcher += patches
        patcher().collect { result ->
            if (result.exception != null) {
                System.err.println("PATCH FAILED: ${result.patch.name}")
                result.exception!!.printStackTrace()
                throw result.exception!!
            } else {
                println("PATCH SUCCEEDED: ${result.patch.name}")
            }
        }
        val patcherResult = patcher.get()
        println("Applying patcherResult (dexFiles=${patcherResult.dexFiles.size}, resFiles=${patcherResult.resources.resourcesApk != null})...")
        patcherResult.applyTo(outputApk)
    }
    println("Successfully generated Morphe-patched APK: ${outputApk.absolutePath} (${outputApk.length()} bytes)")
}
