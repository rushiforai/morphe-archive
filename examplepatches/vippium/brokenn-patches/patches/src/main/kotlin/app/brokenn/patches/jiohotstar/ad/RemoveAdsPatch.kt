package app.brokenn.patches.jiohotstar.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.patch.bytecodePatch
import app.brokenn.patches.shared.firstInstructionIndex
import app.brokenn.patches.shared.nextInstructionIndex
import app.brokenn.patches.shared.referenceText
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes pre-roll, mid-roll, live-match and home-feed ads."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        // Neutralise the ad metadata: force all-optional params and an empty name.
        AdMetadataConstructorFingerprint.method.addInstructions(0, """
            const/4 p1, 0x1
            const/4 p2, 0x1
            const/4 p3, 0x0
            const/4 p4, 0x0
            const/4 p5, 0x0
            const-string p6, ""
        """)

        WatchLiveAdsInitFingerprint.method.returnEarly()
        DisplayAdComposableFingerprint.method.returnEarly()

        SgaiPrefetcherGetAdFingerprint.method.addInstructions(0, """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            return-object v0
        """)

        LiveAdsManagerProcessFingerprint.method.addInstructions(0, """
            sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
            return-object v0
        """)

        // The seekbar ticks are drawn from the ad-break cue-point intervention, not from the
        // ad payload, so the converter has to see an empty list to stop painting them.
        val cuePoints = AdCuePointsConverterFingerprint.method
        val fetchIndex = cuePoints.firstInstructionIndex {
            it.referenceText() == CUE_POINTS_GETTER
        }
        require(fetchIndex >= 0) { "Remove ads: ad cue point fetch not found in ${cuePoints.definingClass}" }
        val resultIndex = cuePoints.nextInstructionIndex(fetchIndex, 2) {
            it.opcode == Opcode.MOVE_RESULT_OBJECT
        }
        require(resultIndex >= 0) { "Remove ads: ad cue point result register not found in ${cuePoints.definingClass}" }
        val listRegister = cuePoints.getInstruction<OneRegisterInstruction>(resultIndex).registerA
        cuePoints.addInstructions(resultIndex + 1, """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v$listRegister
        """)
    }
}

private const val CUE_POINTS_GETTER =
    "Lcom/hotstar/ui/model/feature/intervention/AdBreakInterventionSource;->getCuePointsList()Ljava/util/List;"
