package io.github.yannsoliman.patches.keepcool

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val DATE_PICKER_CLASS =
    "Lcommon_ui/business_components/common/date_picker/DatePickerComponent;"
internal const val USER_REPOSITORY_CLASS = "Lapis/repository/UserRepository;"
internal const val CELL_DATE_PICKER_CLASS =
    "Lcommon_ui/business_components/common/date_picker/CellDatePickerComponent;"
internal const val DATE_MODEL_CLASS = "LZ6/c;"

internal object KeepcoolEmailFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string(ORIGINAL_REGEX),
        methodCall(definingClass = "Ljava/util/regex/Pattern;", name = "compile"),
        methodCall(definingClass = "Ljava/util/regex/Pattern;", name = "matcher"),
        methodCall(definingClass = "Ljava/util/regex/Matcher;", name = "matches")
    )
)


internal object BookingSearchContextFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(
            definingClass = USER_REPOSITORY_CLASS,
            name = "findBookingSlots"
        )
    )
)

internal object BookingDateCellBindFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        fieldAccess(
            definingClass = DATE_MODEL_CLASS,
            name = "f",
            type = "Z",
            opcode = Opcode.IGET_BOOLEAN
        ),
        methodCall(
            definingClass = CELL_DATE_PICKER_CLASS,
            name = "n",
            parameters = listOf("Z", "LZ6/f;")
        )
    )
)

internal object BookedDatesUpdateFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = DATE_PICKER_CLASS,
            name = "setDateIsBooked",
            parameters = listOf("Ljava/util/List;")
        )
    )
)
