package com.zeldrisho.patches.threads.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.zeldrisho.patches.threads.links.WebLinkHandler
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import java.util.zip.ZipFile
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/** Opt-in real-APKM runner for the exact committed production fingerprints. */
class ThreadsFingerprintApkmHarnessTest {
    @get:Rule val temp = TemporaryFolder()

    /** Creates an isolated Threads patch context for the supplied version and version code. */
    private fun context(version: String, code: String): BytecodePatchContext {
        val config = PatcherConfig(apkFile = temp.newFile("input-$version.apk"), temporaryFilesPath = temp.newFolder())
        val metadata = PackageMetadata::class.java.constructors.single().newInstance(
            "com.instagram.barcelona",
            version,
            code,
            null,
        )
        return BytecodePatchContext::class.java
            .getConstructor(PatcherConfig::class.java, PackageMetadata::class.java)
            .newInstance(config, metadata)
    }

    /** Loads classes from every DEX in every APK member of the supplied bundle. */
    private fun classes(apkm: File): List<ClassDef> {
        val result = mutableListOf<ClassDef>()
        ZipFile(apkm).use { bundle ->
            val entries = bundle.entries().asSequence().filter { it.name.endsWith(".apk") }.toList()
            for ((index, entry) in entries.withIndex()) {
                val apk = temp.newFile("split-${apkm.name.hashCode()}-$index.apk")
                bundle.getInputStream(entry).use { input -> apk.outputStream().use(input::copyTo) }
                val dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
                dex.dexEntryNames.forEach { dexName ->
                    result += dex.getEntry(dexName)!!.dexFile.classes
                }
            }
        }
        return result
    }

    /** Collects fingerprint matches across classes, clearing cached matches before each class. */
    private fun scan(classes: List<ClassDef>, fingerprint: Fingerprint, patchContext: BytecodePatchContext) = buildList {
        with(patchContext) {
            classes.forEach { owner ->
                fingerprint.clearMatch()
                addAll(fingerprint.matchAll(owner, 0..Int.MAX_VALUE))
            }
        }
    }

    /** Counts feed and link targets, resolving dependent fingerprints only from unique anchors. */
    private fun matchCounts(apkm: File, version: String, code: String): Map<String, Int> {
        val all = classes(apkm)
        val patchContext = context(version, code)
        with(patchContext) {
            FeedMergeMethod.clearMatch()
            MediaAdPredicateHelper.clearMatch()
            FeedContentAccessor.clearMatch()
            val helper = scan(all, MediaAdPredicateHelper, patchContext)
            val mediaPredicate = if (helper.size == 1) {
                val ref = helper.single().originalMethod
                scan(all, mediaAdPredicate(ref), patchContext)
            } else {
                emptyList()
            }
            println("$version Media predicate candidates: " + mediaPredicate.joinToString { "${it.originalMethod.definingClass}->${it.originalMethod.name}()${it.originalMethod.returnType}" })
            val anchors = scan(all, FeedContentAccessor, patchContext)
            val mediaAccessors = if (anchors.size == 1) {
                scan(all, feedWrapperAccessor(anchors.single().originalMethod, "Lcom/instagram/feed/media/Media;"), patchContext)
            } else {
                emptyList()
            }
            val threadAccessors = if (anchors.size == 1) {
                scan(all, feedThreadAccessor(anchors.single().originalMethod), patchContext)
            } else {
                emptyList()
            }
            val threadItemsAccessors = if (threadAccessors.size == 1) {
                scan(all, threadItemsAccessor(threadAccessors.single().originalMethod), patchContext)
            } else {
                emptyList()
            }
            val itemMediaAccessors = scan(all, threadItemMediaAccessor(), patchContext)
            return linkedMapOf(
                "helper" to helper.size,
                "Media predicate" to mediaPredicate.size,
                "feedContent anchor" to anchors.size,
                "Media accessor" to mediaAccessors.size,
                "thread accessor" to threadAccessors.size,
                "thread-items accessor" to threadItemsAccessors.size,
                "thread-item media accessor" to itemMediaAccessors.size,
                "external-link handler" to scan(all, WebLinkHandler, patchContext).size,
            )
        }
    }

    /**
     * Checks selected target uniqueness and prints match counts for supplied Threads bundles.
     *
     * Reads THREADS_APKM_434/445/449 from the environment or system properties and skips
     * when none points to an available APKM.
     */
    @Test fun reportRealApkmFingerprintCounts() {
        val builds = listOf(
            Triple("434", "434.0.0.41.74", "510406926"),
            Triple("445", "445.0.0.46.83", "511507647"),
            Triple("449", "449.0.0.54.82", "511908382"),
        ).mapNotNull { (label, version, code) ->
            val path = System.getenv("THREADS_APKM_$label")
                ?: System.getProperty("THREADS_APKM_$label")
            if (path.isNullOrBlank() || !File(path).isFile) null else Triple(label, version, code to File(path))
        }
        assumeTrue("Set THREADS_APKM_434/445/449 or matching system properties to available original APKMs", builds.isNotEmpty())
        val results = builds.associate { (label, version, pair) ->
            label to matchCounts(pair.second, version, pair.first).also { counts ->
                assertEquals(1, counts.getValue("thread accessor"), "$label ThreadIntf-role accessor")
                assertEquals(1, counts.getValue("Media predicate"), "$label Media predicate")
                assertEquals(1, counts.getValue("thread-items accessor"), "$label thread-items accessor")
                assertEquals(1, counts.getValue("thread-item media accessor"), "$label thread-item media accessor")
                assertEquals(1, counts.getValue("external-link handler"), "$label external-link handler")
            }
        }
        println("fingerprint\\build\t" + results.keys.joinToString("\t"))
        listOf("helper", "Media predicate", "feedContent anchor", "Media accessor", "thread accessor", "thread-items accessor", "thread-item media accessor", "external-link handler").forEach { fingerprint ->
            println(fingerprint + "\t" + results.values.joinToString("\t") { it.getValue(fingerprint).toString() })
        }
    }
}
