package com.zeldrisho.patches.zalo.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/**
 * Allows screenshots of avatars opened from a profile while retaining Zalo's
 * screenshot protection for other image-viewer entry points.
 */
@Suppress("unused")
val enableZaloAvatarSavingPatch = bytecodePatch(
    name = "Enable avatar saving",
    description = "Restores the “Save photo” action for avatars opened from a profile and allows screenshots. Other Zalo screenshot protections are unchanged.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val match = AvatarScreenshotPolicy.instructionMatches.single { it.instruction.opcode == Opcode.XOR_INT_2ADDR }
        val register = (match.instruction as TwoRegisterInstruction).registerA
        allowAvatarScreenshots(AvatarScreenshotPolicy.method, match.index, register)
    }
}

/**
 * Replaces the screenshot-policy instruction at zero-based [index] with a false value in [register].
 * The caller must supply the matched avatar policy instruction and its destination register.
 */
internal fun allowAvatarScreenshots(
    method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    index: Int,
    register: Int,
) {
    method.replaceInstruction(index, "const/4 v$register, 0x0")
}

/** The profile-only avatar launch builds its screenshot policy in this method. */
private object AvatarScreenshotPolicy : Fingerprint(
    definingClass = "Lcom/zing/zalo/social/presentation/profile/friend_profile/UserProfileView;",
    name = "u8",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    filters = listOf(
        string("avatarPhoto"),
        methodCall(
            definingClass = "Landroid/text/TextUtils;",
            name = "equals",
            parameters = listOf("Ljava/lang/CharSequence;", "Ljava/lang/CharSequence;"),
            returnType = "Z",
        ),
        opcode(Opcode.XOR_INT_2ADDR),
        string("EXTRA_SHOULD_PREVENT_SCREENSHOT"),
        methodCall(
            definingClass = "Landroid/os/BaseBundle;",
            name = "putBoolean",
            parameters = listOf("Ljava/lang/String;", "Z"),
            returnType = "V",
        ),
    ),
)
