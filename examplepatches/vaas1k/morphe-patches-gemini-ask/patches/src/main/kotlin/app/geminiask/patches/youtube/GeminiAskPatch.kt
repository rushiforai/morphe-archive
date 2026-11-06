package app.geminiask.patches.youtube

import app.geminiask.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private const val EXTENSION_CLASS = "Lapp/geminiask/extension/GeminiAsk;"

private const val ICON = """<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
    <path android:fillColor="#FFFFFFFF" android:pathData="M17.5,12c0,-3.04 2.46,-5.5 5.5,-5.5c-3.04,0 -5.5,-2.46 -5.5,-5.5c0,3.04 -2.46,5.5 -5.5,5.5C15.04,6.5 17.5,8.96 17.5,12z" />
    <path android:fillColor="#FFFFFFFF" android:pathData="M6,9h9v2h-9z" />
    <path android:fillColor="#FFFFFFFF" android:pathData="M6,6h5v2h-5z" />
    <path android:fillColor="#FFFFFFFF" android:pathData="M6,12h10v2h-10z" />
    <path android:fillColor="#FFFFFFFF" android:pathData="M20,16H4v-4V4h10V2H4C2.9,2 2,2.9 2,4v18l4,-4h14c1.1,0 2,-0.9 2,-2v-6h-2V16z" />
</vector>
"""

// Merged into the Morphe settings by the official settings patch, next to the download button switch.
private const val PREFERENCES = """<screen after="morphe_external_downloader_overlay_button">
        <SwitchPreference xmlns:android="http://schemas.android.com/apk/res/android"
            android:key="morphe_gemini_button" android:defaultValue="true"
            android:title="Gemini button" android:summaryOn="Gemini button is shown" android:summaryOff="Gemini button is hidden" />
    </screen>"""

private val geminiAskResourcePatch = resourcePatch {
    execute {
        get("res/drawable/morphe_gemini_button.xml").writeText(ICON)

        val prefs = get("morphe_addon_prefs.xml")
        val declarations = if (prefs.exists()) prefs.readText() else "<morphe-add-on-preferences>\n</morphe-add-on-preferences>\n"
        prefs.writeText(declarations.replace("</morphe-add-on-preferences>", "    $PREFERENCES\n</morphe-add-on-preferences>"))
    }
}

@Suppress("unused")
val geminiAskPatch = bytecodePatch(
    name = "Gemini Ask",
    description = "Adds a Gemini button to the player that sends the video link to the Gemini app. " +
        "Apply together with the official Morphe patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(geminiAskResourcePatch)

    extendWith("extensions/extension.mpe")

    execute {
        RegisterAddOnsFingerprint.method.addInstruction(0, "invoke-static {}, $EXTENSION_CLASS->register()V")
    }
}
