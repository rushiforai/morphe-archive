package app.gboardnet.patches.voice

import app.gboardnet.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

private const val GUARD_CLASS = "Lapp/gboardnet/extension/NetworkGuard;"

/** Logged by FallbackOnDeviceRecognitionProvider.canHandle() when the language is not en-US. */
private const val FALLBACK_LANGUAGE_LOG =
    "canHandle() : Only en-us is supported for fallback on-device recognition."

/** Logged by FallbackOnDeviceRecognitionProvider's recognizer factory when no pack exists. */
private const val FALLBACK_FACTORY_LOG = "newRecognizer() : No speech pack."

/** Logged by SpeechPackSlicingStrategy.getSlices(), which builds the speech pack download request. */
private const val SLICING_LOG = "getSlices() : ForceUpdates = %b : LanguageTags = %s"

/** Logged by SpeechRecognitionFactory.getSpeechRecognizer() right before it creates the S3 recognizer. */
private const val ONLINE_FIRST_LOG =
    "[RD] Prioritizing the new S3 recognizer over the on-device recognizer. [news3]"

@Suppress("unused")
val offlineVoiceTypingPatch = patch(
    name = "Offline voice typing",
    description = "Lets Gboard's on-device speech recognizer work for all languages it has speech packs for " +
        "(not just English (US)), and prefers it over Google's online recognizer. " +
        "Can be switched in Gboard settings > Network access.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    extendWith("extensions/extension.mpe")

    val preferOffline by booleanOption(
        key = "preferOfflineVoice",
        default = true,
        title = "Prefer offline voice typing",
        description = "Skip Google's online speech recognizer by default (changeable later in Gboard settings).",
    )

    execute {
        val logger = Logger.getLogger("OfflineVoiceTypingPatch")

        mutableClassDefBy(GUARD_CLASS).methods.first { it.name == "patchDefaultPreferOfflineVoice" }
            .addInstructions(
                0,
                """
                    const/4 v0, ${if (preferOffline != false) 1 else 0}
                    return v0
                """,
            )

        // 1. Fallback recognizer: treat every language as supported. Gboard then looks for the
        //    speech pack of the current language (packs exist for en-AU, en-GB, de-DE, ...).
        val fallback = methodsUsingString(FALLBACK_LANGUAGE_LOG).singleOrNull()
            ?: throw PatchException("Could not find the fallback on-device language check")
        // The en-US language constant the check compares against (sget-object before equals()).
        val enUs = fallback.instructionsList().firstNotNullOfOrNull { ins ->
            if (ins.opcode != Opcode.SGET_OBJECT) return@firstNotNullOfOrNull null
            val field = (ins as ReferenceInstruction).reference as FieldReference
            field.takeIf { it.definingClass == it.type && !it.type.startsWith("Ljava/") }
        } ?: throw PatchException("Could not find Gboard's en-US language constant")

        // Replace "language.equals(en-US)" with "same language family", so every English variant
        // (en-AU, en-GB, en-IN, ...) passes while other languages keep Gboard's stock behaviour.
        var relaxed = 0
        fallback.instructionsList().withIndex().toList().forEach { (index, instruction) ->
            if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEach
            val ref = (instruction as ReferenceInstruction).reference as MethodReference
            if (ref.name != "equals" || ref.returnType != "Z" || ref.definingClass != enUs.type) return@forEach
            val call = instruction as Instruction35c
            if (call.registerCount != 2) return@forEach
            fallback.replaceInstruction(
                index,
                BuilderInstruction35c(
                    Opcode.INVOKE_STATIC, 2, call.registerC, call.registerD, 0, 0, 0,
                    ImmutableMethodReference(
                        GUARD_CLASS, "sameLanguageFamily",
                        listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Z",
                    ),
                ),
            )
            relaxed++
        }
        if (relaxed == 0) throw PatchException("Unexpected shape of the fallback on-device language check")
        logger.info("Offline voice typing: fallback recognizer accepts all English variants ($relaxed checks)")

        // 1b. The fallback recognizer only works with the en-US speech pack (other languages' packs
        //     are rejected by the speech engine as INVALID_LANGUAGE_PACK), so always load that one.
        val factory = methodsUsingString(FALLBACK_FACTORY_LOG).singleOrNull()
            ?: throw PatchException("Could not find the fallback recognizer factory")
        val languageRead = factory.instructionsList().indexOfFirst { ins ->
            ins.opcode == Opcode.IGET_OBJECT &&
                ((ins as ReferenceInstruction).reference as FieldReference).type == enUs.type
        }
        if (languageRead < 0) throw PatchException("Could not find the fallback recognizer's language lookup")
        val target = (factory.instructionsList()[languageRead] as TwoRegisterInstruction).registerA
        factory.replaceInstruction(languageRead, BuilderInstruction21c(Opcode.SGET_OBJECT, target, enUs))
        logger.info("Offline voice typing: fallback recognizer always uses the en-US speech pack")

        // 1c. Speech pack download: always include the en-US pack, don't wait for charging, and
        //     download in the foreground instead of as a delayed background job. Wi-Fi only stays.
        val slicing = methodsUsingString(SLICING_LOG).singleOrNull()
            ?: throw PatchException("Could not find the speech pack download request")
        fun optionResult(name: String): Pair<Int, Int> {
            val list = slicing.instructionsList()
            val keyIndex = list.indexOfFirst { it.isConstString(name) }
            if (keyIndex < 0) throw PatchException("Speech pack option '$name' not found")
            val moveIndex = (keyIndex + 1 until minOf(keyIndex + 4, list.size)).firstOrNull {
                list[it].opcode == Opcode.MOVE_RESULT || list[it].opcode == Opcode.MOVE_RESULT_OBJECT
            } ?: throw PatchException("Unexpected shape around speech pack option '$name'")
            return moveIndex to (list[moveIndex] as OneRegisterInstruction).registerA
        }
        fun setBoolean(name: String, value: Boolean) {
            val (moveIndex, register) = optionResult(name)
            slicing.addInstructions(moveIndex + 1, "const/4 v$register, ${if (value) "0x1" else "0x0"}")
        }
        // Bottom-up so earlier indices stay valid.
        setBoolean("CHARGING_ONLY", false)
        setBoolean("FOREGROUND", true)
        run {
            val (moveIndex, listRegister) = optionResult("LANGUAGE_TAGS")
            val list = slicing.instructionsList()
            // A scratch register: the next move-result after the tag list overwrites it anyway.
            val scratch = (moveIndex + 1 until list.size).firstOrNull {
                list[it].opcode == Opcode.MOVE_RESULT
            }?.let { (list[it] as OneRegisterInstruction).registerA }
                ?: throw PatchException("No scratch register in the speech pack download request")
            if (listRegister > 15 || scratch > 15) throw PatchException("Unexpected registers in speech pack request")
            slicing.addInstructions(
                moveIndex + 1,
                """
                    sget-object v$scratch, ${enUs.definingClass}->${enUs.name}:${enUs.type}
                    invoke-static { v$listRegister, v$scratch }, $GUARD_CLASS->withExtraLanguage(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
                    move-result-object v$listRegister
                """,
            )
        }
        logger.info("Offline voice typing: en-US speech pack always downloaded, without waiting for charging")

        // 2. Recognizer selection: pass the online recognizer through the guard, which returns null
        //    when offline is preferred, so Gboard continues with its on-device recognizers.
        val selector = methodsUsingString(ONLINE_FIRST_LOG).singleOrNull()
            ?: throw PatchException("Could not find Gboard's speech recognizer selection")
        val instructions = selector.instructionsList()
        val logIndex = instructions.indexOfFirst { it.isConstString(ONLINE_FIRST_LOG) }
        val callIndex = (logIndex + 1 until instructions.size).firstOrNull { i ->
            val ins = instructions[i]
            ins.opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_STATIC, Opcode.INVOKE_INTERFACE,
                Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_STATIC_RANGE, Opcode.INVOKE_INTERFACE_RANGE) &&
                ((ins as ReferenceInstruction).reference as MethodReference).returnType.startsWith("L") &&
                instructions.getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        } ?: throw PatchException("Could not find the online recognizer call")
        val returnType = ((instructions[callIndex] as ReferenceInstruction).reference as MethodReference).returnType
        val register = (instructions[callIndex + 1] as OneRegisterInstruction).registerA
        // The session params are the selector's first parameter (p1, or p0 if static).
        val isStatic = selector.accessFlags and AccessFlags.STATIC.value != 0
        val paramsRegister = if (isStatic) "p0" else "p1"
        if (selector.parameterTypes.firstOrNull()?.toString()?.startsWith("L") != true) {
            throw PatchException("Unexpected speech recognizer selection signature")
        }
        selector.addInstructions(
            callIndex + 2,
            """
                invoke-static { v$register, $paramsRegister }, $GUARD_CLASS->filterOnlineRecognizer(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, $returnType
            """,
        )
        logger.info("Offline voice typing: hooked online recognizer selection")
    }
}

private fun Instruction.isConstString(value: String) =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        ((this as ReferenceInstruction).reference as StringReference).string == value

private fun MutableMethod.instructionsList(): List<Instruction> = implementation!!.instructions.toList()

/** Mutable methods that contain a const-string with exactly [value]. */
private fun methodsUsingString(value: String): List<MutableMethod> =
    classDefByStrings(value).flatMap { classDef ->
        val mutableClass = mutableClassDefBy(classDef)
        mutableClass.methods.filter { method ->
            method.implementation?.instructions?.any { it.isConstString(value) } == true
        }
    }
