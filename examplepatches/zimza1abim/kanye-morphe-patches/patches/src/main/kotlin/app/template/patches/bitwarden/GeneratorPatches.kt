package app.template.patches.bitwarden

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val HOOKS = "Lapp/template/extension/bitwarden/GeneratorHooks;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private const val GENERATOR_CLIENTS = "Lcom/bitwarden/sdk/GeneratorClients;"
private const val HELP_DATA = "Lcom/bitwarden/ui/platform/components/button/model/BitwardenHelpButtonData;"
private const val DEFAULT_SPECIAL = "!@#$%^&*"

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/x8bit/bitwarden/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object PasswordGenerateFingerprint : Fingerprint(
    definingClass = GENERATOR_CLIENTS,
    name = "password",
    returnType = STRING,
    parameters = listOf("Lcom/bitwarden/generators/PasswordGeneratorRequest;"),
)

/** GeneratorScreen GeneratedStringItem: the read-only field showing the generated value. */
internal object GeneratedValueFieldFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("GeneratedPasswordLabel"),
)

/** GeneratorScreen PasswordSpecialCharactersToggleItem. */
internal object SpecialCharactersToggleFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("SpecialCharactersToggle", DEFAULT_SPECIAL),
)

private fun MethodReference.sameAs(other: MethodReference) =
    definingClass == other.definingClass && name == other.name && returnType == other.returnType &&
        parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

private fun Instruction.calls(method: MethodReference) =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.sameAs(method) == true

/** A composable call through invoke-static/range with each argument's first register. */
private class RangeCall(val index: Int, val reference: MethodReference, private val start: Int) {
    private val offsets = reference.parameterTypes.runningFold(0) { offset, type ->
        offset + if (type == "J" || type == "D") 2 else 1
    }

    fun register(parameter: Int) = start + offsets[parameter]

    /** The trailing `$default` bit mask of a composable with default arguments. */
    val defaultMaskRegister get() = register(reference.parameterTypes.lastIndex)
}

private fun MutableMethod.singleRangeCall(definingClass: String, name: (String) -> Boolean): RangeCall {
    val calls = implementation!!.instructions.withIndex().mapNotNull { (index, instruction) ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE || reference?.definingClass != definingClass ||
            !name(reference.name)
        ) {
            return@mapNotNull null
        }
        RangeCall(index, reference, (instruction as RegisterRangeInstruction).startRegister)
    }
    return calls.singleOrNull() ?: throw PatchException("Expected one $definingClass call in $this, found ${calls.size}")
}


@Suppress("unused")
val passphraseTotalLengthPatch = bytecodePatch(
    name = "Bitwarden passphrase total length",
    description = "Shows the total character count above a generated passphrase.",
    default = true,
) {
    compatibleWith(BITWARDEN_COMPATIBILITY)
    extendWith("extensions/bitwarden.mpe")

    execute {
        val field = GeneratedValueFieldFingerprint.match().method
        val call = field.singleRangeCall("Lcom/bitwarden/ui/platform/components/field/BitwardenTextFieldKt;") {
            it.startsWith("BitwardenTextField")
        }
        // BitwardenTextField(label: String?, value: String, ...): the generator passes label = null.
        if (call.reference.parameterTypes.take(2) != listOf(STRING, STRING)) {
            throw PatchException("Unexpected BitwardenTextField signature: ${call.reference}")
        }

        // GeneratorScreen passes GeneratorState.generatedText to GeneratedStringItem. Hand the state
        // to the hook there, so only the passphrase tab gets a label, restored state included.
        val stateReads = mutableListOf<Pair<MutableMethod, Int>>()
        classDefForEach { classDef ->
            classDef.methods.filter { method ->
                method.implementation?.instructions?.any { it.calls(field) } == true
            }.forEach { caller ->
                val method = mutableClassDefBy(classDef.type).methods.single { it.sameAs(caller) }
                val instructions = method.implementation!!.instructions.toList()
                val callIndex = instructions.indexOfFirst {
                    it.opcode == Opcode.INVOKE_STATIC_RANGE && it.calls(field)
                }
                if (callIndex < 0) return@forEach
                val text = (instructions[callIndex] as RegisterRangeInstruction).startRegister + 1
                // The last write of the text argument: iget-object vText, vState, GeneratorState->generatedText
                val read = (callIndex - 1 downTo 0).firstOrNull { index ->
                    (instructions[index] as? OneRegisterInstruction)?.registerA == text
                } ?: return@forEach
                val reference = (instructions[read] as? ReferenceInstruction)?.reference as? FieldReference
                if (instructions[read].opcode == Opcode.IGET_OBJECT && reference?.type == STRING) {
                    stateReads += method to read
                }
            }
        }
        val (screen, read) = stateReads.singleOrNull()
            ?: throw PatchException("Expected one GeneratorState.generatedText read, found ${stateReads.size}")
        val getText = screen.implementation!!.instructions[read] as TwoRegisterInstruction
        if (getText.registerA > 15 || getText.registerB > 15) {
            throw PatchException("GeneratorState registers v${getText.registerB}/v${getText.registerA} need a range call")
        }
        screen.addInstructions(
            read + 1,
            "invoke-static {v${getText.registerB}, v${getText.registerA}}, " +
                "$HOOKS->onGeneratorState($OBJECT$STRING)V",
        )

        val label = call.register(0)
        val value = call.register(1)
        field.addInstructions(
            call.index,
            """
                invoke-static/range {v$value .. v$value}, $HOOKS->passphraseLengthLabel($STRING)$STRING
                move-result-object v$label
            """,
        )
    }
}

