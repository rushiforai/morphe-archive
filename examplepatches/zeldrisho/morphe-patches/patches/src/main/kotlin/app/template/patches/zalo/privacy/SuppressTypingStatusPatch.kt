package app.template.patches.zalo.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.template.patches.shared.bytecode.clearBody
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO

/**
 * Stops the dedicated outbound typing-status send path while leaving message
 * transport and incoming typing rendering untouched.
 */
@Suppress("unused")
val suppressZaloTypingStatusPatch = bytecodePatch(
    name = "Suppress outbound typing status",
    description = "Stops sending typing indicators. Incoming typing status is unaffected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val matches = TypingStatusSend.matchAll(0..1) + TypingStatusSend261002.matchAll(0..1)
        check(matches.size == 1) { "Expected exactly one outbound typing-status sender" }
        suppressTypingStatus(matches.single().method)
    }
}

/** Clears the typing-status sender body and try blocks, then replaces it with a void return. */
internal fun suppressTypingStatus(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    method.clearBody()
    method.addInstructions(0, "return-void")
}

/** Zalo 26.10.02's dedicated MessageRepository typing-status sender. */
private object TypingStatusSend261002 : Fingerprint(
    definingClass = "Lf20/s;", name = "S",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V", parameters = listOf("Ljava/lang/String;", "I", "Z", "Z"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Ln20/x;", name = "f",
            parameters = listOf("Ljava/lang/String;", "I", "Z", "Z"), returnType = "V",
        ),
    ),
)

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
