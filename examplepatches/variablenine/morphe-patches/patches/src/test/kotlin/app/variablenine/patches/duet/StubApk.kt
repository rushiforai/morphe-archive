package app.variablenine.patches.duet

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.reandroid.arsc.chunk.TableBlock
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import java.io.File
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

/**
 * A tiny stand-in app, built in code: a manifest with an application element, one empty
 * class and an empty resource table. Real apps cannot be kept in the repository, and
 * the patches under test do not look at the app's code anyway.
 */
internal object StubApk {
    fun build(dir: File, packageName: String): File {
        val table = TableBlock()
        table.newPackage(0x7f, packageName)
        table.refresh()

        val manifest = AndroidManifestBlock().apply {
            setPackageName(packageName)
            versionCode = 1
            versionName = "1.0"
            setMinSdkVersion(29)
            setTargetSdkVersion(34)
            compileSdkVersion = 34
            platformBuildVersionCode = 34
            getOrCreateApplicationElement()
            refreshFull()
        }

        val dex = dir.resolve("classes.dex")
        val stubClass = ImmutableClassDef(
            "L${packageName.replace('.', '/')}/Stub;",
            AccessFlags.PUBLIC.value,
            "Ljava/lang/Object;",
            null, null, null, null, null,
        )
        DexFileFactory.writeDexFile(dex.absolutePath, ImmutableDexFile(Opcodes.getDefault(), setOf(stubClass)))

        val apk = dir.resolve("$packageName.apk")
        ZipOutputStream(apk.outputStream()).use { zip ->
            fun add(name: String, bytes: ByteArray) {
                zip.putNextEntry(ZipEntry(name))
                zip.write(bytes)
                zip.closeEntry()
            }
            add("AndroidManifest.xml", manifest.bytes)
            add("resources.arsc", table.bytes)
            add("classes.dex", dex.readBytes())
        }
        dex.delete()
        return apk
    }
}
