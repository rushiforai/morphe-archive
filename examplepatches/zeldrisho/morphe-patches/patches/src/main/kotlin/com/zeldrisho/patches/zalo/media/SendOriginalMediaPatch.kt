package com.zeldrisho.patches.zalo.media

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

private const val SMALI_HEX_RADIX = 16

/** Returns the referenced field name, or null when the instruction has no field reference. */
private fun fieldName(instruction: Instruction): String? = ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.name

/** Returns the sole list index referencing [name]; fails if there are zero or multiple matches. */
internal typealias IndexedInstruction = Pair<Int, Instruction>

/** Returns the sole method index referencing [name]; fails if matches are not unique. */
internal fun singleFieldInstructionIndex(instructions: List<IndexedInstruction>, name: String): Int = instructions.filter { fieldName(it.second) == name }.single().first

/** Returns the first method index referencing [name]; fails if no field matches. */
internal fun firstFieldInstructionIndex(instructions: List<IndexedInstruction>, name: String): Int = instructions.first { fieldName(it.second) == name }.first

/** Returns the lowest method index referencing [name], or fails with [missingMessage]. */
internal fun earliestFieldInstructionIndex(
    instructions: List<IndexedInstruction>,
    name: String,
    missingMessage: String,
): Int = instructions.filter { fieldName(it.second) == name }.minByOrNull { it.first }?.first
    ?: error(missingMessage)

/** Returns the first MediaItem.q method index, or fails if the original-quality flag moved. */
internal fun earliestMediaItemFlagIndex(instructions: List<IndexedInstruction>): Int = instructions.filter { (_, instruction) ->
    val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
    reference?.definingClass == "Lcom/zing/zalo/data/mediapicker/model/MediaItem;" && reference.name == "q"
}.minByOrNull { it.first }?.first ?: error("MediaItem original flag read moved; re-hunt Lbq0/g->a()")

/** Replaces the instruction at [index] with the supplied smali [replacement]. */
internal fun replaceFieldInstruction(method: MutableMethod, index: Int, replacement: String) {
    method.replaceInstruction(index, replacement)
}

/**
 * Replaces the first reference to [name], using its index in [instructions] as the method index.
 *
 * The supplied list must have indexes aligned with [method]; absence fails with [missingMessage].
 */
internal fun replaceEarliestFieldInstruction(
    method: MutableMethod,
    instructions: List<IndexedInstruction>,
    name: String,
    replacement: String,
    missingMessage: String,
) {
    replaceFieldInstruction(method, earliestFieldInstructionIndex(instructions, name, missingMessage), replacement)
}

/**
 * Replaces the first MediaItem.q reference with true in the pinned destination register v13.
 *
 * The supplied [instructions] must have indexes aligned with [method].
 */
internal fun replaceEarliestMediaItemFlag(method: MutableMethod, instructions: List<IndexedInstruction>) {
    replaceFieldInstruction(
        method,
        earliestMediaItemFlagIndex(instructions),
        "const/4 v13, 0x1",
    )
}

/** Prepends an immediate return of [value] through v0, using a const/4-compatible literal. */
internal fun forceQualityResult(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, value: Int) {
    method.addInstructions(0, "const/4 v0, 0x${value.toString(SMALI_HEX_RADIX)}\nreturn v0")
}

/** Prepends an assignment of original quality (2) to the picker argument p0. */
internal fun forcePickerQualityArgument(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    method.addInstructions(0, "const/4 p0, 0x2")
}

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
        forceQualityResult(SelectedMediaQuality.method, 2)

        // The quality sheet receives the current selection in a Bundle. Force
        // that initial value too; otherwise the sheet can still open on HD
        // when the stored selection predates this patch.
        forcePickerQualityArgument(QualityPickerArguments.method)

        // MediaPickerView.b7() initializes the photo picker to HD when the
        // quality control is enabled. Change only that initialization; the
        // non-HD branch remains Standard.
        val defaultQualityIndex = singleFieldInstructionIndex(
            PickerQualityInitialization.instructionMatches.map { it.index to it.instruction },
            "HD",
        )
        PickerQualityInitialization.method.replaceInstruction(
            defaultQualityIndex,
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
        val landingPageQualityIndex = singleFieldInstructionIndex(
            LandingPageQualityChipUpdate.instructionMatches.map { it.index to it.instruction },
            "Z1",
        )
        LandingPageQualityChipUpdate.method.replaceInstruction(
            landingPageQualityIndex,
            "const/4 v1, 0x2",
        )

        // The send-mode layout initializes the same chip from Z1 before the
        // selection callback runs. Force that label as well; leave the later
        // HD-checkbox initialization untouched.
        replaceEarliestFieldInstruction(
            LandingPageQualityChipInitialization.method,
            LandingPageQualityChipInitialization.instructionMatches.map { it.index to it.instruction },
            "Z1",
            "const/4 p3, 0x2",
            "LandingPageView quality-chip initialization moved; re-hunt W4()",
        )

        // The chat input bar also mirrors the picker quality after selection.
        // This is the visible chip in the normal send flow.
        val chatInputBarQualityIndex = firstFieldInstructionIndex(
            ChatInputBarQualityChipUpdate.instructionMatches.map { it.index to it.instruction },
            "J0",
        )
        ChatInputBarQualityChipUpdate.method.replaceInstruction(
            chatInputBarQualityIndex,
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
        replaceEarliestMediaItemFlag(
            SelectedPhotoOriginalFlag.method,
            SelectedPhotoOriginalFlag.instructionMatches.map { it.index to it.instruction },
        )

        // The picker checks these helpers directly before it calls e(). In
        // 26.08.01, f() is the account/config entitlement check that sends a
        // non-entitled selection into the Z Cloud purchase flow. Patching only
        // e() makes the option visible but still leaves that flow reachable.
        forceQualityResult(OriginalMediaQualityEnabled.method, 1)
        forceQualityResult(OriginalMediaQualityEntitled.method, 1)
        forceQualityResult(OriginalMediaQualityAvailable.method, 1)
    }
}
