package io.github.yannsoliman.patches.leboncoin

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val AD_FREE_COMBINERS = setOf("Lmy0;", "Loy0;")

@Suppress("unused")
val leboncoinRemoveAdsPatch = bytecodePatch(
    name = "Leboncoin: remove ads",
    description = "Use Leboncoin's built-in ad-free paths to suppress banners, native ads and interstitials. Supports Leboncoin 100.124.1 and 100.125.0.",
) {
    compatibleWith(Compatibility(
        name = "Leboncoin",
        packageName = "fr.leboncoin",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(
            AppTarget(version = "100.124.1"),
            AppTarget(version = "100.125.0"),
        ),
    ))

    execute {
        // Leboncoin combines the locally stored start and end dates of its
        // advertising entitlement into a shared Boolean flow. Home, search,
        // ad-detail and interstitial code already observe that flow and use
        // their normal empty/error paths when it is true.
        //
        // The compiler merged this coroutine with unrelated lambdas in a
        // synthetic class. Match both the exact class for this app version and
        // the distinctive time-window calculation before changing anything.
        val entitlementCombiner = Fingerprint(
            name = "invokeSuspend",
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/Object;"),
            filters = listOf(
                methodCall(
                    definingClass = "Ljava/lang/System;",
                    name = "currentTimeMillis",
                    parameters = emptyList(),
                    returnType = "J",
                ),
                methodCall(
                    definingClass = "Ljava/lang/Boolean;",
                    name = "valueOf",
                    parameters = listOf("Z"),
                    returnType = "Ljava/lang/Boolean;",
                ),
            ),
            custom = { method, _ -> method.definingClass in AD_FREE_COMBINERS },
        ).matchAll(1..1).single()

        val instructions = entitlementCombiner.method.implementation!!.instructions.toList()
        val valueOfMatches = instructions.withIndex().filter { (_, instruction) ->
            val reference =
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                    ?: return@filter false
            reference.definingClass == "Ljava/lang/Boolean;" &&
                reference.name == "valueOf" &&
                reference.parameterTypes.map { it.toString() } == listOf("Z") &&
                reference.returnType == "Ljava/lang/Boolean;"
        }
        check(valueOfMatches.size == 1) {
            "Unexpected ad-free Boolean.valueOf call count: ${valueOfMatches.size}"
        }

        val valueOf = valueOfMatches.single()
        val falseIndex = valueOf.index - 1
        val trueIndex = valueOf.index - 3
        check(trueIndex >= 0 && valueOf.index + 1 < instructions.size)
        check(instructions.map { it.opcode }.drop(trueIndex).take(6) == listOf(
            Opcode.CONST_4,
            Opcode.GOTO,
            Opcode.CONST_4,
            Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT_OBJECT,
            Opcode.RETURN_OBJECT,
        )) { "Unexpected ad-free entitlement result layout" }

        val trueInstruction = instructions[trueIndex] as? NarrowLiteralInstruction
            ?: error("Ad-free true branch is not a narrow literal")
        val falseInstruction = instructions[falseIndex] as? NarrowLiteralInstruction
            ?: error("Ad-free false branch is not a narrow literal")
        check(trueInstruction.narrowLiteral == 1 && falseInstruction.narrowLiteral == 0) {
            "Unexpected ad-free entitlement Boolean literals"
        }

        val trueRegister = (instructions[trueIndex] as OneRegisterInstruction).registerA
        val falseRegister = (instructions[falseIndex] as OneRegisterInstruction).registerA
        check(trueRegister == falseRegister) {
            "Ad-free entitlement branches use different registers"
        }

        val valueOfRegisters = when (val instruction = valueOf.value) {
            is RegisterRangeInstruction ->
                IntArray(instruction.registerCount) { instruction.startRegister + it }

            is FiveRegisterInstruction -> intArrayOf(
                instruction.registerC,
                instruction.registerD,
                instruction.registerE,
                instruction.registerF,
                instruction.registerG,
            ).copyOf(instruction.registerCount)

            else -> error("Unsupported Boolean.valueOf invocation: ${instruction.opcode}")
        }
        check(valueOfRegisters.contentEquals(intArrayOf(falseRegister))) {
            "Boolean.valueOf does not consume the entitlement branch register"
        }

        // Turn only the false result into true. The flow, its collectors and all
        // application-owned ad cleanup behavior remain unchanged.
        entitlementCombiner.method.replaceInstruction(
            falseIndex,
            "const/4 v$falseRegister, 0x1",
        )
    }
}
