package com.zeldrisho.patches.testing

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Shared builders for exercising production transformations against synthetic DEX methods. */
fun syntheticMutableMethod(
    definingClass: String = "Ltest/Target;",
    name: String = "run",
    parameters: List<String> = emptyList(),
    returnType: String = "V",
    registerCount: Int,
    instructions: List<Instruction>?,
    accessFlags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
) = ImmutableMethod(
    definingClass,
    name,
    parameters.map { ImmutableMethodParameter(it, emptySet(), null) },
    returnType,
    accessFlags,
    emptySet(),
    emptySet(),
    instructions?.let { ImmutableMethodImplementation(registerCount, it, emptyList(), emptyList()) },
).toMutable()
