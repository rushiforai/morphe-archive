package app.brokenn.patches.jiohotstar.monochrome

import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.io.File
import org.w3c.dom.Element

/**
 * Adds monochrome (themed icon) support to the JioHotstar launcher icon.
 *
 * Stock 26.08.17.3 ships an adaptive icon with only two layers
 * (res/mipmap-anydpi-v26/ic_launcher.xml):
 *   <background android:drawable="@drawable/ic_launcher_background"/>
 *   <foreground android:drawable="@drawable/ic_launcher_foreground"/>
 * There is no <monochrome> layer, so the icon cannot follow the system
 * theme on Android 13+.
 *
 * This patch:
 *  1. Copies a new drawable, res/drawable/ic_launcher_monochrome.webp,
 *     into the decoded resources. It is the v1 monochrome icon: the
 *     stock foreground star (res/drawable/ic_launcher_foreground.webp,
 *     324x324) with all colour and gold shading stripped, leaving a
 *     plain white silhouette with the original alpha mask. The system
 *     tints that silhouette for themed icons, so the star size and
 *     shape are exactly the stock ones. (A dotted-outline variant was
 *     made and dropped by the user; this patch deliberately uses the
 *     plain v1, not the dotted version.)
 *  2. Adds <monochrome android:drawable="@drawable/ic_launcher_monochrome"/>
 *     to ic_launcher.xml. If a <monochrome> layer already exists it is
 *     repointed instead of duplicated, so re-patching does not add a
 *     second layer.
 *
 * Only the main icon is patched. The seasonal adaptive icons
 * (ic_launcher_tadka_ipl_2026, ic_launcher_tiranga_2025) are not the
 * manifest icon and are left alone.
 *
 * This is a resourcePatch, not a bytecodePatch: it triggers a full
 * resource decode/rebuild, so it is slower than the other JioHotstar
 * patches. It has no bytecode fingerprint and nothing to fail on a
 * method rename; it fails loudly if ic_launcher.xml is missing or if
 * the bundled monochrome drawable is not in the patch jar.
 *
 * Fix (2026-11-04, from a real Morphe Manager run on 26.10.12.2):
 * the original version wrote the drawable with a plain
 * java.io.File("res/drawable") path. In a Morphe resource patch
 * that path is NOT the decoded APK's resource root — mkdirs()
 * silently failed (its boolean return was ignored), and the
 * following writeBytes() then threw FileNotFoundException:
 * "res/drawable/ic_launcher_monochrome.webp (No such file or
 * directory)" at MonochromeIconPatch.kt:71, in Patch.finalize.
 * The fix is to resolve the path through the resource patch
 * context itself — get("res/drawable/ic_launcher_monochrome.webp")
 * — which points inside the decoded resources correctly, and to
 * fail loudly if its parent directory still cannot be created,
 * instead of letting writeBytes fail with a bare file error.
 *
 * Not verified here: this environment cannot build the .mpp (Morphe
 * registry access is not available from this VM), so this fix
 * itself still needs a real Morphe Manager patch run to confirm.
 * If the XML step then fails, that would mean ic_launcher.xml
 * moved/changed in 26.10.12.2, which is a separate check.
 */
@Suppress("unused")
val monochromeIconPatch = resourcePatch(
    name = "Monochrome icon support",
    description = "Adds a themed-icon version of the launcher icon for Android 13+.",
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    finalize {
        // 1. Ship the monochrome drawable from this patch's resources
        // (patches/src/main/resources/jiohotstar/ic_launcher_monochrome.webp).
        val iconBytes = object {}.javaClass.getResourceAsStream(
            "/jiohotstar/ic_launcher_monochrome.webp",
        )?.readBytes() ?: throw PatchException(
            "Monochrome icon drawable not found in patch resources: " +
                "/jiohotstar/ic_launcher_monochrome.webp",
        )
        // Do NOT use a plain File("res/drawable") path here: in a
        // Morphe resource patch that path is not the decoded APK
        // root, mkdirs() fails silently, and writeBytes() then
        // throws FileNotFoundException (the dev.5 failure on
        // 26.10.12.2). Resolve through the patch context instead.
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

        // 2. Add the <monochrome> layer to the main adaptive icon.
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
