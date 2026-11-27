package dev.vortexnode.sbrowserx.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

internal fun BytecodePatchContext.findMethodOrThrow(
    classType: String,
    methodName: String,
    parameterTypes: List<String>? = null,
    returnType: String? = null,
): MutableMethod {
    val clazz = mutableClassDefBy(classType)
    val matches = clazz.methods.filter { method ->
        method.name == methodName &&
            (parameterTypes == null || method.parameterTypes.map { it.toString() } == parameterTypes) &&
            (returnType == null || method.returnType == returnType)
    }
    check(matches.size == 1) {
        "Expected exactly 1 method matching $classType->$methodName(${parameterTypes ?: "*"})${returnType ?: "*"}, found ${matches.size}"
    }
    return matches.single()
}

internal fun MutableMethod.returnConstantBoolean(value: Boolean) {
    val literal = if (value) "0x1" else "0x0"
    addInstructions(
        0,
        """
            const/4 v0, $literal
            return v0
        """.trimIndent(),
    )
}

internal fun MutableMethod.returnVoidEarly() {
    addInstructions(0, "return-void")
}
