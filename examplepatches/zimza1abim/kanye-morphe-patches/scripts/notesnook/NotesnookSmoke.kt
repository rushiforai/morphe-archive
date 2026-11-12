import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.dex.SdkDexVerifier
import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.flow.collect

/** Applies the actual built patch and emits DEX/resources; never touches a device. */
fun notesnookSmoke(args: Array<String>) = runBlocking {
    val original = File(args[0])
    val bundle = File(args[1])
    val out = File(args[2]).apply { mkdirs() }
    val patches = loadPatchesFromJar(setOf(bundle)).filter { it.name == "Notesnook custom font" }.toSet()
    check(patches.size == 1) { "Notesnook patch not found" }
    Patcher(PatcherConfig(apkFile = original, temporaryFilesPath = File(out, "work"),
        verifier = SdkDexVerifier(File(args[3]), "36.0.0"))).use { patcher ->
        patcher += patches
        patcher().collect { result ->
            println("PATCH ${result.patch.name}: ${result.exception ?: "OK"}")
            result.exception?.let { throw it }
        }
        val result = patcher.get()
        result.dexFiles?.forEach { dex -> File(out, dex.name).outputStream().use { dex.stream.copyTo(it) } }
        result.resources?.let { resources ->
            resources.resourcesApk?.copyTo(File(out, "resources.apk"), overwrite = true)
            resources.otherResources?.copyRecursively(File(out, "other"), overwrite = true)
        }
        println("SMOKE_OK: actual patch application and DEX/resource compilation complete")
    }
}

fun main(args: Array<String>) = notesnookSmoke(args)
