import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.apk.ApkUtils
import app.morphe.patcher.patch.PatchBundleSignature
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.runBlocking
import java.io.File

/**
 * Applies a Morphe patch bundle to an APK.
 *
 * usage: MainKt verify <bundle.mpp> [expected-public-key-file]
 *        MainKt sign <bundle.mpp> <private-key-file>
 *        MainKt <input.apk> <bundle.mpp> <output.apk> [keystore.jks] [expected-public-key-file]
 */
fun main(args: Array<String>) {
    if (args.getOrNull(0) == "verify") {
        val bundle = File(args[1])
        val publicKey = PatchBundleSignature.verify(bundle) ?: error("bundle is unsigned")
        println("public key : $publicKey")
        println("fingerprint: ${PatchBundleSignature.fingerprint(publicKey)}")
        args.getOrNull(2)?.let { path ->
            val expected = File(path).readText().trim()
            require(expected == publicKey) {
                "signature key mismatch: expected $expected, bundle is signed by $publicKey"
            }
            println("trusted    : yes (matches $path)")
        }
        println("loads      : ${loadPatchesFromJar(setOf(bundle)).map { it.name }}")
        return
    }

    if (args.getOrNull(0) == "sign") {
        val bundle = File(args[1])
        val publicKey = PatchBundleSignature.sign(bundle, File(args[2]).readText())
        val verified = PatchBundleSignature.verify(bundle)
        require(verified == publicKey) { "signature does not verify after signing" }
        println("public key : $publicKey")
        println("fingerprint: ${PatchBundleSignature.fingerprint(publicKey)}")
        println("loads      : ${loadPatchesFromJar(setOf(bundle)).map { it.name }}")
        println("signed     : ${bundle.absolutePath} (${bundle.length()} bytes)")
        return
    }

    val input = File(args[0])
    val bundle = File(args[1])
    val output = File(args[2])

    // Never apply unsigned or unexpected code: the bundle decides what runs against the APK.
    val signer = PatchBundleSignature.verify(bundle)
        ?: throw IllegalStateException("$bundle is unsigned; refusing to apply it")
    args.getOrNull(4)?.let { path ->
        val expected = File(path).readText().trim()
        require(expected == signer) {
            "signature key mismatch: expected $expected, bundle is signed by $signer"
        }
    }
    println("bundle signed by ${PatchBundleSignature.fingerprint(signer)}")
    val keystore = File(args.getOrElse(3) { "quetta-patched.jks" })

    val patches = loadPatchesFromJar(setOf(bundle)).toSet()
    println("loaded ${patches.size} patch(es): ${patches.map { it.name }}")

    val selected = args.getOrNull(5)?.split(",")?.map { it.trim() }?.filter { it.isNotEmpty() }
    val active = if (selected == null) patches else patches.filter { patch ->
        selected.any { token -> patch.name?.contains(token, ignoreCase = true) == true }
    }.toSet()
    require(active.isNotEmpty()) { "no patch matched ${selected}" }

    val failures = mutableListOf<String>()
    Patcher(PatcherConfig(input, File("morphe-temporary-files"), emptySet(), BytecodeMode.FULL)).use { patcher ->
        patcher += active
        runBlocking {
            patcher().collect { result ->
                val name = result.patch.name
                val failure = result.exception
                if (failure == null) println("OK   $name") else {
                    println("FAIL $name: ${failure.message}")
                    failure.printStackTrace()
                    failures += (name ?: "unnamed")
                }
            }
        }
        if (failures.isNotEmpty()) {
            throw IllegalStateException("patches failed: $failures")
        }

        val patched = patcher.get()
        val unsigned = File(output.parentFile ?: File("."), output.nameWithoutExtension + "-unsigned.apk")
        input.copyTo(unsigned, overwrite = true)
        with(ApkUtils) {
            patched.applyTo(unsigned)
            signApk(
                unsigned,
                output,
                "quetta",
                ApkUtils.KeyStoreDetails(keystore, "quetta", "quetta-patched", "quetta-patched"),
                32,
            )
        }
        unsigned.delete()
        println("signed: $output (${output.length()} bytes)")
    }
}
