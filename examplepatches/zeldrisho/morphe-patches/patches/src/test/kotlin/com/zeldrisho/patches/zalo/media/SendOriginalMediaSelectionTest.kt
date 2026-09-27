package com.zeldrisho.patches.zalo.media

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.zeldrisho.patches.testing.syntheticMutableMethod
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class SendOriginalMediaSelectionTest {
    /** Builds a synthetic static field read into v0 for the supplied owner and name. */
    private fun field(owner: String, name: String) = ImmutableInstruction21c(
        Opcode.SGET_OBJECT,
        0,
        ImmutableFieldReference(owner, name, "Ltest/Field;"),
    )

    /** Checks field-selection indexes and failures when the requested field is absent. */
    @Test
    fun selectionHelpersApplySingleFirstAndEarliestRules() {
        val instructions = listOf(
            10 to field("Ltest/Owner;", "OTHER"),
            25 to field("Ltest/Owner;", "Z1"),
            40 to field("Ltest/Owner;", "J0"),
            60 to field("Ltest/Owner;", "Z1"),
        )
        assertEquals(25, singleFieldInstructionIndex(instructions.take(2), "Z1"))
        assertEquals(40, firstFieldInstructionIndex(instructions, "J0"))
        assertEquals(25, earliestFieldInstructionIndex(instructions, "Z1", "missing Z1"))
        assertFailsWith<NoSuchElementException> { singleFieldInstructionIndex(instructions, "MISSING") }
        assertFailsWith<NoSuchElementException> { firstFieldInstructionIndex(instructions, "MISSING") }
        val error = assertFailsWith<IllegalStateException> {
            earliestFieldInstructionIndex(instructions, "MISSING", "target moved")
        }
        assertEquals("target moved", error.message)
    }

    /** Checks that replacements affect the first matching field and preserve later reads. */
    @Test
    fun earliestHdPickerFieldAndMediaFlagAreReplacedInTheirDestinationRegisters() {
        val chipFields = listOf(field("Ltest/Owner;", "HD"), field("Ltest/Owner;", "Z1"), field("Ltest/Owner;", "Z1"))
        val chip = syntheticMutableMethod(
            registerCount = 2,
            instructions = chipFields,
        )
        replaceEarliestFieldInstruction(
            chip,
            chipFields.mapIndexed { index, instruction -> index to instruction },
            "Z1",
            "const/4 v1, 0x2",
            "missing Z1",
        )
        val chipInstructions = chip.implementation!!.instructions.toList()
        assertEquals(Opcode.SGET_OBJECT, chipInstructions[0].opcode)
        assertEquals(Opcode.CONST_4, chipInstructions[1].opcode)
        assertEquals(Opcode.SGET_OBJECT, chipInstructions[2].opcode)

        val mediaFields = listOf(
            field("Lcom/zing/zalo/data/mediapicker/model/MediaItem;", "q"),
            field("Lcom/zing/zalo/data/mediapicker/model/MediaItem;", "q"),
        )
        val media = syntheticMutableMethod(registerCount = 2, instructions = mediaFields)
        replaceEarliestMediaItemFlag(media, mediaFields.mapIndexed { index, instruction -> index to instruction })
        val mediaInstructions = media.implementation!!.instructions.toList()
        assertEquals(Opcode.CONST_4, mediaInstructions[0].opcode)
        assertEquals(Opcode.SGET_OBJECT, mediaInstructions[1].opcode)
    }

    /** Checks owner-specific selection of the first MediaItem.q reference and its absence diagnostic. */
    @Test
    fun mediaItemOriginalFlagSelectionIsClassSpecificAndEarliest() {
        val instructions = listOf(
            11 to field("Lother/MediaItem;", "q"),
            20 to field("Lcom/zing/zalo/data/mediapicker/model/MediaItem;", "metadata"),
            35 to field("Lcom/zing/zalo/data/mediapicker/model/MediaItem;", "q"),
            50 to field("Lcom/zing/zalo/data/mediapicker/model/MediaItem;", "q"),
        )
        assertEquals(35, earliestMediaItemFlagIndex(instructions))
        val error = assertFailsWith<IllegalStateException> { earliestMediaItemFlagIndex(instructions.take(2)) }
        assertEquals("MediaItem original flag read moved; re-hunt Lbq0/g->a()", error.message)
    }
}
