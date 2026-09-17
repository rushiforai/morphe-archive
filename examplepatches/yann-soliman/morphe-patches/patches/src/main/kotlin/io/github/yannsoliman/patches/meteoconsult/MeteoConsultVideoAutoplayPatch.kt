package io.github.yannsoliman.patches.meteoconsult

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PLAYER = "Lb7/e0;"

private fun invokeRegisters(instruction: Instruction): IntArray = when (instruction) {
    is RegisterRangeInstruction ->
        IntArray(instruction.registerCount) { instruction.startRegister + it }

    is FiveRegisterInstruction -> intArrayOf(
        instruction.registerC,
        instruction.registerD,
        instruction.registerE,
        instruction.registerF,
        instruction.registerG,
    ).copyOf(instruction.registerCount)

    else -> error("Unsupported invoke instruction: ${instruction.opcode}")
}

@Suppress("unused")
val meteoConsultVideoAutoplayPatch = bytecodePatch(
    name = "Meteo Consult: disable video autoplay",
    description = "Open weather videos paused; manual play still works. Ad videos are handled by the cleanup patch. Meteo Consult 1.1.4 only."
) {
    compatibleWith(Compatibility(
        name = "Meteo Consult",
        packageName = "com.meteoconsult.androidapp",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "1.1.4")),
    ))

    execute {
        // This coroutine initializes the normal weather-video player: it sets media
        // items, prepares the player, then enables playWhenReady. The call sequence
        // identifies it without relying solely on the obfuscated owner/method name.
        val playerSetup = Fingerprint(
            name = "invokeSuspend",
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/Object;"),
            filters = listOf(
                methodCall(
                    definingClass = PLAYER,
                    name = "L",
                    parameters = listOf("Ljava/util/List;", "Z"),
                    returnType = "V",
                ),
                methodCall(
                    definingClass = PLAYER,
                    name = "C",
                    parameters = emptyList(),
                    returnType = "V",
                ),
                methodCall(
                    definingClass = PLAYER,
                    name = "N",
                    parameters = listOf("Z"),
                    returnType = "V",
                ),
            ),
        ).matchAll(1..1).single()

        val calls = playerSetup.instructionMatches
        check(calls.size == 3) { "Unexpected weather-video player call count" }
        check(calls.map { it.index } == calls.map { it.index }.sorted()) {
            "Unexpected weather-video player call order"
        }
        val references = calls.map { call ->
            ((call.instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?: error("Weather-video player match is not a method call")
        }
        check(references.map { it.definingClass } == List(3) { PLAYER })
        check(references.map { it.name } == listOf("L", "C", "N"))
        check(references.map { it.parameterTypes.map { type -> type.toString() } } == listOf(
            listOf("Ljava/util/List;", "Z"), emptyList(), listOf("Z"),
        )) { "Unexpected weather-video player method signatures" }
        check(references.all { it.returnType == "V" })

        val playWhenReady = calls[2]
        val invokeRegisters = invokeRegisters(playWhenReady.instruction)
        check(invokeRegisters.size == 2) { "Unexpected playWhenReady register count" }
        val playWhenReadyRegister = invokeRegisters[1]

        // The boolean register is initialized earlier and reused by the player
        // setup in some DEX layouts. Override it at the call site instead of
        // assuming its producer is the immediately preceding instruction.
        playerSetup.method.addInstruction(
            playWhenReady.index,
            "const/4 v$playWhenReadyRegister, 0x0",
        )
    }
}
