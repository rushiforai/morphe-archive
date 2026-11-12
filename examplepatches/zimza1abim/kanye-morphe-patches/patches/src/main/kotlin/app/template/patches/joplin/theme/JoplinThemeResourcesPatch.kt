package app.template.patches.joplin.theme

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.joplin.joplinAdapters
import java.security.MessageDigest

// Appearance/font-menu and Blush Pink currently share one prebuilt JS bundle.
// Keep one resource writer; folder separation must not apply the bundle twice.
internal val joplinThemeResourcesPatch = resourcePatch {
    execute {
        val target = get("assets/index.android.bundle")
        val digest = MessageDigest.getInstance("SHA-256")
        target.inputStream().use { stream ->
            val bytes = ByteArray(65536)
            while (true) { val n = stream.read(bytes); if (n < 0) break; digest.update(bytes, 0, n) }
        }
        val hash = digest.digest().joinToString("") { "%02x".format(it.toInt() and 255) }
        val adapter = joplinAdapters.singleOrNull { it.getProperty("originalSha256") == hash }
            ?: throw PatchException("No matching Appearance/theme adapter for this original bundle ($hash). Supported: " +
                joplinAdapters.joinToString { it.getProperty("version") } +
                ". Generate/register an adapter for the new official APK; native hooks are version-independent.")
        val resource = "joplin/adapters/${adapter.getProperty("version")}.bundle"
        val bytes = object {}.javaClass.classLoader.getResourceAsStream(resource)?.use { it.readBytes() }
            ?: throw PatchException("Missing UI adapter $resource")
        val actual = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it.toInt() and 255) }
        if (actual != adapter.getProperty("patchedSha256")) throw PatchException("UI adapter checksum mismatch")
        target.writeBytes(bytes)

    }
}
