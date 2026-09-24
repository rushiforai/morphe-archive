package app.rutube.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.rutube.patches.shared.Constants.COMPATIBILITY_RUTUBE

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Prevents the ad SDK from starting, which stops banner ads and " +
        "pre-roll video ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUTUBE)

    execute {
        // Return before the SDK kernel is built. Everything the ad stack needs is
        // resolved from that kernel, so neither the banner APIs nor the VAST loader
        // are ever reachable afterwards.
        //
        // The method already has a path that returns without building anything: it
        // guards on a static `isInitializeCalled` and returns early when the SDK was
        // already started. That is not proof this is safe - in the normal flow the
        // kernel does exist by the time anything calls into it - so this needs to be
        // checked by running the app, not by the patch applying.
        AdSdkInitializeFingerprint.method.addInstruction(0, "return-void")
    }
}
