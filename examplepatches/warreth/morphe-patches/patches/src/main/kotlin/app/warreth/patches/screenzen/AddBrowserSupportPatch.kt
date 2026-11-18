package app.warreth.patches.screenzen

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.warreth.patches.shared.Constants.COMPATIBILITY_SCREENZEN
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Both browsers expose the same address bar view id as Chrome, because they are
 * Chromium forks. ScreenZen reads the address bar by resource id, so registering
 * the package name is enough to make website blocking work there.
 *
 * Verified against the shipped APKs:
 *  - Vanadium 157.0.8103.50.0 (app.vanadium.browser)   -> id/url_bar
 *  - Cromite  153.0.8010.37  (org.cromite.cromite)     -> id/url_bar
 */
private val BROWSER_ENTRIES = """
    const-string v13, "app.vanadium.browser"
    const-string v14, "app.vanadium.browser:id/url_bar"
    invoke-interface {v0, v13, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v13, "org.cromite.cromite"
    const-string v14, "org.cromite.cromite:id/url_bar"
    invoke-interface {v0, v13, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
"""

@Suppress("unused")
val addBrowserSupportPatch = patch(
    name = "Add Vanadium and Cromite support",
    description = "Adds Vanadium and Cromite to the browsers whose address bar ScreenZen " +
        "reads, so website blocking also works in those browsers.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SCREENZEN)

    execute {
        val method = BrowserUrlMapFingerprint.method

        val instructions = method.implementation?.instructions?.toList()
            ?: error("Browser map method has no implementation")

        // The map is built by a static helper that takes an array of pairs and
        // returns a java.util.Map. Its class name is obfuscated, so match on the
        // signature instead.
        val mapBuildIndex = instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is MethodReference &&
                reference.returnType == "Ljava/util/Map;" &&
                reference.parameterTypes.size == 1 &&
                reference.parameterTypes.first().startsWith("[")
        }

        check(mapBuildIndex >= 0) {
            "Could not find the browser map construction"
        }

        // Insert right after the map lands in v0, before the package lookup.
        val moveResultIndex = (mapBuildIndex + 1 until instructions.size).firstOrNull { index ->
            instructions[index].opcode == Opcode.MOVE_RESULT_OBJECT
        } ?: error("Could not find the map move-result instruction")

        method.addInstructions(moveResultIndex + 1, BROWSER_ENTRIES)
    }
}
