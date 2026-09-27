package com.zeldrisho.patches.bundle

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.io.ByteArrayInputStream
import java.io.File
import java.util.zip.ZipFile

/** Verifies the ABI consumed by injected invoke-static instructions in the bundle. */
private val contractsByArtifact = linkedMapOf(
    "extensions/extension.mpe" to listOf(
        Contract("Lcom/zeldrisho/threads/extension/FeedAdFilter;", "filterAds", listOf("Ljava/util/List;"), "Ljava/util/List;"),
    ),
    "extensions/zalo.mpe" to listOf(
        Contract("Lcom/zeldrisho/zalo/extension/ZaloMicroGSupport;", "checkGmsCore", listOf("Landroid/app/Activity;"), "Z"),
        Contract("Lcom/zeldrisho/zalo/extension/ZaloMicroGSupport;", "scheduleAccountRefresh", listOf("Ljava/lang/Object;", "Ljava/lang/String;"), "V"),
    ),
)

/** Expected embedded extension paths; kept public for isolated archive-shape tests. */
internal val expectedEmbeddedExtensionPaths: Set<String> = contractsByArtifact.keys

/** Rejects missing or cross-app extension artifacts before attempting DEX parsing. */
internal fun verifyEmbeddedExtensionEntries(entries: Set<String>) {
    val embedded = entries.filter { it.endsWith(".mpe") }.toSet()
    check(embedded == expectedEmbeddedExtensionPaths) {
        "Bundle contains unexpected or cross-app extension artifacts: $embedded; " +
            "expected: $expectedEmbeddedExtensionPaths"
    }
}

fun main(args: Array<String>) {
    require(args.size == 1) { "usage: <mpp>" }
    ZipFile(File(args[0])).use { zip ->
        verifyEmbeddedExtensionEntries(zip.entries().asSequence().map { it.name }.toSet())
        contractsByArtifact.forEach { (artifact, contracts) ->
            val entry = zip.getEntry(artifact) ?: error("Bundle is missing $artifact")
            val bytes = zip.getInputStream(entry).use { it.readBytes() }
            val file = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), ByteArrayInputStream(bytes))
            val methods = file.classes.flatMap { it.methods }.toList()
            contracts.forEach { contract ->
                val matches = methods.filter {
                    it.definingClass == contract.owner && it.name == contract.name &&
                        it.parameterTypes == contract.parameters && it.returnType == contract.returnType
                }
                check(matches.size == 1) { "$artifact must contain exactly one ${contract.descriptor}; found ${matches.size}" }
                val flags = matches.single().accessFlags
                check(AccessFlags.PUBLIC.isSet(flags) && AccessFlags.STATIC.isSet(flags)) {
                    "$artifact ${contract.descriptor} must be public static"
                }
            }
        }
    }
}

private data class Contract(
    val owner: String,
    val name: String,
    val parameters: List<String>,
    val returnType: String,
) {
    val descriptor: String get() = "$owner->$name(${parameters.joinToString("")})$returnType"
}
