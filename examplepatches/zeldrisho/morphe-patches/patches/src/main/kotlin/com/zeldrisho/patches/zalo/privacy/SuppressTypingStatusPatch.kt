package com.zeldrisho.patches.zalo.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.zeldrisho.patches.shared.bytecode.clearBody
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/**
 * Stops the dedicated outbound typing-status send path while leaving message
 * transport and incoming typing rendering untouched.
 */
@Suppress("unused")
val suppressZaloTypingStatusPatch = bytecodePatch(
    name = "Suppress outbound typing status",
    description = "Stops Zalo from sending typing indicators. Incoming status rendering and messages remain unchanged.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        TypingStatusSend.method.clearBody()
        TypingStatusSend.method.addInstructions(0, "return-void")
    }
}

/** Zalo 26.08.01's dedicated MessageRepository typing-status sender. */
private object TypingStatusSend : Fingerprint(
    definingClass = "Ll00/r;",
    name = "S",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "I", "Z", "Z"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Ls00/x;",
            name = "f",
            parameters = listOf("Ljava/lang/String;", "I", "Z", "Z"),
            returnType = "V",
        ),
    ),
)
