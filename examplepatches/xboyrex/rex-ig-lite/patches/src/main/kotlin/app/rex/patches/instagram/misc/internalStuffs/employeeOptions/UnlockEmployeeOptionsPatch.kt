/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.internalStuffs.employeeOptions

import app.rex.patches.instagram.misc.hookFlags.hookFlagsPatch
import app.rex.patches.instagram.misc.internalStuffs.checkMappingsPatch
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.addFlags
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockEmployeeOptionsPatch =
    bytecodePatch(
        name = "Unlock employee options",
        description = "Unlocks all options using by employee for debugging",
        default = false,
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(
            settingsPatch,
            hookFlagsPatch,
            checkMappingsPatch,
        )
        execute {

            addFlags("employeeOptionsFlags")
            enableSettings("unlockEmployeeOptions")
        }
    }
