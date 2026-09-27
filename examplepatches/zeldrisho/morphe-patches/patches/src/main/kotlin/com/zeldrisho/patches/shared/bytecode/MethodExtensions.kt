package com.zeldrisho.patches.shared.bytecode

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.builder.BuilderTryBlock
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import java.lang.reflect.Field
import java.lang.reflect.ParameterizedType

/**
 * Wipe the method body in place: drops every instruction AND every try/catch
 * range. Required before replacing a method body via addInstructions() when the
 * original method has try-blocks — leaving the try table pointing at removed
 * offsets causes ART VerifyError ("bad exception entry").
 *
 * Contract: this is a whole-body replacement primitive. Callers may grow the
 * register frame before this function, because all existing instructions are
 * discarded. Do not use it as an instruction-preserving injection primitive.
 * Do not attempt to introduce a brand-new local register (e.g. a fresh
 * v0 for a const/4) after clearBody() — it is NOT guaranteed safe; some methods
 * verify fine, others throw VerifyError ("register vN has type Undefined but
 * expected Integer"). Reusing a parameter register (p0/p1/p2...) for a new value
 * is also illegal — ART enforces parameter registers keep their declared type for
 * the entire method (confirmed via VerifyError: "register vN has type Reference:
 * ... but expected Integer"). Only reuse an existing parameter register for a
 * value of a type compatible with normal control flow (e.g. reassigning p0 to a
 * boolean/enum return value immediately before a return), and only on methods
 * that don't already use that register for an object reference elsewhere.
 *
 * Ported from doom-patches `app.template.patches.shared.MethodExtensions`
 * (itself derived from ReVanced/BiliRoamingX patterns) so patches can
 * safely no-op methods with try-blocks.
 */
fun MutableMethod.clearBody() {
    val impl = implementation ?: return
    val field = tryBlocksField
        ?: throw PatchException(
            "MutableMethodImplementation has no List<BuilderTryBlock> field. dexlib2 layout changed?",
        )
    @Suppress("UNCHECKED_CAST")
    (field.get(impl) as MutableList<BuilderTryBlock>).clear()
    val n = impl.instructions.toList().size
    repeat(n) { impl.removeInstruction(0) }
}

private val tryBlocksField: Field? = run {
    val matches = MutableMethodImplementation::class.java.declaredFields.filter { f ->
        if (!MutableList::class.java.isAssignableFrom(f.type) &&
            !List::class.java.isAssignableFrom(f.type)
        ) {
            return@filter false
        }
        val generic = f.genericType as? ParameterizedType ?: return@filter false
        val arg = generic.actualTypeArguments.firstOrNull() ?: return@filter false
        arg.typeName == BuilderTryBlock::class.java.name ||
            arg.typeName.startsWith("${BuilderTryBlock::class.java.name}<")
    }
    check(matches.size <= 1) {
        "MutableMethodImplementation has multiple try-block fields: ${matches.map { it.name }}"
    }
    matches.singleOrNull()?.apply { isAccessible = true }
}

/**
 * Grows the method's register count to [needed] if it is currently smaller.
 *
 * This is safe only before [clearBody] when replacing the complete body. It is
 * NOT safe for instruction-preserving injection: existing encoded register
 * operands are numeric and are not rewritten when the frame grows, so changing
 * the count can change which parameter a `pN` operand aliases. Injection
 * callers must use registers already present in the frame or use a
 * register-aware transformation that rewrites the complete body.
 *
 * Only bump count BEFORE calling [clearBody] + [addInstructions]; bumping
 * after addInstructions has no effect on already-assembled instruction bytes.
 *
 * Implemented via reflection on the private field — survives dexlib2/morphe
 * internal renames as long as the field type remains `int`.
 */
fun MutableMethod.ensureRegisters(needed: Int) {
    val impl = implementation ?: return
    if (impl.registerCount >= needed) return
    val fields = MutableMethodImplementation::class.java.declaredFields
        .filter { it.type == Int::class.javaPrimitiveType }
    val field = fields.singleOrNull { it.name == "registerCount" }
        ?: if (fields.size == 1) fields.single() else null
    if (field == null) {
        throw PatchException(
            "MutableMethodImplementation registerCount field is ambiguous or missing: " +
                fields.map { it.name } + "; dexlib2 internal layout changed?",
        )
    }
    field.isAccessible = true
    field.setInt(impl, needed)
}