@Suppress("unused")
val customSpecialCharactersPatch = bytecodePatch(
    name = "Bitwarden custom special characters",
    description = "Choose which special characters the password generator uses.",
    default = true,
) {
    compatibleWith(BITWARDEN_COMPATIBILITY)
    extendWith("extensions/bitwarden.mpe")

    execute {
        val onCreate = MainActivityOnCreateFingerprint.match().method
        val password = PasswordGenerateFingerprint.match().method
        val toggle = SpecialCharactersToggleFingerprint.match().method
        val call = toggle.singleRangeCall("Lcom/bitwarden/ui/platform/components/toggle/BitwardenSwitchKt;") {
            it == "BitwardenSwitch"
        }
        // BitwardenSwitch(label: String, isChecked, onCheckedChange, ..., helpData, ..., $default)
        val parameters = call.reference.parameterTypes.map(CharSequence::toString)
        val helpData = parameters.indexOf(HELP_DATA)
        if (parameters.take(2) != listOf(STRING, "Z") || helpData < 0 || helpData > 14 ||
            parameters.count { it == HELP_DATA } != 1 || parameters.last() != "I"
        ) {
            throw PatchException("Unexpected BitwardenSwitch signature: ${call.reference}")
        }
        val labelIndex = toggle.implementation!!.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == DEFAULT_SPECIAL
        }
        val labelRegister = (toggle.implementation!!.instructions[labelIndex] as OneRegisterInstruction).registerA
        if (labelIndex > call.index || labelRegister != call.register(0)) {
            throw PatchException("Special characters label is not the BitwardenSwitch label")
        }

        val checked = call.register(1)
        val onCheckedChange = call.register(2)
        val help = call.register(helpData)
        val mask = call.defaultMaskRegister
        if (mask > 15) throw PatchException("BitwardenSwitch \$default mask register v$mask needs a wide and-int")
        // The help button is an explicit argument now, so drop it from the $default mask.
        toggle.addInstructions(
            call.index,
            """
                invoke-static/range {v$checked .. v$onCheckedChange}, $HOOKS->specialHelpButton(Z$OBJECT)$OBJECT
                move-result-object v$help
                check-cast v$help, $HELP_DATA
                and-int/lit16 v$mask, v$mask, ${(1 shl helpData).inv()}
            """,
        )
        toggle.replaceInstruction(labelIndex, "invoke-static {}, $HOOKS->specialLabel()$STRING")
        toggle.addInstruction(labelIndex + 1, "move-result-object v$labelRegister")

        // A non-null result is the password generated with the custom set; null falls through to the SDK.
        password.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p1 .. p1}, $HOOKS->generatePassword($OBJECT)$STRING
                move-result-object v0
                if-eqz v0, :sdk
                return-object v0
                :sdk
                nop
            """,
        )
        onCreate.addInstructions(0, "invoke-static/range {p0 .. p0}, $HOOKS->attach(Landroid/app/Activity;)V")
    }
}
