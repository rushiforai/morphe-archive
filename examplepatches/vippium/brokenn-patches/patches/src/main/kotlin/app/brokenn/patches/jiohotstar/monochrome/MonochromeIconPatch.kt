package app.brokenn.patches.jiohotstar.monochrome

import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.io.File
import org.w3c.dom.Element

/** Adds a themed-icon layer to the JioHotstar launcher icon. */
@Suppress("unused")
val monochromeIconPatch = resourcePatch(
    name = "Monochrome icon support",
    description = "Adds a themed-icon version of the launcher icon for Android 13+.",
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    finalize {
        val iconBytes = object {}.javaClass.getResourceAsStream(
            "/jiohotstar/ic_launcher_monochrome.webp",
        )?.readBytes() ?: throw PatchException(
            "Monochrome icon drawable not found in patch resources: " +
                "/jiohotstar/ic_launcher_monochrome.webp",
        )
        val drawableFile = get("res/drawable/ic_launcher_monochrome.webp")
        drawableFile.parentFile?.let { parent ->
            if (!parent.exists() && !parent.mkdirs() && !parent.exists()) {
                throw PatchException(
                    "Could not create drawable directory for monochrome icon: " +
                        parent.path,
                )
            }
        }
        drawableFile.writeBytes(iconBytes)

        document("res/mipmap-anydpi-v26/ic_launcher.xml").use { doc ->
            val root = doc.getElementsByTagName("adaptive-icon").item(0)
                as? Element ?: throw PatchException(
                    "No <adaptive-icon> element in res/mipmap-anydpi-v26/ic_launcher.xml",
                )
            val existing = doc.getElementsByTagName("monochrome").item(0) as? Element
            if (existing != null) {
                existing.setAttribute("android:drawable", "@drawable/ic_launcher_monochrome")
            } else {
                val monochrome = doc.createElement("monochrome")
                monochrome.setAttribute("android:drawable", "@drawable/ic_launcher_monochrome")
                root.appendChild(monochrome)
            }
        }
    }
}
