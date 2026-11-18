package app.zeldrisho.patches.zalo.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.string
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL
import com.android.tools.smali.dexlib2.AccessFlags

/** Hides the exact observed display name from the ordinary chat list, without deleting it. */
@Suppress("unused")
val hideZaloZStylePatch = bytecodePatch(
    name = "Hide zStyle conversation",
    description = "Hides the exact name zStyle – Phong cách Zalo from the chat list. " +
        "Another conversation with the same name is also hidden.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL)
    execute {
        // The newer target is experimental until its complete patch set is qualified.
        val version261101 = when (val version = packageMetadata.versionName) {
            "26.10.02" -> false
            "26.11.01" -> true
            else -> error("Hide zStyle conversation: unsupported version $version")
        }
        val method = if (version261101) {
            OrdinaryConversationInsertion261101.matchAll(1..1).single().method
        } else {
            OrdinaryConversationInsertion.matchAll(1..1).single().method
        }
        val expectedRegisters = if (version261101) 16 else 15
        check(method.implementation?.registerCount == expectedRegisters) { "Conversation list register layout changed" }
        // Both scratch registers are overwritten before their first use in the original method.
        val conversation = if (version261101) "p5" else "p2"
        method.addInstructionsWithLabels(0, """
            iget-object v0, $conversation, Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;->c:Ljava/lang/String;
            const-string v1, "zStyle – Phong cách Zalo"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :show_conversation
            return-void
            :show_conversation
            nop
        """.trimIndent())
    }
}

private object OrdinaryConversationInsertion261101 : Fingerprint(
    definingClass = "Lp8g;", name = "C",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I", "Lk8g;", "Ll8g;", "Lt0j;",
        "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;", "Ljava/util/ArrayList;", "Z"),
    filters = listOf(string("ProfileManager: getContactProfileOrPutDefault uid invalid")),
)

private object OrdinaryConversationInsertion : Fingerprint(
    definingClass = "Ltg0/s;", name = "E",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I", "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;",
        "Ljava/util/ArrayList;", "Ltg0/n;", "Ltg0/o;", "Z"),
    filters = listOf(string("ProfileManager: getContactProfileOrPutDefault uid invalid")),
)
