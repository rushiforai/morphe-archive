package app.brokenn.patches.octogram.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_OCTOGRAM = Compatibility(
        name = "OctoGram",
        packageName = "it.octogram.android",
        appIconColor = 0x2AABEE,
        targets = listOf(
            AppTarget(version = "3.6.1 Beta 2")
        )
    )
}
