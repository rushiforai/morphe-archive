package com.zeldrisho.patches.zalo.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/**
 * Drops only outgoing requests whose `seen` flag is true. This guards the
 * shared ACK transport so both legacy and last-message receipt paths are
 * covered, while delivery ACKs and incoming seen-status rendering remain.
 */
@Suppress("unused")
val suppressZaloSeenStatusPatch = bytecodePatch(
    name = "Suppress outbound seen status",
    description = "Prevents others from seeing when you read their messages while keeping incoming seen-status display enabled; delivery acknowledgements and message transport are unchanged.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        suppressSeenStatus(SeenReceiptSend.method)
    }
}

/** Returns early only when the shared ACK transport is asked to send `seen=true`. */
internal fun suppressSeenStatus(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    method.addInstructionsWithLabels(
        0,
        """
        if-eqz p2, :keep_ack
        return-void
        :keep_ack
        nop
    """,
    )
}

/** Zalo 26.08.01's shared ACK transport; p2 is serialized as the `seen` flag. */
private object SeenReceiptSend : Fingerprint(
    definingClass = "Ls00/x;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "Z", "I", "I", "Lf11/j0;"),
    strings = listOf("ackMsgList", "seen"),
)
