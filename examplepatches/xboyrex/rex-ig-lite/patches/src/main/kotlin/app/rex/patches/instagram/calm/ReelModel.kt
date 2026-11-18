package app.rex.patches.instagram.calm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal object ReelParserFingerprint : Fingerprint(
    name = "parseFromJson",
    strings = listOf(" Reel viewer prefetch is only supported for story rings"),
)

internal object ReelSerializerFingerprint : Fingerprint(
    strings = listOf("expiring_at", "ranked_position", "seen_ranked_position", "muted"),
)

context(_: BytecodePatchContext)
internal fun resolveReelGetters(keys: Set<String>): String {
    val insns = ReelSerializerFingerprint.method.instructions.toList()
    val modelType = ReelSerializerFingerprint.method.parameterTypes[1].toString()

    fun interfaceGetter(i: Int): MethodReference? {
        val insn = insns[i]
        if (insn.opcode != Opcode.INVOKE_INTERFACE) return null
        val ref = (insns[i] as ReferenceInstruction).reference as MethodReference
        if (ref.parameterTypes.isNotEmpty() || ref.definingClass == modelType) return null
        return ref
    }

    val pairs = mutableListOf<String>()
    for (i in insns.indices) {
        val key = ((insns[i] as? ReferenceInstruction)?.reference as? StringReference)?.string
        if (key !in keys) continue
        val window = (i + 1)..minOf(i + 8, insns.lastIndex)
        val getter = window.firstNotNullOfOrNull { interfaceGetter(it) } ?: continue
        val wrapper = ReelSerializerFingerprint.classDef.methods.firstOrNull { m ->
            m.parameterTypes.isEmpty() &&
                !AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.implementation?.instructions?.any {
                    (it as? ReferenceInstruction)?.reference == getter
                } == true
        } ?: continue
        pairs.add("$key:${wrapper.name}")
    }
    if (pairs.isEmpty()) throw PatchException("Story tray model: no getters found")
    return pairs.joinToString(",")
}

/** Rewrite a `static String x()` extension stub to return [value] with an empty tryBlocks list. */
internal fun MutableMethod.returnConstant(value: String) {
    val replacement = MutableMethod(
        ImmutableMethod(
            definingClass,
            name,
            parameters,
            returnType,
            accessFlags,
            annotations,
            hiddenApiRestrictions,
            ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList()),
        ),
    ).apply {
        addInstructions(0, "const-string v0, \"$value\"\nreturn-object v0")
    }
    mutableClassDefBy(definingClass).methods.apply {
        remove(this@returnConstant)
        add(replacement)
    }
}

/** Hand every entry the tray parser builds to `[target](Object)V`, just before it returns. */
internal fun hookReelParser(target: String) {
    ReelParserFingerprint.method.apply {
        val returns = instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }
            .map { it.index to (it.value as OneRegisterInstruction).registerA }
            .reversed()
        for ((index, register) in returns) {
            addInstructions(index, "invoke-static { v$register }, $target(Ljava/lang/Object;)V")
        }
    }
}
