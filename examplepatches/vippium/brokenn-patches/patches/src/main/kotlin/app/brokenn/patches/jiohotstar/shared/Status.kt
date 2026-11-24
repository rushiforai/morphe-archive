package app.brokenn.patches.jiohotstar.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.brokenn.patches.jiohotstar.shared.Constants.BROKENN_STATUS_CLASS

/** Matches BrokennStatus.load() in the merged extension dex. */
internal object BrokennStatusLoadFingerprint : Fingerprint(
    definingClass = BROKENN_STATUS_CLASS,
    name = "load",
)

// Marks a patch as included: injects its enable call at the top of BrokennStatus.load().
fun enableStatus(functionName: String) {
    BrokennStatusLoadFingerprint.method.addInstruction(
        0,
        "invoke-static {}, $BROKENN_STATUS_CLASS->$functionName()V",
    )
}
