package local.keepcool

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.smali.toInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22x
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val DATE_PICKER_CLASS = "Lcommon_ui/business_components/common/date_picker/DatePickerComponent;"
private const val ROLE_PARAMS_CLASS = "Lmodels/domain/user/RoleParams;"
private const val CALENDAR_DAYS_INCLUSIVE = 31

internal object BookingCalendarSetupFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = ROLE_PARAMS_CLASS, name = "getMaxBookingVisibleDays"),
        methodCall(definingClass = DATE_PICKER_CLASS, name = "r")
    )
)

internal object DatePickerBuildFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = DATE_PICKER_CLASS, name = "getCurrentCalendar"),
        methodCall(definingClass = DATE_PICKER_CLASS, name = "getNextWeekCalendar"),
        methodCall(definingClass = DATE_PICKER_CLASS, name = "getLastWeekCalendar"),
        string("KEY_DATES"),
        methodCall(definingClass = "Landroidx/viewpager2/widget/ViewPager2;", name = "setAdapter")
    )
)

private fun ReferenceInstruction.methodReference(): MethodReference? = reference as? MethodReference
private fun ReferenceInstruction.typeReference(): TypeReference? = reference as? TypeReference

@Suppress("unused")
val keepcoolThirtyDayCalendarPatch = bytecodePatch(
    name = "Keepcool: 30-day booking calendar",
    description = "Show and allow booking from today through J+30. Keepcool 1.8.21 only."
) {
    compatibleWith(Compatibility(
        name = "Keepcool",
        packageName = "fr.keepcool.memberapp",
        apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget(version = "1.8.21"))
    ))
    execute {
        // The API value is 10, but the component interprets it as a count including today.
        // Override only the value passed to the date picker: J through J+30 is 31 dates.
        val setup = BookingCalendarSetupFingerprint.matchAll(1..1).single().method
        val setupInstructions = setup.implementation!!.instructions
        val maxDaysCallIndex = setupInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.methodReference()
            reference?.definingClass == ROLE_PARAMS_CLASS &&
                reference.name == "getMaxBookingVisibleDays" &&
                instruction.opcode == Opcode.INVOKE_VIRTUAL
        }
        check(maxDaysCallIndex >= 0) { "getMaxBookingVisibleDays call not found" }
        val moveResultIndex = maxDaysCallIndex + 1
        val moveResult = setupInstructions[moveResultIndex]
        check(moveResult.opcode == Opcode.MOVE_RESULT) { "Expected move-result after max days call" }
        val maxDaysRegister = (moveResult as OneRegisterInstruction).registerA
        setup.addInstruction(
            moveResultIndex + 1,
            BuilderInstruction21s(Opcode.CONST_16, maxDaysRegister, CALENDAR_DAYS_INCLUSIVE)
        )

        // The stock picker builds only current, +1 and +2 week pages. Add +3, +4
        // and, when the current week is nearly over, a partial +5 page.
        // Dates after J+30 stay visible as disabled columns on the final page.
        val picker = DatePickerBuildFingerprint.matchAll(1..1).single().method
        check(picker.definingClass == DATE_PICKER_CLASS) { "Unexpected date picker class" }
        check(picker.parameterTypes.size == 3) { "Unexpected date picker parameter count" }
        check(picker.parameterTypes[0].toString() == DATE_PICKER_CLASS) { "Unexpected date picker receiver parameter" }
        check(picker.parameterTypes[2].toString() == "Ljava/lang/Integer;") { "Unexpected max-days parameter" }
        val pickerInstructions = picker.implementation!!.instructions
        val keyDatesIndex = pickerInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
            instruction.opcode == Opcode.CONST_STRING && reference?.string == "KEY_DATES"
        }
        check(keyDatesIndex >= 0) { "KEY_DATES anchor not found" }
        val fragmentListIndex = (keyDatesIndex - 1 downTo 0).firstOrNull { index ->
            val instruction = pickerInstructions[index]
            val reference = (instruction as? ReferenceInstruction)?.typeReference()
            instruction.opcode == Opcode.NEW_INSTANCE && reference?.type == "Ljava/util/ArrayList;"
        } ?: error("Fragment list creation anchor not found")

        val receiverRegister = picker.implementation!!.registerCount - 3
        var insertionIndex = fragmentListIndex
        picker.addInstruction(
            insertionIndex++,
            BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 4, receiverRegister)
        )
        val weekThreeInstructions = """
                # Build week +3 and append it to the page list in v3.
                invoke-direct {v4}, $DATE_PICKER_CLASS->getCurrentCalendar()Ljava/util/Calendar;
                move-result-object v4
                const/4 v5, 0x3
                invoke-virtual {v4, v5}, Ljava/util/Calendar;->get(I)I
                move-result v7
                add-int/lit8 v7, v7, 0x3
                invoke-virtual {v4, v5, v7}, Ljava/util/Calendar;->set(II)V
                new-instance v8, Ljava/util/ArrayList;
                invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V
                invoke-static {v4, v8}, $DATE_PICKER_CLASS->q(Ljava/util/Calendar;Ljava/util/List;)Ljava/util/ArrayList;
                move-result-object v4
                invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            """.trimIndent()
        val compiledWeekThree = weekThreeInstructions.toInstructions(picker)
        picker.addInstructions(insertionIndex, compiledWeekThree)
        insertionIndex += compiledWeekThree.size
        picker.addInstruction(
            insertionIndex++,
            BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 4, receiverRegister)
        )
        val weekFourInstructions = """
                # Build week +4. Keep its seven columns but disable dates after J+30.
                invoke-direct {v4}, $DATE_PICKER_CLASS->getCurrentCalendar()Ljava/util/Calendar;
                move-result-object v4
                const/4 v5, 0x3
                invoke-virtual {v4, v5}, Ljava/util/Calendar;->get(I)I
                move-result v7
                add-int/lit8 v7, v7, 0x4
                invoke-virtual {v4, v5, v7}, Ljava/util/Calendar;->set(II)V
                new-instance v8, Ljava/util/ArrayList;
                invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V
                invoke-static {v4, v8}, $DATE_PICKER_CLASS->q(Ljava/util/Calendar;Ljava/util/List;)Ljava/util/ArrayList;
                move-result-object v4

                # v6 is 31 minus the enabled days in the current week.
                # Three complete following weeks consume 21 days. The last enabled
                # zero-based index in week +4 is therefore v6 - 22.
                add-int/lit8 v8, v6, -0x16
                const/4 v7, 0x0
                :j30_week4_loop
                invoke-virtual {v4}, Ljava/util/ArrayList;->size()I
                move-result v9
                if-ge v7, v9, :j30_week4_done
                if-le v7, v8, :j30_week4_next
                invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
                move-result-object v9
                check-cast v9, LZ6/c;
                iput-boolean v2, v9, LZ6/c;->e:Z
                :j30_week4_next
                add-int/lit8 v7, v7, 0x1
                goto :j30_week4_loop
                :j30_week4_done
                invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            """.trimIndent()
        val compiledWeekFour = weekFourInstructions.toInstructions(picker)
        picker.addInstructionsWithLabels(insertionIndex, weekFourInstructions)
        insertionIndex += compiledWeekFour.size
        picker.addInstruction(
            insertionIndex++,
            BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 4, receiverRegister)
        )
        picker.addInstructionsWithLabels(
            insertionIndex,
            """
                # A partial week +5 is needed when today is Saturday or Sunday.
                const/16 v7, 0x1c
                if-le v6, v7, :j30_week5_skip
                invoke-direct {v4}, $DATE_PICKER_CLASS->getCurrentCalendar()Ljava/util/Calendar;
                move-result-object v4
                const/4 v5, 0x3
                invoke-virtual {v4, v5}, Ljava/util/Calendar;->get(I)I
                move-result v7
                add-int/lit8 v7, v7, 0x5
                invoke-virtual {v4, v5, v7}, Ljava/util/Calendar;->set(II)V
                new-instance v8, Ljava/util/ArrayList;
                invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V
                invoke-static {v4, v8}, $DATE_PICKER_CLASS->q(Ljava/util/Calendar;Ljava/util/List;)Ljava/util/ArrayList;
                move-result-object v4

                # Four complete following weeks consume 28 days. Week +5 therefore
                # enables one or two days, depending on today's weekday.
                add-int/lit8 v8, v6, -0x1d
                const/4 v7, 0x0
                :j30_week5_loop
                invoke-virtual {v4}, Ljava/util/ArrayList;->size()I
                move-result v9
                if-ge v7, v9, :j30_week5_done
                if-le v7, v8, :j30_week5_next
                invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
                move-result-object v9
                check-cast v9, LZ6/c;
                iput-boolean v2, v9, LZ6/c;->e:Z
                :j30_week5_next
                add-int/lit8 v7, v7, 0x1
                goto :j30_week5_loop
                :j30_week5_done
                invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                :j30_week5_skip
                nop
            """.trimIndent()
        )
    }
}
