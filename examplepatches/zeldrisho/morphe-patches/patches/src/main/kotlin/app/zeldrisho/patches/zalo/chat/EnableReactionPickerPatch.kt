@file:OptIn(app.zeldrisho.patches.shared.bytecode.WholeBodyReplacement::class)

package app.zeldrisho.patches.zalo.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_STABLE
import app.zeldrisho.patches.shared.bytecode.clearBody
import com.android.tools.smali.dexlib2.AccessFlags

/** Keeps Zalo's reaction feature flag while removing its local package-list check. */
@Suppress("unused")
val enableReactionPickerPatch = bytecodePatch(
    name = "Chat reaction picker",
    description = "Allows the enabled reaction UI without a matching local subscription package. " +
        "Server restrictions may still apply.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO_STABLE)

    execute {
        val method = ReactionPackageGate.matchAll(1..1).single().method
        check(method.implementation?.registerCount == 4) { "Unexpected reaction gate registers" }
        method.clearBody()
        method.addInstructions(0, """
            iget-boolean v0, p0, Lfj6;->a:Z
            return v0
        """)
    }
}

private object ReactionPackageGate : Fingerprint(
    definingClass = "Lfj6;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)
