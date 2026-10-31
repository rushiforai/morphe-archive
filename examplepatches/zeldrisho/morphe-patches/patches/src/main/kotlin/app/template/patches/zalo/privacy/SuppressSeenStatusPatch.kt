package app.template.patches.zalo.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO

/**
 * Drops only outgoing requests whose `seen` flag is true. This guards the
 * shared ACK transport so both legacy and last-message receipt paths are
 * covered, while delivery ACKs and incoming seen-status rendering remain.
 */
@Suppress("unused")
val suppressZaloSeenStatusPatch = bytecodePatch(
    name = "Suppress outbound seen status",
    description = "Stops sending read receipts. Incoming read status and message delivery are unaffected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val old = SeenReceiptSend.matchAll(0..1)
        val current = SeenReceiptSend261002.matchAll(0..1)
        check(old.size + current.size == 1) { "Expected exactly one seen-status sender" }
        if (old.isNotEmpty()) {
            suppressSeenStatus(old.single().method)
        } else {
            val marker = SeenReceiptMarker261002.matchAll(1..1).single().method
            val callback = classDefByOrNull("Lrz/l3;")?.methods?.filter {
                it.name == "m" && it.parameterTypes == listOf("Ljava/lang/Object;") &&
                    it.returnType == "V" && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                    !AccessFlags.STATIC.isSet(it.accessFlags)
            }.orEmpty()
            check(callback.size == 1) { "Seen-status completion callback changed" }
            suppressSeenStatus261002(current.single().method, marker)
        }
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

/** Zalo 26.10.02 ACK sender, including its concrete callback type. */
private object SeenReceiptSend261002 : Fingerprint(
    definingClass = "Ln20/x;", name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL), returnType = "V",
    parameters = listOf("Ljava/util/List;", "Z", "I", "I", "Lrz/l3;"),
    filters = listOf(
        string("ackMsgList"), string("seen"), string("data"),
        methodCall(definingClass = "Lorg/json/JSONObject;", name = "put", returnType = "Lorg/json/JSONObject;"),
    ),
)

/** The newer read-marker path forwards its seen flag through a separate callback. */
private object SeenReceiptMarker261002 : Fingerprint(
    definingClass = "Ln20/x;", name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL), returnType = "V",
    parameters = listOf("Ljava/util/List;", "Z", "Z", "Z", "Lbb2/l;", "Lbb2/l;"),
    filters = listOf(literal(10309), literal(205), literal(10305), literal(118)),
)

/**
 * Preserve delivery ACKs and complete callbacks when dropping a read-only ACK.
 * The 26.10.02 strategy was informed by Nezumi Patches (GPL-3.0):
 * https://github.com/Nezumi-2711/morphe-patches/blob/0dee7cf8d2f17b9c61d5960c87fd276269c53f69/patches/src/main/kotlin/app/template/patches/zalo/HideReadReceiptsPatch.kt
 */
private fun suppressSeenStatus261002(
    sender: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    marker: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
) {
    check(sender.implementation?.registerCount == 14 && marker.implementation?.registerCount == 22) {
        "Zalo seen-status register layout changed"
    }
    sender.addInstructionsWithLabels(
        0,
        """
        if-eqz p2, :keep_ack_261002
        const/16 v0, 0x6b
        if-eq p3, v0, :complete_seen_ack
        const/16 v0, 0xcb
        if-ne p3, v0, :keep_delivery_ack
        :complete_seen_ack
        if-eqz p5, :finish_seen_ack
        new-instance v0, Lorg/json/JSONObject;
        invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
        invoke-virtual {p5, v0}, Lrz/l3;->m(Ljava/lang/Object;)V
        :finish_seen_ack
        return-void
        :keep_delivery_ack
        const/16 p2, 0x0
        :keep_ack_261002
        nop
        """.trimIndent(),
    )
    marker.addInstructionsWithLabels(
        0,
        """
        if-eqz p2, :keep_marker_261002
        const/16 p2, 0x0
        :keep_marker_261002
        nop
        """.trimIndent(),
    )
}

/** Zalo 26.08.01's shared ACK transport; p2 is serialized as the `seen` flag. */
private object SeenReceiptSend : Fingerprint(
    definingClass = "Ls00/x;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "Z", "I", "I", "Lf11/j0;"),
    strings = listOf(
        string("ackMsgList", StringComparisonType.CONTAINS),
        string("seen", StringComparisonType.CONTAINS),
    ),
)
