package app.zeldrisho.patches.zalo.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO

/** Allows saving and screenshots for photos opened through the profile-cover viewer route. */
@Suppress("unused")
val enableZaloProfileCoverSavingPatch = bytecodePatch(
    name = "Enable profile cover saving",
    description = "Restores Save photo for profile cover photos and allows screenshots. " +
        "Other viewers are unchanged.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val version261101 = packageMetadata.versionName == "26.11.01"
        val screenshotPolicies = ProfileCoverScreenshotPolicy.matchAll(0..1) + ProfileCoverScreenshotPolicy261002.matchAll(0..1) + ProfileCoverScreenshotPolicy261101.matchAll(0..1)
        val menus = ProfileCoverDownloadMenu.matchAll(0..1) + ProfileCoverDownloadMenu261002.matchAll(0..1) + ProfileCoverDownloadMenu261101.matchAll(0..1)
        check(screenshotPolicies.size == 1 && menus.size == 1) { "Expected one profile cover policy and one menu" }
        val screenshot = screenshotPolicies.single()
        val screenshotCall = screenshot.instructionMatches.last { it.instruction.opcode == Opcode.INVOKE_VIRTUAL }
        screenshot.method.addInstructions(screenshotCall.index, "const/4 v0, 0x0")

        val menu = menus.single()
        val coverFlagIndex = menu.instructionMatches.first().index
        val method = menu.method
        val instructions = method.implementation!!.instructions
        if (version261101) {
            val allowDownloadIndex = (coverFlagIndex + 1 until instructions.size - 7).singleOrNull { index ->
                isBranchOn(instructions[index], Opcode.IF_NEZ, 5) &&
                    isBranchOn(instructions[index + 1], Opcode.IF_NEZ, 10) &&
                    isBranchOn(instructions[index + 2], Opcode.IF_NEZ, 11) &&
                    isBranchOn(instructions[index + 3], Opcode.IF_NEZ, 3) &&
                    instructions[index + 4].opcode == Opcode.MOVE &&
                    (instructions[index + 4] as? TwoRegisterInstruction)?.let { it.registerA == 3 && it.registerB == 8 } == true &&
                    instructions[index + 5].opcode == Opcode.GOTO &&
                    instructions[index + 6].opcode == Opcode.MOVE &&
                    (instructions[index + 6] as? TwoRegisterInstruction)?.let { it.registerA == 3 && it.registerB == 7 } == true &&
                    isBranchOn(instructions[index + 7], Opcode.IF_NEZ, 6)
            }?.plus(7) ?: error("Profile-cover download eligibility check was not uniquely found")
            method.addInstructionsAtControlFlowLabel(allowDownloadIndex, """
                iget-boolean v11, v2, Lcom/zing/zalo/social/features/menu_feed/model/BottomSheetMenuBundleDataPhotoViewfull;->j:Z
                or-int/2addr v3, v11
            """)
        } else {
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
}

/** Matches a single-register branch by opcode and tested register, regardless of its target. */
private fun isBranchOn(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction, opcode: Opcode, register: Int): Boolean = instruction.opcode == opcode &&
    (instruction as? OneRegisterInstruction)?.registerA == register

// Experimental target: 26.11.01 is advertised but not fully device-qualified.
private object ProfileCoverScreenshotPolicy261101 : Fingerprint(
    definingClass = "Lsb20;", name = "J", accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V", parameters = listOf("Ldoc;", "Lcom/zing/zalo/control/ItemAlbumMobile;", "Lfl8;", "Lrxj;", "I"),
    filters = listOf(string("fromProfileCover"),
        methodCall(definingClass = "Landroid/os/BaseBundle;", name = "putBoolean", parameters = listOf("Ljava/lang/String;", "Z"), returnType = "V"),
        string("EXTRA_SHOULD_PREVENT_SCREENSHOT"),
        methodCall(definingClass = "Landroid/os/BaseBundle;", name = "putBoolean", parameters = listOf("Ljava/lang/String;", "Z"), returnType = "V")),
)

private object ProfileCoverDownloadMenu261101 : Fingerprint(
    definingClass = "Lcom/zing/zalo/social/features/menu_feed/BottomSheetMenuView;", name = "j5",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL), returnType = "V", parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(fieldAccess(opcode = Opcode.IGET_BOOLEAN,
        definingClass = "Lcom/zing/zalo/social/features/menu_feed/model/BottomSheetMenuBundleDataPhotoViewfull;", name = "j", type = "Z")),
)

/** Profile-cover launch helper in Zalo 26.10.02. */
private object ProfileCoverScreenshotPolicy261002 : Fingerprint(
    definingClass = "Ltc/b1;", name = "J",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Lbk/a;", "Lcom/zing/zalo/control/ItemAlbumMobile;", "Lz00/p1;", "Lb70/u;", "I"),
    filters = listOf(
        string("fromProfileCover"),
        methodCall(definingClass = "Landroid/os/BaseBundle;", name = "putBoolean", parameters = listOf("Ljava/lang/String;", "Z"), returnType = "V"),
        string("EXTRA_SHOULD_PREVENT_SCREENSHOT"),
        methodCall(definingClass = "Landroid/os/BaseBundle;", name = "putBoolean", parameters = listOf("Ljava/lang/String;", "Z"), returnType = "V"),
    ),
)

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

/** Profile-cover menu in Zalo 26.10.02. */
private object ProfileCoverDownloadMenu261002 : Fingerprint(
    definingClass = "Lcom/zing/zalo/social/features/menu_feed/BottomSheetMenuView;", name = "h5",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V", parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, definingClass = "Lcom/zing/zalo/social/features/menu_feed/model/BottomSheetMenuBundleDataPhotoViewfull;", name = "j", type = "Z"),
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
