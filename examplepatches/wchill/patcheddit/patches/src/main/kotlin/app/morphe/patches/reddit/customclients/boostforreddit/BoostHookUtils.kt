/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients.boostforreddit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/**
 * R8 reuses parameter registers inside Boost 1.14 methods. A wrapper keeps the
 * original arguments alive for hooks without changing the native register map.
 * The native result, when present, is available to [after] in v0 (v0/v1 for wide).
 */
context(patchContext: BytecodePatchContext)
internal fun Fingerprint.wrapHook(before: String = "", after: String = "") {
    // Fingerprints can cache the method object replaced by an earlier wrapper.
    val signature = method
    val owner = classDef
    val target = owner.methods.single {
        it.name == signature.name &&
            it.parameterTypes == signature.parameterTypes &&
            it.returnType == signature.returnType
    }
    check(target.name != "<init>" && target.name != "<clinit>")
    val isStatic = AccessFlags.STATIC.isSet(target.accessFlags)
    val parameterWords = target.parameters.fold(if (isStatic) 0 else 1) { words, parameter ->
        words + (if (parameter.type == "J" || parameter.type == "D") 2 else 1)
    }
    var suffix = 0
    var originalName: String
    do {
        originalName = "morpheOriginal_${target.name}_${suffix++}"
    } while (owner.methods.any { it.name == originalName })

    owner.methods.add(
        ImmutableMethod(
            target.definingClass,
            originalName,
            target.parameters,
            target.returnType,
            AccessFlags.PRIVATE.value or (if (isStatic) AccessFlags.STATIC.value else 0),
            null,
            null,
            target.implementation!!,
        ).toMutable(),
    )

    val arguments = if (parameterWords == 0) "{}" else "{p0 .. p${parameterWords - 1}}"
    val invoke = if (isStatic) "invoke-static" else "invoke-direct"
    val range = if (parameterWords == 0) "" else "/range"
    val parameterTypes = target.parameters.joinToString("") { it.type }
    val resultKind = when (target.returnType.first()) {
        'V' -> null
        'L', '[' -> "-object"
        'J', 'D' -> "-wide"
        else -> ""
    }
    val wrapper = ImmutableMethod(
        target.definingClass,
        target.name,
        target.parameters,
        target.returnType,
        target.accessFlags,
        target.annotations,
        target.hiddenApiRestrictions,
        MutableMethodImplementation(parameterWords + 3),
    ).toMutable()
    wrapper.addInstructions(
        0,
        """
            $before
            $invoke$range $arguments, ${target.definingClass}->$originalName($parameterTypes)${target.returnType}
            ${resultKind?.let { "move-result$it v0" }.orEmpty()}
            $after
            ${resultKind?.let { "return$it v0" } ?: "return-void"}
        """,
    )
    check(owner.methods.remove(target))
    check(owner.methods.add(wrapper))
}
