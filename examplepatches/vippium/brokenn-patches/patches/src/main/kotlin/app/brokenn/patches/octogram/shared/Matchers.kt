package app.brokenn.patches.octogram.shared

import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// Anchors that survive R8: kept org.telegram.tgnet class/field names, string
// constants and TL constructors. All patches locate targets through these.

fun Method.instrs() = implementation?.instructions?.toList() ?: emptyList()

fun Method.stringConstants(): Set<String> =
    instrs().mapNotNull { (it as? ReferenceInstruction)?.reference as? StringReference }
        .map { it.string }.toSet()

fun Method.fieldRefKeys(): Set<String> =
    instrs().mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        .map { "${it.definingClass}->${it.name}:${it.type}" }.toSet()

fun Method.typeRefKeys(): Set<String> =
    instrs().mapNotNull { (it as? ReferenceInstruction)?.reference as? TypeReference }
        .map { it.type }.toSet()

fun Method.constructsType(type: String): Boolean =
    instrs().any {
        (it as? ReferenceInstruction)?.reference is TypeReference &&
            (it.reference as TypeReference).type == type
    }

fun Method.instanceOfs(type: String): Boolean =
    instrs().any {
        (it as? ReferenceInstruction)?.reference is TypeReference &&
            (it.reference as TypeReference).type == type
    }

fun Method.readsField(fieldKey: String): Boolean = fieldKey in fieldRefKeys()

fun Method.isStatic(): Boolean =
    accessFlags and 0x0008 != 0

fun ClassDef.classStrings(): Set<String> = methods.flatMap { it.stringConstants() }.toSet()

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
