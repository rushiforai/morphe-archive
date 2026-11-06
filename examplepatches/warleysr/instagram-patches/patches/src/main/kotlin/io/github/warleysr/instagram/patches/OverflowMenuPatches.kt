package io.github.warleysr.instagram.patches

import io.github.warleysr.instagram.patches.Constants.COMPATIBILITY_INSTAGRAM
import io.github.warleysr.instagram.patches.Constants.FEED_BUTTON_EXTENSION_CLASS
import io.github.warleysr.instagram.patches.Constants.MEDIA_OPTIONS_CLASS
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

context(patchContext: BytecodePatchContext)
fun addOverflowMenuButtonAttributes(
    buttonEnumTag: String,
    extensionMethodName: String,
) {
    OverflowMenuButtonEnumInitialiser.apply {
        val classFields = classDef.fields
        if (classFields.none { it.name == buttonEnumTag }) {
            val field =
                classFields
                    .first { it.type == MEDIA_OPTIONS_CLASS }
                    .toMutable()
            field.name = buttonEnumTag
            classFields.add(field)
        }

        method.apply {
            val lastInvokeDirectIndex = instructions.last { it.opcode == Opcode.INVOKE_DIRECT }.location.index

            addInstructions(
                lastInvokeDirectIndex + 2,
                """
                invoke-static {}, $FEED_BUTTON_EXTENSION_CLASS->$extensionMethodName()$MEDIA_OPTIONS_CLASS
                move-result-object v0
                sput-object v0, $MEDIA_OPTIONS_CLASS->$buttonEnumTag:$MEDIA_OPTIONS_CLASS
                """.trimIndent(),
            )
        }
    }
}

val includeButtonsInOverflowMenuArrayPatch =
    bytecodePatch(
        description = "Hooks array values initialisation in overflow menu button enum.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        execute {
            OverflowMenuButtonEnumInitialiser.method.apply {
                val valuesSputIndex = instructions.indexOfFirst {
                    it.opcode == Opcode.SPUT_OBJECT &&
                        it.getReference<FieldReference>()?.name == "\$VALUES"
                }

                if (valuesSputIndex == -1) {
                    throw PatchException("Could not find \$VALUES sput-object in MediaOption\$Option.<clinit>")
                }

                val arrayRegister = getInstruction(valuesSputIndex).registersUsed[0]

                addInstructions(
                    valuesSputIndex + 1,
                    """
                    sget-object v$arrayRegister, $MEDIA_OPTIONS_CLASS->${"$" + "VALUES"}:[$MEDIA_OPTIONS_CLASS
                    invoke-static {v$arrayRegister}, $FEED_BUTTON_EXTENSION_CLASS->appendOptionToArray([$MEDIA_OPTIONS_CLASS)[$MEDIA_OPTIONS_CLASS
                    move-result-object v$arrayRegister
                    sput-object v$arrayRegister, $MEDIA_OPTIONS_CLASS->${"$" + "VALUES"}:[$MEDIA_OPTIONS_CLASS
                    """.trimIndent(),
                )
            }
        }
    }

val hookOverflowMenuButtonOnClickPatch =
    bytecodePatch(
        description = "Hooks feed overflow menu item click.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        execute {
            FeedButtonOnClickFingerprint.apply {
                method.apply {
                    addInstructionsWithLabels(
                        0,
                        """
                        move-object/from16 v1, p1
                        invoke-static {v1}, $FEED_BUTTON_EXTENSION_CLASS->onButtonClicked($MEDIA_OPTIONS_CLASS)Z
                        move-result v0
                        if-eqz v0, :continue_original
                        return-void
                        """.trimIndent(),
                        ExternalLabel("continue_original", getInstruction(0)),
                    )
                }
            }
        }
    }

val hookOverflowMenuButton =
    bytecodePatch(
        description = "Hooks overflow menu button creation and population.",
    ) {
        dependsOn(includeButtonsInOverflowMenuArrayPatch, hookOverflowMenuButtonOnClickPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        extendWith(io.github.warleysr.instagram.patches.Constants.EXTENSION_PATH)
        execute {
            val enumBtnClass = classNameToExtension(EnumButtonClassFingerprint.classDef.type)
            GetEnumButtonClassExtensionFingerprint.changeFirstString(enumBtnClass)

            MediaOptionsOverflowMenuCreatorConstructorFingerprint.classDef.apply {
                val addingFeedButtonMethodName = methods.first { it.parameters.size > 1 }.name
                AddFeedButtonExtensionFingerprint.changeFirstString(addingFeedButtonMethodName)
            }

            AddFeedButtonFingerprint.method.apply {
                var arrayListRegister = -1
                var checkCastRegister = -1
                var checkCastIndex = -1

                if (getInstruction(0).opcode == Opcode.INVOKE_STATIC) {
                    arrayListRegister = getInstruction(1).registersUsed[0]
                    checkCastIndex = indexOfFirstInstruction(Opcode.CHECK_CAST)
                    checkCastRegister = getInstruction(checkCastIndex).registersUsed[0]
                } else {
                    val arrayListInstructions =
                        instructions.filter {
                            it.opcode == Opcode.NEW_INSTANCE &&
                                it.getReference<TypeReference>()?.type == "Ljava/util/ArrayList;"
                        }

                    arrayListInstructions.firstOrNull { instruction ->
                        val index = instruction.location.index
                        val nextNextInstructionOpcode = getInstruction(index + 2).opcode
                        val nextNextNextInstructionOpcode = getInstruction(index + 3).opcode
                        if (nextNextInstructionOpcode == Opcode.IGET_OBJECT && nextNextNextInstructionOpcode == Opcode.CHECK_CAST) {
                            val arrayInitInstruction = getInstruction(index + 1)
                            arrayListRegister = arrayInitInstruction.registersUsed[0]
                            checkCastIndex = indexOfFirstInstruction(index, Opcode.CHECK_CAST)
                            checkCastRegister = getInstruction(checkCastIndex).registersUsed[0]
                            true
                        } else {
                            false
                        }
                    }
                }

                if (arrayListRegister != -1 && checkCastRegister != -1 && checkCastIndex != -1) {
                    addInstructions(
                        checkCastIndex + 1,
                        """
                        invoke-static {v$checkCastRegister, v$arrayListRegister}, $FEED_BUTTON_EXTENSION_CLASS->addFeedOverflowButton(Ljava/lang/Object;Ljava/util/ArrayList;)V
                        """.trimIndent(),
                    )
                }
            }
        }
    }
