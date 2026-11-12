package app.template.patches.joplin

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import java.util.Properties

internal fun joplinProperties(resource: String) = Properties().apply {
    val stream = object {}.javaClass.classLoader.getResourceAsStream(resource)
        ?: error("Missing Joplin UI adapter metadata: $resource")
    stream.use { load(it) }
}
internal val joplinAdapters = joplinProperties("joplin/adapters/index.properties")
    .getProperty("versions").split(',').map { version ->
        joplinProperties("joplin/adapters/$version.properties")
    }
internal val JOPLIN_COMPATIBILITY = Compatibility(
    name = "Joplin", packageName = "net.cozic.joplin", apkFileType = ApkFileType.APK,
    targets = joplinAdapters.map { AppTarget(version = it.getProperty("version")) },
)
