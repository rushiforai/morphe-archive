package io.github.yannsoliman.patches.keepcool

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val AVAILABILITY_EXTENSION =
    "Lio/github/yannsoliman/keepcool/availability/AvailabilityRuntime;"


private fun ReferenceInstruction.methodReference(): MethodReference? = reference as? MethodReference
private fun ReferenceInstruction.fieldReference(): FieldReference? = reference as? FieldReference

private fun invokeRegisters(instruction: Instruction): IntArray = when (instruction) {
    is RegisterRangeInstruction ->
        IntArray(instruction.registerCount) { instruction.startRegister + it }

    is FiveRegisterInstruction -> {
        val registers = intArrayOf(
            instruction.registerC,
            instruction.registerD,
            instruction.registerE,
            instruction.registerF,
            instruction.registerG
        )
        registers.copyOf(instruction.registerCount)
    }

    else -> error("Unsupported invoke instruction: ${instruction.opcode}")
}

@Suppress("unused")
val keepcoolBookingAvailabilityDotsPatch = bytecodePatch(
    name = "Keepcool: booking availability dots",
    description = "Show a green dot on calendar dates having at least one booking slot with a free place. Keepcool 1.8.21 only."
) {
    compatibleWith(KEEPCOOL_COMPATIBILITY)

    extendWith("extensions/keepcool-availability.mpe")

    execute {
        // Capture the exact filters already normalized by Keepcool immediately
        // before each of the two normal findBookingSlots calls. The original
        // invoke uses seven contiguous registers:
        // repository, clubs, categories, freePlace, timeBlocks, date, continuation.
        val bookingSearches = BookingSearchContextFingerprint.matchAll(2..2).toList()
        bookingSearches.forEach { match ->
            val call = match.instructionMatches.single()
            val instruction = call.instruction
            val reference = (instruction as? ReferenceInstruction)?.methodReference()
            check(reference?.definingClass == USER_REPOSITORY_CLASS)
            check(reference.name == "findBookingSlots")
            check(instruction is RegisterRangeInstruction) {
                "Expected findBookingSlots to use invoke-*/range"
            }
            check(instruction.registerCount == 7) {
                "Unexpected findBookingSlots register count: ${instruction.registerCount}"
            }

            val start = instruction.startRegister
            match.method.addInstruction(
                call.index,
                "invoke-static/range {v$start .. v${start + 4}}, " +
                    "$AVAILABILITY_EXTENSION->captureContext(" +
                    "Ljava/lang/Object;Ljava/util/List;Ljava/util/List;ZLjava/util/List;)V"
            )
        }

        // Hook the cell binding without allocating/clobbering a scratch register.
        // The date model can live in a high register, so pass it separately through
        // a ThreadLocal in the extension, then pass the two registers already used
        // by the original CellDatePickerComponent.n(booked, ...) call.
        val cellBind = BookingDateCellBindFingerprint.matchAll(1..1).single()
        val renderCall = cellBind.instructionMatches.single { match ->
            val reference =
                (match.instruction as? ReferenceInstruction)?.methodReference()
            reference?.definingClass == CELL_DATE_PICKER_CLASS &&
                reference.name == "n" &&
                reference.parameterTypes.map { it.toString() } ==
                    listOf("Z", "LZ6/f;")
        }
        val renderReference =
            (renderCall.instruction as? ReferenceInstruction)?.methodReference()
        check(renderReference?.definingClass == CELL_DATE_PICKER_CLASS)
        check(renderReference.name == "n")

        val instructions = cellBind.method.implementation!!.instructions
        val bookedReadIndex = (renderCall.index - 1 downTo 0).firstOrNull { index ->
            val instruction = instructions[index]
            val field = (instruction as? ReferenceInstruction)?.fieldReference()
            instruction.opcode == Opcode.IGET_BOOLEAN &&
                field?.definingClass == DATE_MODEL_CLASS &&
                field.name == "f" &&
                field.type == "Z"
        } ?: error("DatePickerModel.isDateBooked read not found before cell render")

        val bookedRead = instructions[bookedReadIndex] as TwoRegisterInstruction
        val bookedRegister = bookedRead.registerA
        val dateModelRegister = bookedRead.registerB
        val renderRegisters = invokeRegisters(renderCall.instruction)
        check(renderRegisters.size == 3) {
            "Unexpected CellDatePickerComponent.n register count"
        }
        val cellRegister = renderRegisters[0]
        check(renderRegisters[1] == bookedRegister) {
            "Booked boolean register does not match CellDatePickerComponent.n argument"
        }

        val bindInvoke = if (
            renderCall.instruction is RegisterRangeInstruction &&
            renderRegisters[1] == renderRegisters[0] + 1
        ) {
            "invoke-static/range {v$cellRegister .. v$bookedRegister}, " +
                "$AVAILABILITY_EXTENSION->bindRemembered(Ljava/lang/Object;Z)V"
        } else {
            check(cellRegister <= 15 && bookedRegister <= 15) {
                "Cell/booked registers cannot be encoded without clobbering scratch registers"
            }
            "invoke-static {v$cellRegister, v$bookedRegister}, " +
                "$AVAILABILITY_EXTENSION->bindRemembered(Ljava/lang/Object;Z)V"
        }

        // Preserve the model before iget-boolean overwrites its register. Insert the
        // bind separately immediately before Keepcool's original render call.
        cellBind.method.addInstruction(
            renderCall.index,
            bindInvoke
        )
        cellBind.method.addInstruction(
            bookedReadIndex,
            "invoke-static/range {v$dateModelRegister .. v$dateModelRegister}, " +
                "$AVAILABILITY_EXTENSION->rememberDateModel(Ljava/lang/Object;)V"
        )

        // Observe Keepcool's existing booked-date list. The extension uses it only
        // for visual priority/invalidation; the original orange-dot flow is untouched.
        val bookedDates = BookedDatesUpdateFingerprint.matchAll(1..1).single()
        val bookedCall = bookedDates.instructionMatches.single()
        val bookedReference =
            (bookedCall.instruction as? ReferenceInstruction)?.methodReference()
        check(bookedReference?.definingClass == DATE_PICKER_CLASS)
        check(bookedReference.name == "setDateIsBooked")
        val bookedRegisters = invokeRegisters(bookedCall.instruction)
        check(bookedRegisters.size == 2) {
            "Unexpected setDateIsBooked register count"
        }
        val listRegister = bookedRegisters[1]
        bookedDates.method.addInstruction(
            bookedCall.index + 1,
            "invoke-static/range {v$listRegister .. v$listRegister}, " +
                "$AVAILABILITY_EXTENSION->onBookedDatesChanged(Ljava/util/List;)V"
        )
    }
}
