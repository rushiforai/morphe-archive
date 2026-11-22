package app.xhyxfxxc.patches.sendanywhere.ads

import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import app.xhyxfxxc.patches.shared.Constants.COMPATIBILITY_SEND_ANYWHERE

@Suppress("unused")
val hideAdsPatch = patch(
    name = "Hide ads",
    description = "Hides all ads by making the app's own ads-disabled check always pass.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEND_ANYWHERE)

    execute {
        AdsDisabledFingerprint.method.returnEarly(true)
    }
}
