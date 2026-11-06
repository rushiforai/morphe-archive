package patches.bol.sponsored

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import patches.bol.shared.Constants.COMPATIBILITY_BOL

/** PDP section values (see [PdpSectionEnumFingerprint]) that are advertisements. */
private val AD_SECTION_VALUES = listOf(
    "advertisement",
    "considerationDisplayAd",
    "productdisplayad",
    "sponsoredproducts",
)

private fun Method.indexOfString(value: String) = instructions.indexOfFirst {
    it.opcode == Opcode.CONST_STRING && it.getReference<StringReference>()?.string == value
}

private val Instruction.registers
    get() = (this as FiveRegisterInstruction).let {
        listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG).take(it.registerCount)
    }

/** Indices of all instructions with the given opcode, last first, so earlier indices stay valid while patching. */
private fun MutableMethod.indicesOf(opcode: Opcode) =
    instructions.withIndex().filter { it.value.opcode == opcode }.map { it.index }.reversed()

/** First registers below 16 (usable by every instruction format) that are not in [exclude]. */
private fun freeLowRegisters(count: Int, vararg exclude: Int) =
    (0 until 16).filter { it !in exclude }.take(count)

private val FieldReference.smali get() = "$definingClass->$name:$type"

private val MethodReference.smali
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

@Suppress("unused")
val hideSponsoredContentPatch = bytecodePatch(
    name = "Hide sponsored content",
    description = "Removes sponsored products from search results, the sponsored and advertisement sections " +
        "on product pages, and the display ad banners on the home, search and category pages.",
) {
    compatibleWith(COMPATIBILITY_BOL)

    execute {

        // region Sponsored products in search results

        // Find the enableSponsoredProducts field through toString():
        //   if3.o(sb, <previous field>, ", enableSponsoredProducts=", <this field>, ", viewMode=")
        // The field value is the argument right after the label.
        val sponsoredField = SearchInputToStringFingerprint.originalMethod.let { toString ->
            val instructions = toString.instructions.toList()
            val labelIndex = toString.indexOfString(", enableSponsoredProducts=")
            val labelRegister = (instructions[labelIndex] as OneRegisterInstruction).registerA

            val callIndex = (labelIndex + 1 until instructions.size).first {
                instructions[it] is FiveRegisterInstruction && labelRegister in instructions[it].registers
            }
            val callRegisters = instructions[callIndex].registers
            val fieldRegister = callRegisters[callRegisters.indexOf(labelRegister) + 1]

            (callIndex - 1 downTo 0).map { instructions[it] }.first {
                it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerA == fieldRegister
            }.getReference<FieldReference>()!!
        }

        // Apollo Optional.Present(value), a subclass of the field type (Optional).
        val presentType = Fingerprint(
            name = "toString",
            returnType = "Ljava/lang/String;",
            parameters = listOf(),
            strings = listOf("Present(value="),
            custom = { _, classDef -> classDef.superclass == sponsoredField.type }
        ).originalClassDef.type

        // At the end of every constructor: this.enableSponsoredProducts = Optional.Present(false)
        SearchInputToStringFingerprint.classDef.methods.filter { it.name == "<init>" }.forEach { constructor ->
            constructor.indicesOf(Opcode.RETURN_VOID).forEach { returnIndex ->
                // R8 copies `this` to a low register, so take it from the last field write before the return.
                val thisRegister = (returnIndex - 1 downTo 0).map { constructor.getInstruction(it) }.first {
                    it.opcode == Opcode.IPUT_OBJECT &&
                        it.getReference<FieldReference>()?.definingClass == sponsoredField.definingClass
                }.let { (it as TwoRegisterInstruction).registerB }
                val (presentRegister, falseRegister) = freeLowRegisters(2, thisRegister)

                constructor.addInstructionsAtControlFlowLabel(
                    returnIndex,
                    """
                        new-instance v$presentRegister, $presentType
                        sget-object v$falseRegister, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                        invoke-direct {v$presentRegister, v$falseRegister}, $presentType-><init>(Ljava/lang/Object;)V
                        iput-object v$presentRegister, v$thisRegister, ${sponsoredField.smali}
                    """
                )
            }
        }

        // endregion

        // region Sponsored and advertisement sections on product pages

        val adSectionFields = PdpSectionEnumFingerprint.originalMethod.let { clinit ->
            val instructions = clinit.instructions.toList()
            AD_SECTION_VALUES.map { value ->
                (clinit.indexOfString(value) until instructions.size).map { instructions[it] }
                    .first { it.opcode == Opcode.SPUT_OBJECT }
                    .getReference<FieldReference>()!!
            }
        }

        // Before each return: list = new ArrayList(list); list.remove(<each ad section>)
        PdpSectionsFingerprint.method.apply {
            indicesOf(Opcode.RETURN_OBJECT).forEach { returnIndex ->
                val listRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA
                val (copyRegister, sectionRegister, sourceRegister) = freeLowRegisters(3, listRegister)

                val removeSections = adSectionFields.joinToString("\n") { field ->
                    """
                        sget-object v$sectionRegister, ${field.smali}
                        invoke-virtual {v$copyRegister, v$sectionRegister}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
                    """
                }

                addInstructionsAtControlFlowLabel(
                    returnIndex,
                    """
                        move-object/from16 v$sourceRegister, v$listRegister
                        new-instance v$copyRegister, Ljava/util/ArrayList;
                        invoke-direct {v$copyRegister, v$sourceRegister}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
                        $removeSections
                        move-object/from16 v$listRegister, v$copyRegister
                    """
                )
            }
        }

        // endregion

        // region Display ad banners

        // fromJson of the DisplayAds query data ends with `return new Data(displayAds)`.
        // Pass null instead, exactly what the server returns when there are no ads for a slot.
        val dataClass = DisplayAdsDataToJsonFingerprint.classDef
        dataClass.methods.single {
            it.returnType == "Ljava/lang/Object;" && it.parameterTypes.size == 2
        }.apply {
            val initIndex = instructions.indexOfLast {
                it.opcode == Opcode.INVOKE_DIRECT &&
                    it.getReference<MethodReference>()?.let { reference ->
                        reference.name == "<init>" && reference.parameterTypes == listOf("Ljava/util/List;")
                    } == true
            }
            val init = getInstruction<FiveRegisterInstruction>(initIndex)
            val initReference = init.getReference<MethodReference>()!!

            replaceInstruction(initIndex, "const/4 v${init.registerD}, 0x0")
            addInstruction(initIndex + 1, "invoke-direct {v${init.registerC}, v${init.registerD}}, ${initReference.smali}")
        }

        // endregion
    }
}
