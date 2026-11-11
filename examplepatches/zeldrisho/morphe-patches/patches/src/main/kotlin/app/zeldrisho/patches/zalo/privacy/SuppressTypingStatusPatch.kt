@file:OptIn(app.zeldrisho.patches.shared.bytecode.WholeBodyReplacement::class)

package app.zeldrisho.patches.zalo.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO
import app.zeldrisho.patches.shared.bytecode.clearBody
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/** Stops the dedicated outbound typing sender. */
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

internal fun suppressTypingStatus(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    method.clearBody()
    method.addInstructions(0, "return-void")
}

private object TypingStatusSend261002 : Fingerprint(
    definingClass = "Lf20/s;", name = "S",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V", parameters = listOf("Ljava/lang/String;", "I", "Z", "Z"),
    filters = listOf(methodCall(
        opcode = Opcode.INVOKE_VIRTUAL, definingClass = "Ln20/x;", name = "f",
        parameters = listOf("Ljava/lang/String;", "I", "Z", "Z"), returnType = "V",
    )),
)

private object TypingStatusSend : Fingerprint(
    definingClass = "Ll00/r;", name = "S",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V", parameters = listOf("Ljava/lang/String;", "I", "Z", "Z"),
    filters = listOf(
        methodCall(
            definingClass = "Ls00/x;", name = "f",
            parameters = listOf("Ljava/lang/String;", "I", "Z", "Z"), returnType = "V",
        ),
    ),
)
