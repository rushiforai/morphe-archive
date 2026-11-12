package app.template.patches.notesnook.fontswap

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest
import java.util.Properties
import java.util.logging.Logger

private fun resource(name: String) = object {}.javaClass.classLoader.getResourceAsStream(name)

private fun adapters(): List<Properties> {
    val index = resource("notesnook/adapters/index.properties")?.use { Properties().apply { load(it) } }
        ?: return emptyList()
    return index.getProperty("versions").orEmpty().split(',').filter { it.isNotBlank() }.map { version ->
        resource("notesnook/adapters/$version.properties")?.use { Properties().apply { load(it) } }
            ?: throw PatchException("Missing Notesnook adapter metadata: $version")
    }
}

private fun sha256(bytes: ByteArray) =
    MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it.toInt() and 255) }

/**
 * Settings → Customization → Appearance → Font. The release JS bundle is rebuilt
 * from the same official tag with one added item (scripts/notesnook/build-bundle.cjs)
 * and selected by the original bundle's hash, never by guessing a nearby version.
 * An unregistered release keeps its own bundle; the font itself still applies and
 * the screen stays reachable from the app shortcut and App info.
 */
internal val notesnookAppearanceMenuPatch = resourcePatch {
    execute {
        val target = get("assets/index.android.bundle")
        if (!target.isFile) throw PatchException("Notesnook JS bundle not found")
        val hash = sha256(target.readBytes())
        val known = adapters()
        val adapter = known.singleOrNull { it.getProperty("originalSha256") == hash }
        if (adapter == null) {
            Logger.getLogger("NotesnookFont").warning(
                "No Appearance menu adapter for this bundle ($hash); supported: " +
                    known.joinToString { it.getProperty("version") } + ". Font patch still applies."
            )
            return@execute
        }
        val name = "notesnook/adapters/${adapter.getProperty("version")}.bundle"
        val bytes = resource(name)?.use { it.readBytes() } ?: throw PatchException("Missing adapter $name")
        if (sha256(bytes) != adapter.getProperty("patchedSha256")) throw PatchException("Adapter checksum mismatch: $name")
        target.writeBytes(bytes)
    }
}
