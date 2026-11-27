package app.template.patches.orca

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.loadAdapter
import java.io.ByteArrayInputStream
import java.security.MessageDigest
import java.util.Properties
import java.util.zip.ZipInputStream
import org.w3c.dom.Element

private const val NS = "http://schemas.android.com/apk/res/android"
private const val FONT_DIR = "morphe-orca"
private const val AUTHORITY = "dev.orca.app.morphe.fonts"
private const val RUNTIME = "app.fontism.extension.orca"

/** Application class of the release under patch; the font loader starts there. */
internal var orcaApplicationType = ""

private fun sha256(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes)
    .joinToString("") { "%02x".format(it.toInt() and 255) }

private fun bundled(name: String) = object {}.javaClass.classLoader.getResourceAsStream(name)

/**
 * Installs the bundled faces, the rebuilt settings bundle and the startup
 * provider. The adapter is chosen by the APK's own version, and the official
 * Hermes bundle is identified before anything is replaced: a settings screen
 * the native side never matches would silently break font loading, so an
 * unexpected Orca build stops here.
 */
internal val orcaFontResources = resourcePatch {
    execute {
        var version = ""
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            if (root.getAttribute("package") != "dev.orca.app")
                throw PatchException("This patch requires dev.orca.app")
            version = root.getAttributeNS(NS, "versionName")
            if (version.isEmpty()) throw PatchException("Orca version is not declared in the manifest")

            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("Orca application element not found")
            val name = application.getAttributeNS(NS, "name")
            if (name.isEmpty()) throw PatchException("Orca application class is not declared")
            orcaApplicationType = "L" + name.replace('.', '/') + ";"

            // Installed font packages (Samsung FlipFont, Galaxy Store) are invisible to
            // package queries on Android 11+ without this.
            val permissions = manifest.getElementsByTagName("uses-permission")
            if ((0 until permissions.length).none {
                    (permissions.item(it) as Element).getAttributeNS(NS, "name") ==
                        "android.permission.QUERY_ALL_PACKAGES"
                }) root.insertBefore(manifest.createElement("uses-permission").apply {
                setAttributeNS(NS, "android:name", "android.permission.QUERY_ALL_PACKAGES")
            }, application)

            if ((0 until application.getElementsByTagName("provider").length).any {
                    (application.getElementsByTagName("provider").item(it) as Element)
                        .getAttributeNS(NS, "authorities") == AUTHORITY
                }) throw PatchException("Orca font provider already exists")
            application.appendChild(manifest.createElement("provider").apply {
                setAttributeNS(NS, "android:name", "$RUNTIME.OrcaFontProvider")
                setAttributeNS(NS, "android:authorities", AUTHORITY)
                setAttributeNS(NS, "android:exported", "false")
                setAttributeNS(NS, "android:grantUriPermissions", "false")
                setAttributeNS(NS, "android:initOrder", "1000")
            })
            // A separate process outlives the app process it restarts after a font change.
            application.appendChild(manifest.createElement("activity").apply {
                setAttributeNS(NS, "android:name", "$RUNTIME.OrcaRestartActivity")
                setAttributeNS(NS, "android:exported", "false")
                setAttributeNS(NS, "android:process", ":morphefontrestart")
                setAttributeNS(NS, "android:excludeFromRecents", "true")
                setAttributeNS(NS, "android:noHistory", "true")
                setAttributeNS(NS, "android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            })

            // Expo updates are already off in the official release; keep them off so the
            // patched app cannot swap its bundle for one the font hooks never saw.
            val entries = application.getElementsByTagName("meta-data")
            (0 until entries.length).map { entries.item(it) as Element }.filter {
                it.getAttributeNS(NS, "name") == "expo.modules.updates.ENABLED"
            }.forEach { it.setAttributeNS(NS, "android:value", "false") }
        }

        val metadata = bundled("orca/adapters/$version.properties")?.use { Properties().apply { load(it) } }
            ?: throw PatchException("No Orca $version adapter. Build one with orca/build-bundle.cjs first.")

        val bundle = get("assets/index.android.bundle")
        if (!bundle.isFile) throw PatchException("Orca embedded bundle not found")
        val original = bundle.readBytes()
        if (sha256(original) != metadata.getProperty("originalSha256"))
            throw PatchException("Unsupported Orca bundle for $version. Rebuild the adapter from that APK.")

        // Verify every artifact before writing any of them.
        val fonts = listOf(
            "Pretendard-Regular.ttf" to "regularSha256",
            "Pretendard-Bold.ttf" to "boldSha256",
            "OFL.txt" to "licenseSha256",
        ).map { (name, key) ->
            val bytes = bundled("orca/fonts/$name")?.use { it.readBytes() }
                ?: throw PatchException("Orca font $name is missing")
            if (sha256(bytes) != metadata.getProperty(key))
                throw PatchException("Orca font $name checksum mismatch")
            name to bytes
        }
        val adapter = loadAdapter("orca/adapters", version, metadata, original)
        val overlay = bundled("orca/adapters/$version.assets.zip")?.use { it.readBytes() }
            ?: throw PatchException("Orca font adapter assets are missing")
        if (sha256(overlay) != metadata.getProperty("assetsSha256"))
            throw PatchException("Orca font adapter assets checksum mismatch")

        fonts.forEach { (name, bytes) ->
            val target = get("assets/$FONT_DIR/$name")
            target.parentFile.mkdirs()
            target.writeBytes(bytes)
        }

        // Only the JavaScript bundle is rebuilt, from the same release source.
        bundle.writeBytes(adapter)

        // Expo emits native assets beside the bundle; they belong in res/ or assets/.
        ZipInputStream(ByteArrayInputStream(overlay)).use { zip ->
            while (true) {
                val entry = zip.nextEntry ?: break
                if (!entry.isDirectory) {
                    val name = entry.name.removePrefix("./")
                    if (name.split('/').any { it == ".." } || name.startsWith('/') ||
                        !(name.startsWith("assets/") || name.startsWith("res/"))
                    ) throw PatchException("Invalid Orca adapter asset: $name")
                    val target = get(name)
                    target.parentFile.mkdirs()
                    target.outputStream().use { zip.copyTo(it) }
                }
                zip.closeEntry()
            }
        }
    }
}
