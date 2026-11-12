import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.dex.SdkDexVerifier
import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking

/** Applies to an original APK and verifies changed dex; no phone access. */
fun main(args: Array<String>) = runBlocking {
    val output = File(args[2]).apply { mkdirs() }
    val selected = loadPatchesFromJar(setOf(File(args[1])))
        .single { it.name == "Brave font picker in settings" }
    Patcher(PatcherConfig(
        apkFile = File(args[0]),
        temporaryFilesPath = File(output, "work"),
        verifier = SdkDexVerifier(File(args[3]), "36.0.0"),
    )).use { patcher ->
        patcher += setOf(selected)
        patcher().collect { result ->
            println("PATCH ${result.patch.name}: ${result.exception ?: "OK"}")
            result.exception?.let { throw it }
        }
        val result = patcher.get()
        result.dexFiles?.forEach { dex ->
            File(output, dex.name).outputStream().use { dex.stream.copyTo(it) }
        }
        val root = File(output, "work/apk")
        val manifest = File(root, "AndroidManifest.xml").readText()
        check(manifest.contains("app.fontism.extension.brave.BraveFontSettingsActivity"))
        check(manifest.contains("app.fontism.extension.brave.BraveRestartActivity"))
        val menus = File(root, "resources").walkTopDown().filter {
            it.isFile && it.extension == "xml" && it.readText().contains("brave_custom_font")
        }.toList()
        check(menus.size == 1) { "Expected one Brave custom font preference" }
        check(menus.single().readText().contains("android:targetPackage=\"com.brave.browser\""))
        check(File(root, "root/lib/arm64-v8a/libfontism_brave_233.so").isFile)
        check(File(root, "uncompressed-files.json").readText().contains("libfontism_brave_233.so"))
        println("BRAVE_SMOKE_OK dex=${result.dexFiles?.size}")
    }
}
