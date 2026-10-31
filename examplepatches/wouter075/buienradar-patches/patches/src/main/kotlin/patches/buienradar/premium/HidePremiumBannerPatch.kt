package patches.buienradar.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import patches.buienradar.shared.Constants.COMPATIBILITY_BUIENRADAR

@Suppress("unused")
val hidePremiumBannerPatch = bytecodePatch(
    name = "Hide Premium banner",
    description = "Hides the 'Discover Buienradar Premium' promotion block on the Today screen.",
) {
    compatibleWith(COMPATIBILITY_BUIENRADAR)

    execute {
        // TODAY enum constant: first static field assigned after the "TODAY" string in <clinit>.
        val todayField = PromotionsTypeEnumFingerprint.method.let { clinit ->
            val stringIndex = clinit.instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    (it as ReferenceInstruction).reference.toString() == "TODAY"
            }
            clinit.instructions.drop(stringIndex).first { it.opcode == Opcode.SPUT_OBJECT }
                .let { (it as ReferenceInstruction).reference as FieldReference }
        }

        val showUiClass = PromotionsShowUiToStringFingerprint.originalClassDef
        val showUiType = showUiClass.type
        val stateSuperclass = showUiClass.superclass!!

        fun stateObject(toStringValue: String): Pair<ClassDef, String> {
            val classDef = Fingerprint(
                superclass = stateSuperclass,
                name = "toString",
                returnType = "Ljava/lang/String;",
                strings = listOf(toStringValue)
            ).originalClassDef
            val field = classDef.staticFields.first { it.type == classDef.type }
            return classDef to "${classDef.type}->${field.name}:${classDef.type}"
        }

        val (loadingClass, _) = stateObject("Loading")
        val (_, hideInstance) = stateObject("Hide")

        // Method that loads the promotions for the Today screen:
        //   state.emit(Loading); ...; state.emit(ShowUI(list, PromotionsType.TODAY))
        Fingerprint(
            filters = listOf(
                fieldAccess(reference = todayField, opcode = Opcode.SGET_OBJECT),
                methodCall(
                    definingClass = showUiType,
                    name = "<init>",
                    opcode = Opcode.INVOKE_DIRECT
                )
            )
        ).let { fingerprint ->
            fingerprint.method.apply {
                // Replace ShowUI(..., TODAY) with Hide.
                val initIndex = fingerprint.instructionMatches.last().index
                val showUiRegister = getInstruction<FiveRegisterInstruction>(initIndex).registerC
                addInstruction(initIndex + 1, "sget-object v$showUiRegister, $hideInstance")

                // Replace Loading with Hide as well, so no placeholder flashes while loading.
                instructions.withIndex()
                    .filter { (_, instruction) ->
                        instruction.opcode == Opcode.SGET_OBJECT &&
                            ((instruction as ReferenceInstruction).reference as FieldReference)
                                .definingClass == loadingClass.type
                    }
                    .map { it.index }
                    .sortedDescending()
                    .forEach { index ->
                        val register = getInstruction<OneRegisterInstruction>(index).registerA
                        addInstruction(index + 1, "sget-object v$register, $hideInstance")
                    }
            }
        }
    }
}
