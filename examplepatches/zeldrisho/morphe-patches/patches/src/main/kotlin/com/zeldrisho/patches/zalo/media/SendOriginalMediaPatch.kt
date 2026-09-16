package com.zeldrisho.patches.zalo.media

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/** Enables Zalo's existing server-supported original-quality photo path. */
@Suppress("unused")
val sendZaloOriginalMediaPatch = bytecodePatch(
    name = "Prefer original photo quality",
    description = "Enables Zalo's existing original-quality photo path. " +
        "It does not change picker defaults, server upload limits, account restrictions, or video handling.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        SelectedMediaQuality.method.addInstructions(
            0,
            """
            const/4 v0, 0x2
            return v0
            """.trimIndent(),
        )

        OriginalMediaQualityAvailable.method.addInstructions(
            0,
            """
            const/4 v0, 0x1
            return v0
            """.trimIndent(),
        )
    }
}
