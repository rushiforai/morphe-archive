package app.geminiask.patches.youtube

import app.morphe.patcher.Fingerprint

// Official Morphe add-on injection point (public contract of the Morphe YouTube extension).
object RegisterAddOnsFingerprint : Fingerprint(
    definingClass = "Lapp/morphe/extension/youtube/addon/AddOnManager;",
    name = "registerAddOns",
    returnType = "V",
    parameters = listOf()
)
