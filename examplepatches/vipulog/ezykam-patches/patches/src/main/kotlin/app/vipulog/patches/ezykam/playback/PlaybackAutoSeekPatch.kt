package app.vipulog.patches.ezykam.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.vipulog.patches.ezykam.playback.Fingerprints.AutoSeekNextSegmentFingerprint
import app.vipulog.patches.ezykam.playback.Fingerprints.FragmentEndCallbackFingerprint
import app.vipulog.patches.ezykam.playback.Fingerprints.FrameInfoAdvanceFingerprint
import app.vipulog.patches.ezykam.playback.Fingerprints.NEXT_TIME_PIECE_OBSERVER_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.NextTimePieceObserverFingerprint
import app.vipulog.patches.ezykam.playback.Fingerprints.PLAYBACK_PANEL_PRESENTER_CLASS
import app.vipulog.patches.ezykam.playback.Fingerprints.PlaybackStartVideoFingerprint
import app.vipulog.patches.ezykam.signature.certificateFingerprintPatch
import app.vipulog.patches.ezykam.shared.Constants.COMPATIBILITY_EZYKAM_4_1_4
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val playbackAutoSeekPatch = bytecodePatch(
    name = "Fix playback freeze at clip boundaries",
    description = "Fixes SD card playback freezing at clip ends by auto-advancing to consecutive fragments.",
    default = true,
) {
    dependsOn(certificateFingerprintPatch)
    compatibleWith(COMPATIBILITY_EZYKAM_4_1_4)

    execute {
        // 1. Force isAutoSeekNextTimeSegment to always return true so the model automatically
        // queries and queues contiguous recording segments on the SD card.
        AutoSeekNextSegmentFingerprint.method.apply {
            removeInstructions(0, implementation!!.instructions.size)
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent(),
            )
        }

        // 2. In FragmentEndCallback.onSuccess, neutralise the isSupportPlayMode branch so the
        // end-of-fragment signal is unconditionally dispatched when a video clip ends.
        val callbackInstructions = FragmentEndCallbackFingerprint.method.implementation!!.instructions
        val callbackPlayModeCallIndex = callbackInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            (reference as? MethodReference)?.name == "isSupportPlayMode"
        }
        check(callbackPlayModeCallIndex != -1) {
            "Could not locate isSupportPlayMode invocation in FragmentEndCallback.onSuccess"
        }

        val callbackBranchIndex = callbackPlayModeCallIndex + 2
        val callbackBranchInstruction = callbackInstructions[callbackBranchIndex]
        check(callbackBranchInstruction.opcode.name.startsWith("if-")) {
            "Expected conditional branch instruction after isSupportPlayMode in callback, found ${callbackBranchInstruction.opcode.name}"
        }
        FragmentEndCallbackFingerprint.method.replaceInstruction(callbackBranchIndex, "nop")

        // 3. In PlayBackPanelPresenter.j, bypass the isSupportPlayMode check to ensure s0(endTime)
        // is always invoked to advance playback to the next segment when timestamps update.
        val presenterInstructions = FrameInfoAdvanceFingerprint.method.implementation!!.instructions
        val presenterPlayModeCallIndex = presenterInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            (reference as? MethodReference)?.name == "isSupportPlayMode"
        }
        check(presenterPlayModeCallIndex != -1) {
            "Could not locate isSupportPlayMode invocation in PlayBackPanelPresenter.j"
        }

        val presenterBranchIndex = presenterPlayModeCallIndex + 2
        val presenterBranchInstruction = presenterInstructions[presenterBranchIndex]
        check(presenterBranchInstruction.opcode.name.startsWith("if-")) {
            "Expected conditional branch instruction after isSupportPlayMode in presenter, found ${presenterBranchInstruction.opcode.name}"
        }
        FrameInfoAdvanceFingerprint.method.replaceInstruction(presenterBranchIndex, "nop")

        // 4. In PlayBackPanelPresenter.u0 (startPlayVideo), neutralize the duplicate-play check that
        // erroneously cancels playback of contiguous segments sharing the boundary timestamp.
        val startVideoInstructions = PlaybackStartVideoFingerprint.method.implementation!!.instructions
        val cancelStringIndex = startVideoInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            (reference as? StringReference)?.string?.contains("timePieceBean playtime same cancel") == true
        }
        check(cancelStringIndex != -1) {
            "Could not locate cancellation log string in PlayBackPanelPresenter.u0"
        }

        val fieldReadIndices = mutableListOf<Int>()
        for (i in 0 until cancelStringIndex) {
            val instruction = startVideoInstructions[i]
            val reference = (instruction as? ReferenceInstruction)?.reference
            if ((reference as? FieldReference)?.name == "n" && instruction.opcode.name.startsWith("iget")) {
                fieldReadIndices.add(i)
            }
        }
        check(fieldReadIndices.size >= 2) {
            "Expected at least 2 iget instructions for field 'n' before cancel string in u0, found ${fieldReadIndices.size}"
        }

        PlaybackStartVideoFingerprint.method.replaceInstruction(fieldReadIndices[1], "const/4 v0, 0x0")
        PlaybackStartVideoFingerprint.method.replaceInstruction(fieldReadIndices[0], "const/4 v0, 0x0")

        // 5. In PlayBackPanelPresenter$12.a, reset presenter.n to 0 via synthetic accessor method K
        // before invoking u0 to clear any lingering clip start timestamp.
        val nextPieceInstructions = NextTimePieceObserverFingerprint.method.implementation!!.instructions
        val startVideoCallIndex = nextPieceInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            (reference as? MethodReference)?.name == "u0"
        }
        check(startVideoCallIndex != -1) {
            "Could not locate u0 invocation in PlayBackPanelPresenter$12.a"
        }

        NextTimePieceObserverFingerprint.method.addInstructions(
            startVideoCallIndex,
            """
                const/4 v1, 0x0
                invoke-static {v0, v1}, $PLAYBACK_PANEL_PRESENTER_CLASS->K(${PLAYBACK_PANEL_PRESENTER_CLASS}I)I
            """.trimIndent(),
        )
    }
}
