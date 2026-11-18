package com.morphe.patches.zankremote

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.patch
import com.morphe.patches.zankremote.Constants.COMPATIBILITY_ZANK_REMOTE

@Suppress("unused")
val unlockProPatch = patch(
    name = "Unlock Pro",
    description = "Unlocks Pro features including Air Mouse mode and Floating Remote without subscription."
) {
    compatibleWith(COMPATIBILITY_ZANK_REMOTE)

    execute {
        IsProFingerprint.method.replaceInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
