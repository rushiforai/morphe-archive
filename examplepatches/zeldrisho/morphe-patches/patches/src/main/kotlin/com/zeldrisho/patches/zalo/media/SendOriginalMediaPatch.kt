package com.zeldrisho.patches.zalo.media

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/** Enables Zalo's existing server-supported original-quality photo path. */
@Suppress("unused")
val sendZaloOriginalMediaPatch = bytecodePatch(
    name = "Prefer original photo quality",
    description = "Enables Zalo's existing original-quality photo path by default. " +
        "It does not change server upload limits, account restrictions, or video handling.",
    default = true,
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

        // The quality sheet receives the current selection in a Bundle. Force
        // that initial value too; otherwise the sheet can still open on HD
        // when the stored selection predates this patch.
        QualityPickerArguments.method.addInstructions(
            0,
            """
            const/4 p0, 0x2
            """.trimIndent(),
        )

        // MediaPickerView.b7() initializes the photo picker to HD when the
        // quality control is enabled. Change only that initialization; the
        // non-HD branch remains Standard.
        val defaultQuality = PickerQualityInitialization.instructionMatches
            .mapNotNull { match ->
                val instruction = match.instruction as? ReferenceInstruction
                val reference = instruction?.reference as? FieldReference
                if (reference?.name == "HD") match else null
            }
            .single()
        PickerQualityInitialization.method.replaceInstruction(
            defaultQuality.index,
            "sget-object v0, Lvh1/d;->ORIGINAL:Lvh1/d;",
        )

        // Keep the quality chip consistent with the forced outgoing choice.
        PhotoQualityChipUpdate.method.addInstructions(
            0,
            """
            const/4 p1, 0x2
            """.trimIndent(),
        )

        // After selection, the landing page refreshes its own chip from Z1.
        // Override only that cached photo-quality value; visibility and video
        // handling remain unchanged.
        val landingPageQuality = LandingPageQualityChipUpdate.instructionMatches
            .single { match ->
                val instruction = match.instruction as? ReferenceInstruction
                val reference = instruction?.reference as? FieldReference
                reference?.name == "Z1"
            }
        LandingPageQualityChipUpdate.method.replaceInstruction(
            landingPageQuality.index,
            "const/4 v1, 0x2",
        )

        // The send-mode layout initializes the same chip from Z1 before the
        // selection callback runs. Force that label as well; leave the later
        // HD-checkbox initialization untouched.
        val landingPageChipInitialization = LandingPageQualityChipInitialization.instructionMatches
            .filter { match ->
                val instruction = match.instruction as? ReferenceInstruction
                val reference = instruction?.reference as? FieldReference
                reference?.name == "Z1"
            }
            .minByOrNull { it.index }
            ?: error("LandingPageView quality-chip initialization moved; re-hunt W4()")
        LandingPageQualityChipInitialization.method.replaceInstruction(
            landingPageChipInitialization.index,
            "const/4 p3, 0x2",
        )

        // The chat input bar also mirrors the picker quality after selection.
        // This is the visible chip in the normal send flow.
        val chatInputBarQuality = ChatInputBarQualityChipUpdate.instructionMatches
            .first { match ->
                val instruction = match.instruction as? ReferenceInstruction
                val reference = instruction?.reference as? FieldReference
                reference?.name == "J0"
            }
        ChatInputBarQualityChipUpdate.method.replaceInstruction(
            chatInputBarQuality.index,
            "const/4 v0, 0x2",
        )

        // Some selection callbacks update the chip through a path that does
        // not pass through the three owners above. Enforce the label at the
        // quality-chip rendering boundary; this widget is not used by video
        // sending, whose controls use separate views.
        QualityChipLabel.method.addInstructions(
            0,
            """
            const/4 v0, 0x2
            invoke-static {v0}, Lvh1/c;->a(I)Ljava/lang/String;
            move-result-object p1
            """.trimIndent(),
        )

        // The send conversion copies MediaItem.q into the outgoing photo
        // model. The picker UI can display Original while this flag remains
        // false, which causes the upload to use HD. Change only that copy;
        // the other q read feeds metadata and is intentionally untouched.
        val originalFlag = SelectedPhotoOriginalFlag.instructionMatches
            .filter { match ->
                val instruction = match.instruction as? ReferenceInstruction
                val reference = instruction?.reference as? FieldReference
                reference?.definingClass == "Lcom/zing/zalo/data/mediapicker/model/MediaItem;" &&
                    reference.name == "q"
            }
            .minByOrNull { it.index }
            ?: error("MediaItem original flag read moved; re-hunt Lbq0/g->a()")
        SelectedPhotoOriginalFlag.method.replaceInstruction(
            originalFlag.index,
            "const/4 v13, 0x1",
        )

        // The picker checks these helpers directly before it calls e(). In
        // 26.08.01, f() is the account/config entitlement check that sends a
        // non-entitled selection into the Z Cloud purchase flow. Patching only
        // e() makes the option visible but still leaves that flow reachable.
        OriginalMediaQualityEnabled.method.addInstructions(
            0,
            """
            const/4 v0, 0x1
            return v0
            """.trimIndent(),
        )

        OriginalMediaQualityEntitled.method.addInstructions(
            0,
            """
            const/4 v0, 0x1
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
