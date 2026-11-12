import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.dex.SdkDexVerifier
import app.morphe.patcher.dex.DexVerifier
import java.util.zip.ZipFile
import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.flow.collect

/** Applies the actual built patch and emits DEX/resources; never touches a device. */
fun main(args: Array<String>) = runBlocking {
    val original = File(args[0])
    val bundle = File(args[1])
    val out = File(args[2]).apply { mkdirs() }
    val patches = loadPatchesFromJar(setOf(bundle)).filter { it.name == "Anytype custom font" }.toSet()
    check(patches.size == 1) { "Anytype patch not found" }
    val sdk = SdkDexVerifier(File(args[3]), "36.0.0")
    val baseline = File(out, "baseline").apply { mkdirs() }
    ZipFile(original).use { zip -> zip.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.forEach { entry ->
        zip.getInputStream(entry).use { input -> File(baseline, entry.name).outputStream().use { input.copyTo(it) } }
    } }
    fun issues(dir: File): Set<String> {
        try { sdk.verifyDexDirectory(dir); return emptySet() }
        catch (error: Exception) {
            val message = error.message.orEmpty()
            if (!message.startsWith("Cross-DEX class hierarchy verification found")) throw error
            return message.lineSequence().map { it.trim() }.filter { it.matches(Regex("[0-9]+\\. .*")) }
                .map { it.replaceFirst(Regex("^[0-9]+\\. "), "").replace(Regex(" \\(classes[0-9]*\\.dex\\)"), "") }.toSet()
        }
    }
    val known = issues(baseline)
    File(out, "baseline-issues.txt").writeText(known.sorted().joinToString("\n"))
    val verifier = object : DexVerifier {
        override fun verifyDexFile(file: File) = sdk.verifyDexFile(file)
        override fun verifyApkFile(file: File) = sdk.verifyApkFile(file)
        override fun verifyDexDirectory(dir: File) {
            val actual = issues(dir)
            check(actual == known) { "DEX issues changed: added=${actual - known}; removed=${known - actual}" }
            println("DEX_BASELINE_OK: ${actual.size} existing optional-library references, no new issues")
        }
    }
    Patcher(PatcherConfig(apkFile = original, temporaryFilesPath = File(out, "work"),
        verifier = verifier)).use { patcher ->
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
