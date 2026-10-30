package com.irzak.patches.toyota.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.irzak.patches.toyota.shared.Constants.COMPATIBILITY_TOYOTA

@Suppress("unused")
val bypassDeviceLockPatch = bytecodePatch(
    name = "Bypass device lock requirement",
    description = "Stops the app from refusing to start unless the phone has a " +
        "lockscreen PIN, pattern or password set. Also keeps the app running after " +
        "it has been re-signed, which its tamper check would otherwise treat as a " +
        "compromised device and shut the app down on launch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TOYOTA)

    execute {
        val verdict = SecurityVerdictConstructorFingerprint.classDef

        // a() == "device is secure" (has a lockscreen PIN). The splash screen refuses
        // to continue and sends the user to set up a device lock when this is false.
        // Forcing it true drops that requirement.
        verdict.forceReturnBoolean("a", true)

        // b() == "device is compromised" (root || emulator || tampering). Re-signing
        // the apk - which any patched build is - trips the tampering branch, so without
        // this the app reports itself rooted, logs ROOTED_DEVICE and self-destructs on
        // launch; the runtime DeviceIntegrityMonitor re-checks the same method and would
        // kill it later too. Forcing it false neutralises both. Root and emulator are
        // folded into the same verdict and go benign as well, which is intended: the
        // patch is opt-in and applied by the device owner.
        verdict.forceReturnBoolean("b", false)
    }
}

/**
 * Rewrite a no-argument, boolean-returning method on [this] class so it immediately
 * returns [value], ignoring its original body.
 */
private fun MutableClass.forceReturnBoolean(methodName: String, value: Boolean) {
    val method = methods.firstOrNull {
        it.name == methodName && it.parameterTypes.isEmpty() && it.returnType == "Z"
    } ?: throw PatchException("$methodName()Z not found on $type")

    method.addInstructions(
        0,
        """
            const/4 v0, 0x${if (value) 1 else 0}
            return v0
        """,
    )
}
