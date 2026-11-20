package app.zeldrisho.patches.zalo.links

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_STABLE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** Enables Zalo's existing external-browser link preference by default. */
@Suppress("unused")
val openZaloLinksExternallyPatch = bytecodePatch(
    name = "Open links externally by default",
    description = "Sets Zalo's existing link preference to the external browser by default while preserving the in-app browser option.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO_STABLE)

    execute {
        val method = LinkDispatcher.method
        val implementation = requireNotNull(method.implementation)
        val invokeIndex = implementation.instructions.withIndex().single { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lcfj;->t(ILjava/lang/String;Z)I"
        }.index

        // The original true literal is also the first argument to cfj.t. Keep that
        // argument intact and provide false in the otherwise-unused v2 register.
        method.addInstructions(invokeIndex, "const/4 v2, 0x0")
        method.replaceInstruction(invokeIndex + 1, "invoke-static {v1, v0, v2}, Lcfj;->t(ILjava/lang/String;Z)I")
    }
}

private object LinkDispatcher : Fingerprint(
    definingClass = "Lp0e;",
    name = "A",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ldoc;", "Ljava/lang/String;", "I", "Ljava/lang/String;", "I", "Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(definingClass = "Lcfj;", name = "t", returnType = "I"),
    ),
)
