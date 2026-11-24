package app.brokenn.patches.picasso.update

import app.brokenn.patches.picasso.shared.Constants.COMPATIBILITY_PICASSO
import app.brokenn.patches.picasso.shared.Constants.SPLASH_ACTIVITY
import app.brokenn.patches.picasso.shared.Constants.UPDATE_INFO
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

@Suppress("unused")
val disableUpdatePromptPatch = bytecodePatch(
    name = "Disable update prompt",
    description = "Skips the launch version check that shows the update dialog.",
) {
    compatibleWith(COMPATIBILITY_PICASSO)

    execute {
        // The splash activity funnels the whole update flow through one predicate that
        // parses the server version code and compares it with the installed one.
        val splash = mutableClassDefBy(SPLASH_ACTIVITY)
        val gates = splash.methods.filter {
            it.returnType == "Z" && it.parameters.toList() == listOf("Ljava/lang/String;")
        }
        if (gates.size != 1) throw PatchException("Expected 1 update gate in splash, found ${gates.size}")
        gates.first().returnEarly(false)

        // Second layer: an update is never newer than the installed build.
        mutableClassDefBy(UPDATE_INFO).methods
            .filter { it.returnType == "Ljava/lang/String;" && it.parameters.isEmpty() && it.name == "getVersionCode" }
            .forEach { it.returnEarly("0") }
    }
}
