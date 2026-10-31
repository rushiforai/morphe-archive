package app.template.patches.zalo.media

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO

/**
 * Keeps locally available large chat files out of Zalo's expired state.
 *
 * Zalo's classifier uses BIG_FILE_EXPIRED to select the subscription/expired
 * UI even when the restored file remains on disk. Replacing only that enum
 * load preserves all other media states and lets the normal local-file path
 * serve the existing file.
 *
 * Limits: this is a client-side status bypass. It cannot recreate a file that
 * is absent locally, bypass server authorization for a new download, or make
 * a remote URL live again.
 */
@Suppress("unused")
val keepZaloMediaAccessiblePatch = bytecodePatch(
    name = "Keep expired media accessible",
    description = "Keeps locally stored large chat media accessible after expiry. " +
        "Missing files and server restrictions are unaffected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val matches = MediaExpiryStatus.matchAll(0..1) + MediaExpiryStatus261002.matchAll(0..1)
        check(matches.size == 1) { "Expected exactly one media expiry classifier" }
        val match = matches.single()
        val expiredLoad = match.instructionMatches
            .single { match ->
                val reference = (match.instruction as? ReferenceInstruction)?.reference
                (reference as? FieldReference)?.name == "BIG_FILE_EXPIRED"
            }
        val register = (expiredLoad.instruction as OneRegisterInstruction).registerA
        val expiredField = (expiredLoad.instruction as ReferenceInstruction).reference as FieldReference
        val owner = expiredField.definingClass
        check(expiredField.type == owner) { "Unexpected media expiry enum type" }
        match.method.replaceInstruction(
            expiredLoad.index,
            "sget-object v$register, $owner->BIG_FILE_NOT_EXPIRED:$owner",
        )
    }
}
