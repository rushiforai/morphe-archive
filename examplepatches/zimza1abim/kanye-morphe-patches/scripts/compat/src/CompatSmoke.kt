import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.dex.DexVerificationException
import app.morphe.patcher.dex.DexVerifier
import app.morphe.patcher.dex.SdkDexVerifier
import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import java.util.zip.ZipFile
import kotlin.system.exitProcess
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking

private val ISSUE_LINE = Regex("""^\s*\d+\.\s+(.+)$""")
private val DEX_NAME = Regex(""" \(classes\d*\.dex\)""")

/** Numbered issue lines of a verification failure, without the dex file name (patching re-packs classes). */
private fun issuesOf(error: DexVerificationException): Set<String> =
    error.message.orEmpty().lines()
        .mapNotNull { ISSUE_LINE.find(it)?.groupValues?.get(1) }
        .map { it.replace(DEX_NAME, "") }
        .toSet()

/**
 * Fails only on verification issues the patches introduced. Some apps ship dex that
 * already references optional classes they never bundle (Anytype: Sentry integrations,
 * x5 template helpers); those issues are measured on the original APK first.
 */
private class BaselineDexVerifier(
    private val delegate: DexVerifier,
    private val baseline: Set<String>,
) : DexVerifier {
    private fun check(block: () -> Unit) {
        try {
            block()
        } catch (error: DexVerificationException) {
            val issues = issuesOf(error)
            if (issues.isEmpty()) throw error
            val introduced = issues - baseline
            if (introduced.isNotEmpty()) {
                throw DexVerificationException(
                    "Patched dex introduced ${introduced.size} verification issue(s):\n" +
                        introduced.joinToString("\n") { "  - $it" },
                )
            }
            println("DEX_BASELINE_IGNORED ${issues.size} issue(s) already present in the original APK")
        }
    }

    override fun verifyDexFile(file: File) = check { delegate.verifyDexFile(file) }
    override fun verifyDexDirectory(directory: File) = check { delegate.verifyDexDirectory(directory) }
    override fun verifyApkFile(file: File) = check { delegate.verifyApkFile(file) }
}

private fun baselineIssues(apk: File, verifier: DexVerifier, workDirectory: File): Set<String> {
    val directory = File(workDirectory, "original-dex").apply { deleteRecursively(); mkdirs() }
    ZipFile(apk).use { zip ->
        zip.entries().asSequence()
            .filter { Regex("""classes\d*\.dex""").matches(it.name) }
            .forEach { entry ->
                zip.getInputStream(entry).use { input ->
                    File(directory, entry.name).outputStream().use(input::copyTo)
                }
            }
    }
    return try {
        verifier.verifyDexDirectory(directory)
        emptySet()
    } catch (error: DexVerificationException) {
        issuesOf(error)
    } finally {
        directory.deleteRecursively()
    }
}

/**
 * Applies the named patches (plus their dependencies) to an original APK and
 * verifies the rewritten dex. Never installs or executes the APK.
 * Args: apk, mpp, output directory, Android SDK, patch names separated by '|'.
 */
fun main(args: Array<String>) {
    val ok = runBlocking {
        val apk = File(args[0])
        val output = File(args[2]).apply { mkdirs() }
        val names = args[4].split('|').filter(String::isNotBlank).toSet()
        val selected = loadPatchesFromJar(setOf(File(args[1]))).filter { it.name in names }.toSet()
        val missing = names - selected.map { it.name }.toSet()
        if (missing.isNotEmpty()) {
            println("SMOKE_FAILED missing patches in bundle: $missing")
            return@runBlocking false
        }
        val sdkVerifier = SdkDexVerifier(File(args[3]), "36.0.0")
        val baseline = baselineIssues(apk, sdkVerifier, output)
        println("DEX_BASELINE ${baseline.size} issue(s) in the original APK")

        var failed = false
        Patcher(PatcherConfig(
            apkFile = apk,
            temporaryFilesPath = File(output, "work"),
            verifier = BaselineDexVerifier(sdkVerifier, baseline),
        )).use { patcher ->
            patcher += selected
            patcher().collect { result ->
                println("PATCH ${result.patch.name}: ${result.exception ?: "OK"}")
                result.exception?.let { failed = true; it.printStackTrace(System.out) }
            }
            if (!failed) {
                try {
                    val dexFiles = patcher.get().dexFiles.orEmpty()
                    println("DEX_FILES ${dexFiles.size}")
                } catch (error: DexVerificationException) {
                    failed = true
                    println("DEX_VERIFICATION_FAILED ${error.message}")
                }
            }
        }
        !failed
    }
    println(if (ok) "SMOKE_OK" else "SMOKE_FAILED")
    exitProcess(if (ok) 0 else 1)
}
