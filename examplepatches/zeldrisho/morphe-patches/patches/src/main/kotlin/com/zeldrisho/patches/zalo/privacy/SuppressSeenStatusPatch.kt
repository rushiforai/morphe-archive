package com.zeldrisho.patches.zalo.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.zeldrisho.patches.shared.bytecode.clearBody
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/**
 * Stops Zalo's dedicated outbound seen-status packet path.
 *
 * This is intentionally limited to the method that constructs the
 * `sendSeenStatus` RequestPacket. Delivery acknowledgements and ordinary
 * message transport use different paths and are not modified.
 */
@Suppress("unused")
val suppressZaloSeenStatusPatch = bytecodePatch(
    name = "Suppress outbound seen status",
    description = "Stops Zalo from sending seen-status packets without changing message delivery or incoming status rendering.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        suppressSeenStatus(SeenStatusSend.method)
    }
}

/** Clears the seen-status sender body and try blocks, then replaces it with a void return. */
internal fun suppressSeenStatus(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    method.clearBody()
    method.addInstructions(0, "return-void")
}

/** Zalo 26.08.01's dedicated seen-status RequestPacket builder. */
private object SeenStatusSend : Fingerprint(
    definingClass = "Lpn/h0;",
    name = "m2",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/internal/measurement/g4;", "I", "I"),
    filters = listOf(
        string("sendSeenStatus "),
    ),
)
