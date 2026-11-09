package app.brokenn.patches.jiohotstar.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes pre-roll, mid-roll, live-match and home-feed ads."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        AdMetadataConstructorFingerprint.method.addInstructions(0, """
            const/4 p1, 0x1
            const/4 p2, 0x1
            const/4 p3, 0x0
            const/4 p4, 0x0
            const/4 p5, 0x0
            const-string p6, ""
        """)

        WatchLiveAdsInitFingerprint.method.addInstructions(0, """
            return-void
        """)

        DisplayAdComposableFingerprint.method.addInstructions(0, """
            return-void
        """)

        SgaiPrefetcherGetAdFingerprint.method.addInstructions(0, """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            return-object v0
        """)

        LiveAdsManagerProcessFingerprint.method.addInstructions(0, """
            sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
            return-object v0
        """)
    }
}
