package com.zeldrisho.patches.zalo.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/** Allows saving and screenshots for photos opened through the profile-cover viewer route. */
@Suppress("unused")
val enableZaloProfileCoverSavingPatch = bytecodePatch(
    name = "Enable profile cover saving",
    description = "Restores the “Save photo” action and allows screenshots for profile cover photos. Other viewer entry points are unchanged.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val screenshotCall = ProfileCoverScreenshotPolicy.instructionMatches.last { it.instruction.opcode == Opcode.INVOKE_VIRTUAL }
        ProfileCoverScreenshotPolicy.method.addInstructions(screenshotCall.index, "const/4 v0, 0x0")

        val menuMatches = ProfileCoverDownloadMenu.instructionMatches
        val coverFlagIndex = menuMatches.first().index
        val method = ProfileCoverDownloadMenu.method
        val instructions = method.implementation!!.instructions
        val allowDownloadIndex = (coverFlagIndex + 1 until instructions.size - 3).singleOrNull { index ->
            isBranchOn(instructions[index], Opcode.IF_NEZ, 12) &&
                isBranchOn(instructions[index + 1], Opcode.IF_NEZ, 13) &&
                isBranchOn(instructions[index + 2], Opcode.IF_NEZ, 4) &&
                instructions[index + 3].opcode == Opcode.MOVE &&
                (instructions[index + 3] as? TwoRegisterInstruction)?.let {
                    it.registerA == 4 && it.registerB == 8
                } == true
        }?.plus(4) ?: error("Profile-cover download eligibility check was not uniquely found")
        method.addInstructions(allowDownloadIndex, "iget-boolean v13, v0, Lcom/zing/zalo/social/features/menu_feed/model/BottomSheetMenuBundleDataPhotoViewfull;->j:Z\nor-int/2addr v4, v13")
    }
}

/** Matches a single-register branch by opcode and tested register, regardless of its target. */
private fun isBranchOn(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction, opcode: Opcode, register: Int): Boolean = instruction.opcode == opcode &&
    (instruction as? OneRegisterInstruction)?.registerA == register

/** The actual profile-cover launch helper explicitly marks fromProfileCover. */
private object ProfileCoverScreenshotPolicy : Fingerprint(
    definingClass = "Lkb/q0;",
    name = "K",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Lqi/a;",
        "Lcom/zing/zalo/control/ItemAlbumMobile;",
        "Lfz/b2;",
        "Lg50/r;",
        "I",
    ),
    filters = listOf(
        string("fromProfileCover"),
        methodCall(
            definingClass = "Landroid/os/BaseBundle;",
            name = "putBoolean",
            parameters = listOf("Ljava/lang/String;", "Z"),
            returnType = "V",
        ),
        string("EXTRA_SHOULD_PREVENT_SCREENSHOT"),
        methodCall(
            definingClass = "Landroid/os/BaseBundle;",
            name = "putBoolean",
            parameters = listOf("Ljava/lang/String;", "Z"),
            returnType = "V",
        ),
    ),
)

/** Profile-cover viewer menu model carries this flag as field j. */
private object ProfileCoverDownloadMenu : Fingerprint(
    definingClass = "Lcom/zing/zalo/social/features/menu_feed/BottomSheetMenuView;",
    name = "S4",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "Lcom/zing/zalo/social/features/menu_feed/model/BottomSheetMenuBundleDataPhotoViewfull;",
            name = "j",
            type = "Z",
        ),
    ),
)
