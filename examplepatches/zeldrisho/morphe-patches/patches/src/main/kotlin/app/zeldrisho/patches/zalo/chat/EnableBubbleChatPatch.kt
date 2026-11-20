@file:OptIn(app.zeldrisho.patches.shared.bytecode.WholeBodyReplacement::class)

package app.zeldrisho.patches.zalo.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261101
import app.zeldrisho.patches.shared.bytecode.clearBody
import com.android.tools.smali.dexlib2.AccessFlags

/** Keeps Zalo's optional bubble-chat entry point available when the server hides it. */
@Suppress("unused")
val enableBubbleChatPatch = bytecodePatch(
    name = "Enable bubble chat",
    description = "Keeps Zalo's bubble-chat entry point available when supported by Android and notification settings.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO_261101)

    execute {
        val method = BubbleChatEntryPointHidden.matchAll(1..1).single().method
        method.clearBody()
        method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}

private object BubbleChatEntryPointHidden : Fingerprint(
    definingClass = "Lju10;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(string("features@bubble_chat@hide_entry_point")),
)
