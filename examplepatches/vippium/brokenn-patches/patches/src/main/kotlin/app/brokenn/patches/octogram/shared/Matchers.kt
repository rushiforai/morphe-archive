package app.brokenn.patches.octogram.shared

import app.brokenn.patches.shared.instrs
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// Anchors that survive R8: kept org.telegram.tgnet names, strings and TL constructors.
// Generic instruction helpers live in app.brokenn.patches.shared.

// isSecretMedia: first instruction reads messageOwner, second checks TL_message_secret.
fun Method.startsWithMessageOwnerSecretCheck(): Boolean {
    val ins = instrs()
    if (ins.size < 2) return false
    val first = (ins[0] as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    if (first.name != "messageOwner") return false
    val second = (ins[1] as? ReferenceInstruction)?.reference as? TypeReference ?: return false
    return second.type == "Lorg/telegram/tgnet/TLRPC\$TL_message_secret;"
}

// static isSecretMedia/isSecretPhotoOrVideo: first instruction is instance-of TL_message_secret.
fun Method.startsWithInstanceOf(type: String): Boolean {
    val ins = instrs()
    if (ins.isEmpty()) return false
    val first = (ins[0] as? ReferenceInstruction)?.reference as? TypeReference ?: return false
    return first.type == type
}
