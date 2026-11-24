package app.brokenn.patches.jiohotstar.screenshot

import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun MutableMethod.disableSurfaceSecure(): Boolean {
    val instructions = instructionsOrNull?.toList() ?: return false

    val targetIndex = instructions.indexOfFirst { instruction ->
        instruction is ReferenceInstruction &&
            (instruction.reference as? MethodReference)?.let { reference ->
                reference.name == "setSecure" &&
                    reference.definingClass == "Landroid/view/SurfaceView;"
            } == true
    }
    if (targetIndex < 0) return false

    removeInstruction(targetIndex)
    return true
}

@Suppress("unused")
val enableScreenshotPatch = bytecodePatch(
    name = "Enable screenshots",
    description = "Allows screenshots and screen recording, including during playback. " +
        "Will not work on DRM-protected content (Widevine L1).",
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        // Layer 1: the Activity window FLAG_SECURE (0x2000).
        runCatching {
            ComposeFlagSecureFingerprint.method.returnEarly()
        }

        // Layer 2: the app's own AB switch that gates the legacy secure surface.
        runCatching {
            UseSecureViewFingerprint.method.returnEarly(false)
        }

        // Layer 3: every method that marks a SurfaceView as secure. Matched by behaviour, so
        // new player paths (Exo, Media3, tiledmedia) are covered without renaming anything.
        SurfaceSetSecureFingerprint.matchAllOrNull()?.forEach { candidate ->
            runCatching { candidate.method.disableSurfaceSecure() }
        }
    }
}
