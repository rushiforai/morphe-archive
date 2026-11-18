package com.morphe.patches.zankremote

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.patch
import com.morphe.patches.zankremote.Constants.COMPATIBILITY_ZANK_REMOTE

@Suppress("unused")
val removeAdsPatch = patch(
    name = "Remove Ads",
    description = "Disables App Open ads and interstitial ad prompts."
) {
    compatibleWith(COMPATIBILITY_ZANK_REMOTE)

    execute {
        AppOpenManagerShowAdFingerprint.method.replaceInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
