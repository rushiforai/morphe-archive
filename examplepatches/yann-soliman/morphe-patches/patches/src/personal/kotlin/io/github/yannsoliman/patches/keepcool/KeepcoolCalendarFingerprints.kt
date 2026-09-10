package io.github.yannsoliman.patches.keepcool

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal const val ROLE_PARAMS_CLASS = "Lmodels/domain/user/RoleParams;"

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
        methodCall(
            definingClass = "Landroidx/viewpager2/widget/ViewPager2;",
            name = "setAdapter"
        )
    )
)
