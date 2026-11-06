package app.vipulog.patches.ezykam.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.vipulog.patches.ezykam.playback.Fingerprints.CAMERA_PLAYBACK_FRAGMENT_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.CAMERA_PLAYBACK_PANEL_ACTIVITY_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.CAPABILITY_SPEED_4X_BITMASK
import app.vipulog.patches.ezykam.playback.Fingerprints.FragmentSpeedIndicatorFingerprint
import app.vipulog.patches.ezykam.playback.Fingerprints.LANDSCAPE_PLAYBACK_PANEL_ACTIVITY_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.LandscapeSpeedIndicatorFingerprint
import app.vipulog.patches.ezykam.playback.Fingerprints.PLAYBACK_PANEL_MODEL_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.PLAYBACK_PRESENTER_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.PLAYBACK_SPEED_ASSIST_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.PLAYBACK_SPEED_HOOK_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.PLAYBACK_SPEED_LISTENER_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.PLAYBACK_SPEED_REQUEST_CALLBACK_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.PLAYBACK_SPEED_REQUEST_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.PanelSpeedIndicatorFingerprint
import app.vipulog.patches.ezykam.playback.Fingerprints.PlaybackModelSupportedSpeedsFingerprint
import app.vipulog.patches.ezykam.playback.Fingerprints.PlaybackSpeedRequestFailureFingerprint
import app.vipulog.patches.ezykam.playback.Fingerprints.PlaybackSpeedSelectFingerprint
import app.vipulog.patches.ezykam.playback.Fingerprints.TEXT_VIEW_CLASS
import app.vipulog.patches.ezykam.shared.Constants.COMPATIBILITY_EZYKAM_4_1_4
import app.vipulog.patches.ezykam.signature.certificateFingerprintPatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun buildSpeedSelectionHook(): String = """
    iget-object v0, p0, $PLAYBACK_SPEED_ASSIST_CLASS->c:$PLAYBACK_SPEED_LISTENER_CLASS
    iget-object v1, p0, $PLAYBACK_SPEED_ASSIST_CLASS->d:$PLAYBACK_PRESENTER_CLASS
    invoke-static {v0, v1, p1}, $PLAYBACK_SPEED_HOOK_CLASS->selectSpeed(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    return-void
""".trimIndent()

private fun buildDualViewIndicatorHook(classDescriptor: String, primaryField: String, secondaryField: String): String = """
    iget-object v0, p0, $classDescriptor->$primaryField:$TEXT_VIEW_CLASS
    iget-object v1, p0, $classDescriptor->$secondaryField:$TEXT_VIEW_CLASS
    invoke-static {p1, v0, v1}, $PLAYBACK_SPEED_HOOK_CLASS->updateSpeedText(Ljava/lang/Object;Landroid/widget/TextView;Landroid/widget/TextView;)V
    return-void
""".trimIndent()

private fun buildSingleViewIndicatorHook(classDescriptor: String, fieldName: String): String = """
    iget-object v0, p0, $classDescriptor->$fieldName:$TEXT_VIEW_CLASS
    invoke-static {p1, v0}, $PLAYBACK_SPEED_HOOK_CLASS->updateSpeedText(Ljava/lang/Object;Landroid/widget/TextView;)V
    return-void
""".trimIndent()

private fun buildFailureCallbackRecordingHook(): String = """
    iget-object v0, p0, $PLAYBACK_SPEED_REQUEST_CALLBACK_CLASS->c:$PLAYBACK_SPEED_REQUEST_CLASS
    iget-object v0, v0, $PLAYBACK_SPEED_REQUEST_CLASS->b:$PLAYBACK_PANEL_MODEL_CLASS
    iget v1, p0, $PLAYBACK_SPEED_REQUEST_CALLBACK_CLASS->a:I
    invoke-static {v0, v1}, $PLAYBACK_PANEL_MODEL_CLASS->s(${PLAYBACK_PANEL_MODEL_CLASS}I)I
""".trimIndent()

@Suppress("unused")
val playbackSpeedPatch = bytecodePatch(
    name = "Add 4x playback speed",
    description = "Adds 4x fast-forward speed option to camera SD card playback.",
    default = true,
) {
    dependsOn(certificateFingerprintPatch)
    compatibleWith(COMPATIBILITY_EZYKAM_4_1_4)
    extendWith("extensions/ezykam.mpe")

    execute {
        val supportedSpeedsMethod = PlaybackModelSupportedSpeedsFingerprint.method
        val instructions = supportedSpeedsMethod.implementation!!.instructions

        val localStorageCallIndex = instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            (reference as? MethodReference)?.name == "getLocalStorage"
        }

        check(localStorageCallIndex != -1) {
            "Could not locate getLocalStorage invocation in PlayBackPanelModel.v0()"
        }

        // Bit 0x400 in the Tuya Camera SDK capability bitmask corresponds to 4x playback support
        supportedSpeedsMethod.addInstruction(
            localStorageCallIndex + 2,
            "or-int/lit16 v0, v0, $CAPABILITY_SPEED_4X_BITMASK",
        )

        PlaybackSpeedSelectFingerprint.method.apply {
            removeInstructions(0, implementation!!.instructions.size)
            addInstructions(0, buildSpeedSelectionHook())
        }

        // Record the requested speed mode even when the async SDK call resolves through onFailure
        PlaybackSpeedRequestFailureFingerprint.method.addInstructions(
            0,
            buildFailureCallbackRecordingHook(),
        )

        PanelSpeedIndicatorFingerprint.method.apply {
            removeInstructions(0, implementation!!.instructions.size)
            addInstructions(
                0,
                buildDualViewIndicatorHook(CAMERA_PLAYBACK_PANEL_ACTIVITY_CLASS, "x", "y"),
            )
        }

        LandscapeSpeedIndicatorFingerprint.method.apply {
            removeInstructions(0, implementation!!.instructions.size)
            addInstructions(
                0,
                buildDualViewIndicatorHook(LANDSCAPE_PLAYBACK_PANEL_ACTIVITY_CLASS, "w", "x"),
            )
        }

        FragmentSpeedIndicatorFingerprint.method.apply {
            removeInstructions(0, implementation!!.instructions.size)
            addInstructions(
                0,
                buildSingleViewIndicatorHook(CAMERA_PLAYBACK_FRAGMENT_CLASS, "m"),
            )
        }
    }
}
